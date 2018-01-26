From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH v4] Support intel-vbtn based tablet mode switch
Date: Fri, 26 Jan 2018 12:23:20 +0100
Message-ID: <CAD6_Bott=hvvAgX3ub+4w90h6r5ByeC8-QraahHQYHB8cUPUMQ@mail.gmail.com>
References: <1516720704-19831-1-git-send-email-notmart@gmail.com>
 <1914818.Wtl4XKE3JN@phobos> <20180126105233.yhowbofqfcx6yvdw@pali>
 <CAD6_BotttRjah8cn0_NJ5npJq2TzNF4w8G7ypnPjT5HKpp7G8A@mail.gmail.com> <20180126111652.oze3os3bsi3p6qeb@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34664 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751394AbeAZLXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 06:23:21 -0500
In-Reply-To: <20180126111652.oze3os3bsi3p6qeb@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bhushan Shah <bhush94@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mario Limonciello <mario_limonciello@dell.com>

On Fri, Jan 26, 2018 at 12:16 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> On Friday 26 January 2018 12:09:01 Marco Martin wrote:
>> On Fri, Jan 26, 2018 at 11:52 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
>> > On Friday 26 January 2018 10:45:55 Marco Martin wrote:
>> >> On marted=C3=AC 23 gennaio 2018 16:18:24 CET Marco Martin wrote:
>> >> > Some laptops such as Dell Inspiron 7000 series have the
>> >> > tablet mode switch implemented in Intel ACPI,
>> >> > the events to enter and exit the tablet mode are 0xCC and 0xCD
>> >> >
>> >> > CC: platform-driver-x86@vger.kernel.org
>> >> > CC: Matthew Garrett <mjg59@srcf.ucam.org>
>> >> > CC: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
>> >> > CC: Darren Hart <dvhart@infradead.org>
>> >> > CC: Mario Limonciello <mario_limonciello@dell.com>
>> >> > CC: Andy Shevchenko <andy@infradead.org>
>> >> >
>> >> > Signed-off-by: Marco Martin <notmart@gmail.com>
>> >> > ---
>> >> >  drivers/platform/x86/intel-vbtn.c | 21 +++++++++++++++++++++
>> >> >  1 file changed, 21 insertions(+)
>> >> >
>> >> > diff --git a/drivers/platform/x86/intel-vbtn.c
>> >> > b/drivers/platform/x86/intel-vbtn.c index 58c5ff3..64b4b34 100644
>> >> > --- a/drivers/platform/x86/intel-vbtn.c
>> >> > +++ b/drivers/platform/x86/intel-vbtn.c
>> >> > @@ -26,6 +26,9 @@
>> >> >  #include <linux/suspend.h>
>> >> >  #include <acpi/acpi_bus.h>
>> >> >
>> >> > +/* When NOT in tablet mode, VBDS has the flag 0x40 */
>> >> > +#define TABLET_MODE_FLAG 0x40
>> >> > +
>> >> >  MODULE_LICENSE("GPL");
>> >> >  MODULE_AUTHOR("AceLan Kao");
>> >> >
>> >> > @@ -42,6 +45,8 @@ static const struct key_entry intel_vbtn_keymap[]=
 =3D {
>> >> >     { KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },          /* volume-up ke=
y release */
>> >> >     { KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },           /* volume-down =
key press */
>> >> >     { KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },        /* volume-down =
key release */
>> >> > +   { KE_SW,  0xCC, { .sw =3D { SW_TABLET_MODE, 1 } } }, /* Tablet =
mode in */
>> >> > +   { KE_SW,  0xCD, { .sw =3D { SW_TABLET_MODE, 0 } } }, /* Tablet =
mode out */
>> >> >     { KE_END },
>> >> >  };
>> >> >
>> >> > @@ -88,6 +93,7 @@ static void notify_handler(acpi_handle handle, u3=
2 event,
>> >> > void *context)
>> >> >
>> >> >  static int intel_vbtn_probe(struct platform_device *device)
>> >> >  {
>> >> > +   struct acpi_buffer vgbs_output =3D { ACPI_ALLOCATE_BUFFER, NULL=
 };
>> >> >     acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>> >> >     struct intel_vbtn_priv *priv;
>> >> >     acpi_status status;
>> >> > @@ -110,6 +116,21 @@ static int intel_vbtn_probe(struct platform_de=
vice
>> >> > *device) return err;
>> >> >     }
>> >> >
>> >> > +   status =3D acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_out=
put);
>> >> > +   /* VGBS being present and returning something means
>> >> > +    * we have a tablet mode switch
>> >> > +    */
>> >> > +   if (ACPI_SUCCESS(status)) {
>> >> > +           union acpi_object *obj =3D vgbs_output.pointer;
>> >> > +
>> >> > +           if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
>> >> > +                   input_set_capability(priv->input_dev, EV_SW, SW=
_TABLET_MODE);
>> >> > +                   input_report_switch(priv->input_dev,
>> >> > +                                                           SW_TABL=
ET_MODE,
>> >> > +                                                           !(obj->=
integer.value & TABLET_MODE_FLAG));
>> >> > +           }
>> >> > +   }
>> >> > +
>> >> >     status =3D acpi_install_notify_handler(handle,
>> >> >                                          ACPI_DEVICE_NOTIFY,
>> >> >                                          notify_handler,
>> >>
>> >> Is there still something to change in this version of the patch?
>> >
>> > Yes, I already wrote it in thread for older patch version. Calling
>> > input_set_capability() is not needed at all because all capabilities a=
re
>> > already set by sparse_keymap_setup() function.
>>
>> ah, sorry, i somehow missed the answer.
>> Wouldn't this cause a problem tough? it was querying VGBS to add the
>> switch capability just conditionally
>> on models which actually have it, so now being in sparse_keymap, all
>> will have that switch available even if not there.
>> Now, if this is fine (after all that switch would never be triggered
>> on such hardware) i can go forward removing all of that so the patch
>> becomes a neat two-liner.
>
> Looking at other drivers and I see that they send initial status of
> SW_TABLET_MODE at probe time. I do not know if this is correct or not.
> If yes, then you need to call that input_report_switch() as you have.
> If not, then then really just 2 line patch is enough.
>
> But in both cases, call to input_set_capability() is not needed.

ok, done in latest version.
the initial query and set seems indeed to be necessary, otherwise if i do
modprobe of intel-vbtn when in tablet mode, it incorrectly reports 0
as initial state
