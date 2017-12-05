From: Jason Gerecke <killertofu@gmail.com>
Subject: Re: [PATCH] intel-hid: add a DMI quirk to support Wacom Mobile Studio Pro
Date: Tue, 5 Dec 2017 11:14:45 -0800
Message-ID: <CANRwn3RbwPLdpwkGQ7mvRknXifLDAKmoMXB_-fMQveirGo+azw@mail.gmail.com>
References: <1512460332-7420-1-git-send-email-alex.hung@canonical.com> <A0A02DDE-F512-4523-AC1F-A63E0685B027@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:43380 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750740AbdLETOr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Dec 2017 14:14:47 -0500
Received: by mail-ua0-f196.google.com with SMTP id e10so1050538uah.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Dec 2017 11:14:47 -0800 (PST)
In-Reply-To: <A0A02DDE-F512-4523-AC1F-A63E0685B027@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

I may have actually spoken too soon: the patch isn't working on a
second device. This second device is a smaller model with a slightly
different board, and is also the shipping version rather than a
pre-release version. I'm going to gather some more dmidecode data and
get back to you.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


On Tue, Dec 5, 2017 at 10:01 AM, Jason Gerecke <killertofu@gmail.com> wrote=
:
> On December 4, 2017 11:52:12 PM PST, Alex Hung <alex.hung@canonical.com> =
wrote:
>>HEBC method reports capabilities of 5 button array but Wacom Mobile
>>Studio Pro does not have this control method. A DMI quirk was created
>
> Nit: s/Mobile Studio/MobileStudio/ here and in the subject and the `butto=
n_array_table`
>
>>to
>>enable 5 button array for this system.
>>
>>Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D197991
>>
>>Reported-by: Jason Gerecke <killertofu@gmail.com>
>
> Please use "Reported-by: Jason Gerecke <jason.gerecke@wacom.com>"
>
> Thanks again for the fix!
>
> Jason
> ---
> Now instead of four in the eights place /
> you=E2=80=99ve got three, =E2=80=98Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can=E2=80=99t take seven from three,    /
> So you look at the sixty-fours....
>
>>Signed-off-by: Alex Hung <alex.hung@canonical.com>
>>---
>>drivers/platform/x86/intel-hid.c | 34
>>+++++++++++++++++++++++++++++++---
>> 1 file changed, 31 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/platform/x86/intel-hid.c
>>b/drivers/platform/x86/intel-hid.c
>>index f470279..54d761c 100644
>>--- a/drivers/platform/x86/intel-hid.c
>>+++ b/drivers/platform/x86/intel-hid.c
>>@@ -25,6 +25,7 @@
>> #include <linux/acpi.h>
>> #include <linux/suspend.h>
>> #include <acpi/acpi_bus.h>
>>+#include <linux/dmi.h>
>>
>> MODULE_LICENSE("GPL");
>> MODULE_AUTHOR("Alex Hung");
>>@@ -73,6 +74,17 @@ static const struct key_entry intel_array_keymap[] =3D
>>{
>>       { KE_END },
>> };
>>
>>+static const struct dmi_system_id button_array_table[] =3D {
>>+      {
>>+              .ident =3D "Wacom Mobile Studio Pro",
>>+              .matches =3D {
>>+                      DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
>>+                      DMI_MATCH(DMI_PRODUCT_NAME, "Skylake"),
>>+              },
>>+      },
>>+      { }
>>+};
>>+
>> struct intel_hid_priv {
>>       struct input_dev *input_dev;
>>       struct input_dev *array;
>>@@ -263,10 +275,27 @@ static void notify_handler(acpi_handle handle,
>>u32 event, void *context)
>>                        ev_index);
>> }
>>
>>+static bool button_array_present(struct platform_device *device)
>>+{
>>+      acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>>+      unsigned long long event_cap;
>>+      acpi_status status;
>>+      bool supported =3D false;
>>+
>>+      status =3D acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap)=
;
>>+      if (ACPI_SUCCESS(status) && (event_cap & 0x20000))
>>+              supported =3D true;
>>+
>>+      if (dmi_check_system(button_array_table))
>>+              supported =3D true;
>>+
>>+      return supported;
>>+}
>>+
>> static int intel_hid_probe(struct platform_device *device)
>> {
>>       acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>>-      unsigned long long event_cap, mode;
>>+      unsigned long long mode;
>>       struct intel_hid_priv *priv;
>>       acpi_status status;
>>       int err;
>>@@ -299,8 +328,7 @@ static int intel_hid_probe(struct platform_device
>>*device)
>>       }
>>
>>       /* Setup 5 button array */
>>-      status =3D acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap)=
;
>>-      if (ACPI_SUCCESS(status) && (event_cap & 0x20000)) {
>>+      if (button_array_present(device)) {
>>               dev_info(&device->dev, "platform supports 5 button array\n=
");
>>               err =3D intel_button_array_input_setup(device);
>>               if (err)
>
