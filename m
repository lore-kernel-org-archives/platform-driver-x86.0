From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
Date: Sat, 13 Jul 2019 17:34:44 +0200
Message-ID: <CAK8P3a3SPpQAbXu5+rHjEaF-MSVxVmG9sWy9hxu844HKn8JgLg@mail.gmail.com>
References: <20190712085437.4007720-1-arnd@arndb.de> <fb36b507-e637-e4d9-fdd4-2947eb7faf14@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fb36b507-e637-e4d9-fdd4-2947eb7faf14@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jul 13, 2019 at 4:36 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 12.07.19 10:54, Arnd Bergmann wrote:
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index e869a5c760b6..cf48b9068843 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1324,8 +1324,8 @@ config PCENGINES_APU2
> >       tristate "PC Engines APUv2/3 front button and LEDs driver"
> >       depends on INPUT && INPUT_KEYBOARD
> >       depends on LEDS_CLASS
> > -     select GPIO_AMD_FCH
> > -     select KEYBOARD_GPIO_POLLED
> > +     select GPIO_AMD_FCH if GPIOLIB
> > +     select KEYBOARD_GPIO_POLLED if GPIOLIB
> >       select LEDS_GPIO
> >       help
> >         This driver provides support for the front button and LEDs on
>
> That might compile but the driver won't work, if KEYBOARD_GPIO_POLLED
> or GPIO_AMD_FCH isn't there.

Right, I agree it's a bit inconsistent. A better way would probably
be to turn all of the 'select' statements into 'depends on' here, or
possibly just remove them and document in the help text what others
are required.

Generally using 'select' in order to save users from thinking causes
more problems than it helps, as the build problems in this driver
have already illustrated.

      Arnd
