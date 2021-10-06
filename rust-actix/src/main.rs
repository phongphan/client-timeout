
use std::time::Duration;
use actix_web::{get, web, HttpResponse, Responder};

#[get("/delay/{seconds}")]
async fn delay(web::Path(seconds): web::Path<u64>) -> impl Responder {
    println!("Delay {} seconds", seconds);
    std::thread::sleep(Duration::from_secs(seconds));
    println!("Delay finished");

    HttpResponse::Ok().body(format!("Delay {} seconds", seconds))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    use actix_web::{App, HttpServer};

    HttpServer::new(|| App::new().service(delay))
        .bind("127.0.0.1:3000")?
        .run()
        .await
}
