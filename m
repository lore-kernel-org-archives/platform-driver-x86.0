From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 6/7] platform/x86: fujitsu-laptop: More accurately
 represent the hotkey ring buffer managed by firmware
Date: Wed, 28 Feb 2018 18:13:55 +0200
Message-ID: <CAHp75VeANKg+L7GsA=onScQ6mBeWzhthd0cP6=36rFB4KHWr7w@mail.gmail.com>
References: <20180227211539.5708-1-kernel@kempniu.pl> <20180227211539.5708-7-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227211539.5708-7-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 27, 2018 at 11:15 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kemp=
niu.pl> wrote:
> The MAX_HOTKEY_RINGBUFFER_SIZE constant is set to 100, which allows up
> to 100 hotkey events to be drained from the firmware ring buffer upon
> module load.  However, no known firmware is capable of holding more than
> 16 hotkey events in its internal ring buffer:

> The RINGBUFFERSIZE constant is set to 40, which allows the module to
> queue up to 40 hotkey events for delivery to user space.  As this value
> seems arbitrarily chosen and 16 should be more than enough for any
> practical use case, merge the two aforementioned constants into one
> (HOTKEY_RINGBUFFER_SIZE) in order to simplify code and more accurately
> represent the underlying data structure.

> +#define HOTKEY_RINGBUFFER_SIZE         16

This need the comment or a

BUILD_BUG_ON(!is_power_of_2(...));


> -       ret =3D kfifo_alloc(&priv->fifo, RINGBUFFERSIZE * sizeof(int),
> +       ret =3D kfifo_alloc(&priv->fifo, HOTKEY_RINGBUFFER_SIZE * sizeof(=
int),
>                           GFP_KERNEL);

>         while (call_fext_func(device, FUNC_BUTTONS, OP_GET_EVENTS,
>                               0x0, 0x0) !=3D 0 &&
> -              i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
> +              i++ < HOTKEY_RINGBUFFER_SIZE)
>                 ; /* No action, result is discarded */

This looks horrible.
Can it be redone

do {
 if (call...() =3D=3D 0)
  break;
} while (i++ < ...);

?

>         while ((irb =3D call_fext_func(device, FUNC_BUTTONS, OP_GET_EVENT=
S,
>                                      0x0, 0x0)) !=3D 0 &&
> -              i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
> +              i++ < HOTKEY_RINGBUFFER_SIZE) {

Ditto.

>                 scancode =3D irb & 0x4ff;
>                 if (sparse_keymap_entry_from_scancode(priv->input, scanco=
de))
>                         acpi_fujitsu_laptop_press(device, scancode);


--=20
With Best Regards,
Andy Shevchenko
