using Backend.SecurityEducation.Aplicacion.Configuracion;
using Backend.SecurityEducation.Infraestructura.Configuracion;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AgregarServiciosAplicacion();

// Usa la clase ServiceConfigurator para registrar los servicios
ServiceConfigurator.AddDataBusinessServices(builder.Services, connectionString);

// Configurar la autenticación JWT
builder.Services.AddAuthentication("Bearer")
.AddJwtBearer(options =>
{
    SymmetricSecurityKey signingkey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["EncryptionKey"]));
    SigningCredentials signingCredentials = new SigningCredentials(signingkey, SecurityAlgorithms.HmacSha256Signature);
    // Configuración de validación del token
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true, // Si tienes un emisor específico, configúralo en true y agrégalo en el token
        ValidIssuer = "http://localhost:5235",
        ValidateAudience = false, // Configúralo en true si tienes una audiencia específica
        ValidateLifetime = true, // Verifica que el token no haya expirado
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = signingkey // La misma clave que usaste en App 1
    };
});

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.WithOrigins("http://localhost:4200")
                          .AllowAnyHeader()
                          .AllowAnyMethod();
                      });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(MyAllowSpecificOrigins);

// Habilita el uso de autenticación y autorización
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
