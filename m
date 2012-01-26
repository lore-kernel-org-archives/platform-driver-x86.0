From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: No wifi rfkill on Lenovo machines
Date: Thu, 26 Jan 2012 10:53:24 +0800
Message-ID: <1327546404.15260.18.camel@linux-s257.site>
References: <1327027494.15960.73.camel@linux-s257.site>
	 <1327456627-10369-1-git-send-email-ike.pan@canonical.com>
	 <4F1F659B.7040300@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:60066 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401Ab2AZC6B (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Wed, 25 Jan 2012 21:58:01 -0500
In-Reply-To: <4F1F659B.7040300@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Hi Ike,=20

=E6=96=BC =E4=B8=89=EF=BC=8C2012-01-25 =E6=96=BC 10:14 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> This patch has been tested on ideapad s205
>=20
> User reports the first time try wireless hard/soft all blocked
>=20
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/875659/comment=
s/53
>=20
> but the second try looks good.
>=20
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/875659/comment=
s/55
>=20
>=20

That will be better retest this patch after remove ac power and battery=
=2E

> On 01/25/2012 09:57 AM, Ike Panhc wrote:
> > We have several reports which says acer-wmi is loaded on ideapads
> > and register rfkill for wifi which can not be unblocked.
> >=20
> > Since ideapad-laptop also register rfkill for wifi and it works
> > reliably, it will be fine acer-wmi is not going to register rfkill
> > for wifi once VPC2004 is found.
> >=20
> > Also put IBM0068/LEN0068 in the list. Though thinkpad_acpi has no
> > wifi rfkill capability, there are reports which says acer-wmi also
> > block wireless on Thinkpad E520/E420.
> >=20
> > Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c |   29 +++++++++++++++++++++++++++=
+-
> >  1 files changed, 28 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index b848277..aaef8f8 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -679,6 +679,32 @@ static acpi_status AMW0_find_mailled(void)
> >  	return AE_OK;
> >  }
> > =20
> > +static int AMW0_set_cap_acpi_check_device_found =3D 0;
> > +
> > +static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle h=
andle,
> > +	u32 level, void *context, void **retval)
> > +{
> > +	AMW0_set_cap_acpi_check_device_found =3D 1;
> > +	return AE_OK;
> > +}
> > +
> > +static const struct acpi_device_id norfkill_ids[] =3D {
> > +	{ "VPC2004", 0},
> > +	{ "IBM0068", 0},
> > +	{ "LEN0068", 0},
> > +	{ "", 0},
> > +};
> > +
> > +static int AMW0_set_cap_acpi_check_device(void)
> > +{
> > +	const struct acpi_device_id *id;
> > +
> > +	for (id =3D norfkill_ids; id->id[0]; id++)
> > +		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
> > +				NULL, NULL);
> > +	return AMW0_set_cap_acpi_check_device_found;
> > +}
> > +
> >  static acpi_status AMW0_set_capabilities(void)
> >  {
> >  	struct wmab_args args;
> > @@ -692,7 +718,8 @@ static acpi_status AMW0_set_capabilities(void)
> >  	 * work.
> >  	 */
> >  	if (wmi_has_guid(AMW0_GUID2)) {
> > -		interface->capability |=3D ACER_CAP_WIRELESS;
> > +		if (!AMW0_set_cap_acpi_check_device())
> > +			interface->capability |=3D ACER_CAP_WIRELESS;

I suggest add the following logic (non-test) to pass quirks that were
already supported by acer-wmi:

	if ((quirk !=3D &quirk_unknown) || !AMW0_set_cap_acpi_check_device())
		interface->capability |=3D ACER_CAP_WIRELESS;

That can keep acer-wmi still support Lenovo Ideapad S205 and Lenovo 300=
0 N200 by
quirks. Those quirks works fine before.

> >  		return AE_OK;
> >  	}
> > =20
>=20
>=20


Thanks a lot!
Joey Lee
