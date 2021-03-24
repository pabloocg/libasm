[![License][license-logo]][license-url]

<br />
<p align="center">
  <h2 align="center">Libasm</h2>

  <p align="center">
    Assembly yourself!
  </p>
</p>


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

---

## About The Project

The aim of this project is to get familiar with assembly language.

---

### Madatory Part

- You must write 64 bits ASM. Beware of the "calling convention".
- You can’t do inline ASM, you must do ’.s’ files.
- You must compile your assembly code with nasm.
- You must use the Intel syntax, not the AT&T.
- You must rewrite the following functions in asm:
    - ft_strlen
    - ft_strcpy
    - ft_strcmp
    - ft_write
    - ft_read
    - ft_strdup
- You must check for errors during syscalls and properly set them when needed

### Bonus Part

You can rewrite these functions in asm. The linked list function will use the following structure:

```c
typedef struct  s_list
{
    void            *data;
    struct  s_list  *next;
}               t_list;
```

- ft_atoi_base
- ft_list_push_front
- ft_list_size
- ft_list_sort
- ft_list_remove_if 

## Getting Started

### Installation

1. Clone the repository
    ```sh
    $ git clone https://github.com/pabloocg/libasm.git
    ```
2. Enter the repository and run make
    ```sh
    $ cd libasm && make
    ```

## Usage

To test the library of functions you can do:
```
    $ make test
    $ make testbonus
```

## License

Distributed under the GNU GPLv3. See `LICENSE` for more information.

## Contact

Pablo Cuadrado García </br>
[Linkedin][linkedin-url] - pablocuadrado97@gmail.com

[license-logo]: https://img.shields.io/cran/l/devtools?style=for-the-badge
[license-url]: https://github.com/pabloocg/libasm/LICENSE
[linkedin-url]: https://linkedin.com/in/pablo-cuadrado97

