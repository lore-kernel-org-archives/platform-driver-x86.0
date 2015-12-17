From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Thu, 17 Dec 2015 10:48:23 +0100
Message-ID: <567284E7.3050103@redhat.com>
References: <559C1C17.3060009@dell.com>
 <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
 <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl> <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl> <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com> <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030403070309070308000909"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36063 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750846AbbLQJsc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Dec 2015 04:48:32 -0500
In-Reply-To: <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030403070309070308000909
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michał,

On 17-12-15 09:05, Michał Kępień wrote:
> Hi Hans,
>
>> Pali, thanks for bringing this one to my attention, so as I see it we
>> need to do a number of things:
>>
>> 1) Add a dmi based quirk to: drivers/acpi/video_detect.c to
>>     use native backlight on this model, so that the flickering gets fixed,
>>     for now you can use acpi_backlight=native for testing, until we've got
>>     the keys sorted out and then we should submit a kernel patch with this
>>     quirk
>>
>> 2a) I'm not familiar with the WMI bits, but as I see it we want that driver to
>>     be loaded to get other hotkeys to work, so lets load it (I assume this will
>>     already happen automatically if enabled). If I understand things correctly
>>     then doing this will silence the i8042 generated brightness key events, but
>>     it will cause the acpi-video bus generated key events lag in time by one
>>     event. So we will need an option in drivers/acpi/acpi_video.c to stop it
>>     from generating key-presses, this may be useful in some other (rare) cases
>>     too. I've written a patch for this (attached), can you build a kernel with
>>     this patch and then add "video.report_key_events=1" to the kernel cmdline
>>     and see if that helps ?
>
> Thank you for a quick response.  Your patch works fine.  If per-model
> key event generation suppression is acceptable, I believe this would
> indeed work around V131's issues.  The elegance of this solution is that
> it doesn't depend on the state of WMI event reporting - if it is off,
> events will still be correctly reported by i8042; if it is on, dell-wmi
> will generate them.  Either way, the behavior will be correct.
>
>> Or alternatively we could not load the wmi driver, and fix the double events
>> being reported by the i8042 / atkbd driver by adding a udev hwdb entry to
>> filter these out, we already do that for some laptops because of similar issues,
>> see e.g. this part of: /lib/udev/hwdb.d/60-keyboard.hwdb
>>
>> # Dell Inspiron 1520
>> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnDell*:pnInspiron*1520:pvr*
>> KEYBOARD_KEY_85=unknown # Brightness Down, also emitted by acpi-video, ignore
>> KEYBOARD_KEY_86=unknown # Brightness Up, also emitted by acpi-video, ignore
>>
>> To test this you need to edit /lib/udev/hwdb.d/60-keyboard.hwdb add an entry
>> for your laptop (see "cat /sys/class/dmi/id/product_name" output to find what to
>> put after "pn" ), then rebuild the hwdb: "sudo udevadm hwdb --update" and then
>> reboot, yes reboot there is another way to re-apply the rules but rebooting is
>> really so much easier.
>>
>> I think you should try this method too and see if the flickering goes away
>> when fixing the double events, without needing to use acpi_backlight=native.
>
> The flickering is caused by two things happening in short succession:
>
>    * an erroneous ASLE request, which is only ignored by the i915 driver
>      with acpi_backlight=native,
>
>    * a notification sent to the ACPI video driver, which causes
>      brightness to be switched after HZ / 10 with acpi_backlight=video.
>
> So I believe those double events are just a side effect, not the root
> cause of the flickering.
>
>> It is also not clear to me if you've tried using the WMI events without
>> acpi_backlight=native, maybe that fixes things magically ?
>
> In order for WMI events to be reported at all on Vostro V131, a special
> SMI has to be invoked.  That SMI always messes up the key events
> reported by the ACPI video driver, no matter what acpi_backlight is set
> to.  And the flickering is caused by yet another piece of faulty AML
> inside the CESM method.  Is this what you were asking?  If not, I'll be
> happy to answer any further questions you might have.
>
> Also, I need to apologize.  While testing your patch I noticed that my
> notes got mixed up at some point, rendering the story in my previous
> message partially invalid.  I wrote that in order for dell-wmi to report
> key events, acpi_backlight has to be set to "native".  That is not true
> as it has to be set to "vendor", as the code in dell_wmi_init() and
> dell_wmi_process_key() clearly shows.
>
> To clear things up, here is the current state of affairs:
>
>    * acpi_backlight=native solves the flickering issue, but doesn't help
>      with key event "lagging" after WMI is enabled,
>
>    * using the patch provided by Hans (or a similar one), the "lagged"
>      events can be filtered, leaving key event generation to dell-wmi,
>
>    * dell-wmi won't generate events unless acpi_backlight=vendor, which
>      in turn breaks brightness control due to faulty ASLE requests.
>
> To break out of this loop, I suggest that:
>
>    * acpi_backlight should default to "native" for Vostro V131, based on
>      a DMI check,

