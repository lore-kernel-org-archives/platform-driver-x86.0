From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 15 Jun 2018 13:37:28 +0200
Message-ID: <20180615113728.h7snxhe2juaqvjyx@pali>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615112606.GA3986@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Friday 15 June 2018 13:26:06 Pavel Machek wrote:
> Hi!
> 
> > Hi! With up-to-date thinkpad_acpi.ko driver on ThinkPad T480s I'm seeing
> > a strange behavior of LEDs which are integrated into mic mute (Fn+F4)
> > and mute (Fn+F1) keys.
> > 
> > When thinkpad_acpi.ko is not loaded, then mute key is working fine. When
> > pressed, it correctly generates KEY_MUTE on AT Translated Set 2 keyboard
> > input device and also turn on/of mute led. But when micmute key is
> > pressed then, nothing happen. No key event is reported and also led is
> > not turned on/off.
> > 
> > On the other hand, when thinkpad_acpi.ko is loaded, then both buttons
> > mute and micmute correctly generates input events; mute via AT keyboard
> > and micmute via ThinkPad Extra Buttons. But led is not changed. When
> > thinkpad_acpi.ko is loaded it turn off both leds (mute and micmute) and
> > leds after pressing any of those buttons, leds are not turned on again.
> 
> With thinkpad_acpi.ko loaded, kernel should handle the LEDs, right?

I suppose. But I would be happy even with working "hardware" controlling
(which is working fine when thinkpad_acpi.ko is unloaded).

> Do we have a support for that?

In thinkpad_acpi.c there are some TPACPI_LED_MUTE and TPACPI_LED_MICMUTE
keywords. And also function static int mute_led_on_off(). So some kind
of support there is.

> Do they have directories in /sys/class/leds? What are the triggers there?

No.

$ ll /sys/class/leds
total 0
drwxr-xr-x  2 root root 0 Jun 15 13:27 ./
drwxr-xr-x 51 root root 0 Jun 15 13:27 ../
lrwxrwxrwx  1 root root 0 Jun 15 13:27 input0::capslock -> ../../devices/platform/i8042/serio0/input/input0/input0::capslock/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 input0::numlock -> ../../devices/platform/i8042/serio0/input/input0/input0::numlock/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 input0::scrolllock -> ../../devices/platform/i8042/serio0/input/input0/input0::scrolllock/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 phy0-led -> ../../devices/pci0000:00/0000:00:1c.6/0000:3d:00.0/leds/phy0-led/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 tpacpi::kbd_backlight -> ../../devices/platform/thinkpad_acpi/leds/tpacpi::kbd_backlight/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 tpacpi::power -> ../../devices/platform/thinkpad_acpi/leds/tpacpi::power/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 tpacpi::standby -> ../../devices/platform/thinkpad_acpi/leds/tpacpi::standby/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 tpacpi::thinklight -> ../../devices/platform/thinkpad_acpi/leds/tpacpi::thinklight/
lrwxrwxrwx  1 root root 0 Jun 15 13:27 tpacpi::thinkvantage -> ../../devices/platform/thinkpad_acpi/leds/tpacpi::thinkvantage/

But looks like that thinkpad_acpi.c does not define any struct
led_classdev nor struct tpacpi_led_classdev for MUTE or MICMUTE.

Henrique, any idea why there are no exported led classes for mute and
micmute? And how are suppose to be controlled?

> With thinkpad_acpi.ko unloaded, hardware drives the LEDs, so nothing
> for us to do...

So somehow tell thinkpad_acpi.ko to let hardware control those LEDs when
thinkpad_acpi.ko is loaded?

-- 
Pali Rohár
pali.rohar@gmail.com
