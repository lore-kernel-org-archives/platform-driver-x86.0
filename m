From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/4] fujitsu_init() cleanup
Date: Fri, 13 Jan 2017 12:02:36 +0100
Message-ID: <20170113110240.622-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

These patches should make fujitsu_init() a bit more palatable.  I
intentionally stopped after four patches, because they should do no harm
and the next steps require some discussion.

The problem I have with this driver is that it is generally oblivious to
the user's chosen backlight provider.  It was written before acpi_video
support for backlight control was automatically detected by the kernel
and as such it required a fix which was allegedly provided by
7d5c89a615c5 ("fujitsu-laptop: fingers off backlight if video.ko is
serving this functionality").  However, that fix was superficial as the
module still registered its vendor-specific ACPI driver for backlight
control.  That in turn caused SBLL/SBL2 to be called when brightness
hotkeys were pressed even when acpi_video was supposed to handle
brightness changes, which is exactly what that patch was hoping to
prevent.  Moreover, the module unconditionally exports backlight-related
sysfs attributes which enable userspace to change the brightness level,
which should also only be possible when vendor backlight control is
used.  Fast forward several years and on modern Fujitsu machines (e.g.
Lifebook E744), the kernel automatically detects that native backlight
control [1] should be used and SBLL becomes a noop [2].  This creates
confusion, because the driver claims that it can get/set LCD brightness
level via the platform device's sysfs attributes, but it actually
cannot.  It gets even more confusing on Skylake machines on which the
FUJ02B1 ACPI device is not present at all.

The proposal I put forward in regard to the above is to remove the three
backlight-related attributes (brightness_changed, lcd_level,
max_brightness) from the platform driver's sysfs tree.  I believe the
functions they implement should only be exposed through the backlight
device, because the latter is only created when the user explicitly
selects vendor backlight control or it is automatically selected by the
kernel (this should be the case for older machines).

That would leave us with the remaining three sysfs attributes of the
platform device, namely dock, lid and radios.  These all depend on the
FUJ02E3 ACPI device.  Which begs the question: shall we reassign them to
that ACPI device and drop the platform device altogether?  This would
logically be the correct thing to do (panasonic-laptop and toshiba_acpi
already assign extra sysfs attributes to ACPI nodes).  But I understand
that this would break an 8-year-old userspace interface as functions
previously exposed through /sys/devices/platform/fujitsu-laptop would be
moved to /sys/bus/acpi/devices/FUJ02E3:00.  If that is unacceptable, the
least we can (and should) do is to move platform device registration to
acpi_fujitsu_hotkey_add().  What the driver currently does may create
confusion in the future, because the platform device is registered
unconditionally while it clearly depends on FUJ02E3 being present.  I do
not know whether FUJ02E3 is present on all Fujitsu devices today without
exception, but I do know that if Fujitsu ever decides to drop that
device from its firmware, we would again (see above) expose a userspace
interface (dock, lid, radios) which simply will not be able to function
properly.

I am happy to provide patches for whatever solution gets chosen, but
first I would really appreciate if you (and anyone interested) could
comment on the issues I described above.  Thanks!

[1] This means the kernel does not handle backlight brightness changes
    on its own but instead delegates this task to userspace and only
    feeds it input events which indicate the user requested a brightness
    change.  For more information, see fbc9fe1b4f22 ("ACPI / video: Do
    not register backlight if win8 and native interface exists").

[2] It can be invoked, but it does not change screen brightness.

 drivers/platform/x86/fujitsu-laptop.c | 98 ++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 48 deletions(-)

-- 
2.11.0