Ack.

>    * brightness key event generation performed by the ACPI video driver
>      should always be suppressed on Vostro V131, because it's faulty due
>      to firmware bugs (and correct events will be reported anyway by
>      either i8042 or WMI),

s/should always be suppressed/should be suppressed by default/ otherwise
ack. We can easily do this the same way we currently deal with the
disable_backlight_sysfs_if option in acpi_video.c

>    * yet another quirk should be added to dell-wmi, so that brightness
>      key events are generated not only when acpi_backlight=vendor, but
>      also when acpi_backlight=native.

Nack, the real problem here is that checking if acpi_backlight!=vendor
is the wrong way to check if key event generation should be suppressed.

This actually reminds me that I've the following item on my
todo list for a while but I've not gotten around to it yet:

  -Add an acpi_video_handles_key_presses() helper, and use this where
   appropriate (dell-wmi and others).

The mean reason for that item on my todo list was to make code doing
brigthness key-event suppression more readable. But we can also use
it for this case, if we check the new video.report_key_events parameter
in the acpi_video_handles_key_presses() helper, and switch dell-wmi
over to this helper, things will just work without needing yet another
quirk in dell-wmi :)

I've written a patch-set implementing this (attached), this obsoletes
my previous patch. As before, please test this with:

acpi_backlight=native video.report_key_events=1

On the kernel cmdline, we can add a patch adding dmi quirks to make
those the default later.

For that patch I'm going to need the dmi strings for your laptop,
can you please do:

for i in /sys/class/dmi/id/*_*; do echo $i; cat $i; done

And then include the output in your next mail ? Feel free to leave
out the serial numbers, asset tags and uuids, those are potentially
privacy sensitive and I don't need them.

> The only downside I see to such a solution is that by default the user
> would have to use a userspace helper in order for the key events to be
> translated into brightness changes.  However, if they so desire,
> acpi_backlight may still be set to "video", which would enable
> brightness changes to be done by the kernel, though with the flickering
> effect still in place.  Sounds like a fair choice to me.  What do you
> think?

I do not see the need for a userspace helper as a problem, this actually
is the case on most modern laptops already, as we default to
acpi_backlight=native there, and that has the same requirement.

Regards,

Hans

--------------030403070309070308000909
Content-Type: text/x-patch;
 name="0001-acpi-video-Add-a-acpi_video_handles_brightness_key_p.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-acpi-video-Add-a-acpi_video_handles_brightness_key_p.pa";
 filename*1="tch"

From d2ee1961d2a94a5f7b9f2bf5ae9fb2e6a791f25b Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 17 Dec 2015 09:51:07 +0100
Subject: [PATCH 1/4] acpi-video: Add a
 acpi_video_handles_brightness_key_presses() helper

Several drivers want to know if the acpi-video is generating key-presses
for brightness change hotkeys to avoid sending double key-events to
userspace for these. Currently these driver use this construct for this:

	if (acpi_video_get_backlight_type() == acpi_backlight_vendor)
		report_brightness_key_event();

This indirect way of detecting if acpi-video is active does not make the
code easier to understand, and in some cases it is wrong because just
because the preferred type != vendor does not mean that acpi-video is
actually listening for brightness events, e.g. there may be no acpi-video
bus on the system at all.

This commit adds a acpi_video_handles_brightness_key_presses() helper
function, making the code needing this functionality both easier to read
and more correct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c | 12 ++++++++++++
 include/acpi/video.h      |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 3405f7a..2a649f3e 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -2072,6 +2072,18 @@ void acpi_video_unregister_backlight(void)
 	mutex_unlock(&register_count_mutex);
 }
 
+bool acpi_video_handles_brightness_key_presses(void)
+{
+	bool have_video_busses;
+
+	mutex_lock(&video_list_lock);
+	have_video_busses = !list_empty(&video_bus_head);
+	mutex_unlock(&video_list_lock);
+
+	return have_video_busses;
+}
+EXPORT_SYMBOL(acpi_video_handles_brightness_key_presses);
+
 /*
  * This is kind of nasty. Hardware using Intel chipsets may require
  * the video opregion code to be run first in order to initialise
diff --git a/include/acpi/video.h b/include/acpi/video.h
index c62392d..f11d342 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -2,6 +2,7 @@
 #define __ACPI_VIDEO_H
 
 #include <linux/errno.h> /* for ENODEV */
