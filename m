From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fix surface3_button build errors
Date: Wed, 28 Dec 2016 22:45:28 +0200
Message-ID: <CAHp75VeeGqieiLZLX90tynZvOs-jrPMWbnj-KN529KVUkiHL-A@mail.gmail.com>
References: <4b805dc9-4eeb-10bb-7db5-85defa32a304@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35742 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751534AbcL1Upa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Dec 2016 15:45:30 -0500
In-Reply-To: <4b805dc9-4eeb-10bb-7db5-85defa32a304@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, kbuild test robot <fengguang.wu@intel.com>, Benjamin Tissoires <benjamin.tissoires@gmail.com>

On Wed, Dec 28, 2016 at 12:28 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build errors when I2C=m and SURFACE_3_BUTTON=y.
> The driver uses i2c interfaces so it should depend on I2C.
>
> drivers/built-in.o: In function `surface3_driver_init':
> surface3_button.c:(.init.text+0x75cb0): undefined reference to `i2c_register_driver'
> drivers/built-in.o: In function `surface3_driver_exit':
> surface3_button.c:(.exit.text+0x31a8): undefined reference to `i2c_del_driver'
>
> Fixes: 1a64b719d3ae (platform/x86: Introduce button support for the Surface 3)
>

Pushed to fixes.
Thanks!

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Darren Hart <dvhart@infradead.org>
> ---
>  drivers/platform/x86/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- lnx-410-rc1.orig/drivers/platform/x86/Kconfig
> +++ lnx-410-rc1/drivers/platform/x86/Kconfig
> @@ -1034,7 +1034,7 @@ config SURFACE_PRO3_BUTTON
>
>  config SURFACE_3_BUTTON
>         tristate "Power/home/volume buttons driver for Microsoft Surface 3 tablet"
> -       depends on ACPI && KEYBOARD_GPIO
> +       depends on ACPI && KEYBOARD_GPIO && I2C
>         ---help---
>           This driver handles the power/home/volume buttons on the Microsoft Surface 3 tablet.
>



-- 
With Best Regards,
Andy Shevchenko
