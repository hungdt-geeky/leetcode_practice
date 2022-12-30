# https://leetcode.com/problems/first-bad-version/?envType=study-plan&id=level-1

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  min_version = 1
  max_version = n
  bad_version = nil

  while min_version <= max_version
    mid_version = (min_version + max_version) / 2

    if is_bad_version(mid_version)
      bad_version = mid_version
      max_version = mid_version - 1
    else
      min_version = mid_version + 1
    end
  end

  bad_version
end