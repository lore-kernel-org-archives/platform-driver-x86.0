From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH 00/11] asus-wmi: Support of ASUS TUF Gaming series laptops
Date: Wed, 10 Apr 2019 22:11:33 +0200
Message-ID: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

I'm new to kernel development, so first I would like to apologize in
advance for any mistakes.

The support for this laptop series is currently non-existent, as the
asus-nb-wmi driver (which is essentially configuration for asus-wmi) fails
to load and multiple ACPI errors are logged in dmesg. This patch series
adds pretty comprehenisve support for these relatively new laptops, adds
some code organization, and fixes couple of bugs in the asus-wmi module.

I have FX565GM (FX505GM) model, but I would guess that the same will
likely apply to the complete FX505 / FX705 series. I've also tested 
this on an older K54C model to ensure that it doesn't break support.
Unfortunately I don't have capacity to test this on more devices.

The patches 1 and 2 are pure bug fixes, but I can not measure relevance
for stable.

OVERALL DESIGN DECISIONS
Besides this patch, I've written experimental separate driver [1] for this
series to make it usable on my system as a DKMS module for 4.18 kernel for
the time being. One might wonder if it is more reasonable to make a new
independent module. The things to consider are that: asus-nb-wmi is
currently loaded by the WMI GUID alias, whereas the original ASUS driver
does check for the ASUS7000 device in ACPI. One should then choose
appropriate base driver instead of asus-wmi when asus-nb-wmi is loaded,
about third of the code gets duplicated in this case and the whole ends up
ugly.

Another question, does it make sense to embed RGB keyboard backlight
support in kernel code? There was discussion [2] about exposing WMI to the
userspace. The same would apply for the fan boost mode support. As I
understand as of yet it is still preferrable to support hardware features
in kernel.

NOTE ON HWMON
One open issue with the result is that hwmon device gets loaded anyway,
but it does not do anything noticeable. The heavily reduced code for the
MFUN is present in DSDT, but it either really does nothing or possibly
call something unnoticeable via DMA.

I've managed to detect that thermal sensor is not present, but the MFUN
for read fan speed does return 0 and not an error. Taking this as 
condition for disabling hwmon might intermittently break some existing
devices if the RPM is really 0 (no idea if that is really possible). One
might ponder on the better way to detect the presence of manual fan
control.

NOTE ON QUIRKS
I would speculate that the queue might be really present in many more
devices, it just didn't get noticed. Anyway after this is merged one might
consider if it is reasonable to enable it always and fallback if flush
fails. The patch does enable the new quirks only for very new models.

Regarding the DSTS force quirk, as I understand the underlying issue is a
workaround for EEEPC devices and use of DSTS is more conventional. It
might be reasonable to find a way to detect specific DSTS device ID that
is present on EEEPC instead, apply same ACPI device detection approach or
just duplicate the relevant method calls. I don't have access to such
device or it's DSDT and can't evaluate any of these options myself.

NOTE ON KEYBOARD BACKLIGHT
When the keyboard backlight is set via 0x50021 DEVID the brightness drops
slightly compared to brightness after boot. I did not found any way to
revert this. The method does set some bit in EC RAM, but this address is
not used anywhere else.  Unfortunately I wiped original OS after two hours
after unpacking.If someone can verify whether it is identical to behavior
of the vendor driver it would be appreciated.

NOTE ON UPOWER DAEMON
If you're testing with GNOME, notice that UPower does hang pretty badly if
the module is removed at runtime at least on my device. Stop it with
'systemctl stop upower' before removing the module and then restart it
again.

[1] https://github.com/hackbnw/faustus
[2] https://lwn.net/Articles/725725/

Yurii Pavlovskyi (11):
  platform/x86: asus-wmi: Fix hwmon device cleanup
  platform/x86: asus-wmi: Fix preserving keyboard backlight intensity on
    load
  platform/x86: asus-wmi: Increase input buffer size of WMI methods
  platform/x86: asus-wmi: Add quirk to force DSTS WMI method detection
  platform/x86: asus-wmi: Support queued WMI event codes
  platform/x86: asus-nb-wmi: Add microphone mute key code
  platform/x86: asus-wmi: Organize code into sections
  platform/x86: asus-wmi: Enhance detection of thermal data
  platform/x86: asus-wmi: Control RGB keyboard backlight
  platform/x86: asus-wmi: Switch fan boost mode
  platform/x86: asus-wmi: Do not disable keyboard backlight on unload

 .../ABI/testing/sysfs-platform-asus-wmi       |  71 ++
 drivers/platform/x86/asus-nb-wmi.c            |   9 +-
 drivers/platform/x86/asus-wmi.c               | 755 +++++++++++++++---
 drivers/platform/x86/asus-wmi.h               |   7 +
 include/linux/platform_data/x86/asus-wmi.h    |   3 +
 5 files changed, 742 insertions(+), 103 deletions(-)

-- 
2.17.1
