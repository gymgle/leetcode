impl Solution {
    pub fn search(nums: Vec<i32>, target: i32) -> i32 {
        let mut l = 0;
        let mut r = nums.len() as i32 - 1;
        while l <= r {
            let m = (r - l) / 2 + l;
            if nums[m as usize] == target {
                return m;
            }
            if nums[m as usize] > target {
                if nums[l as usize] <= nums[m as usize] && nums[l as usize] > target {
                    l = m + 1;
                } else {
                    r = m - 1;
                }
            } else {
                if nums[m as usize] <= nums[r as usize] && nums[r as usize] < target {
                    r = m - 1;
                } else {
                    l = m + 1;
                }
            }
        }
        -1
    }
}
