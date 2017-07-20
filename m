From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Thu, 20 Jul 2017 08:42:57 +0200
Message-ID: <20170720064257.GA4942@larwa.localdomain>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey <harv@gmx.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Hello,

Hi!  Thank you for the report and sorry about the delay, but I have been
at a conference for the past week, having way less spare time than I
wish I had.

> I found your mail address in https://patchwork.kernel.org/patch/8598801/
> and it seems you are somehow involved in the improvement for
> fujitsu-laptop LED handling. If this does not 'belong' to you, maybe you
> can point me in the right direction where to report the issue.

No worries, that is fine, though I have CCed Jonathan Woithe, who is the
maintainer of fujitsu-laptop, and both the platform-driver-x86 mailing
list and LKML (both are open lists).

> So let's start explaining.
> I am the proud owner of a Fujitsu Lifebook E 751 (DMI: FUJITSU LIFEBOOK
> E751/FJNB222, BIOS Version 1.22 04/19/2013) which is equipped with some
> LEDs in the body (11 to be clear).

A photo would be useful (though please do not attach it to your message,
provide a link to it instead) so that we know exactly what we are
discussing; image search engines can sometimes come up with confusing
results when looking for a specific model.  Is this what your laptop
looks like?

https://www.notebookcheck.net/fileadmin/_migrated/pics/Fujitsu-LB-E751-Tastatur_1j.jpg

I also found an alleged photo of an E781, which apparently is a very
similar model:

https://www.notebookcheck.com/fileadmin/_processed_/csm_Fujitsu_lifebook_E781_Tastatur_67df789f2a.jpg

Are these the 11 LEDs you mentioned?

  - top, left: E, HDD, Num Lock, Caps Lock, Scroll Lock,
  - top, right: I, Power Button,
  - front (not pictured in the first photo above): Power Supply, Battery
    Charging, Battery 1, Battery 2.

> I am using archlinux and as of kernel
> 4.11 (IIRC) there has appeared an error message in the journalctl log
> saying:
> 
> kernel: leds fujitsu::radio_led: Setting an LED's brightness failed
> (-2147483648)
> 
> This appears for several times:
> 
> harvey@gruenix ~/Documents/scripts $ sudo journalctl -b | grep radio_led
> 725:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 761:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 762:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 788:Jul 14 12:29:38 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 796:Jul 14 12:29:38 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 799:Jul 14 12:29:38 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 887:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 979:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 981:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 987:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 988:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1009:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1010:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1036:Jul 14 12:29:46 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1037:Jul 14 12:29:46 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1776:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1777:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1779:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1781:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)
> 1783:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting an
> LED's brightness failed (-2147483648)

4.11 included a patch which sets the default trigger for the radio LED
to rfkill-any, which would explain why you only started seeing these
errors after upgrading to that version.  See also below.

> Some of the LEDs are not working under linux, especially the bluetooth
> one

Where is the Bluetooth LED located?  I cannot see it.  Can you show it
on a photo?  How does it behave under other operating systems?

> and three others E,

According to a manual I found [1], this is an "Energy saving functions
indicator", which is lit when "energy function are enabled".  My guess
would be it can be repurposed under Linux.

> I(nformation)

According to the same manual, this LED signals battery level when the
laptop is off (S5 state) and the "I" key is pressed.  Not sure it can be
repurposed, but how does it behave under other operating systems?

> and one that shows the sign of a
> lock with up and down arrows in it.

That is Scroll Lock.  I do not think fujitsu-laptop has anything to do
with it.  If it does not work the way you expect it to, you might want
to search the web, because there are known inconsistencies in how
various distributions handle it.

> The case is equipped with a slider
> for Wireless on/off, if that matters.

It does, see also below.

> Although the message seems to be harmless I am somewhat embarrassed what
> happens here and thought I might report it to someone with more knowledge ;)

Again, thank you for the report, because implementing a feature like
this in a platform driver often requires at least some guesswork, which
may result in that feature working for some users and misbehaving for
others.  This is an example of such a situation.

As you may have inferred from the patchwork link you visited, I was not
sure whether my method of detecting radio LED presence was correct.
Your report clearly proves I was wrong.  Could you please send me the
BTNI value reported on your laptop?  You should be able to look it up by
running:

    $ dmesg | grep BTNI
    
In fact, posting your entire dmesg output somewhere would not hurt
either.

Anyway, you were curious what causes these log messages to appear.  I
believe it happens because fujitsu-laptop _thinks_ you have a radio LED
present on your machine, which causes it to register this LED with a
default trigger set to rfkill-any.  This means the kernel tries to
enable this LED whenever any radio transmitter is active and disable it
when all radio transmissions are disabled.  In order to set the state of
the LED, the kernel driver calls a function exposed by the firmware.
This function returns an error, which is logged.  The specific error
number you are seeing (-2147483648) means "unsupported command", which
means fujitsu-laptop attempted to use a feature which is unsupported by
your laptop's firmware.  If you want to get rid of these messages,
running the following after every reboot should be enough:

    # echo "none" > /sys/class/leds/fujitsu::radio_led/trigger

However, I would appreciate it if you could help us with finding out the
correct way to detect the radio LED (it may as well turn out it is not
possible by just checking firmware contents).  For starters, we will
need your laptop's DSDT table, which you can extract using:

    # cat /sys/firmware/acpi/tables/DSDT > dsdt.bin

The resulting binary file dsdt.bin is what is needed for further
analysis.

[1] http://www.lpmanual.com/manuals/fujitsu/Fujitsu_LIFEBOOK_E751.pdf

-- 
Best regards,
Michał Kępień
