From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/2] dell-laptop: Expose auxiliary MAC address if available
Date: Wed, 11 May 2016 18:41:54 +0200
Message-ID: <201605111841.54411@pali>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com> <1462811099-16897-2-git-send-email-mario_limonciello@dell.com> <20160511133251.GA3440@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1623782.YBPC2U4TLr";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160511133251.GA3440@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart1623782.YBPC2U4TLr
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario & Micha=C5=82!

On Wednesday 11 May 2016 15:32:51 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > System with Type-C ports have a feature to expose an auxiliary
> > persistent MAC address.  This address is burned in at the
> > factory.
> >=20
> > The intention of this address is to update the MAC address on
> > Type-C docks containing an ethernet adapter to match the
> > auxiliary address of the system connected to them.

So... if I understand patch description correctly, it means that new=20
notebooks could have reserved MAC address used by dock, right?

And USB Type-C docks with ethernet port act like USB ethernet card,=20
right?

So notebook has burned MAC address which should be used for any=20
connected dock (usb ethernet) into C port, instead MAC address burned=20
into ethernet card?

If I'm not right, please describe me how it should work, as I'm not sure=20
if I understand it correctly...

> > +/* get_aux_mac
>=20
> I'm not sure whether repeating the function's name in a comment
> placed just above its definition is useful when not using
> kernel-doc.

Yes, that comment does not bring any value for reader.

> CC'ing Matthew and Pali who are the maintainers of dell-laptop as
> this boils down to their opinion (and you'll need their ack for the
> whole patch anyway).  Please CC them for any upcoming revisions of
> this patch series.

I'm not on platform-driver-x86 ML, so please CC me explicitly if you=20
want from me to comment patches.

> > + * returns the auxiliary mac address
>=20
> get_aux_mac() doesn't return the auxiliary MAC address, it stores it
> in a variable and returns an error code.  Please rephrase the
> comment to avoid confusion.
>=20
> > + * for assigning to a Type-C ethernet device
> > + * such as that found in the Dell TB15 dock
> > + */
> > +static int get_aux_mac(void)
> > +{
> > +	struct calling_interface_buffer *buffer;
> > +	unsigned char *extended_buffer;
> > +	size_t length;
> > +	int ret;
> > +
> > +	buffer =3D dell_smbios_get_buffer();
> > +	length =3D 17;
> > +	extended_buffer =3D dell_smbios_send_extended_request(11, 6,
> > &length); +	ret =3D buffer->output[0];
> > +	if (ret !=3D 0 || !extended_buffer) {
> > +		pr_debug("get_aux_mac: ext buffer: %p, len: %lu, ret: %d\n",
> > +			 extended_buffer, length, ret);
> > +		auxiliary_mac_address =3D NULL;
>=20
> This is redundant as auxiliary_mac_address is static and thus will be
> initialized to NULL.
>=20
> > +		goto auxout;
>=20
> I guess the label's name could be changed to "out" for consistency
> with other functions in dell-laptop using only one goto label.
>=20
> > +	}
> > +
> > +	/* address will be stored in byte 4-> */
>=20
> This comment is now redundant.
>=20
> > +	auxiliary_mac_address =3D kmalloc(length, GFP_KERNEL);
> > +	memcpy(auxiliary_mac_address, extended_buffer, length);
> > +
> > + auxout:
> > +	dell_smbios_release_buffer();
> > +	return dell_smbios_error(ret);
> > +}
> > +
> > +static ssize_t auxiliary_mac_show(struct device *dev,
> > +				  struct device_attribute *attr, char *page)
>=20
> Could you rename the variable "page" to "buf" for consistency with
> other device attributes defined inside dell-laptop?
>=20
> > +{
> > +	return sprintf(page, "%s\n", auxiliary_mac_address);
> > +}
> > +
> > +static DEVICE_ATTR_RO(auxiliary_mac);
> > +static struct attribute *dell_attributes[] =3D {
> > +	&dev_attr_auxiliary_mac.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group dell_attr_group =3D {
> > +	.attrs =3D dell_attributes,
> > +};
> > +

In my opinion this is not correct way to export "random" sysfs=20
attributes to userspace. If it is possible we should use existing=20
API/ABI for kernel and not to invent new ABI for userspace.

Dell-laptop driver has already documented ABI for non standard things=20
(like extended settings for keyboard backlight), see:=20
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-platform-dell-la=
ptop

And exporting MAC address sounds for me like bad idea. I think it should=20
handle kernel itself (maybe send it to driver which use it?).

And most important question: Who is going to use that sysfs file? Is=20
there any application? It is not possible to query for that address from=20
userspace, e.g. from libsmbios tools?

We have libsmbios functionality in kernel just for things which have=20
exiting API/ABI/interface in kernel. Not those which do not have...

So why is needed to have such sysfs attribute exported by kernel?

> >  /*
> > =20
> >   * Derived from information in smbios-wireless-ctl:
> >   *
> >=20
> > @@ -392,7 +441,6 @@ static const struct dmi_system_id dell_quirks[]
> > __initconst =3D {
> >=20
> >   *     cbArg1, byte0 =3D 0x13
> >   *     cbRes1 Standard return codes (0, -1, -2)
> >   */
> >=20
> > -
>=20
> It seems to me that removing this unrelated empty line is something
> close to your heart ;)
>=20
> >  static int dell_rfkill_set(void *data, bool blocked)
> >  {
> > =20
> >  	struct calling_interface_buffer *buffer;
> >=20
> > @@ -2003,6 +2051,12 @@ static int __init dell_init(void)
> >=20
> >  		goto fail_rfkill;
> >  =09
> >  	}
> >=20
> > +	ret =3D get_aux_mac();
> > +	if (!ret) {
> > +		sysfs_create_group(&platform_device->dev.kobj,
> > +				   &dell_attr_group);
> > +	}
>=20
> The curly brackets are redundant here.
>=20
> BTW, while this code will behave correctly when the requested length
> of the extended buffer is 17, I cannot shake the premonition that
> bad things will happen when someone copy-pastes your code for
> get_aux_mac() while changing the requested length of the extended
> buffer to an invalid value.  In such a case
> dell_smbios_send_extended_request() would return NULL, but the
> return value from the copy-pasted sibling of get_aux_mac() would be
> 0, because dell_smbios_get_buffer() zeroes the SMI buffer and
> dell_smbios_send_extended_request() would return so early that it
> wouldn't even call dell_smbios_send_request().  Therefore, "if
> (!ret)" would evaluate to true, even though the copy-pasted sibling
> of get_aux_mac() would have encountered an error.
>=20
> Perhaps I'm being overly paranoid, but maybe it won't hurt to do the
> following instead:
>=20
>     get_aux_mac();
>     if (auxiliary_mac_address)
>         sysfs_create_group(&platform_device->dev.kobj,
>                            &dell_attr_group);
>=20
> and make get_aux_mac() return void.  What do you think?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1623782.YBPC2U4TLr
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlczYNIACgkQi/DJPQPkQ1IuaACgyI1mOQ2Q32Nu2x2aLkC0izVt
6h4AoKXjDJT+2fw6vPARUNYtiI8HPfCC
=JQ3w
-----END PGP SIGNATURE-----

--nextPart1623782.YBPC2U4TLr--
