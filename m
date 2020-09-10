From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: platform/x86: asus-wmi: SW_TABLET_MODE is always 1 on some
 devices
Date: Thu, 10 Sep 2020 19:44:10 +0200
Message-ID: <a21a6fbf-f38b-3531-07f4-74edd0e42eb6@redhat.com>
References: <20200901215536.qcouepovmfxje4n5@fastboi.localdomain>
 <0f7302c9-b508-a078-8c62-5ad5a03d92c2@redhat.com>
 <20200902125220.25x52dl2vupejg5f@fastboi.localdomain>
 <20200904094546.jes44d2kn5mtn2zu@fastboi.localdomain>
 <320c0b71-af94-c673-21c8-c32a0fdb4d4e@redhat.com>
 <20200904171743.ejew22p3zzada55p@fastboi.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------131864D387AC597B247094E1"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200904171743.ejew22p3zzada55p@fastboi.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is a multi-part message in MIME format.
--------------131864D387AC597B247094E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/4/20 7:17 PM, Samuel Čavoj wrote:
> Hi,
> 
> On 04.09.2020 12:06, Hans de Goede wrote:
>> Hi,
>>
>> On 9/4/20 11:45 AM, Samuel Čavoj wrote:
>>> Hello!
>>>
>>> On 02.09.2020 14:52, Samuel Čavoj wrote:
>>>> Hello,
>>>>
>>>> On 02.09.2020 13:52, Hans de Goede wrote:
>>>>> But I would rather try to figure out a better way. Can you
>>>>> create an acpidump, by as root running:
>>>>>
>>>>> acpidump -o acpidump.asus-UX360CA
>>>>
>>>> The file is attached gzipped.
>>>>
>>>>>
>>>>> And then send me a direct (so without including the list)
>>>>> email with the generated acpidump.asus-UX360CA file attached please?
>>>>>
>>>>> Also, if necessary are you capable of building your own
>>>>> kernel with a (test)patch applied ?
>>>>
>>>> Yes, that is no problem at all.
>>>> Thank you for your quick response.
>>>>
>>>> Regards,
>>>> Samuel
>>>
>>> I don't mean to waste your time, it's just that my trust in mail systems
>>> has been steadily decreasing. I would just like to make sure you have
>>> received my previous email with the acpidump.
>>>
>>> In case not, here[1] it is available over https, if the message got
>>> dropped because of the attachment.
>>
>> I got your mail, but I've been burried under a ton of work,
>> so it may take a couple of days at least before I can take
>> a closer look at this.
> 
> That's quite alright.
> 
> I decided I would try and see if I can be of any use, so I looked around
> in the WMI implementation in the DSDT and found the following in the
> DSTS method:
> 
> [...]
> 37486     If ((IIA0 == 0x00120063))
> 37487     {
> 37488         Local0 = ^^PCI0.LPCB.EC0.DKPS ()
> 37489         If ((Local0 == One))
> 37490         {
> 37491             Return (0x00010001)
> 37492         }
> 37493         Else
> 37494         {
> 37495             Return (0x00010000)
> 37496         }
> 37497     }
> [...]
> 
> This is the If statement responsible for the ASUS_WMI_DEVID_KBD_DOCK
> device, and it always seems to return 0x00010000 on my machine. I
> followed it up the call chain but in the end it just read some bit from
> some register of the EC.
> 
> Then I noticed the If statement right above it, which corresponds to
> dev_id 0x00060062:
> 
> [...]
> 37472     If ((IIA0 == 0x00060062))
> 37473     {
> 37474         If (^^PCI0.LPCB.EC0.RPIN (0x15))
> 37475         {
> 37476             Local0 = 0x00010001
> 37477         }
> 37478         Else
> 37479         {
> 37480             Local0 = 0x00010000
> 37481         }
> 37482
> 37483         Return (Local0)
> 37484     }
> [...]
> 
> By a stroke of luck, it turns out it's the correct one! I patched the
> driver to query the state on every event and print it out, and it is
> exactly what we are looking for.
> 
> The state is 0 if the device is in normal, laptop state and changes to 1
> if flipped over 180 degrees. I patched the module so that the
> SW_TABLET_MODE switch was set according to it, and everything seems to
> be behaving as it should.

