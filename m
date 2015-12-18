From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 18 Dec 2015 11:44:45 +0100
Message-ID: <5673E39D.8050007@redhat.com>
References: <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl> <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl> <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com> <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
 <567284E7.3050103@redhat.com> <20151218071037.GA4606@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080605040304090103000006"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40752 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751606AbbLRKox (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 05:44:53 -0500
In-Reply-To: <20151218071037.GA4606@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080605040304090103000006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18-12-15 08:10, Michał Kępień wrote:
>>> To clear things up, here is the current state of affairs:
>>>
>>>    * acpi_backlight=native solves the flickering issue, but doesn't help
>>>      with key event "lagging" after WMI is enabled,
>>>
>>>    * using the patch provided by Hans (or a similar one), the "lagged"
>>>      events can be filtered, leaving key event generation to dell-wmi,
>>>
>>>    * dell-wmi won't generate events unless acpi_backlight=vendor, which
>>>      in turn breaks brightness control due to faulty ASLE requests.
>>>
>>> To break out of this loop, I suggest that:
>>>
>>>    * acpi_backlight should default to "native" for Vostro V131, based on
>>>      a DMI check,
>>
>> Ack.
>>
>>>    * brightness key event generation performed by the ACPI video driver
>>>      should always be suppressed on Vostro V131, because it's faulty due
>>>      to firmware bugs (and correct events will be reported anyway by
>>>      either i8042 or WMI),
>>
>> s/should always be suppressed/should be suppressed by default/ otherwise
>> ack. We can easily do this the same way we currently deal with the
>> disable_backlight_sysfs_if option in acpi_video.c
>>
>>>    * yet another quirk should be added to dell-wmi, so that brightness
>>>      key events are generated not only when acpi_backlight=vendor, but
>>>      also when acpi_backlight=native.
>>
>> Nack, the real problem here is that checking if acpi_backlight!=vendor
>> is the wrong way to check if key event generation should be suppressed.
>
> Well, I'm sure you know better, given that you wrote the code that this
> new patch series fixes :)
>
>> This actually reminds me that I've the following item on my
>> todo list for a while but I've not gotten around to it yet:
>>
>>   -Add an acpi_video_handles_key_presses() helper, and use this where
>>    appropriate (dell-wmi and others).
>>
>> The mean reason for that item on my todo list was to make code doing
>> brigthness key-event suppression more readable. But we can also use
>> it for this case, if we check the new video.report_key_events parameter
>> in the acpi_video_handles_key_presses() helper, and switch dell-wmi
>> over to this helper, things will just work without needing yet another
>> quirk in dell-wmi :)
>>
>> I've written a patch-set implementing this (attached), this obsoletes
>> my previous patch. As before, please test this with:
>>
>> acpi_backlight=native video.report_key_events=1
>>
>> On the kernel cmdline, we can add a patch adding dmi quirks to make
>> those the default later.
>
> I tested the patch series you submitted and it seems to work fine for
> me, given that proper kernel parameters are provided.
>
>> For that patch I'm going to need the dmi strings for your laptop,
>> can you please do:
>>
>> for i in /sys/class/dmi/id/*_*; do echo $i; cat $i; done
>>
>> And then include the output in your next mail ? Feel free to leave
>> out the serial numbers, asset tags and uuids, those are potentially
>> privacy sensitive and I don't need them.
>
> /sys/class/dmi/id/bios_date
> 06/12/2014
> /sys/class/dmi/id/bios_vendor
> Dell Inc.
> /sys/class/dmi/id/bios_version
> A04
> /sys/class/dmi/id/board_name
> 0X3GJK
> /sys/class/dmi/id/board_vendor
> Dell Inc.
> /sys/class/dmi/id/board_version
> A04
> /sys/class/dmi/id/chassis_type
> 8
> /sys/class/dmi/id/chassis_vendor
> Dell Inc.
> /sys/class/dmi/id/chassis_version
> Not Specified
> /sys/class/dmi/id/product_name
> Vostro V131
> /sys/class/dmi/id/product_version
> Not Specified
> /sys/class/dmi/id/sys_vendor
> Dell Inc.

Thanks for both the testing and the dmi info, attached is a patch
which applies on top of the other 4 which should automatically do the
right thing, can you please test this patch with an "empty" kernel
cmdline, once that bit works I'll post the entire set upstream for
merging.

Regards,

Hans

--------------080605040304090103000006
Content-Type: text/x-patch;
 name="0005-acpi-video-Add-quirks-for-the-Dell-Vostro-V131.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0005-acpi-video-Add-quirks-for-the-Dell-Vostro-V131.patch"

From 3225a9c43a02682e3cae5c02ca6d38e923256de1 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 18 Dec 2015 11:36:16 +0100
Subject: [PATCH 5/5] acpi-video: Add quirks for the Dell Vostro V131

The Dell Vostro V131 has an especially broken acpi-video implementation.

The backlight control bits work, but when the brightness is changed via
the acpi-video interface the backlight flickers annoyingly before settling
at the new brightness, switching to using the native interface fixes the
flickering so add a quirk for this (the vendor interface has the same
problem).

Brightness keypresses reported through the acpi-video-bus are also broken,
they get reported one event delayed, so if you press the brightness-up
hotkey on the keyboard nothing happens, then if you press brightness-down,
the previous brightness-up event gets reported. Since the keypresses are
also reported via wmi (if active) and via atkbd (when wmi is not active)
add a quirk to simply filter out the delayed (broken) events.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c   | 25 +++++++++++++++++++++++++
 drivers/acpi/video_detect.c |  8 ++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 2971154..80b13d4 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -419,6 +419,13 @@ static int video_enable_only_lcd(const struct dmi_system_id *d)
 	return 0;
 }
 
+static int video_set_report_key_events(const struct dmi_system_id *id)
+{
+	if (report_key_events == -1)
+		report_key_events = (uintptr_t)id->driver_data;
+	return 0;
+}
+
 static struct dmi_system_id video_dmi_table[] = {
 	/*
 	 * Broken _BQC workaround http://bugzilla.kernel.org/show_bug.cgi?id=13121
@@ -507,6 +514,24 @@ static struct dmi_system_id video_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "ESPRIMO Mobile M9410"),
 		},
 	},
+	/*
+	 * Some machines report wrong key events on the acpi-bus, suppress
+	 * key event reporting on these.  Note this is only intended to work
+	 * around events which are plain wrong. In some cases we get double
+	 * events, in this case acpi-video is considered the canonical source
+	 * and the events from the other source should be filtered. E.g.
+	 * by calling acpi_video_handles_brightness_key_presses() from the
+	 * vendor acpi/wmi driver or by using /lib/udev/hwdb.d/60-keyboard.hwdb
+	 */
+	{
+	 .callback = video_set_report_key_events,
+	 .driver_data = (void *)((uintptr_t)REPORT_OUTPUT_KEY_EVENTS),
+	 .ident = "Dell Vostro V131",
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
+		},
+	},
 	{}
 };
 
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index daaf1c4..8fe2682 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -279,6 +279,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro12,1"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 .ident = "Dell Vostro V131",
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
+		},
+	},
 	{ },
 };
 
-- 
2.5.0


--------------080605040304090103000006--
