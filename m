From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
Date: Sat, 13 Jul 2019 16:36:36 +0200
Message-ID: <fb36b507-e637-e4d9-fdd4-2947eb7faf14@metux.net>
References: <20190712085437.4007720-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712085437.4007720-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 12.07.19 10:54, Arnd Bergmann wrote:

Hi,

> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e869a5c760b6..cf48b9068843 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1324,8 +1324,8 @@ config PCENGINES_APU2
>  	tristate "PC Engines APUv2/3 front button and LEDs driver"
>  	depends on INPUT && INPUT_KEYBOARD
>  	depends on LEDS_CLASS
> -	select GPIO_AMD_FCH
> -	select KEYBOARD_GPIO_POLLED
> +	select GPIO_AMD_FCH if GPIOLIB
> +	select KEYBOARD_GPIO_POLLED if GPIOLIB
>  	select LEDS_GPIO
>  	help
>  	  This driver provides support for the front button and LEDs on

That might compile but the driver won't work, if KEYBOARD_GPIO_POLLED
or GPIO_AMD_FCH isn't there.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
