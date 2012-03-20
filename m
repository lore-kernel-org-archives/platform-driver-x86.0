From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 2/2 v4] asus-wmi: store backlight power status for AIO machine
Date: Tue, 20 Mar 2012 11:22:01 +0800
Message-ID: <CAMz9Wg9tJa_T0VejusNdsnKx6wSgoGG+phXu08P4VkhDksrtKg@mail.gmail.com>
References: <1332150395-14126-1-git-send-email-acelan.kao@canonical.com>
	<1332150395-14126-2-git-send-email-acelan.kao@canonical.com>
	<CAHR064iSM4cmTtCY1CGmG-geHw+s8T-V997HhB_St-=tfd4Asw@mail.gmail.com>
	<CAMz9Wg-r7jg4L5W4SYZEVtzY++pZyzO2qs9fvxDaY89=OBmerQ@mail.gmail.com>
	<CAHR064h3QjJRX1ox3cXQeN9xqwDg=TUVG59LGLvGu13rTUyiJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:62090 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754066Ab2CTDWD convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 23:22:03 -0400
Received: by wibhq7 with SMTP id hq7so4638537wib.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 20:22:02 -0700 (PDT)
In-Reply-To: <CAHR064h3QjJRX1ox3cXQeN9xqwDg=TUVG59LGLvGu13rTUyiJw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

It looks good and works on the ET2012 machines.
Thanks.

Best regards,
AceLan Kao.

2012/3/20 Corentin Chary <corentin.chary@gmail.com>:
> On Mon, Mar 19, 2012 at 1:22 PM, AceLan Kao <acelan.kao@canonical.com=
> wrote:
>> Dear Corentin,
>>
>> 2012/3/19 Corentin Chary <corentin.chary@gmail.com>:
>>> On Mon, Mar 19, 2012 at 10:46 AM, AceLan Kao <acelan.kao@canonical.=
com> wrote:
>>>> Due to some implementation reasons, ASUS ET2012 All-in-One machine=
s
>>>> can't report the correct backlight power status, it will always re=
turn
>>>> 1. To track the backlight power status correctly, we have to store=
 the
>>>> status by ourselves.
>>>>
>>>> BTW, by the BIOS design, the backlight power will be turn on/off
>>>> sequently, no matter what the value of the parameter will be.
>>>> More over, the brightness adjustment command will turn on the back=
light
>>>> power. Those behaviors will make us fail to track the backlight po=
wer
>>>> status.
>>>> For example, While we are trying to turn on the backlight power,
>>>> we will send out the brightness adjustment command and then trying=
 to
>>>> figure out if we have to turn on the backlight power, then send ou=
t
>>>> the command. But, the real case is that, the backlight power turns=
 on
>>>> while sending the brightness adjustment command, and then we send =
out
>>>> the command to turn on the backlight power, it actually will turn =
off
>>>> the backlight power and the backlight power status we recorded bec=
omes
>>>> wrong. So, we have to seperate these two commands by a if statemen=
t.
>>>>
>>>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>>>> ---
>>>> =A0drivers/platform/x86/asus-wmi.c =A0| =A0 33 +++++++++++++++++++=
+-------------
>>>> =A0drivers/platform/x86/asus-wmi.h =A0| =A0 =A02 ++
>>>> =A0drivers/platform/x86/eeepc-wmi.c | =A0 15 ++++++++++++---
>>>> =A03 files changed, 34 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x8=
6/asus-wmi.c
>>>> index ea80fbe..9cd459a 100644
>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>> @@ -1076,7 +1076,12 @@ static int asus_wmi_hwmon_init(struct asus_=
wmi *asus)
>>>> =A0*/
>>>> =A0static int read_backlight_power(struct asus_wmi *asus)
>>>> =A0{
>>>> - =A0 =A0 =A0 int ret =3D asus_wmi_get_devstate_simple(asus, ASUS_=
WMI_DEVID_BACKLIGHT);
>>>> + =A0 =A0 =A0 int ret;
>>>> + =A0 =A0 =A0 if (asus->driver->quirks->store_backlight_power)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D !asus->driver->panel_power;
>>>> + =A0 =A0 =A0 else
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D asus_wmi_get_devstate_simple=
(asus,
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ASUS_WMI_DEVID_BACKLIGHT);
>>>>
>>>> =A0 =A0 =A0 =A0if (ret < 0)
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>>>> @@ -1138,24 +1143,23 @@ static int update_bl_status(struct backlig=
ht_device *bd)
>>>> =A0{
>>>> =A0 =A0 =A0 =A0struct asus_wmi *asus =3D bl_get_data(bd);
>>>> =A0 =A0 =A0 =A0u32 ctrl_param;
>>>> - =A0 =A0 =A0 int power, err;
>>>> -
>>>> - =A0 =A0 =A0 if (asus->driver->quirks->scalar_panel_brightness)
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D get_scalar_command(bd=
);
>>>> - =A0 =A0 =A0 else
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D bd->props.brightness;
>>>> -
>>>> - =A0 =A0 =A0 err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTN=
ESS,
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ctrl_param, NULL);
>>>> -
>>>> - =A0 =A0 =A0 if (err < 0)
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
>>>> + =A0 =A0 =A0 int power, err =3D 0;
>>>>
>>>> =A0 =A0 =A0 =A0power =3D read_backlight_power(asus);
>>>> =A0 =A0 =A0 =A0if (power !=3D -ENODEV && bd->props.power !=3D powe=
r) {
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctrl_param =3D !!(bd->props.power =3D=
=3D FB_BLANK_UNBLANK);
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D asus_wmi_set_devstate(ASUS_=
WMI_DEVID_BACKLIGHT,
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ctrl_param, NULL);
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (asus->driver->quirks->store_back=
light_power)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 asus->driver->panel_=
power =3D bd->props.power;
>>>> + =A0 =A0 =A0 } else {
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (asus->driver->quirks->scalar_pan=
el_brightness)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D get_s=
calar_command(bd);
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D bd->p=
rops.brightness;
>>>> +
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D asus_wmi_set_devstate(ASUS_W=
MI_DEVID_BRIGHTNESS,
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 ctrl_param, NULL);
>>>> =A0 =A0 =A0 =A0}
>>>
>>> Something I didn't notice, why is this moved in an "else" ?
>>> Does this break something on your hardware ?
>> Yes, in the original sequence, it will send out a brightness command=
 through
>> WMI anyway, even if we hit this function because of changing the
>> backlight power.
>>
>> And in the ET2012 series machines, it will turn on the backlight pow=
er
>> automatically
>> when you send out the brightness command.
>> And the backlight power command actually is a backlight toggle comma=
nd
>> in ET2012.
>> That is no matter what the parameter is while sending the backlight
>> power command,
>> it will turn on and off the backlight power in a row.
>> So, when we're trying to turn on the backlight power, the panel will
>> be turned on
>> by the brightness command and the turn on backlight command will act=
ually
>> turn off the backlight.
>>
>> To avoid this, I use an if else statement to distinguish these 2 cas=
es,
>> brightness or backlight power, and this should do no harm to normal =
machines,
>> hope I don't miss anything.
>
> Ok I see. I pushed some patches on top of these two, they are
> available at http://git.iksaif.net/?p=3Dacpi4asus-dkms.git;a=3Dsummar=
y
> These are mostly cleanups, fix for asus-nb-wmi, and I restored the
> ability to update both brightness and power (still disabled for
> et2012).
> Could you test these patches ?
> Thanks,
>
> --
> Corentin Chary
> http://xf.iksaif.net
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
