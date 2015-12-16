From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 16 Dec 2015 11:29:18 +0100
Message-ID: <56713CFE.8090201@redhat.com>
References: <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali> <559C1C17.3060009@dell.com>
 <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
 <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl> <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl> <20151216093057.GQ13531@pali>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030203020205050905040004"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36518 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933879AbbLPK30 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Dec 2015 05:29:26 -0500
In-Reply-To: <20151216093057.GQ13531@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030203020205050905040004
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 16-12-15 10:30, Pali Rohár wrote:
> On Wednesday 16 December 2015 10:05:31 Michał Kępień wrote:
>>>> I have recently noticed that backlight control on a Vostro V131 running
>>>> Linux has some glitches as well.  Before WMI gets enabled, pressing
>>>> either the "brightness down" (Fn+F4) or the "brightness up" (Fn+F5) key
>>>> causes two "presses" of the respective keycode (KEY_BRIGHTNESSUP or
>>>> KEY_BRIGHTNESSDOWN) to be reported.  This itself seems buggy to me, but
>>>> whatever.  The worse part is that there is an irritating flickering
>>>> effect as well [1].
>>>
>>>  From that bug I understood that solution is to use native backlight
>>> control (via acpi_backlight=native). This is something which can be
>>> forced or changed by default per DMI type (for buggy machines like
>>> this). Right?
>>
>> Setting acpi_backlight=native only solves the flickering problem.  So if
>> you don't want to enable WMI (i.e. use the Dell Instant Launch hotkey),
>> that's it, you're good.  But once you add the WMI-enabling SMI into the
>> mix, things go awry again.  In other words, I see no way of making all
>> features of this laptop work correctly at the same time without
>> resorting to DSDT patching (or properly fixing the firmware).
>> Hopefully, someone will.  See below for a detailed explanation.
>>
>>>> But if that wasn't enough, it gets even worse after
>>>> issuing the WMI-enabling SMI call, because the keycode simulated by ACPI
>>>> gets "shifted" by one event while the WMI events are reported correctly.
>>>> Consider the following sequence of key presses:
>>>>
>>>> Key pressed     Keycode reported        WMI event reported
>>>> -----------     ----------------        ------------------
>>>> Fn+F4           (none)                  0xe005
>>>> Fn+F4           KEY_BRIGHTNESSDOWN      0xe005
>>>> Fn+F5           KEY_BRIGHTNESSDOWN      0xe006
>>>> Fn+F5           KEY_BRIGHTNESSUP        0xe006
>>>> Fn+Mute         KEY_BRIGHTNESSUP        0x0000
>>>> Fn+Mute         (none)                  0x0000
>>>
>>> Hm... I'm not sure if I understood this problem correctly, but those
>>> keycodes are reported on i8042 bus by atk keyboard? Or are reported by
>>> ACPI video.ko module? And problem is only with brightness keys?
>>>
>>> What happen if you boot 4.2+ kernel with acpi_backlight=native?
>>
>> Okay, so here is the full story.  First, assume you're booting an
>> unpatched kernel with default command line arguments.  When you press
>> the "brightness up" or "brightness down" key, its scancode is reported
>> by the i8042 driver.  That's perfect, but the CESM method still does two
>> things: it sends a request to the i915 driver using the ASLE OpRegion
>> _and_ notifies the ACPI video driver about brightness change.  Note that
>> it probably does both of these things due to a broken conditional
>> expression in the AML code.  With acpi_backlight=native, the ASLE
>> request is ignored by the i915 driver (which alleviates the flickering
>> problem), but the Notify() calls inside the CESM method still cause
>> another (identical) scancode to be emitted by acpi-video (to be precise,
>> by acpi_video_device_notify()).  dell-wmi is not involved, because no
>> WMI events are generated.  In total, you get two identical scancodes for
>> a single key press.  It's suboptimal, but at least not completely
>> broken.
>>
>> Now, assume you perform the WMI-enabling SMI call.  It causes the
>> brightness keys to no longer be reported by i8042, but rather using WMI
>> events.  Unless acpi_backlight=native, dell-wmi will remain idle, but
>> the ACPI video driver will still emit scancodes.  In other words, you
>> will get a single scancode for each key press.  Sounds good, but not
>> really because the generated scancodes are shifted (see the table from
>> my previous message in this thread) and you are still left with the
>> flickering issue.  If you use acpi_backlight=native, the flickering will
>> be gone, but then dell-wmi will start reacting to key presses as well
>> and in the extreme case you might get two different scancodes
>> (KEY_BRIGHTNESSUP and KEY_BRIGHTNESSDOWN) for a single key press - one
>> (the correct one) will be generated by dell-wmi and the other (the
>> shifted one) by acpi-video.
>>
>> The most straightforward hack seems to be to just kill CESM with fire
>> and then with acpi_backlight=native you will get a single, correct
>> scancode for each key press.  Though that solution is still not ideal
>> because it makes it impossible to change brightness without using some
>> userspace helper.
>>
>> Answering your question, AFAICT brightness keys are the only ones
>> affected by the WMI-enabling SMI call, but that's bad enough.  Without
>> DSDT patching you have to choose between hotkey support and sane
>> brightness control.  Unless you can prove me wrong, which I am hoping
>> for.
>>
>
> CCing Hans de Goede
>
> Hans, you tried to fix problems with acpi backlight... do you have idea
> how to fix above problem with those two brightness keys?
>
> In my opinion we should drop keypress events in acpi-video module. And
> use event from dell-wmi if SMM was enabled.

