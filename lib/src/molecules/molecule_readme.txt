# Molecules

This directory contains Flutter widgets that are composed of one or more "atom" widgets. Molecules are responsible for combining atoms into meaningful, reusable UI components.

## Structure

Each molecule should reside in its own file within this directory, named `molecule_name.dart`.

## Examples

- `molecule_button_with_icon.dart`: A button atom combined with an icon atom.
- `molecule_card_with_title_and_description.dart`: A card atom containing text atoms for title and description.

## Guidelines

- **Composition over Configuration:** Molecules should primarily focus on arranging and combining atom widgets. Avoid adding complex business logic or state management within molecules.
- **Reusability:** Design molecules to be as generic and reusable as possible across different parts of the application.
- **Props/Parameters:** Molecules should accept necessary data and callbacks as parameters to maintain their reusability and separation of concerns.
- **No Business Logic:** Molecules should not contain business logic. Their responsibility is purely UI composition.
- **Testing:** Molecules should be easily testable in isolation, primarily focusing on their visual composition and parameter handling.
