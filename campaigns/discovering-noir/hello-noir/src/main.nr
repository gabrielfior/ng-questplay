mod tests; // Do not modify this first line!
use dep::std;

fn assert_divisible_by(number: u32, factor: u32) {
    assert (number % factor == 0);
}

fn main(key: u32, lock_1: pub u32, lock_2: pub u32){
    assert(key != 1);
    assert_divisible_by(lock_1,key);
    assert_divisible_by(lock_2,key);
}