From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 2/2] dell-laptop: Expose auxiliary MAC address if
 available
Date: Wed, 11 May 2016 15:32:51 +0200
Message-ID: <20160511133251.GA3440@eudyptula.hq.kempniu.pl>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
 <1462811099-16897-2-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34868 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932564AbcEKNc4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 May 2016 09:32:56 -0400
Received: by mail-lf0-f65.google.com with SMTP id u64so5166019lff.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2016 06:32:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1462811099-16897-2-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

> System with Type-C ports have a feature to expose an auxiliary
> persistent MAC address.  This address is burned in at the
> factory.
>=20
> The intention of this address is to update the MAC address on
> Type-C docks containing an ethernet adapter to match the
> auxiliary address of the system connected to them.
>=20
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 61 ++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c
> index 2c2f02b..7d29690 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -87,6 +87,7 @@ static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
>  static struct rfkill *wwan_rfkill;
>  static bool force_rfkill;
> +static char *auxiliary_mac_address;
> =20
>  module_param(force_rfkill, bool, 0444);
>  MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted mod=
els");
> @@ -273,6 +274,54 @@ static const struct dmi_system_id dell_quirks[] =
__initconst =3D {
>  	{ }
>  };
> =20
> +/* get_aux_mac

I'm not sure whether repeating the function's name in a comment placed
just above its definition is useful when not using kernel-doc.

CC'ing Matthew and Pali who are the maintainers of dell-laptop as this
boils down to their opinion (and you'll need their ack for the whole
patch anyway).  Please CC them for any upcoming revisions of this patch
series.

> + * returns the auxiliary mac address

get_aux_mac() doesn't return the auxiliary MAC address, it stores it in
a variable and returns an error code.  Please rephrase the comment to
avoid confusion.

> + * for assigning to a Type-C ethernet device
> + * such as that found in the Dell TB15 dock
> + */
> +static int get_aux_mac(void)
> +{
> +	struct calling_interface_buffer *buffer;
> +	unsigned char *extended_buffer;
> +	size_t length;
> +	int ret;
> +
> +	buffer =3D dell_smbios_get_buffer();
> +	length =3D 17;
> +	extended_buffer =3D dell_smbios_send_extended_request(11, 6, &lengt=
h);
> +	ret =3D buffer->output[0];
> +	if (ret !=3D 0 || !extended_buffer) {
> +		pr_debug("get_aux_mac: ext buffer: %p, len: %lu, ret: %d\n",
> +			 extended_buffer, length, ret);
> +		auxiliary_mac_address =3D NULL;

This is redundant as auxiliary_mac_address is static and thus will be
initialized to NULL.

> +		goto auxout;

I guess the label's name could be changed to "out" for consistency with
other functions in dell-laptop using only one goto label.

> +	}
> +
> +	/* address will be stored in byte 4-> */

This comment is now redundant.

> +	auxiliary_mac_address =3D kmalloc(length, GFP_KERNEL);
> +	memcpy(auxiliary_mac_address, extended_buffer, length);
> +
> + auxout:
> +	dell_smbios_release_buffer();
> +	return dell_smbios_error(ret);
> +}
> +
> +static ssize_t auxiliary_mac_show(struct device *dev,
> +				  struct device_attribute *attr, char *page)

Could you rename the variable "page" to "buf" for consistency with othe=
r
device attributes defined inside dell-laptop?

> +{
> +	return sprintf(page, "%s\n", auxiliary_mac_address);
> +}
> +
> +static DEVICE_ATTR_RO(auxiliary_mac);
> +static struct attribute *dell_attributes[] =3D {
> +	&dev_attr_auxiliary_mac.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group dell_attr_group =3D {
> +	.attrs =3D dell_attributes,
> +};
> +
>  /*
>   * Derived from information in smbios-wireless-ctl:
>   *
> @@ -392,7 +441,6 @@ static const struct dmi_system_id dell_quirks[] _=
_initconst =3D {
>   *     cbArg1, byte0 =3D 0x13
>   *     cbRes1 Standard return codes (0, -1, -2)
>   */
> -

It seems to me that removing this unrelated empty line is something
close to your heart ;)

>  static int dell_rfkill_set(void *data, bool blocked)
>  {
>  	struct calling_interface_buffer *buffer;
> @@ -2003,6 +2051,12 @@ static int __init dell_init(void)
>  		goto fail_rfkill;
>  	}
> =20
> +	ret =3D get_aux_mac();
> +	if (!ret) {
> +		sysfs_create_group(&platform_device->dev.kobj,
> +				   &dell_attr_group);
> +	}

The curly brackets are redundant here.

BTW, while this code will behave correctly when the requested length of
the extended buffer is 17, I cannot shake the premonition that bad
things will happen when someone copy-pastes your code for get_aux_mac()
while changing the requested length of the extended buffer to an invali=
d
value.  In such a case dell_smbios_send_extended_request() would return
NULL, but the return value from the copy-pasted sibling of get_aux_mac(=
)
would be 0, because dell_smbios_get_buffer() zeroes the SMI buffer and
dell_smbios_send_extended_request() would return so early that it
wouldn't even call dell_smbios_send_request().  Therefore, "if (!ret)"
would evaluate to true, even though the copy-pasted sibling of
get_aux_mac() would have encountered an error.

Perhaps I'm being overly paranoid, but maybe it won't hurt to do the
following instead:

    get_aux_mac();
    if (auxiliary_mac_address)
        sysfs_create_group(&platform_device->dev.kobj,
                           &dell_attr_group);

and make get_aux_mac() return void.  What do you think?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
