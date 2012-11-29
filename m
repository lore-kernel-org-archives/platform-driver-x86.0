From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 4/6] msi-laptop: Add MSI Wind U90/U100 support
Date: Thu, 29 Nov 2012 12:14:23 +0800
Message-ID: <1354162463.21227.1148.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-5-git-send-email-maxtram95@gmail.com>
	 <1354073572.21227.1000.camel@linux-s257.site>
	 <CAKErNvrSOTFLn=Q3jDH954rm7gOKGyJ7BQZH+26fr1vXvWvd+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:53651 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030Ab2K2EPY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Nov 2012 23:15:24 -0500
In-Reply-To: <CAKErNvrSOTFLn=Q3jDH954rm7gOKGyJ7BQZH+26fr1vXvWvd+w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

=E6=96=BC =E4=B8=89=EF=BC=8C2012-11-28 =E6=96=BC 19:41 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> 2012/11/28 joeyli <jlee@suse.com>:
> > =E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8C=
Maxim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> >> Add MSI Wind U90/U100 to separate DMI table, add U90/U100 specific
> >> workarounds and add some missing EC features support such as basic=
 fan
> >> control, turbo and ECO modes and touchpad state.
> >>
> >> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> >> ---
> >>  drivers/platform/x86/msi-laptop.c | 199 +++++++++++++++++++++++++=
+++++++------
> >>  1 file changed, 171 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/=
x86/msi-laptop.c
> >> index 3b6f494..16e9863 100644
> >> --- a/drivers/platform/x86/msi-laptop.c
> >> +++ b/drivers/platform/x86/msi-laptop.c
> >> @@ -82,8 +82,19 @@
> >>  #define MSI_STANDARD_EC_SCM_LOAD_ADDRESS     0x2d
> >>  #define MSI_STANDARD_EC_SCM_LOAD_MASK                (1 << 0)
> >>
> >> -#define MSI_STANDARD_EC_TOUCHPAD_ADDRESS     0xe4
> >> +#define MSI_STANDARD_EC_POWER_ADDRESS                0xe4
> >
> > If 0xE4 register is not just for touchpad and power, then I suggest=
 use
> > a more general name like: MSI_STANDARD_EC_FUNCTIONS_ADDRESS or othe=
r.
>=20
> OK, I will rename it.

thanks

> >> +static ssize_t show_touchpad(struct device *dev,
> >> +     struct device_attribute *attr, char *buf)
> >> +{
> >> +
> >> +     u8 rdata;
> >> +     int result;
> >> +
> >> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
> >> +     if (result < 0)
> >> +             return result;
> >> +
> >> +     return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUCH=
PAD_MASK));
> >> +}
> >
> > I don't think we need create a touchpad attribute interface because
> > there already have key code raise the change to user space.
>=20
> Key codes only indicate touchpad state change. We cannot determine
> initial touchpad state on boot using only key codes. I think, it migh=
t
> be useful to have a file in sysfs that always keeps actual touchpad
> state, so that we can get initial touchpad state on boot. Do you
> disagree with that?
>=20

I agree this reason for add a sysfs interface for raise touchpad status
to userland.
But this interface will be a special api and I am not sure there alread=
y
have standard way in input subsystem for raise touchpad status. If ther=
e
have no standard api to raise it, I think add it is make sense.

> >> +
> >> +static ssize_t show_turbo(struct device *dev,
> >> +     struct device_attribute *attr, char *buf)
> >> +{
=2E..
> >> -     if (!old_ec_model)
> >> +     if (!old_ec_model) {
> >>               get_threeg_exists();
> >> +             if (dmi_check_system(msi_load_scm_models_dmi_table))
> >> +                     load_scm_model =3D 1;
> >> +             else if (dmi_check_system(msi_load_scm_ro_models_dmi=
_table)) {
> >> +                     load_scm_model =3D 1;
> >> +                     ec_read_only =3D 1;
> >> +             }
> >> +     }
> >>
> >>       if (!old_ec_model && dmi_check_system(msi_load_scm_models_dm=
i_table))
> >>               load_scm_model =3D 1;
> >
> > hmm... the load_scm_model dmi table check 2 times? I think you can =
just
> > remove the duplicate code.
>=20
> Oops, I forgot to remove the last two lines when I were preparing pat=
ches.
>=20
> Do I need to resend all patches after doing all needed fixes?

Yes, please modify your patches for all changed and I suggest re-send
them by add v2 to subject, like:
	[PATCH 0/6 v2] msi-laptop: Add MSI Wind U90/U100 support
	...
	[PATCH 4/6 v2] msi-laptop: Add MSI Wind U90/U100 support

Please write down what's the v2 change for each patch on description of
patch.


Thanks a lot!
Joey Lee