Pali, thanks for bringing this one to my attention, so as I see it we
need to do a number of things:

1) Add a dmi based quirk to: drivers/acpi/video_detect.c to
    use native backlight on this model, so that the flickering gets fixed,
    for now you can use acpi_backlight=native for testing, until we've got
    the keys sorted out and then we should submit a kernel patch with this
    quirk

2a) I'm not familiar with the WMI bits, but as I see it we want that driver to
    be loaded to get other hotkeys to work, so lets load it (I assume this will
    already happen automatically if enabled). If I understand things correctly
    then doing this will silence the i8042 generated brightness key events, but
    it will cause the acpi-video bus generated key events lag in time by one
    event. So we will need an option in drivers/acpi/acpi_video.c to stop it
    from generating key-presses, this may be useful in some other (rare) cases
    too. I've written a patch for this (attached), can you build a kernel with
    this patch and then add "video.report_key_events=1" to the kernel cmdline
    and see if that helps ?

Or alternatively we could not load the wmi driver, and fix the double events
being reported by the i8042 / atkbd driver by adding a udev hwdb entry to
filter these out, we already do that for some laptops because of similar issues,
see e.g. this part of: /lib/udev/hwdb.d/60-keyboard.hwdb

# Dell Inspiron 1520
evdev:atkbd:dmi:bvn*:bvr*:bd*:svnDell*:pnInspiron*1520:pvr*
KEYBOARD_KEY_85=unknown # Brightness Down, also emitted by acpi-video, ignore
KEYBOARD_KEY_86=unknown # Brightness Up, also emitted by acpi-video, ignore

To test this you need to edit /lib/udev/hwdb.d/60-keyboard.hwdb add an entry
for your laptop (see "cat /sys/class/dmi/id/product_name" output to find what to
put after "pn" ), then rebuild the hwdb: "sudo udevadm hwdb --update" and then
reboot, yes reboot there is another way to re-apply the rules but rebooting is
really so much easier.

I think you should try this method too and see if the flickering goes away
when fixing the double events, without needing to use acpi_backlight=native.

It is also not clear to me if you've tried using the WMI events without
acpi_backlight=native, maybe that fixes things magically ?

Regards,

Hans

--------------030203020205050905040004
Content-Type: text/x-patch;
 name="0001-acpi-video-Add-a-module-option-to-disable-the-report.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-acpi-video-Add-a-module-option-to-disable-the-report.pa";
 filename*1="tch"

From fc76b85ba7fd6fa9a37b696ab743568d5c7742c4 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 16 Dec 2015 11:19:00 +0100
Subject: [PATCH] acpi-video: Add a module option to disable the reporting of
 keypresses

Add a module option to disable the reporting of keypresses, in some buggy
firmware implementatinon, the reported events are wrong. E.g. they lag
reality by one event in the case triggering the writing of this patch.

In this case it is better to not forward these wrong events to userspace
(esp.) when there is another source of the same events which is not buggy.

Note this is only intended to work around implementations which send
events which are plain wrong. In some cases we get double events, e.g.
from both acpi-video and the atkbd driver, in this case acpi-video is
considered the canonical source, and the events from the other source
should be filtered (using e.g. /lib/udev/hwdb.d/60-keyboard.hwdb).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 3405f7a..d41c95b 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -77,6 +77,13 @@ module_param(allow_duplicates, bool, 0644);
 static int disable_backlight_sysfs_if = -1;
 module_param(disable_backlight_sysfs_if, int, 0444);
 
+#define REPORT_OUTPUT_KEY_EVENTS		0x01
+#define REPORT_BRIGHTNESS_KEY_EVENTS		0x02
+static int report_key_events = -1;
+module_param(report_key_events, int, 0644);
+MODULE_PARM_DESC(report_key_events,
+	"0: none, 1: output changes, 2: brightness changes, 3: all");
+
 static bool device_id_scheme = false;
 module_param(device_id_scheme, bool, 0444);
 
@@ -1480,7 +1487,7 @@ static void acpi_video_bus_notify(struct acpi_device *device, u32 event)
 		/* Something vetoed the keypress. */
 		keycode = 0;
 
-	if (keycode) {
+	if (keycode && (report_key_events & REPORT_OUTPUT_KEY_EVENTS)) {
 		input_report_key(input, keycode, 1);
 		input_sync(input);
 		input_report_key(input, keycode, 0);
@@ -1544,7 +1551,7 @@ static void acpi_video_device_notify(acpi_handle handle, u32 event, void *data)
 
 	acpi_notifier_call_chain(device, event, 0);
 
-	if (keycode) {
+	if (keycode && (report_key_events & REPORT_BRIGHTNESS_KEY_EVENTS)) {
 		input_report_key(input, keycode, 1);
 		input_sync(input);
 		input_report_key(input, keycode, 0);
-- 
2.5.0


--------------030203020205050905040004--