+#include <linux/types.h> /* for bool */
 
 struct acpi_device;
 
@@ -31,6 +32,7 @@ extern int acpi_video_get_edid(struct acpi_device *device, int type,
 			       int device_id, void **edid);
 extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
 extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
+extern bool acpi_video_handles_brightness_key_presses(void);
 #else
 static inline int acpi_video_register(void) { return 0; }
 static inline void acpi_video_unregister(void) { return; }
@@ -46,6 +48,10 @@ static inline enum acpi_backlight_type acpi_video_get_backlight_type(void)
 static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
 {
 }
+static inline bool acpi_video_handles_brightness_key_presses(void)
+{
+	return false;
+}
 #endif
 
 #endif
-- 
2.5.0


--------------030403070309070308000909
Content-Type: text/x-patch;
 name="0002-dell-wmi-Use-acpi_video_handles_brightness_key_press.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-dell-wmi-Use-acpi_video_handles_brightness_key_press.pa";
 filename*1="tch"

From 9355058f5c1d7c815a293e0c0731d85f0a59b4a1 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 17 Dec 2015 09:59:01 +0100
Subject: [PATCH 2/4] dell-wmi: Use acpi_video_handles_brightness_key_presses()

Use the new acpi_video_handles_brightness_key_presses function to check
if we should report brightness key-presses.

This makes the code both easier to read and makes it properly report
key-presses when acpi-video is not reporting them for reasons other
then the backlight type being vendor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-wmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index f2d77fe..cb8a9c2 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -43,8 +43,6 @@ MODULE_LICENSE("GPL");
 
 #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
 
-static int acpi_video;
-
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
 
 /*
@@ -159,7 +157,8 @@ static void dell_wmi_process_key(int reported_key)
 
 	/* Don't report brightness notifications that will also come via ACPI */
 	if ((key->keycode == KEY_BRIGHTNESSUP ||
-	     key->keycode == KEY_BRIGHTNESSDOWN) && acpi_video)
+	     key->keycode == KEY_BRIGHTNESSDOWN) &&
+	    acpi_video_handles_brightness_key_presses())
 		return;
 
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
@@ -398,7 +397,6 @@ static int __init dell_wmi_init(void)
 	}
 
 	dmi_walk(find_hk_type, NULL);
-	acpi_video = acpi_video_get_backlight_type() != acpi_backlight_vendor;
 
 	err = dell_wmi_input_setup();
 	if (err)
-- 
2.5.0


--------------030403070309070308000909
Content-Type: text/x-patch;
 name="0003-thinkpad_acpi-Use-acpi_video_handles_brightness_key_.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-thinkpad_acpi-Use-acpi_video_handles_brightness_key_.pa";
 filename*1="tch"

From b55c9c38169a543465dd8a213e7330e1561eee95 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 17 Dec 2015 10:19:18 +0100
Subject: [PATCH 3/4] thinkpad_acpi: Use
 acpi_video_handles_brightness_key_presses()

Use the new acpi_video_handles_brightness_key_presses function to check
if we should report brightness key-presses.

This makes the code both easier to read and makes it properly report
key-presses when acpi-video is not reporting them for reasons other
then the backlight type being vendor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0bed473..f453d5d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3488,7 +3488,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	/* Do not issue duplicate brightness change events to
 	 * userspace. tpacpi_detect_brightness_capabilities() must have
 	 * been called before this point  */
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (acpi_video_handles_brightness_key_presses()) {
 		pr_info("This ThinkPad has standard ACPI backlight "
 			"brightness control, supported by the ACPI "
 			"video driver\n");
-- 
2.5.0


--------------030403070309070308000909
Content-Type: text/x-patch;
 name="0004-acpi-video-Add-a-module-option-to-disable-the-report.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0004-acpi-video-Add-a-module-option-to-disable-the-report.pa";
 filename*1="tch"

From 5e7ff99407aeb60c2f1516cdd80d7859646497dd Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 16 Dec 2015 11:19:00 +0100
Subject: [PATCH 4/4] acpi-video: Add a module option to disable the reporting
 of keypresses

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
 drivers/acpi/acpi_video.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 2a649f3e..2971154 100644
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
@@ -2080,7 +2087,8 @@ bool acpi_video_handles_brightness_key_presses(void)
 	have_video_busses = !list_empty(&video_bus_head);
 	mutex_unlock(&video_list_lock);
 
-	return have_video_busses;
+	return have_video_busses &&
+	       (report_key_events & REPORT_BRIGHTNESS_KEY_EVENTS);
 }
 EXPORT_SYMBOL(acpi_video_handles_brightness_key_presses);
 
-- 
2.5.0


--------------030403070309070308000909--
