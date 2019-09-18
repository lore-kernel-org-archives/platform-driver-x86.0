From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: add ACPI_BATTERY dependency
Date: Wed, 18 Sep 2019 23:03:39 +0300
Message-ID: <CAHp75VdLLkFSYhvvXtzyEVeay3reBaYfJuzfd6qQ4Rw+k7QLKQ@mail.gmail.com>
References: <20190918195652.2137765-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918195652.2137765-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 18, 2019 at 10:57 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Without this dependency, we can run into a link failure:
>
> drivers/platform/x86/asus-wmi.o: In function `asus_wmi_remove':
> asus-wmi.c:(.text+0x430): undefined reference to `battery_hook_unregister'
> drivers/platform/x86/asus-wmi.o: In function `asus_wmi_probe':
> asus-wmi.c:(.text+0x2c6f): undefined reference to `battery_hook_register'
>

Thanks, the similar is in my tree. I will send it later.

> Fixes: 7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 1b67bb578f9f..d81de3f4f72e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -680,6 +680,7 @@ config ASUS_WMI
>         depends on RFKILL || RFKILL = n
>         depends on HOTPLUG_PCI
>         depends on ACPI_VIDEO || ACPI_VIDEO = n
> +       depends on ACPI_BATTERY
>         select INPUT_SPARSEKMAP
>         select LEDS_CLASS
>         select NEW_LEDS
> --
> 2.20.0
>


-- 
With Best Regards,
Andy Shevchenko
