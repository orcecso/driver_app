# Organism

Organisms are relatively complex UI components composed of groups of molecules and/or atoms. They represent distinct, reusable sections of an interface.

## Structure

Organisms are typically found in the `lib/src/organism` directory. Each organism should have its own subdirectory containing:

- `[organism_name].dart`: The main Dart file defining the organism widget.

## Naming Convention

Organism files and directories should be named using `snake_case` for directories and `PascalCase` for the main Dart file (e.g., `transaction_list/transaction_list.dart`).

## Examples

- `TransactionList`: A list of transactions, composed of `TransactionCard` molecules.
- `UserProfileHeader`: A user's profile header, composed of `Avatar` and `Text` atoms, and potentially `Button` molecules.

## Usage

Organisms are used to build pages (templates) and can be reused across different parts of the application. They encapsulate specific functionalities and UI patterns.
