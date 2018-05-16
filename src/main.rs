use std::env;
use std::fs::File;
use std::io::{BufRead, BufReader, Error};

type Data = (f64, f64);
type Matrix = Vec<Vec<f64>>;

fn read_dat(filename: &str) -> Result<Vec<Data>, Error> {
    let mut vec = Vec::new();

    let file = match File::open(filename) {
        Ok(v) => v,
        Err(v) => return Err(v)
    };
    let reader = BufReader::new(file);

    for line in reader.lines() {
        let data = line.unwrap()
            .split(" ")
            .map(|e| e.trim().parse::<f64>().unwrap())
            .collect::<Vec<f64>>();
        vec.push((data[0], data[1]))
    }

    return Ok(vec);
}

fn calc_neq(dim: usize, data: &Vec<Data>) -> (Matrix, Vec<f64>) {
    let mut mat = vec![vec![0.0; dim]; dim];
    let mut vec = vec![0.0; dim];

    for &(x, y) in data.iter() {
        let mut c1: f64 = 1.0;
        for px in (0..dim).rev() {
            let mut c2: f64 = c1;
            for py in (0..dim).rev() {
                mat[py][px] += c2;
                if px == dim - 1 {
                    vec[py] += c2 * y;
                }
                c2 *= x;
            }
            c1 *= x;
        }
    }

    return (mat, vec);
}

fn calc_lsm(dim: usize, data: &Vec<Data>) -> Vec<f64> {
    let (mut mat, mut vec) = calc_neq(dim, data);

    for i in 0..dim {
        // mat[i][i]を1にする
        vec[i] /= mat[i][i];
        for x in (0..dim).rev() { mat[i][x] /= mat[i][i]; }

        // mat[y][i]を0にする（i < y)
        for y in (i + 1)..dim {
            vec[y] -= vec[i] * mat[y][i];
            for x in (i..dim).rev() { mat[y][x] -= mat[i][x] * mat[y][i]; }
        }
    }

    for i in (0..dim).rev() {
        for y in 0..i {
            vec[y] -= mat[y][i] * vec[i];
            mat[y][i] = 0.;
        }
    }

    return vec;
} 

fn main() {
    let program: String = env::args().next().unwrap();
    let args: Vec<String> = env::args().skip(1).collect();

    if args.len() != 2 {
        println!("Usage:");
        println!("  {} [dimention] [.dat file]", program);
        std::process::exit(1);
    }

    let dimention = args[0].trim().parse::<usize>().unwrap() + 1;
    let filename = &args[1];

    let data = read_dat(filename).unwrap();
    let result = calc_lsm(dimention, &data);

    result.iter().for_each(|v| print!("{:.3}\t", v));
}
