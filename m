From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH] ideadpad: Runtime check for hw touchpad control
Date: Thu, 2 Jun 2016 10:30:49 -0400
Message-ID: <CA+A7VXWwhBbE0TevXSegUrsEpPw4KYBoBVRP2sS9fhTpg7RtOw@mail.gmail.com>
References: <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
 <1464736867-6084-1-git-send-email-jprvita@endlessm.com> <CAKErNvqfphVV5f6s9zfO-c=e279wQoGQ_Q2Z35qq11fEkdu5_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:36026 "EHLO
	mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932712AbcFBOba convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 10:31:30 -0400
Received: by mail-yw0-f195.google.com with SMTP id l126so7054990ywe.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 07:31:29 -0700 (PDT)
In-Reply-To: <CAKErNvqfphVV5f6s9zfO-c=e279wQoGQ_Q2Z35qq11fEkdu5_A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 1 June 2016 at 00:37, Maxim Mikityanskiy <maxtram95@gmail.com> wrote=
:
> 2016-06-01 2:21 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.c=
om>:
>> Check if disabling the i8042 AUX port has any effect on
>> VPCCMD_R_TOUCHPAD, and use that information to decide whether or not
>> ideapad_sync_touchpad_state() should do something.
>>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platfor=
m/x86/ideapad-laptop.c
>> index 06a837a..08dd487 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -93,6 +93,7 @@ struct ideapad_private {
>>         struct dentry *debug;
>>         unsigned long cfg;
>>         bool has_hw_rfkill_switch;
>> +       bool has_hw_tp_ctrl;
>>  };
>>
>>  static bool no_bt_rfkill;
>> @@ -773,6 +774,9 @@ static void ideapad_sync_touchpad_state(struct i=
deapad_private *priv)
>>  {
>>         unsigned long value;
>>
>> +       if (!priv->has_hw_tp_ctrl)
>> +               return;
>> +
>>         /* Without reading from EC touchpad LED doesn't switch state=
 */
>>         if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &va=
lue)) {
>>                 /* Some IdeaPads don't really turn off touchpad - th=
ey only
>> @@ -930,6 +934,18 @@ static const struct dmi_system_id no_hw_rfkill_=
list[] =3D {
>>         {}
>>  };
>>
>> +static bool ideapad_has_touchpad_ctrl(struct ideapad_private *priv)
>> +{
>> +       unsigned char param;
>> +       unsigned long value_disabled, value_enabled;
>> +
>> +       i8042_command(&param, I8042_CMD_AUX_DISABLE);
>> +       read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value_d=
isabled);
>> +       i8042_command(&param, I8042_CMD_AUX_ENABLE);
>> +       read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value_e=
nabled);
>
> This should be tested on a device that has touchpad control, but
> personally I don't think it will work in that way. As
> VPCCMD_R_TOUCHPAD returns different values independently of the actua=
l
> touchpad state, but synchronously with the LED state changes, I think
> disabling the touchpad by I8042_CMD_AUX_DISABLE will not affect the
> value read with VPCCMD_R_TOUCHPAD. So if this code will for some
> reason work, we should test it in advance, merging it without prior
> testing has a very big chances to break touchpad switching.
>

=46rom your previous explanation of ideapad_sync_touchpad_state() I
understood that the LED state would reflect the touchpad state when
you disabled the AUX port, but maybe I missed something on the way. I
tried to reach out to colleagues and friends to see if someone has an
Ideapad Z570, but I'm not very confident I'll find one.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
