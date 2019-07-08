From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Mon, 8 Jul 2019 21:39:39 +0200
Message-ID: <16c856e1-4672-4503-72ee-de70d0b5455f@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
 <e2c50449b498c796de8258fac0b0aba6@dev.tdt.de>
 <CAHp75VdHPRXgg6YsBM8uAfuM4CBs1HHn1condus6uW5BqC5COg@mail.gmail.com>
 <226c0a14b7a662be019d02eee4695d17@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <226c0a14b7a662be019d02eee4695d17@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 05.07.19 13:36, Florian Eckert wrote:

Hi,

> APU1 (PC-Engines) CPU "AMD G series T40E APU":> This is also an old design and is not recommend for new design>
(deprecated).> Also not many were produced and are in the field.> See
https://pcengines.ch/apu.htm
Yes, and I haven't been able to get one yet, so I dropped my original
plan of supporting this once. The gpio device is very different.

> Platform-Device (LEDs, Button):> I have no platform device description found in the linux sources.> So
the GPIO button should not work.
Talking about the old driver ? It only supports the three front LEDs
directly and conflicts w/ anything else that wants to support other
GPIOs.

> Platform-Device (LEDs, Button):
> This Platform description is only valid for APU2/APU3 and not for APU1.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/pcengines-apuv2.c

Correct. If we really wanna support APUv1, that most likely become a
completely separate driver, as the chipsets are very different.

> LEDs-Driver:
> We have an additional device only for LEDs this works for APU1/APU2/APU3.
> I think we should remove the APU2/APU3 LEDs from the leds-apu device as
> mentioned above.
> So this device supports only the APU1 LEDs.

ACK.

> We could extend and/or rename the pcengienes-apuv2 device to support
> also APU3 and the newest APU4.

APUv3 already is supported. APUv4 again is pretty different, and I don't
have one yet. (if anybody convices pcengines to give me some boards,
I'll add support for them :))

> The APU3 does have an additional the simswap pin.

Already planned to add it, but not yet sorted into which subsystem it
actually belongs to.

> We should change this to the following layout and add the legacy GPIO
> numbering.

First we'll have to sort out where the new pins actually belong into.
(maybe power management / regulators for the reset pins ?)

> ALIX (PC-Engines) CPU "AMD Geode LX":
> This is an old design we have already in use and is not recommend for
> new design (deprecated)
> https://pcengines.ch/alix.htm

And it's an entirely different chipset, not related at all to apu.

> I think we should leave the driver as it is because this is a different
> design and has nothing to do with the PUs.

Yes.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
