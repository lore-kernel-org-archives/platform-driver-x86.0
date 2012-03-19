From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2 v4] asus-wmi: store backlight power status for AIO machine
Date: Mon, 19 Mar 2012 17:19:37 +0100
Message-ID: <CAHR064h3QjJRX1ox3cXQeN9xqwDg=TUVG59LGLvGu13rTUyiJw@mail.gmail.com>
References: <1332150395-14126-1-git-send-email-acelan.kao@canonical.com>
	<1332150395-14126-2-git-send-email-acelan.kao@canonical.com>
	<CAHR064iSM4cmTtCY1CGmG-geHw+s8T-V997HhB_St-=tfd4Asw@mail.gmail.com>
	<CAMz9Wg-r7jg4L5W4SYZEVtzY++pZyzO2qs9fvxDaY89=OBmerQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:61738 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758664Ab2CSQTj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 12:19:39 -0400
Received: by bkcik5 with SMTP id ik5so4427019bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 09:19:37 -0700 (PDT)
In-Reply-To: <CAMz9Wg-r7jg4L5W4SYZEVtzY++pZyzO2qs9fvxDaY89=OBmerQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 19, 2012 at 1:22 PM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> Dear Corentin,
>
> 2012/3/19 Corentin Chary <corentin.chary@gmail.com>:
>> On Mon, Mar 19, 2012 at 10:46 AM, AceLan Kao <acelan.kao@canonical.c=
om> wrote:
>>> Due to some implementation reasons, ASUS ET2012 All-in-One machines
>>> can't report the correct backlight power status, it will always ret=
urn
>>> 1. To track the backlight power status correctly, we have to store =
the
>>> status by ourselves.
>>>
>>> BTW, by the BIOS design, the backlight power will be turn on/off
>>> sequently, no matter what the value of the parameter will be.
>>> More over, the brightness adjustment command will turn on the backl=
ight
>>> power. Those behaviors will make us fail to track the backlight pow=
er
>>> status.
>>> For example, While we are trying to turn on the backlight power,
>>> we will send out the brightness adjustment command and then trying =
to
>>> figure out if we have to turn on the backlight power, then send out
>>> the command. But, the real case is that, the backlight power turns =
on
>>> while sending the brightness adjustment command, and then we send o=
ut
>>> the command to turn on the backlight power, it actually will turn o=
ff
>>> the backlight power and the backlight power status we recorded beco=
mes
>>> wrong. So, we have to seperate these two commands by a if statement=
=2E
>>>
>>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>>> ---
>>> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0| =C2=A0 33 +++++++++++=
+++++++++-------------
>>> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0| =C2=A0 =C2=A02 ++
>>> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 15 ++++++++++++---
>>> =C2=A03 files changed, 34 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86=
/asus-wmi.c
>>> index ea80fbe..9cd459a 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -1076,7 +1076,12 @@ static int asus_wmi_hwmon_init(struct asus_w=
mi *asus)
>>> =C2=A0*/
>>> =C2=A0static int read_backlight_power(struct asus_wmi *asus)
>>> =C2=A0{
>>> - =C2=A0 =C2=A0 =C2=A0 int ret =3D asus_wmi_get_devstate_simple(asu=
s, ASUS_WMI_DEVID_BACKLIGHT);
>>> + =C2=A0 =C2=A0 =C2=A0 int ret;
>>> + =C2=A0 =C2=A0 =C2=A0 if (asus->driver->quirks->store_backlight_po=
wer)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D !asus->d=
river->panel_power;
>>> + =C2=A0 =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D asus_wmi=
_get_devstate_simple(asus,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASUS_WMI_DEVID_BACKLIGHT);
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret < 0)
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>>> @@ -1138,24 +1143,23 @@ static int update_bl_status(struct backligh=
t_device *bd)
>>> =C2=A0{
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_wmi *asus =3D bl_get_data(bd=
);
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl_param;
>>> - =C2=A0 =C2=A0 =C2=A0 int power, err;
>>> -
>>> - =C2=A0 =C2=A0 =C2=A0 if (asus->driver->quirks->scalar_panel_brigh=
tness)
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D g=
et_scalar_command(bd);
>>> - =C2=A0 =C2=A0 =C2=A0 else
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D b=
d->props.brightness;
>>> -
>>> - =C2=A0 =C2=A0 =C2=A0 err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID=
_BRIGHTNESS,
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param, NULL);
>>> -
>>> - =C2=A0 =C2=A0 =C2=A0 if (err < 0)
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;
>>> + =C2=A0 =C2=A0 =C2=A0 int power, err =3D 0;
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0power =3D read_backlight_power(asus);
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (power !=3D -ENODEV && bd->props.powe=
r !=3D power) {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl_param =3D=
 !!(bd->props.power =3D=3D FB_BLANK_UNBLANK);
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D asus=
_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ctrl_param, NULL);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asus->driver=
->quirks->store_backlight_power)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 asus->driver->panel_power =3D bd->props.power;
>>> + =C2=A0 =C2=A0 =C2=A0 } else {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asus->driver=
->quirks->scalar_panel_brightness)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ctrl_param =3D get_scalar_command(bd);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ctrl_param =3D bd->props.brightness;
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D asus_wmi=
_set_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ctrl_param, NULL);
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> Something I didn't notice, why is this moved in an "else" ?
>> Does this break something on your hardware ?
> Yes, in the original sequence, it will send out a brightness command =
through
> WMI anyway, even if we hit this function because of changing the
> backlight power.
>
> And in the ET2012 series machines, it will turn on the backlight powe=
r
> automatically
> when you send out the brightness command.
> And the backlight power command actually is a backlight toggle comman=
d
> in ET2012.
> That is no matter what the parameter is while sending the backlight
> power command,
> it will turn on and off the backlight power in a row.
> So, when we're trying to turn on the backlight power, the panel will
> be turned on
> by the brightness command and the turn on backlight command will actu=
ally
> turn off the backlight.
>
> To avoid this, I use an if else statement to distinguish these 2 case=
s,
> brightness or backlight power, and this should do no harm to normal m=
achines,
> hope I don't miss anything.

Ok I see. I pushed some patches on top of these two, they are
available at http://git.iksaif.net/?p=3Dacpi4asus-dkms.git;a=3Dsummary
These are mostly cleanups, fix for asus-nb-wmi, and I restored the
ability to update both brightness and power (still disabled for
et2012).
Could you test these patches ?
Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
