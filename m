From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] intel-hid: add a DMI quirk to support Wacom Mobile Studio Pro
Date: Wed, 6 Dec 2017 10:15:29 +0800
Message-ID: <CAJ=jqubS62bGO_b8q18iwB_TxD2NKb=h5D+6bxsVkSgR5dZt2Q@mail.gmail.com>
References: <1512460332-7420-1-git-send-email-alex.hung@canonical.com>
 <A0A02DDE-F512-4523-AC1F-A63E0685B027@gmail.com> <CANRwn3RbwPLdpwkGQ7mvRknXifLDAKmoMXB_-fMQveirGo+azw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50977 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754158AbdLFCPc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Dec 2017 21:15:32 -0500
Received: from mail-qt0-f199.google.com ([209.85.216.199])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <alex.hung@canonical.com>)
        id 1eMPFD-0005dY-D8
        for platform-driver-x86@vger.kernel.org; Wed, 06 Dec 2017 02:15:31 +0000
Received: by mail-qt0-f199.google.com with SMTP id r51so1840882qtj.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Dec 2017 18:15:31 -0800 (PST)
In-Reply-To: <CANRwn3RbwPLdpwkGQ7mvRknXifLDAKmoMXB_-fMQveirGo+azw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jason Gerecke <killertofu@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, Dec 6, 2017 at 3:14 AM, Jason Gerecke <killertofu@gmail.com> wrote:
> I may have actually spoken too soon: the patch isn't working on a
> second device. This second device is a smaller model with a slightly
> different board, and is also the shipping version rather than a
> pre-release version. I'm going to gather some more dmidecode data and
> get back to you.

The updated DMI strings look better. I have updated intel-hid.c to bugzilla.

>
> Jason
> ---
> Now instead of four in the eights place /
> you’ve got three, ‘Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can’t take seven from three,    /
> So you look at the sixty-fours....
>
>
> On Tue, Dec 5, 2017 at 10:01 AM, Jason Gerecke <killertofu@gmail.com> wrote:
>> On December 4, 2017 11:52:12 PM PST, Alex Hung <alex.hung@canonical.com> wrote:
>>>HEBC method reports capabilities of 5 button array but Wacom Mobile
>>>Studio Pro does not have this control method. A DMI quirk was created
>>
>> Nit: s/Mobile Studio/MobileStudio/ here and in the subject and the `button_array_table`
>>
>>>to
>>>enable 5 button array for this system.
>>>
>>>Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197991
>>>
>>>Reported-by: Jason Gerecke <killertofu@gmail.com>
>>
>> Please use "Reported-by: Jason Gerecke <jason.gerecke@wacom.com>"

Okay and will do

>>
>> Thanks again for the fix!
>>
>> Jason
>> ---
>> Now instead of four in the eights place /
>> you’ve got three, ‘Cause you added one  /
>> (That is to say, eight) to the two,     /
>> But you can’t take seven from three,    /
>> So you look at the sixty-fours....
>>
>>>Signed-off-by: Alex Hung <alex.hung@canonical.com>
>>>---
>>>drivers/platform/x86/intel-hid.c | 34
>>>+++++++++++++++++++++++++++++++---
>>> 1 file changed, 31 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/platform/x86/intel-hid.c
>>>b/drivers/platform/x86/intel-hid.c
>>>index f470279..54d761c 100644
>>>--- a/drivers/platform/x86/intel-hid.c
>>>+++ b/drivers/platform/x86/intel-hid.c
>>>@@ -25,6 +25,7 @@
>>> #include <linux/acpi.h>
>>> #include <linux/suspend.h>
>>> #include <acpi/acpi_bus.h>
>>>+#include <linux/dmi.h>
>>>
>>> MODULE_LICENSE("GPL");
>>> MODULE_AUTHOR("Alex Hung");
>>>@@ -73,6 +74,17 @@ static const struct key_entry intel_array_keymap[] =
>>>{
>>>       { KE_END },
>>> };
>>>
>>>+static const struct dmi_system_id button_array_table[] = {
>>>+      {
>>>+              .ident = "Wacom Mobile Studio Pro",
>>>+              .matches = {
>>>+                      DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
>>>+                      DMI_MATCH(DMI_PRODUCT_NAME, "Skylake"),
>>>+              },
>>>+      },
>>>+      { }
>>>+};
>>>+
>>> struct intel_hid_priv {
>>>       struct input_dev *input_dev;
>>>       struct input_dev *array;
>>>@@ -263,10 +275,27 @@ static void notify_handler(acpi_handle handle,
>>>u32 event, void *context)
>>>                        ev_index);
>>> }
>>>
>>>+static bool button_array_present(struct platform_device *device)
>>>+{
>>>+      acpi_handle handle = ACPI_HANDLE(&device->dev);
>>>+      unsigned long long event_cap;
>>>+      acpi_status status;
>>>+      bool supported = false;
>>>+
>>>+      status = acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
>>>+      if (ACPI_SUCCESS(status) && (event_cap & 0x20000))
>>>+              supported = true;
>>>+
>>>+      if (dmi_check_system(button_array_table))
>>>+              supported = true;
>>>+
>>>+      return supported;
>>>+}
>>>+
>>> static int intel_hid_probe(struct platform_device *device)
>>> {
>>>       acpi_handle handle = ACPI_HANDLE(&device->dev);
>>>-      unsigned long long event_cap, mode;
>>>+      unsigned long long mode;
>>>       struct intel_hid_priv *priv;
>>>       acpi_status status;
>>>       int err;
>>>@@ -299,8 +328,7 @@ static int intel_hid_probe(struct platform_device
>>>*device)
>>>       }
>>>
>>>       /* Setup 5 button array */
>>>-      status = acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
>>>-      if (ACPI_SUCCESS(status) && (event_cap & 0x20000)) {
>>>+      if (button_array_present(device)) {
>>>               dev_info(&device->dev, "platform supports 5 button array\n");
>>>               err = intel_button_array_input_setup(device);
>>>               if (err)
>>



-- 
Cheers,
Alex Hung
