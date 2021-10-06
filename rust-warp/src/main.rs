use std::time::Duration;

use warp::Filter;


#[tokio::main]
async fn main() {
    let delay = warp::path!("delay" / u64)
        .map(|seconds| {
            println!("Delay {} seconds", seconds);
            std::thread::sleep(Duration::from_secs(seconds));
            println!("Delay finished");
            return format!("Delay {} seconds", seconds);
        });

    warp::serve(delay)
        .run(([127,0,0,1], 3000))
        .await;
}
