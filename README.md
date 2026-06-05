# Personal Expenses Tracker

A clean, intuitive, and responsive personal finance tracking application built using Flutter. This project allows users to log their daily transactions, visualize their weekly spending habits through a dynamic bar chart, and manage their expenses on the go.

Originally developed as part of a foundational Flutter development course, I have refactored, modernized, and polished the application—including layout optimizations, updated state management handling, and interactive modal sheets—to turn it into a production-ready portfolio piece.

---

## 📱 Key Features

- **Dynamic Weekly Spending Chart:** A visual bar chart at the top dynamically calculates and renders the percentage of total weekly spending allocated to each individual day.
- **Transaction Management:** Add transactions seamlessly with a clear title, amount, and specific date selection. Delete unnecessary entries instantly with a clean swipe or tap.
- **Interactive Date Picker:** Integrates native platform-optimized date modals to ensure accurate timestamping for all logged expenses.
- **Empty State UX:** Features an engaging fallback screen ("No transactions added yet!") utilizing structured illustrations when the application contains no logs.
- **Responsive Context Menus:** Uses persistent bottom sheets for transactional inputs, preventing screen clutter and maintaining focus.

---

## 📸 Screenshots & Application Flow

> **Tip for Portfolio:** Create a folder in your project called `screenshots/`, rename your images to match the filenames below, and drop them in there so they display perfectly on GitHub!

### 1. Empty Dashboard State

When no expenses have been recorded for the current tracking period, the app provides a clean fallback interface encouraging the user to log their first expense.

![Empty Dashboard State](screenshots/empty_state.png)

### 2. Live Expense Tracking & Analytics

Once expenses are populated, the weekly overview updates dynamically. The bars represent proportional daily expenses against the weekly cap.

![Active Dashboard](screenshots/active_state.png)

### 3. Adding New Transactions

Clicking the floating action button (`+`) invokes an elegant modal sheet where users input details.

![Add Transaction Modal](screenshots/add_transaction.png)

### 4. Interactive Date Selection

Ensures seamless localized calendar pickers to historical or forward-plan transactions accurately.

![Date Picker Component](screenshots/date_picker.png)

---

## 🛠️ Tech Stack & Engineering Concepts Mastered

- **Framework:** Flutter (Dart)
- **UI Architecture:** Custom Stateful and Stateless widgets, leveraging material design patterns (`ModalBottomSheet`, `FloatingActionButton`, customized `Card` themes).
- **Layout & Responsiveness:** Clean handling of viewport constraints using `SingleChildScrollView` and flexible column hierarchies to ensure layout consistency.
- **State Management:** Lifting state up to maintain a single source of truth for the transaction list and computing programmatic aggregates dynamically for the analytics cards.

---

## 🚀 Enhancements & Custom Implementations

To differentiate this project from the base tutorial architecture, I introduced several critical enhancements:

1. **Code Refactoring & Modernization:** Migrated components to comply with the latest Dart null-safety standards and strict linting constraints.
2. **UI Polish:** Replaced default borders with customized desaturated primary/accent colors (Cyan and Soft Blue tones) along with drop-shadow enhancements to improve structural contrast.
3. **Data Integrity:** Enforced input validation preventing empty strings or negative numbers from corrupting the state tree.

---

## 🏃 Getting Started

### Prerequisites

Make sure you have the Flutter SDK configured on your development system.

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### Installation & Run

1. Clone this repository to your local directory:
   ```bash
   git clone [https://github.com/your-username/personal-expenses-flutter.git](https://githu
   ```
