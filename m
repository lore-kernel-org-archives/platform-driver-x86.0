From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RESEND RFC PATCH 0/5] platform drivers for UP Board
Date: Mon, 04 Jul 2016 19:17:27 +0300
Message-ID: <1467649047.30123.473.camel@linux.intel.com>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-1-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64379 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750713AbcGDQRq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2016 12:17:46 -0400
In-Reply-To: <1467648434-29080-1-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan O'Donovan <dan@emutex.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: lee.jones@linaro.org, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org, "Puustinen, Ismo" <ismo.puustinen@intel.com>

+Ismo

On Mon, 2016-07-04 at 17:07 +0100, Dan O'Donovan wrote:
> [Re-sending to a wider audience suggested by Darren Hart]
>=20
> The UP Board is a new SBC based on the Intel Atom X5-Z8350 "Cherry=C2=
=A0
> Trail" SoC and features a 40-pin I/O pin header and form-factor=C2=A0
> inspired by the Raspberry Pi 2.
>=20
> It utilises a CPLD between the SoC and the external 40-pin header
> to provide buffered voltage level-shifting of the I/O signals, mux
> switching and LED control, and programmable pin mapping between the
> SoC and the external pin header.
>=20
> The gpio, pinctrl and led drivers provided in this patch series=C2=A0
> enable and manage the functions provided by that CPLD.
>=20
> I have some open questions about this patch series:
> =C2=A0* Is it ok to place all of these various UP board drivers toget=
her
> =C2=A0=C2=A0=C2=A0in drivers/platform/x86/, or would it be preferable=
 to place them
> =C2=A0=C2=A0=C2=A0in the respective sub-system directories (gpio, pin=
ctrl, etc.)?
> =C2=A0=C2=A0=C2=A0My rationale for keeping them together here is that=
 they are all
> =C2=A0=C2=A0=C2=A0specific to this UP Board platform and not expected=
 to be
> =C2=A0=C2=A0=C2=A0generally useful on any other platforms (except var=
iants of UP).
> =C2=A0* Is it acceptable to include hard-coded references to ACPI dev=
ice
> =C2=A0=C2=A0=C2=A0IDs (representing devices integrated on the SoC dev=
ices) for the
> =C2=A0=C2=A0=C2=A0purpose of pin map and gpio references? Or is it re=
quired to
> =C2=A0=C2=A0=C2=A0use only named gpio pins?
>=20
> Any feedback/suggestions on the questions above, and the patch series
> in general, would be greatly appreciated!
>=20
> Further information on the UP board can be obtained from [1] and [2].

Ismo, since you are doing something regarding Intel Galileo open
connected board I think you would be interested in this discussion sinc=
e
it brings for example pinctrl driver for a _board_ which Galileo and
Edison/Arduino need.

>=20
> [1] https://www.up-board.org
> [2] https://up-community.org
>=20
> Dan O'Donovan (5):
> =C2=A0 platform: x86: add driver for UP Board I/O CPLD
> =C2=A0 platform: x86: add UP Board I/O pinctrl driver
> =C2=A0 platform: x86: add UP Board I/O gpio driver
> =C2=A0 platform: x86: add UP Board CPLD LED driver
> =C2=A0 platform: x86: add platform driver for UP Board
>=20
> =C2=A0drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A013 +
> =C2=A0drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A05 +
> =C2=A0drivers/platform/x86/up_board.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 167 ++++++++++
> =C2=A0drivers/platform/x86/up_board_cpld.c=C2=A0=C2=A0=C2=A0=C2=A0| 5=
60
> ++++++++++++++++++++++++++++++++
> =C2=A0drivers/platform/x86/up_board_cpld.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A038 +++
> =C2=A0drivers/platform/x86/up_board_gpio.c=C2=A0=C2=A0=C2=A0=C2=A0| 2=
54 +++++++++++++++
> =C2=A0drivers/platform/x86/up_board_gpio.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A059 ++++
> =C2=A0drivers/platform/x86/up_board_leds.c=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A085 +++++
> =C2=A0drivers/platform/x86/up_board_leds.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A050 +++
> =C2=A0drivers/platform/x86/up_board_pinctrl.c | 285 ++++++++++++++++
> =C2=A0drivers/platform/x86/up_board_pinctrl.h | 102 ++++++
> =C2=A011 files changed, 1618 insertions(+)
> =C2=A0create mode 100644 drivers/platform/x86/up_board.c
> =C2=A0create mode 100644 drivers/platform/x86/up_board_cpld.c
> =C2=A0create mode 100644 drivers/platform/x86/up_board_cpld.h
> =C2=A0create mode 100644 drivers/platform/x86/up_board_gpio.c
> =C2=A0create mode 100644 drivers/platform/x86/up_board_gpio.h
> =C2=A0create mode 100644 drivers/platform/x86/up_board_leds.c
> =C2=A0create mode 100644 drivers/platform/x86/up_board_leds.h
> =C2=A0create mode 100644 drivers/platform/x86/up_board_pinctrl.c
> =C2=A0create mode 100644 drivers/platform/x86/up_board_pinctrl.h
>=20

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
