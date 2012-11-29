From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 4/6] msi-laptop: Add MSI Wind U90/U100 support
Date: Thu, 29 Nov 2012 18:31:11 +0200
Message-ID: <CAKErNvov1YeX8uJ-zjT9MTUxoKOEp4sguG3d91zcHPSxDjeswQ@mail.gmail.com>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
 <1353796141-1470-5-git-send-email-maxtram95@gmail.com> <1354073572.21227.1000.camel@linux-s257.site>
 <CAKErNvrSOTFLn=Q3jDH954rm7gOKGyJ7BQZH+26fr1vXvWvd+w@mail.gmail.com> <1354162463.21227.1148.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:49718 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938Ab2K2Qbd convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Nov 2012 11:31:33 -0500
Received: by mail-vc0-f174.google.com with SMTP id m18so11549133vcm.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Nov 2012 08:31:32 -0800 (PST)
In-Reply-To: <1354162463.21227.1148.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

2012/11/29 joeyli <jlee@suse.com>:
> =A9=F3 =A4T=A1A2012-11-28 =A9=F3 19:41 +0200=A1AMaxim Mikityanskiy =B4=
=A3=A8=EC=A1G
>> 2012/11/28 joeyli <jlee@suse.com>:
>> > =A9=F3 =A4=E9=A1A2012-11-25 =A9=F3 00:28 +0200=A1AMaxim Mikityansk=
iy =B4=A3=A8=EC=A1G
>> >> Add MSI Wind U90/U100 to separate DMI table, add U90/U100 specifi=
c
>> >> workarounds and add some missing EC features support such as basi=
c fan
>> >> control, turbo and ECO modes and touchpad state.
>> >>
>> >> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>> >> ---
>> >>  drivers/platform/x86/msi-laptop.c | 199 ++++++++++++++++++++++++=
++++++++------
>> >>  1 file changed, 171 insertions(+), 28 deletions(-)
>> >>
>> >> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform=
/x86/msi-laptop.c
>> >> index 3b6f494..16e9863 100644
>> >> --- a/drivers/platform/x86/msi-laptop.c
>> >> +++ b/drivers/platform/x86/msi-laptop.c
>> >> @@ -82,8 +82,19 @@
>> >>  #define MSI_STANDARD_EC_SCM_LOAD_ADDRESS     0x2d
>> >>  #define MSI_STANDARD_EC_SCM_LOAD_MASK                (1 << 0)
>> >>
>> >> -#define MSI_STANDARD_EC_TOUCHPAD_ADDRESS     0xe4
>> >> +#define MSI_STANDARD_EC_POWER_ADDRESS                0xe4
>> >
>> > If 0xE4 register is not just for touchpad and power, then I sugges=
t use
>> > a more general name like: MSI_STANDARD_EC_FUNCTIONS_ADDRESS or oth=
er.
>>
>> OK, I will rename it.
>
> thanks
>
>> >> +static ssize_t show_touchpad(struct device *dev,
>> >> +     struct device_attribute *attr, char *buf)
>> >> +{
>> >> +
>> >> +     u8 rdata;
>> >> +     int result;
>> >> +
>> >> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
>> >> +     if (result < 0)
>> >> +             return result;
>> >> +
>> >> +     return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUC=
HPAD_MASK));
>> >> +}
>> >
>> > I don't think we need create a touchpad attribute interface becaus=
e
>> > there already have key code raise the change to user space.
>>
>> Key codes only indicate touchpad state change. We cannot determine
>> initial touchpad state on boot using only key codes. I think, it mig=
ht
>> be useful to have a file in sysfs that always keeps actual touchpad
>> state, so that we can get initial touchpad state on boot. Do you
>> disagree with that?
>>
>
> I agree this reason for add a sysfs interface for raise touchpad stat=
us
> to userland.
> But this interface will be a special api and I am not sure there alre=
ady
> have standard way in input subsystem for raise touchpad status. If th=
ere
> have no standard api to raise it, I think add it is make sense.

AFAIK, there is no generic interface that exposes touchpad state. As
for now, the only way is to create such special platform-specific file
in sysfs. asus-wmi uses the same approach.

>> >> +
>> >> +static ssize_t show_turbo(struct device *dev,
>> >> +     struct device_attribute *attr, char *buf)
>> >> +{
> ...
>> >> -     if (!old_ec_model)
>> >> +     if (!old_ec_model) {
>> >>               get_threeg_exists();
>> >> +             if (dmi_check_system(msi_load_scm_models_dmi_table)=
)
>> >> +                     load_scm_model =3D 1;
>> >> +             else if (dmi_check_system(msi_load_scm_ro_models_dm=
i_table)) {
>> >> +                     load_scm_model =3D 1;
>> >> +                     ec_read_only =3D 1;
>> >> +             }
>> >> +     }
>> >>
>> >>       if (!old_ec_model && dmi_check_system(msi_load_scm_models_d=
mi_table))
>> >>               load_scm_model =3D 1;
>> >
>> > hmm... the load_scm_model dmi table check 2 times? I think you can=
 just
>> > remove the duplicate code.
>>
>> Oops, I forgot to remove the last two lines when I were preparing pa=
tches.
>>
>> Do I need to resend all patches after doing all needed fixes?
>
> Yes, please modify your patches for all changed and I suggest re-send
> them by add v2 to subject, like:
>         [PATCH 0/6 v2] msi-laptop: Add MSI Wind U90/U100 support
>         ...
>         [PATCH 4/6 v2] msi-laptop: Add MSI Wind U90/U100 support
>
> Please write down what's the v2 change for each patch on description =
of
> patch.

OK, I'll do that when v2 will be ready.

>
> Thanks a lot!
> Joey Lee
>
>
