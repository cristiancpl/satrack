using Datos;
using Entidades;
using Negocio;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton(new Conexion { ConexionSatrack = builder.Configuration.GetSection("ConnectionStrings:Satrack").Get<string>() });

builder.Services.AddSingleton<IBrokerEstados, BrokerEstados>();
builder.Services.AddSingleton<IGestorEstados, GestorEstados>();

builder.Services.AddSingleton<IBrokerCategorias, BrokerCategorias>();
builder.Services.AddSingleton<IGestorCategorias, GestorCategorias>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();




