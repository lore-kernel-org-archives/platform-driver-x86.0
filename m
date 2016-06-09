From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] ideapad: DMI quirk for touchpad control
Date: Thu, 9 Jun 2016 07:08:16 +0300
Message-ID: <CAKErNvpahaFjNgmufUMsrrLg8WKms6F5RpGK2sos5Zo0ncdKFw@mail.gmail.com>
References: <1465230324-18035-1-git-send-email-jprvita@endlessm.com> <20160608220751.GJ28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35656 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338AbcFIEIs convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jun 2016 00:08:48 -0400
Received: by mail-lf0-f68.google.com with SMTP id s186so2339751lfs.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2016 21:08:47 -0700 (PDT)
In-Reply-To: <20160608220751.GJ28348@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, Christian Hesse <list@eworm.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

2016-06-09 1:07 GMT+03:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Jun 06, 2016 at 12:25:24PM -0400, Jo=C3=A3o Paulo Rechi Vita =
wrote:
>> Don't try to control the touchpad on laptops that do not support it,=
 as
>> it leads to sending wrong KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF events =
to
>> userspace.
>
> Other than some minor comment clarity/grammar, this looks like a reas=
onable
> approach to get the new models working without risking breakage to th=
e older
> models. I'll correct.
>
> Maxim, Ike? OK with this approach?

Looks good for me.

>>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 26 ++++++++++++++++++++++++=
++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platfor=
m/x86/ideapad-laptop.c
>> index 06a837a..6270948 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -93,6 +93,7 @@ struct ideapad_private {
>>       struct dentry *debug;
>>       unsigned long cfg;
>>       bool has_hw_rfkill_switch;
>> +     bool has_tp_ctrl;
>>  };
>>
>>  static bool no_bt_rfkill;
>> @@ -773,6 +774,9 @@ static void ideapad_sync_touchpad_state(struct i=
deapad_private *priv)
>>  {
>>       unsigned long value;
>>
>> +     if (!priv->has_tp_ctrl)
>> +             return;
>> +
>>       /* Without reading from EC touchpad LED doesn't switch state *=
/
>>       if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &valu=
e)) {
>>               /* Some IdeaPads don't really turn off touchpad - they=
 only
>> @@ -930,6 +934,27 @@ static const struct dmi_system_id no_hw_rfkill_=
list[] =3D {
>>       {}
>>  };
>>
>> +/*
>> + * Avoid sending wrong KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF events to=
 userspace.
>> + */
>> +static const struct dmi_system_id no_tp_ctrl_list[] =3D {
>> +     {
>> +             .ident =3D "Lenovo 80HE", /* Yoga 3 Pro 2 */
>> +             .matches =3D {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "80HE"),
>> +             },
>> +     },
>> +     {
>> +             .ident =3D "Lenovo 80MK", /* Yoga 900 */
>> +             .matches =3D {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "80MK"),
>> +             },
>> +     },
>> +     {}
>> +};
>> +
>>  static int ideapad_acpi_add(struct platform_device *pdev)
>>  {
>>       int ret, i;
>> @@ -953,6 +978,7 @@ static int ideapad_acpi_add(struct platform_devi=
ce *pdev)
>>       priv->adev =3D adev;
>>       priv->platform_device =3D pdev;
>>       priv->has_hw_rfkill_switch =3D !dmi_check_system(no_hw_rfkill_=
list);
>> +     priv->has_tp_ctrl =3D !dmi_check_system(no_tp_ctrl_list);
>>
>>       ret =3D ideapad_sysfs_init(priv);
>>       if (ret)
>> --
>> 2.5.0
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
