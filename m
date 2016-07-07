From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [RESEND RFC PATCH 5/5] platform: x86: add platform driver for
 UP Board
Date: Thu, 07 Jul 2016 02:57:56 +0100
Message-ID: <1467856676.17253.126.camel@nexus-software.ie>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-6-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37603 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504AbcGGB6A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2016 21:58:00 -0400
Received: by mail-wm0-f48.google.com with SMTP id a66so14111827wme.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jul 2016 18:57:59 -0700 (PDT)
In-Reply-To: <1467648434-29080-6-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan O'Donovan <dan@emutex.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: lee.jones@linaro.org, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, 2016-07-04 at 17:07 +0100, Dan O'Donovan wrote:
> This platform driver instantiates a platform device relevant to the
> UP board, in particular a device representing the unique I/O pin CPLD
> controller on the UP board.
>=20
> In addition, this driver registers pin maps to configure
> appropriately the underlying SoC GPIO pins for use with the
> UP Board I/O pin header.
>=20
> Signed-off-by: Dan O'Donovan <dan@emutex.com>
> ---
> =C2=A0drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
13 ++++
> =C2=A0drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=
=A05 ++
> =C2=A0drivers/platform/x86/up_board.c | 167
> ++++++++++++++++++++++++++++++++++++++++
> =C2=A03 files changed, 185 insertions(+)
> =C2=A0create mode 100644 drivers/platform/x86/up_board.c
>=20
> diff --git a/drivers/platform/x86/Kconfig
> b/drivers/platform/x86/Kconfig
> index 3ec0025..b579adb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1011,4 +1011,17 @@ config INTEL_TELEMETRY
> =C2=A0	=C2=A0=C2=A0used to get various SoC events and parameters
> =C2=A0	=C2=A0=C2=A0directly via debugfs files. Various tools may use
> =C2=A0	=C2=A0=C2=A0this interface for SoC state monitoring.
> +
> +config UP_BOARD
> +	bool "UP Board Platform I/O Driver"

Addressing your question in the cover letter - I'm not sure where
up_board.c should go but, I reckon up_board_leds.c should go into
drivers/leds, up_board_gpio.c should go into drivers/gpio etc.

My highly scientific feeling is that up_board.c and up_board_cpld.c
shouldn't be in this directory but, that they would fit well in
drivers/mfd.

> +	depends on ACPI && PINCTRL_CHERRYVIEW
> +	select GPIOLIB_IRQCHIP
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	---help---
> +	=C2=A0=C2=A0This driver provides support for the platform functions=
 on
> the UP
> +	=C2=A0=C2=A0board.=C2=A0=C2=A0It includes platform, pinctrl and gpi=
o drivers for
> the CPLD
> +	=C2=A0=C2=A0that manages the external pin header, as well as a driv=
er
> for the
> +	=C2=A0=C2=A0built-in LEDs.
> +
> =C2=A0endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile
> b/drivers/platform/x86/Makefile
> index 9b11b40..687c583 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -70,3 +70,8 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+=3D
> intel_telemetry_core.o \
> =C2=A0				=C2=A0=C2=A0=C2=A0intel_telemetry_pltdrv.o \
> =C2=A0				=C2=A0=C2=A0=C2=A0intel_telemetry_debugfs.o
> =C2=A0obj-$(CONFIG_INTEL_PMC_CORE)=C2=A0=C2=A0=C2=A0=C2=A0+=3D intel_=
pmc_core.o
> +obj-$(CONFIG_UP_BOARD)		+=3D up_board.o \
> +				=C2=A0=C2=A0=C2=A0up_board_cpld.o \
> +				=C2=A0=C2=A0=C2=A0up_board_pinctrl.o \
> +				=C2=A0=C2=A0=C2=A0up_board_gpio.o \
> +				=C2=A0=C2=A0=C2=A0up_board_leds.o
> diff --git a/drivers/platform/x86/up_board.c
> b/drivers/platform/x86/up_board.c
> new file mode 100644
> index 0000000..8635759
> --- /dev/null
> +++ b/drivers/platform/x86/up_board.c
> @@ -0,0 +1,167 @@
> +

Dangling extra line.

> +
> +/*
> + * On the UP board, if the ODEn bit=20

Do you mean Open Drain Enable bit ? I think this comment will parse
better if its called out explicitly.

> is set on the pad configuration
> + * it seems to impair some functions on the I/O header such as UART,
> SPI
> + * and I2C.=C2=A0=C2=A0So we disable it for all header pins by defau=
lt.
> + */

Seems to impair is a bit vague... what does impair mean - not working
or just wrong ?

> +static struct up_board_info *up_board;
> +
> +static int __init
> +up_board_init_devices(void)

Why are you breaking up the __init and the function name onto separate
lines ?

> +{
> +	const struct dmi_system_id *system_id;
> +	int ret;
> +
> +	system_id =3D dmi_first_match(up_board_id_table);
> +	if (!system_id)
> +		return -ENXIO;

How about=C2=A0-ENODEV

> +
> +
> +	up_board->vreg_pdev =3D
> +		regulator_register_always_on(0, "fixed-3.3V",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vref3v3_consumers,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ARRAY_SIZE(vref3v3_cons
> umers),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03300000);
> +	if (!up_board->vreg_pdev) {
> +		pr_err("Failed to register UP Board ADC vref
> regulator");

dev_err(&up_board->cpld_pdev.dev) ?

> +		platform_device_unregister(up_board->cpld_pdev);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit
> +up_board_exit(void)

Same comment on multiple line declarations.

---
bod
