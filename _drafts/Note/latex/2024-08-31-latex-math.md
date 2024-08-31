---
layout: post
title: "Latex Math"
date: 2024-08-31  16:23:52 +0800
categories: note
---

- Contents

{:toc}

> Generated from `ChatGPT`.

## Space

Choosing the appropriate space in LaTeX depends on the context and the specific mathematical expression you’re working with. Below are examples of when and how to use different spaces in LaTeX, along with both the code and the resulting output.

### 1. **Thin Space (`\,`)**
   - **Use Case:** A thin space is typically used to separate closely related elements, like between a number and its unit, or between differential operators.
   
   **Example:** Separate a function from its argument and the differential in an integral.
   ```latex
   \int_0^1 f(x)\, dx
   ```
   **Result:** 
   $$
   \int_0^1 f(x)\, dx
   $$

   **Example:** Add space between the terms of a product.
   ```latex
   ab\,c
   ```
   **Result:** 
   $$
   ab\,c
   $$

### 2. **Medium Space (`\:`)**
   - **Use Case:** Use a medium space to separate terms that need more distinction than a thin space provides, but where a full quad might be too much.
   
   **Example:** Adding space around binary relations or operators like `+`.
   ```latex
   a + b \: = \: c
   ```
   **Result:**
   $$
   a + b \: = \: c
   $$

### 3. **Thick Space (`\;`)**
   - **Use Case:** This space is used to clearly separate terms, often in more complex expressions or when aligning elements within the equation.
   
   **Example:** Separate elements in a sum of terms.
   ```latex
   x_1 \; + \; x_2 \; + \; x_3
   ```
   **Result:**
   $$
   x_1 \; + \; x_2 \; + \; x_3
   $$

### 4. **Quad Space (`\quad`)**
   - **Use Case:** A quad space is typically used to align elements across an equation or between different equations.
   
   **Example:** Separating terms within a large equation for clarity.
   ```latex
   a \quad + \quad b = c
   ```
   **Result:**
   $$
   a \quad + \quad b = c
   $$

   **Example:** Separate different parts of a piecewise function.
   ```latex
   f(x) = 
   \begin{cases}
   x^2 \quad & \text{if } x \geq 0 \\
   -x \quad & \text{if } x < 0
   \end{cases}
   ```
   **Result:**
   $$
   f(x) = 
   \begin{cases}
   x^2 \quad & \text{if } x \geq 0 \\
   -x \quad & \text{if } x < 0
   \end{cases}
   $$

### 5. **Double Quad Space (`\qquad`)**
   - **Use Case:** This is used when you need to significantly separate parts of an equation, often in display equations or for aligning equations that span multiple lines.
   
   **Example:** Aligning parts of an equation across lines.
   ```latex
   A \qquad = \qquad B + C
   ```
   **Result:**
   $$
   A \qquad = \qquad B + C
   $$

### 6. **Negative Space (`\!`)**
   - **Use Case:** Negative space pulls elements closer together. This is useful when elements are too far apart by default, like when combining subscript and superscript.
   
   **Example:** Tighten the spacing between a superscript and subscript.
   ```latex
   a^{b\!c}
   ```
   **Result:**
   $$
   a^{b\!c}
   $$

### 7. **Custom Space with `\hspace`**
   - **Use Case:** For precise control, you can specify the exact amount of space you need using `\hspace{length}`.
   
   **Example:** Insert a 0.5 cm space between two elements.
   ```latex
   x \hspace{0.5cm} y
   ```
   **Result:**
   $$
   x \hspace{0.5cm} y
   $$

### Summary of Usage:
- **Thin Space (`\,`)**: Close elements, like function arguments and differentials.
- **Medium Space (`\:`)**: Slightly more separation, often between operators and their operands.
- **Thick Space (`\;`)**: Clear separation of terms within an equation.
- **Quad Space (`\quad`)**: Aligning elements, separating larger groups.
- **Double Quad Space (`\qquad`)**: Major separation, often across multiple lines.
- **Negative Space (`\!`)**: Bringing elements closer together.
- **Custom Space (`\hspace{}`)**: Fine-tuning specific spacing needs.

These examples demonstrate how different spacing commands can be used to enhance the clarity and readability of your LaTeX documents.


## Math Equation

Here are several LaTeX math equations that work well in most Markdown conditions, especially when using inline and block math modes. These examples cover common mathematical concepts and show how to format them effectively.

