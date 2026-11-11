# Sample file for checking the theme.
from dataclasses import dataclass


@dataclass
class Player:
    name: str
    number: int


def top_scorers(goals: dict[str, int], limit: int = 3) -> list[str]:
    """Return the names with the most goals."""
    ranked = sorted(goals, key=lambda n: goals[n], reverse=True)
    return [name for name in ranked[:limit] if goals[name] > 0]


if __name__ == "__main__":
    print(top_scorers({"A": 12, "B": 7, "C": 0}))
