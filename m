From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
Date: Sun, 14 Jul 2019 19:41:25 +0300
Message-ID: <CAHp75VfGs9v_YoAfFcsQphqfR3-i+vb_2aS5GijJ8PgG5W0CWg@mail.gmail.com>
References: <20190712085437.4007720-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712085437.4007720-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 12, 2019 at 11:54 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I ran into another build issue in randconfig testing for this driver,
> when CONFIG_GPIOLIB is not set:
>
> WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
>   Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
>
> WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
>   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
>
> Make the 'select' statements conditional on that so we don't have to
> introduce another 'select'.
>

Thanks, I have applied the fix from YueHaibing, the idea is to depened
on GPIOLIB.


> Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> Fixes: a422bf11bdb4 ("platform/x86: fix PCENGINES_APU2 Kconfig warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e869a5c760b6..cf48b9068843 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1324,8 +1324,8 @@ config PCENGINES_APU2
>         tristate "PC Engines APUv2/3 front button and LEDs driver"
>         depends on INPUT && INPUT_KEYBOARD
>         depends on LEDS_CLASS
> -       select GPIO_AMD_FCH
> -       select KEYBOARD_GPIO_POLLED
> +       select GPIO_AMD_FCH if GPIOLIB
> +       select KEYBOARD_GPIO_POLLED if GPIOLIB
>         select LEDS_GPIO
>         help
>           This driver provides support for the front button and LEDs on
> --
> 2.20.0
>


-- 
With Best Regards,
Andy Shevchenko
