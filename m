From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 2/2] dell-laptop: Expose auxiliary MAC address if
 available
Date: Mon, 9 May 2016 14:13:18 +0200
Message-ID: <20160509121318.GB2875@eudyptula.hq.kempniu.pl>
References: <1462636364-25644-1-git-send-email-mario_limonciello@dell.com>
 <1462636364-25644-2-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35154 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751764AbcEIMNZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2016 08:13:25 -0400
Received: by mail-lf0-f68.google.com with SMTP id u64so20888378lff.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 May 2016 05:13:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1462636364-25644-2-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

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
>  drivers/platform/x86/dell-laptop.c | 66 ++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 65 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c
> index 2c2f02b..7a1fe08 100644
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
> @@ -273,6 +274,59 @@ static const struct dmi_system_id dell_quirks[] =
__initconst =3D {
>  	{ }
>  };
> =20
> +/* get_aux_mac
> + * returns the auxiliary mac address
> + * for assigning to a Type-C ethernet device
> + * such as that found in the Dell TB15 dock
> + */
> +static int get_aux_mac(void)
> +{
> +	struct calling_interface_buffer *buffer;
> +	int ret;
> +	unsigned char *address =3D
> +		(unsigned char *) __get_free_page(GFP_KERNEL | GFP_DMA32);
> +
> +	buffer =3D dell_smbios_get_buffer();
> +
> +	/* prepare a 17 byte buffer */
> +	dell_smbios_prepare_v2_call(address, 17);
> +	buffer->input[0] =3D virt_to_phys(address);
> +	dell_smbios_send_request(11, 6);

I guess this code could be made reusable by:

  * moving the pre-allocation to dell-smbios (so it would pre-allocate
    two pages, one for "normal" requests and one more for "complex"
    requests),
   =20
  * defining a new function, e.g. dell_smbios_send_v2_request(), taking
    an additional parameter for specifying the desired length of the
    "complex request" buffer, which would:
       =20
      o prepare the "complex request" buffer,
       =20
      o fill the SMI buffer with proper values (physical address of the
        "complex request" buffer as the first input argument),
       =20
      o perform the SMI request,
       =20
      o return a structure containing the length of the returned
        "complex" data and a pointer to that data (or perhaps even
        length immediately followed by data, so that the "complex
        request" buffer can simply be cast to that structure after the
        SMI is performed).

Such a function could then be used like this:

    struct calling_interface_extended_buffer *extbuffer;
    struct calling_interface_buffer *buffer;
    int ret;

    buffer =3D dell_smbios_get_buffer();
    extbuffer =3D dell_smbios_send_v2_request(11, 6, 17);
    ret =3D buffer->output[0];
    if (ret !=3D 0) {
        ...
    }
    auxiliary_mac_address =3D kmalloc(extbuffer->length, GFP_KERNEL);
    memcpy(auxiliary_mac_address, extbuffer->data, extbuffer->length);
    dell_smbios_release_buffer();

This "complex request" buffer could then be freed in dell_smbios_exit()=
,
making caller cleanup a bit simpler.

I am also not sure about the "v2" part of the naming scheme, perhaps it
should be "extended" or "complex" instead?  Is it referred to as "v2" i=
n
some internal Dell documentation?

> +	ret =3D buffer->output[0];
> +
> +	if (ret !=3D 0) {

Nit: I would remove the empty line here, perhaps moving it one line
higher, i.e. below dell_smbios_send_request().

> +		auxiliary_mac_address =3D NULL;
> +		goto auxout;
> +	}
> +	dell_smbios_clear_buffer();

Why is this needed?

> +
> +	/* address will be stored in byte 4-> */
> +	auxiliary_mac_address =3D kmalloc(13, GFP_KERNEL);
> +	memcpy(auxiliary_mac_address, &address[4], 13);

As pointed out above, instead of hardcoding a constant value here, the
value returned in the first four bytes of the "complex request" buffer
should probably be used or at least checked.

> +
> + auxout:
> +	free_page((unsigned long)address);
> +	dell_smbios_release_buffer();
> +	return dell_smbios_error(ret);
> +
> +}
> +
> +static ssize_t auxiliary_mac_show(struct device *dev,
> +				  struct device_attribute *attr, char *page)
> +{
> +	return sprintf(page, "%s\n", auxiliary_mac_address);
> +}
> +
> +static DEVICE_ATTR_RO(auxiliary_mac);
> +static struct attribute *dell_attributes[] =3D {
> +	&dev_attr_auxiliary_mac.attr,
> +	NULL
> +};
> +static const struct attribute_group dell_attr_group =3D {
> +.attrs =3D dell_attributes,

While checkpatch doesn't complain here, an indent would ensure
consistency with the rest of dell-laptop.

> +};
> +
> +

If you run checkpatch with the --strict option, you will find that it
has some whitespace-related remarks here and in several other places.

>  /*
>   * Derived from information in smbios-wireless-ctl:
>   *
> @@ -392,7 +446,6 @@ static const struct dmi_system_id dell_quirks[] _=
_initconst =3D {
>   *     cbArg1, byte0 =3D 0x13
>   *     cbRes1 Standard return codes (0, -1, -2)
>   */
> -

Is there any reason why this patch touches an unrelated empty line?

>  static int dell_rfkill_set(void *data, bool blocked)
>  {
>  	struct calling_interface_buffer *buffer;
> @@ -2003,6 +2056,12 @@ static int __init dell_init(void)
>  		goto fail_rfkill;
>  	}
> =20
> +	ret =3D get_aux_mac();
> +	if (!ret) {
> +		sysfs_create_group(&platform_device->dev.kobj,
> +				   &dell_attr_group);
> +	}
> +
>  	if (quirks && quirks->touchpad_led)
>  		touchpad_led_init(&platform_device->dev);
> =20
> @@ -2064,6 +2123,11 @@ fail_platform_driver:
> =20
>  static void __exit dell_exit(void)
>  {
> +	if (auxiliary_mac_address)
> +		sysfs_remove_group(&platform_device->dev.kobj,
> +				  &dell_attr_group);
> +
> +	kfree(auxiliary_mac_address);

Nit, but it might be cleaner to only call kfree() if
auxiliary_mac_address is not NULL.

BTW, I sincerely hope this whole "complex request" thingy is also used
for something more useful than encoding a 6-byte MAC into a 13-byte
null-terminated string...

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
