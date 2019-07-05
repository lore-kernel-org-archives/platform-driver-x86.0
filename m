From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Fri, 05 Jul 2019 13:36:47 +0200
Message-ID: <226c0a14b7a662be019d02eee4695d17@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
 <e2c50449b498c796de8258fac0b0aba6@dev.tdt.de>
 <CAHp75VdHPRXgg6YsBM8uAfuM4CBs1HHn1condus6uW5BqC5COg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdHPRXgg6YsBM8uAfuM4CBs1HHn1condus6uW5BqC5COg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello Andy

>> >> This patchset adds the following changes to this pcengines-apuv2
>> >> platform device.
>> >>
>> >
>> > Before doing anything to this driver, what is the plan for previously
>> > upstreamed:
>> >
>> > drivers/leds/leds-apu.c
>> 
>> I think we can remove the related APU2/APU3 code stuff from this 
>> driver.
>> The recently added pcengines-apuv2 driver does *not* support the APU1.
>> So I think we need the related APU1 stuff if we still want to support
>> this board.
> 
> So, I would like to see some unification (since it's material for v5.4
> cycle anyway, we have time).

A few thoughts and information about your suggestion to unify this.

APU1 (PC-Engines) CPU "AMD G series T40E APU":
This is also an old design and is not recommend for new design 
(deprecated).
Also not many were produced and are in the field.
See https://pcengines.ch/apu.htm

Platform-Device (LEDs, Button):
I have no platform device description found in the linux sources.
So the GPIO button should not work.

LEDs-Driver:
Only the LEDs should work with this device driver.
This is shared additonal with new APU2/APU3.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/leds/leds-apu.c

I think we should remove the APU2/APU3 stuff. This will now be handled 
by the new gpio-amd-fch.c / pcengines-apuv2.c
kombination.


APU2/APU3/APU4 (PC-Engines) CPU "AMD Embedded G series GX-412TC":
This is the newest design and is recommend for new products.
See https://pcengines.ch/apu2.htm

GPIO-Driver:
The following driver is responsible for the GPIO export and handling
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-amd-fch.c

Platform-Device (LEDs, Button):
This Platform description is only valid for APU2/APU3 and not for APU1.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/pcengines-apuv2.c

LEDs-Driver:
We have an additional device only for LEDs this works for 
APU1/APU2/APU3.
I think we should remove the APU2/APU3 LEDs from the leds-apu device as 
mentioned above.
So this device supports only the APU1 LEDs.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/leds/leds-apu.c

We could extend and/or rename the pcengienes-apuv2 device to support 
also APU3 and the newest APU4.
The APU2 does only have LEDs Button and the MPCIE2 reset lines see my 
patch.
The APU3 does have an additional the simswap pin.
So the current pcengines-apuv2 platform is from my point of view wrong.
We should change this to the following layout and add the legacy GPIO 
numbering.

This are the following GPIOs:

APU2:
LED1
LED2
LED3
BUTTON
MPCIE2
MPCIE3

APU3:
LED1
LED2
LED3
BUTTON
MPCIE2
MPCIE3
SIMSWAP

APU4:
TODO


>> > arch/x86/platform/geode/alix.c
>> 
>> I think this is not related because this is a different platform 
>> driver.
>> Maybe we should move them to drivers/platform/x86?
> 
> You mentioned somewhere ALIx, can you elaborate if these are platforms
> of the same family (PC engines)?
> 
> Looking into the code, I think we may unify all three under umbrella
> of one driver if the above is true.

ALIX (PC-Engines) CPU "AMD Geode LX":
This is an old design we have already in use and is not recommend for 
new design (deprecated)
https://pcengines.ch/alix.htm

GPIO-Driver:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-cs5535.c

Platform-Device (LEDs, button):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/geode/alix.c

I think we should leave the driver as it is because this is a different 
design and has nothing to do with the PUs.
The only thing I can imagine is to move the platform device to 
"drivers/platform/x86", but this is cosmetic.
I have only mentioned the alix board to explain why I think that we 
should change the APU key code from the GPIO button to unify this.

With Best Regards,

Florian
