From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/6] toshiba_acpi: Convert to use acpi_driver
Date: Wed, 21 Sep 2011 09:31:24 +0200
Message-ID: <CAHR064g=vu2JXtqpNhdrNbyU6k5Wq5uvA7AYspxTPU6aSpn+rQ@mail.gmail.com>
References: <1316555754-25949-1-git-send-email-seth.forshee@canonical.com>
	<1316555754-25949-2-git-send-email-seth.forshee@canonical.com>
	<1316557078.1903.11.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:36185 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752540Ab1IUHb0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Sep 2011 03:31:26 -0400
In-Reply-To: <1316557078.1903.11.camel@Joe-Laptop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Seth Forshee <seth.forshee@canonical.com>, Matthew Garrett <mjg@redhat.com>, Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 21, 2011 at 12:17 AM, Joe Perches <joe@perches.com> wrote:
> On Tue, 2011-09-20 at 16:55 -0500, Seth Forshee wrote:
>> Changes toshiba_acpi to register an acpi driver and eliminates the
>> platform device it was using.
>
> Just trivial comments...
>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/=
x86/toshiba_acpi.c
>> +static acpi_status hci_raw(struct toshiba_acpi_dev *dev,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const u32 in[HCI_WORDS], u32 out[HCI_WORDS])
> []
>> @@ -237,85 +234,79 @@ static acpi_status hci_raw(const u32 in[HCI_WO=
RDS], u32 out[HCI_WORDS])
>> =C2=A0 * may be useful (such as "not supported").
>> =C2=A0 */
>>
>> -static acpi_status hci_write1(u32 reg, u32 in1, u32 * result)
>> +static acpi_status hci_write1(struct toshiba_acpi_dev *dev, u32 reg=
,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 u32 in1, u32 *result)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 u32 in[HCI_WORDS] =3D { HCI_SET, reg, in1, 0, 0=
, 0 };
>
> A lot of the in[HCI_WORDS] could be static const or const
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0static const u32 in[HCI_WORDS] etc...

Not static const ! see how reg and in1 are used. const is ok.

>
>> +static acpi_status hci_read1(struct toshiba_acpi_dev *dev, u32 reg,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0u32 *out1, u32 *result)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 u32 in[HCI_WORDS] =3D { HCI_GET, reg, 0, 0, 0, =
0 };
>
> here too.
>
>> =C2=A0 =C2=A0 =C2=A0 u32 out[HCI_WORDS];
>> - =C2=A0 =C2=A0 acpi_status status =3D hci_raw(in, out);
>> + =C2=A0 =C2=A0 acpi_status status =3D hci_raw(dev, in, out);
>> =C2=A0 =C2=A0 =C2=A0 *out1 =3D out[2];
>> =C2=A0 =C2=A0 =C2=A0 *result =3D (status =3D=3D AE_OK) ? out[0] : HC=
I_FAILURE;
>> =C2=A0 =C2=A0 =C2=A0 return status;
>> =C2=A0}
>>
>> -static acpi_status hci_write2(u32 reg, u32 in1, u32 in2, u32 *resul=
t)
>> +static acpi_status hci_write2(struct toshiba_acpi_dev *dev, u32 reg=
,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 u32 in1, u32 in2, u32 *result)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 u32 in[HCI_WORDS] =3D { HCI_SET, reg, in1, in2,=
 0, 0 };
>
> const etc.
>
>> @@ -507,8 +486,13 @@ static int get_lcd(struct backlight_device *bd)
>>
>> =C2=A0static int lcd_proc_show(struct seq_file *m, void *v)
>> =C2=A0{
>> - =C2=A0 =C2=A0 int value =3D get_lcd(NULL);
>> + =C2=A0 =C2=A0 struct toshiba_acpi_dev *dev =3D m->private;
>> + =C2=A0 =C2=A0 int value;
>> +
>> + =C2=A0 =C2=A0 if (!dev->backlight_dev)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>>
>> + =C2=A0 =C2=A0 value =3D get_lcd(dev->backlight_dev);
>> =C2=A0 =C2=A0 =C2=A0 if (value >=3D 0) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seq_printf(m, "brig=
htness: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%d\n", value);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seq_printf(m, "brig=
htness_levels: =C2=A0 =C2=A0 =C2=A0 %d\n",
>
> Some small amount space could be saved by using:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, =
"%-24s %d\n", "brightness:", value);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, =
"%-24s %d\n", "brightness_levels:", etc...
> []
>> @@ -675,13 +663,14 @@ static const struct file_operations video_proc=
_fops =3D {
>>
>> =C2=A0static int fan_proc_show(struct seq_file *m, void *v)
>> =C2=A0{
>> + =C2=A0 =C2=A0 struct toshiba_acpi_dev *dev =3D m->private;
>> =C2=A0 =C2=A0 =C2=A0 u32 hci_result;
>> =C2=A0 =C2=A0 =C2=A0 u32 value;
>>
>> - =C2=A0 =C2=A0 hci_read1(HCI_FAN, &value, &hci_result);
>> + =C2=A0 =C2=A0 hci_read1(dev, HCI_FAN, &value, &hci_result);
>> =C2=A0 =C2=A0 =C2=A0 if (hci_result =3D=3D HCI_SUCCESS) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seq_printf(m, "runn=
ing: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %d\n", (va=
lue > 0));
>
> Here too:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, =
"%-24s %d\n", "running:", (value > 0);
>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seq_printf(m, "force_on:=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%d\n", force_fa=
n);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seq_printf(m, "force_on:=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%d\n", dev->for=
ce_fan);
>
> etc.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Corentin Chary
http://xf.iksaif.net
