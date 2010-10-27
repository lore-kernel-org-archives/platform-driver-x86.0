From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: toshiba_acpi.c: Full TOS1900 device support
Date: Wed, 27 Oct 2010 13:24:15 -0600
Message-ID: <AANLkTinmsNzAkp_ZGcaNyVRVMu0Rc4-C+xPKuSOS5jRJ@mail.gmail.com>
References: <AANLkTikff5b9zhCLEmyoHZPTPaREuHE1qp21SLA0v=83@mail.gmail.com>
	<20101026192028.GA17880@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:59354 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756043Ab0J0TYQ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Oct 2010 15:24:16 -0400
In-Reply-To: <20101026192028.GA17880@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 26, 2010 at 1:20 PM, Matthew Garrett <mjg59@srcf.ucam.org> =
wrote:
> On Tue, Oct 26, 2010 at 01:14:25PM -0600, Azael Avalos wrote:
>>
>> - =C2=A0 =C2=A0 hci_read1(HCI_LCD_BRIGHTNESS, &value, &hci_result);
>> - =C2=A0 =C2=A0 if (hci_result =3D=3D HCI_SUCCESS) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (value >> HCI_LCD=
_BRIGHTNESS_SHIFT);
>> - =C2=A0 =C2=A0 } else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EFAULT;
>> + =C2=A0 =C2=A0 if (toshiba_acpi.spfc && toshiba_acpi.video_handle) =
{
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D acpi_evaluate=
_integer(toshiba_acpi.video_handle,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0"_BQC", NULL, &val);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ACPI_SUCCESS(status)=
)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return val;
>
> This doesn't look right. Shouldn't _BQC indicate that it's an ACPI sp=
ec
> video device, and thus driven by the ACPI video driver?
>

Yes, actually the ACPI video driver does a better job of detecting the
video device,
so perhaps something like the following would be better IMHO for at lea=
st the
backlight:


	if (toshiba_acpi.spfc || !acpi_video_backlight_support()) {
		props.max_brightness =3D HCI_LCD_BRIGHTNESS_LEVELS - 1;
		toshiba_backlight_device =3D backlight_device_register("toshiba",
						    &toshiba_acpi.p_dev->dev,
						    NULL,
						    &toshiba_backlight_data,
						    &props);
		if (IS_ERR(toshiba_backlight_device)) {
			ret =3D PTR_ERR(toshiba_backlight_device);

			printk(KERN_ERR
			       "Could not register toshiba backlight device\n");
			toshiba_backlight_device =3D NULL;
			toshiba_acpi_exit();
			return ret;
		}
	}


Is there an ACPI function that let's us query the display brightness?
Because TOS1900 devices lack the HCI method to query the LCD status,
and thus the proc interface will be useless, that is, if a userland (or=
 any
other) application is using it.



>> +static void toshiba_input_event(struct input_handle *handle, unsign=
ed int type,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int code, int value)
>> =C2=A0{
>> - =C2=A0 =C2=A0 struct key_entry *key;
>> -
>> - =C2=A0 =C2=A0 for (key =3D toshiba_acpi_keymap; key->type !=3D KE_=
END; key++)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (code =3D=3D key->cod=
e)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return key;
>> -
>> - =C2=A0 =C2=A0 return NULL;
>> + =C2=A0 =C2=A0 if (type =3D=3D EV_MSC && code =3D=3D MSC_SCAN && va=
lue =3D=3D TOSHIBA_FN_SCAN)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 schedule_work(&((struct =
toshiba_acpi_dev *)handle->private)->hotkey_work);
>> =C2=A0}
>
> Ugh. Use i8042_install_filter instead, and just look at the raw i8042
> stream. That'll avoid the ugly strncmp for the device names in order =
to
> find the right device.
>

Can you point me to some documents (if any) or even pieces of code
that I can look at.

I've tried using the i8042_install_filter function, but I haven't had
any luck so far,
or perhaps I'm using it in wrong, due to my limited kernel knowledge.


Saludos
Azael


--=20
-- El mundo apesta y vosotros apestais tambien --