Good work on figuring this out!

> This is, of course, not a full solution, as we
> still somehow need to decide whether to use the KDB_DOCK device or this
> one. I don't know what to do about that. Ideally find some flag in the
> ACPI which says which one we should use?
> 
> The event code which is fired when the lid switch state changes, as we
> already know from the sparse keymap[1], is 0xfa. When the laptop is
> suspended in laptop mode, flipped to tablet mode in its sleep and
> awoken, the event is fired. It is, however, not fired when doing it the
> other way around, so we should probably check the state on resume as
> well.

Ok, I've written a patch to try and use the 0x00060062 WMI object/devid
first and only if that is not there use the 0x00120063 one which the
Bay Trail and Cherry Trail devices use.

I've attached the patch, please give it a try.

Regards,

Hans

p.s.

I did successfully receive your acpidump, thanks.

--------------131864D387AC597B247094E1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-asus-wmi-Fix-SW_TABLET_MODE-always-repo.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-platform-x86-asus-wmi-Fix-SW_TABLET_MODE-always-repo.pa";
 filename*1="tch"

From 5f5dc9a48b5b71f44b25727cf241e2533dc8061b Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 10 Sep 2020 18:06:37 +0200
Subject: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always reporting 1
 on the Asus UX360CA
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
in laptop mode.

Samual found out that this model has another WMI "object" with an devid of
0x00060062 which correctly reports laptop vs tablet-mode on the
Asus UX360CA.

All the models on which the SW_TABLET_MODE code was previously tested do
not have this new devid 0x00060062 object.

This commit adds support for the new devid 0x00060062 object and prefers it
over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
being reported as 1 on these models.

Reported-by: Samuel Čavoj <samuel@cavoj.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c            | 32 ++++++++++++++++++----
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8f4acdc06b13..c8689da0323b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_KBD_BRTTOGGLE		0xc7
 #define NOTIFY_KBD_FBM			0x99
 #define NOTIFY_KBD_TTP			0xae
+#define NOTIFY_FLIP_TABLET_MODE_CHANGE	0xfa
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -173,6 +174,7 @@ struct asus_wmi {
 	int spec;
 	int sfun;
 	bool wmi_event_queue;
+	bool use_flip_tablet_mode;
 
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -365,12 +367,22 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	if (err)
 		goto err_free_dev;
 
-	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
+	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_FLIP_TABLET_MODE);
 	if (result >= 0) {
+		asus->use_flip_tablet_mode = true;
 		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-		input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
-	} else if (result != -ENODEV) {
-		pr_err("Error checking for keyboard-dock: %d\n", result);
+		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+	} else {
+		if (result != -ENODEV)
+			pr_err("Error checking for flip-tablet-mode: %d\n", result);
+
+		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
+		if (result >= 0) {
+			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
+			input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
+		} else if (result != -ENODEV) {
+			pr_err("Error checking for keyboard-dock: %d\n", result);
+		}
 	}
 
 	err = input_register_device(asus->inputdev);
@@ -2114,7 +2126,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (code == NOTIFY_KBD_DOCK_CHANGE) {
+	if (!asus->use_flip_tablet_mode && code == NOTIFY_KBD_DOCK_CHANGE) {
 		result = asus_wmi_get_devstate_simple(asus,
 						      ASUS_WMI_DEVID_KBD_DOCK);
 		if (result >= 0) {
@@ -2125,6 +2137,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	if (asus->use_flip_tablet_mode && code == NOTIFY_FLIP_TABLET_MODE_CHANGE) {
+		result = asus_wmi_get_devstate_simple(asus,
+						      ASUS_WMI_DEVID_FLIP_TABLET_MODE);
+		if (result >= 0) {
+			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+			input_sync(asus->inputdev);
+		}
+		return;
+	}
+
 	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
 		fan_boost_mode_switch_next(asus);
 		return;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 897b8332a39f..1897b4683562 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -62,6 +62,7 @@
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
+#define ASUS_WMI_DEVID_FLIP_TABLET_MODE	0x00060062
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.28.0


--------------131864D387AC597B247094E1--
