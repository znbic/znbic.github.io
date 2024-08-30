---
layout: post
title: "Kramdown Configuration Test"
date: 2024-08-30 11:06:37 +0800
categories: test
---

# Header Level 1

## Header Level 2

### Header Level 3

#### Header Level 4

##### Header Level 5 (Should not appear in the TOC)

* Contents
{:toc}

---

This is a test file for Kramdown configuration. It includes different elements like **headers**, `code blocks`, and more to see how the settings affect the rendering.

### Code Block Test

Here’s a Ruby code snippet with `Coderay` syntax highlighting and line numbers:

```ruby
def hello_world
  puts 'Hello, world!'
end

hello_world
```

### Smart Quotes Test

Testing smart quotes:

- Single quotes: 'Hello, world!' should become ‘Hello, world!’
- Double quotes: "Hello, world!" should become “Hello, world!”

### Footnotes Test

This is a sentence with a footnote.[^1]

[^1]: This is the footnote content.

### Header Offset Test

The header levels should be offset by 2, so `# Header Level 1` should render as `<h3>` instead of `<h1>`.

# Header to Test Offset

### Header to Test Offset at Level 3