### 1. **Basic Inline Equations:**
   - **Pythagorean Theorem:**
     ```latex
     $a^2 + b^2 = c^2$
     ```
     **Result:**
     $a^2 + b^2 = c^2$

   - **Quadratic Formula:**
     ```latex
     $x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$
     ```
     **Result:**
     $x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$

   - **Euler's Identity:**
     ```latex
     $e^{i\pi} + 1 = 0$
     ```
     **Result:**
     $e^{i\pi} + 1 = 0$

### 2. **Block Equations:**
   For block equations, use `$$...$$` in Markdown or the `$$$$` notation in LaTeX.

   - **Integral of a Function:**
     ```latex
     $$
     \int_0^1 x^2 \, dx = \frac{1}{3}
     $$
     ```
     **Result:**
     $$
     \int_0^1 x^2 \, dx = \frac{1}{3}
     $$

   - **Sum of a Series:**
     ```latex
     $$
     \sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}
     $$
     ```
     **Result:**
     $$
     \sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}
     $$

   - **Matrix Representation:**
     ```latex
     $$
     \mathbf{A} = \begin{pmatrix}
     a_{11} & a_{12} & a_{13} \\
     a_{21} & a_{22} & a_{23} \\
     a_{31} & a_{32} & a_{33}
     \end{pmatrix}
     $$
     ```
     **Result:**
     $$
     \mathbf{A} = \begin{pmatrix}
     a_{11} & a_{12} & a_{13} \\
     a_{21} & a_{22} & a_{23} \\
     a_{31} & a_{32} & a_{33}
     \end{pmatrix}
     $$

### 3. **Complex Expressions:**
   - **Limit Expression:**
     ```latex
     $$
     \lim_{x \to 0} \frac{\sin x}{x} = 1
     $$
     ```
     **Result:**
     $$
     \lim_{x \to 0} \frac{\sin x}{x} = 1
     $$

   - **Probability Density Function:**
     ```latex
     $$
     f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
     $$
     ```
     **Result:**
     $$
     f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
     $$

### 4. **System of Equations:**
   ```latex
   $$
   \begin{align*}
   x + y &= 10 \\
   2x - y &= 3
   \end{align*}
   $$
   ```
   **Result:**
   $$
   \begin{align*}
   x + y &= 10 \\
   2x - y &= 3
   \end{align*}
   $$

### 5. **Piecewise Function:**
   ```latex
   $$
   f(x) = 
   \begin{cases} 
   x^2 & \text{if } x \geq 0 \\ 
   -x & \text{if } x < 0 
   \end{cases}
   $$
   ```
   **Result:**
   $$
   f(x) = 
   \begin{cases} 
   x^2 & \text{if } x \geq 0 \\ 
   -x & \text{if } x < 0 
   \end{cases}
   $$

### 6. **Derivatives:**
   - **First Derivative:**
     ```latex
     $$
     \frac{d}{dx} \left( x^2 \right) = 2x
     $$
     ```
     **Result:**
     $$
     \frac{d}{dx} \left( x^2 \right) = 2x
     $$

   - **Second Derivative:**
     ```latex
     $$
     \frac{d^2}{dx^2} \left( x^3 \right) = 6x
     $$
     ```
     **Result:**
     $$
     \frac{d^2}{dx^2} \left( x^3 \right) = 6x
     $$

### 7. **Vectors and Cross Products:**
   - **Vector Notation:**
     ```latex
     $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ v_3 \end{pmatrix}$
     ```
     **Result:**
     $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ v_3 \end{pmatrix}$

   - **Cross Product:**
     ```latex
     $$
     \mathbf{u} \times \mathbf{v} = \begin{vmatrix} \mathbf{i} & \mathbf{j} & \mathbf{k} \\ u_1 & u_2 & u_3 \\ v_1 & v_2 & v_3 \end{vmatrix}
     $$
     ```
     **Result:**
     $$
     \mathbf{u} \times \mathbf{v} = \begin{vmatrix} \mathbf{i} & \mathbf{j} & \mathbf{k} \\ u_1 & u_2 & u_3 \\ v_1 & v_2 & v_3 \end{vmatrix}
     $$

### General Tips for Markdown Compatibility:

1. **Inline vs. Block Mode:** Use `$...$` for inline math and `$$...$$` or `$$$$` for block math. Inline math is best for simple equations or short expressions.

2. **Escaping Special Characters:** In Markdown, special characters like `*`, `_`, `#`, and others may need to be escaped within LaTeX expressions, especially if they are not rendering correctly.

3. **Testing in Your Environment:** Since not all Markdown parsers handle LaTeX equally, it’s a good idea to test your equations in the specific environment you’re using (e.g., GitHub, Jekyll, Pandoc).

These examples should work well in most Markdown processors that support LaTeX, allowing you to write clear and concise mathematical expressions.