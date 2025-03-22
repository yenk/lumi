countries = ["iceland", "poland", "china", "switzerland"]
numbers = [2, 3, 8, 2]

text = "we go running today! trailrunning is fun"


def sort_countries(countries):
    return sorted(countries, reverse=True)


def multiply_countries(numbers):
    return [n**3 for n in numbers]


def map_numbers(numbers):
    """Use map() to demonstrate the tool."""
    return numbers**3


triple = list(map(map_numbers, numbers))


def get_countries(countries):
    """return -> <function get_countries.<locals>.<lambda> at 0x7fd213c8a3b0>"""
    return lambda countries: countries.upper()


def __str__(countries):
    """return -> string test ['iceland', 'poland', 'china', 'switzerland']"""
    return f"string test {countries}"


def __repr__(countries):
    """return -> repr test ['iceland', 'poland', 'china', 'switzerland']"""
    return f"repr test {countries}"


def __str__(numbers):
    return f"{numbers}"


def create_uppercase_str(text):
    """This function is used as an arg for < map(arg, iterable)> built-in function.

    return ->
        let's map this!
        WE GO RUNNING TODAY! TRAILRUNNING IS FUN
    """
    return text.upper()


# assign new var for map(arg, iterable)
map_str_uppercase = map(create_uppercase_str, text)
print("let's map this!".format(create_uppercase_str), end="-> ")


if __name__ == "__main__":
    # print(sort_countries(countries))
    # countries = list(map(len, countries))
    # print(f"countries are: \n{countries}")
    # print(multiply_countries(numbers))
    # print(map_countries(countries))
    # print(triple)
    # print(map_with_lambda(countries))
    # print(get_countries(countries))
    # print(__str__(countries))
    # print(__repr__(countries))
    # print(map_numbers(numbers))
    # print(triple)
    print(create_uppercase_str(text))
