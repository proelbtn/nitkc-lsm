use std::fs::File;
use std::io::{BufReader, BufRead};

fn read_dat(filename: &str) -> Vec<(f64, f64)>{
    let mut vec = Vec::new();

    let file = File::open(filename).unwrap();
    let reader = BufReader::new(file);

    for line in reader.lines() {
        let data = line.unwrap()
            .split(" ")
            .map(|e| e.trim().parse::<f64>().unwrap())
            .collect::<Vec<f64>>();
        vec.push((data[0], data[1]))
    }

    return vec;
}

fn main() {
    read_dat("data/example1.dat");
}
