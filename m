From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [RESEND][PATCH 0/5] Support for the TS-5500 board
Date: Tue, 9 Aug 2011 23:32:08 -0400
Message-ID: <20110809233208.1a71122e@lenov0n>
References: <1311887450-22235-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([209.172.62.77]:58927 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752558Ab1HJDcR convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Aug 2011 23:32:17 -0400
In-Reply-To: <1311887450-22235-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, mjg@redhat.com, platform-driver-x86@vger.kernel.org

Le Thu, 28 Jul 2011 17:10:45 -0400,
Vivien Didelot <vivien.didelot@savoirfairelinux.com> a =E9crit :

> This set of patches brings the support for the Technologic Systems
> TS-5500 Single Board Computer.
>=20
> The first patch adds the base for the support of the board in
> /arch/x86/platform/ts5500 and a documentation file in
> Documentation/ABI/testing/sysfs-platform-ts5500.
>=20
> The second patch adds support for GPIO.
>=20
> The third patch adds support for the on-board LED.
>=20
> The fourth patch brings support for the Analogic/Digital converter.
>=20
> The fifth patch moves the already existing support for the Flash MTD
> into the /arch/x86/platform/ts5500 directory.
>=20
> Jerome Oufella (1):
>   gpio: add support for TS-5500 GPIO
>=20
> Jonas Fonseca (2):
>   leds: add support for TS-5500 LED
>   adc: add support for TS-5500 ADC
>=20
> Vivien Didelot (2):
>   x86: base support for TS-5500 Single Board Computer
>   mtd: move support for TS-5500 MTD
>=20
>  Documentation/ABI/testing/sysfs-platform-ts5500 |   46 +++
>  MAINTAINERS                                     |   13 +
>  arch/x86/Kconfig                                |    2 +
>  arch/x86/platform/Makefile                      |    1 +
>  arch/x86/platform/ts5500/Kconfig                |   47 +++
>  arch/x86/platform/ts5500/Makefile               |    5 +
>  arch/x86/platform/ts5500/ts5500.c               |  440
> +++++++++++++++++++++++
> arch/x86/platform/ts5500/ts5500_adc.c           |  326
> +++++++++++++++++ arch/x86/platform/ts5500/ts5500_adc.h           |
> 62 ++++ arch/x86/platform/ts5500/ts5500_flash.c         |  118 ++++++
> arch/x86/platform/ts5500/ts5500_gpio.c          |  421
> ++++++++++++++++++++++
> arch/x86/platform/ts5500/ts5500_gpio.h          |   60 +++
> arch/x86/platform/ts5500/ts5500_leds.c          |  133 +++++++
> drivers/mtd/maps/Kconfig                        |   18 -
> drivers/mtd/maps/Makefile                       |    1 -
> drivers/mtd/maps/ts5500_flash.c                 |  121 ------- 16
> files changed, 1674 insertions(+), 140 deletions(-) create mode
> 100644 Documentation/ABI/testing/sysfs-platform-ts5500 create mode
> 100644 arch/x86/platform/ts5500/Kconfig create mode 100644
> arch/x86/platform/ts5500/Makefile create mode 100644
> arch/x86/platform/ts5500/ts5500.c create mode 100644
> arch/x86/platform/ts5500/ts5500_adc.c create mode 100644
> arch/x86/platform/ts5500/ts5500_adc.h create mode 100644
> arch/x86/platform/ts5500/ts5500_flash.c create mode 100644
> arch/x86/platform/ts5500/ts5500_gpio.c create mode 100644
> arch/x86/platform/ts5500/ts5500_gpio.h create mode 100644
> arch/x86/platform/ts5500/ts5500_leds.c delete mode 100644
> drivers/mtd/maps/ts5500_flash.c
>=20

This set of patches has been sent two times without any answer yet.
Can I have any feedback please?

Regards,
Vivien.
