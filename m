From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH] ideapad: DMI quirk for touchpad control
Date: Fri, 10 Jun 2016 12:11:22 -0400
Message-ID: <CA+A7VXX5ZYimA1_XVhvFqgJ6jk4_4HGbqkSpuxsJ9xJ7EB8Thg@mail.gmail.com>
References: <1465230324-18035-1-git-send-email-jprvita@endlessm.com> <20160608221513.GK28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:34765 "EHLO
	mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932719AbcFJQMD convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Jun 2016 12:12:03 -0400
Received: by mail-yw0-f194.google.com with SMTP id j74so9065555ywg.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2016 09:12:02 -0700 (PDT)
In-Reply-To: <20160608221513.GK28348@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, Christian Hesse <list@eworm.de>, platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 8 June 2016 at 18:15, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Jun 06, 2016 at 12:25:24PM -0400, Jo=C3=A3o Paulo Rechi Vita =
wrote:
>> Don't try to control the touchpad on laptops that do not support it,=
 as
>> it leads to sending wrong KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF events =
to
>> userspace.
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
>
> Upon closer inspection, is there a reason you chose to match on PRODU=
CT_NAME
> instead of PRODUCT_VERSION like the no_hw_rfkill_list? The PRODUCT_VE=
RSION tends
> to have the user recognizable name which you placed in a comment inst=
ead of in
> the .ident. For both consistency and legibility, it seems like it wou=
ld be better to
> match on DMI_PRODUCT_VERSION and use that in the .ident.
>

The reason I chose PRODUCT_NAME is because on these laptops this seems
to more specifically identify the machine. 80MK is the model name I
see on the machine's box and at the website at the time. Now the
website shows 80UE. So maybe this is a way to avoid the kind of
clashing that led to reverting the previous quirk by Hans? If that
does not make much sense I can change it to match against
PRODUCT_VERSION, which on my Yoga 900 shows "Lenovo YOGA 900-13ISK".

Also, let me know if you have a explicit suggestion to make the commit
message clearer, or feel free to fix it when you pick the patch.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
