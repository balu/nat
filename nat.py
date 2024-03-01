# Represent natural numbers.
# N should take only log(N) storage.
# n+m should take linear-time.

def make(n):
    assert n >= 0
    xs = []
    while n >= 10:
        xs.append(n % 10)
        n = n//10
    xs.append(n)
    return xs

def add(xs, ys):
    k = 0
    N = len(xs)
    M = len(ys)
    zs = []
    carry = 0
    while k < min(N, M):
        s = xs[k] + ys[k] + carry
        if s >= 10:
            carry = 1
            s = s - 10
        else:
            carry = 0
        zs.append(s)
        k = k + 1

    if N > M:
        ws = xs
    elif M > N:
        ws = ys

    while k < max(N, M):
        s = ws[k] + carry
        if s >= 10:
            carry = 1
            s = s - 10
        else:
            carry = 0
        zs.append(s)
        k = k + 1

    if carry: zs.append(carry)

    return zs
