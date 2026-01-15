def fibonacci(n):
    if n < 0:
        raise ValueError("n має бути >= 0")
    return n if n < 2 else fibonacci(n-1) + fibonacci(n-2)

if __name__ == "__main__":
    n = int(input("Введіть n: "))
    print(f"F({n}) = {fibonacci(n)}")
