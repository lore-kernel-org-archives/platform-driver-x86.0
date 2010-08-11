From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Wed, 11 Aug 2010 15:51:03 +0200
Message-ID: <AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
References: <1281480758.5887.33.camel@localhost>
	<AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
	<1281533999.3236.8.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63281 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287Ab0HKNvF convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Aug 2010 09:51:05 -0400
Received: by fxm13 with SMTP id 13so97797fxm.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Aug 2010 06:51:04 -0700 (PDT)
In-Reply-To: <1281533999.3236.8.camel@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wed, Aug 11, 2010 at 3:39 PM, David Woodhouse <dwmw2@infradead.org> =
wrote:
> On Wed, 2010-08-11 at 14:59 +0200, Corentin Chary wrote:
>> I'd suggest to name it ideapad-laptop (IDEAPAD_LAPTOP). We try to us=
e
>> that name for laptop related drivers.
>
> OK.
>
>> But ... new WMI drivers are named with the *-wmi suffix. So I'm not
>> really sure. Anyway, it's not really important.
>
> It doesn't do any WMI stuff... yet. I was looking at your discussion
> from April and hoping you'd help make it work...

I'd suggest you to read http://lwn.net/Articles/391230/  :)

>> What's DEV_KILLSW ? a global kill switch ?
>
> Yes, that's a physical switch on the side of the laptop which
> automatically kills all of wifi, bluetooth and 3g.
>
>> > +static struct rfkill *ideapad_rfkill[5];
>> > +
>> > +static const char *ideapad_rfk_names[] =3D {
>> > + =A0 =A0 =A0 "ideapad_camera", "ideapad_wlan", "ideapad_bluetooth=
", "ideapad_3g", "ideapad_rfkill"
>> > +};
>>
>> Hum, ideapad_camera inside rfkill stuff ?
>
> Element zero of the array doesn't get used. It was that or add a bunc=
h
> of '-1' in various places. I am entirely unconvinced which I like lea=
st.
> It's the same for the types:
>
>> > +static const int ideapad_rfk_types[] =3D {
>> > + =A0 =A0 =A0 0, RFKILL_TYPE_WLAN, RFKILL_TYPE_BLUETOOTH, RFKILL_T=
YPE_WWAN, RFKILL_TYPE_WLAN
>> > +};
> ...
>> > +static ssize_t store_ideapad_cam(struct device *dev,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s=
truct device_attribute *attr,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
onst char *buf, size_t count)
>> > +{
>> > + =A0 =A0 =A0 int ret, state;
>> > +
>> > + =A0 =A0 =A0 if (!count)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> > + =A0 =A0 =A0 if (sscanf(buf, "%i", &state) !=3D 1)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> > + =A0 =A0 =A0 ret =3D ideapad_dev_set_state(IDEAPAD_DEV_CAMERA, st=
ate);
>>
>> What does it do with values other than 1 and 0 ? maybe you could sen=
d
>> !!state instead
>
> I could do. The ACPI code does so for itself anyway:
>
> =A0 =A0 =A0 =A0 =A0 =A0If (Arg1)
> =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Store (0x01, Local1)
> =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0Else
> =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Store (0x00, Local1)
> =A0 =A0 =A0 =A0 =A0 =A0}
>
>> Also, it would be great not to use the "there will only be one of
>> these device" anti-pattern.
>> Of course, it will work, but I think it's better to get a clean,
>> fully-reentrant driver.
>
> Agreed. Will fix.

Alan did a great work on that for eeepc-laptop, and the new eeepc-wmi
should be clean.
You can take a look a these.

And you should probably make it a platform driver (being the parent of
acpi, wmi, input, backlight, rfkill, etc..).

Is there a lot of thing hidden in ACPI / WMI on these models (like
hotkeys, backlight, light sensors)  ?

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
