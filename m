Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B13B8959
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361423; cv=none; b=fMKLvoq+a2mXLY3+dsyDGuko/xTh6E7csMFaavde+hZ2UXV0RkmLA6DGZO7lSx31Anr4uIoYlkX/qH2Xxx4dAhcy38STRoMfa3Jk9arfwvWUERq2hlM3s8YD5OwU4JGrN6rJsH7uEcjer3eAEHkxfPoRgpvnoTYbuc/ZnCynpwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361423; c=relaxed/simple;
	bh=uj47Z3s9cpv7dqFOvHNiYSi5nsn108BDEov0Iv57LRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ycrr1iZLC+AEkMgMRmYmL2FloeikE6wSrDxlznIkOsUSBs7gKzgeQZ/JGAv2eTHbQKQ6i/kVnmzxU35P12HxW5eByCo2OxFoj7DQQJSiCHnPhIfKhYzEU/OhQboJi4l+1fclWfLT/GzuJ669KvIWgYW0Chy/ocW4jfGZgI14Lnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=trricEHX; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="trricEHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790361414; x=1790966214; i=w_armin@gmx.de;
	bh=rT+qmyx+0E59DwDIY8iAziexcqneAP2VVurNeet2Yag=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=trricEHXKW9mQ51Mf9HM4+1GlhVmU5FAk9k8r8iWEPfQ+97tCwTTm4NpG3xN12GI
	 6yTVnDS5T+dchcKahqQOg18IIWmq+dP4W9ExYQ+4r01HBKGvACQNlekCjKs7gbkaa
	 R2xfghKssBGxPBgHZfBnpqvwDx/aJ81ZOFtflDWCjoXRG4VzA+ylbmywXR0RmKBM8
	 dzR1XgaWUqI/P2obaMNzZYEN+6xCBINwPkZkme2EV91W09x46Bac1mS510OtXmgEM
	 XiWHxygiUTQGPtTQ6y4p5EILzPY3yEdPIv0rssCU3qUXFBeXAoB7ScGqB8eu20sMV
	 c6MZRK17kKagAtLliA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpSl-1wYt2N2pr7-00h2nd; Fri, 25
 Sep 2026 20:36:54 +0200
Message-ID: <9ea1a4fe-5ce9-46f6-8347-85c951ad1060@gmx.de>
Date: Fri, 25 Sep 2026 20:36:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] platform/x86: wmi: Use common WMI string
 functions
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: prasanth.ksr@dell.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 derekjohn.clark@gmail.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-4-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260925160047.2063361-4-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WovnqYmgqxZGeGi6vHW3ZDxA8icP2vQdUBWi6FLd1nAWjMGRi3o
 i+FQ402yU+tTnvG2LkV7vLbsj5vAK1eN4FwU2MsI+TFmXftlc+VXr6VElbvBBEprEJU8/Hm
 b4BxACb077btqFp55Zb7CjpqMF9gapmvvE+L3dxZc9y/cjeFxg7hsdBw1sK/OlJgaE1JNj7
 WHBMKVtb9kgdFfL2cIHXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TdytuIugY6s=;89flZSvxHnSH+jHWh2Et7dbn0X6
 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
 m+IZ9OWAZNoOM5ldw==

Am 25.09.26 um 18:00 schrieb Mark Pearson:

> The WMI buffer 'string' handling needed for ThinkLMI v2 is done in the s=
ame
> way as on the Dell systems (I suspect this may be common on Windows).
>
> Move the populate_string_buffer and calculate_string_buffer functions in=
to
> the WMI core module so they can be used by other WMI drivers.
>
> The implementation in WMI core has a bit more error checking, as it can =
be
> less certain that the inputs will be good.
>
> Modify the Dell modules to use the new interface and take advantage of
> the error checking.

Why not replace populate_string_buffer() with wmi_string_from_utf8s()?
Additionally calculate_string_buffer() will fail for characters that requi=
re
two UTF16 code points.

I suggest that you replace calculate_string_buffer() with:

	struct_size_t(struct wmi_string, chars, strlen(str) * 2 + 1);

This way each string can safely occupy up to two UTF16 codepoints, with on=
e
being used for the NUL termination.

You can then determine the true size of the WMI string from the return val=
ue:

	struct_size_t(struct wmi_string, chars, ret + 1);

Thanks,
Armin Wolf

> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>   drivers/platform/wmi/core.c                   | 49 +++++++++++++++++++
>   .../dell/dell-wmi-sysman/biosattr-interface.c | 16 ++++--
>   .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 -
>   .../dell-wmi-sysman/passwordattr-interface.c  | 24 ++++++---
>   .../x86/dell/dell-wmi-sysman/sysman.c         | 40 ---------------
>   include/linux/wmi.h                           |  3 ++
>   6 files changed, 82 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 5a2ffcbab6af..c50362365366 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -25,6 +25,7 @@
>   #include <linux/kernel.h>
>   #include <linux/limits.h>
>   #include <linux/module.h>
> +#include <linux/nls.h>
>   #include <linux/platform_device.h>
>   #include <linux/rwsem.h>
>   #include <linux/slab.h>
> @@ -98,6 +99,54 @@ MODULE_DEVICE_TABLE(acpi, wmi_device_ids);
>  =20
>   #define dev_to_wblock(__dev)	container_of_const(__dev, struct wmi_bloc=
k, dev.dev)
>  =20
> +/*
> + * Utility functions common to multiple WMI drivers
> + */
> +
> +/**
> + * wmi_populate_string_buffer() - populates a string buffer
> + * @buffer: the start of the destination buffer
> + * @buffer_len: length of the destination buffer
> + * @str: the string to insert into buffer
> + */
> +ssize_t wmi_populate_string_buffer(char *buffer, size_t buffer_len, con=
st char *str)
> +{
> +	u16 *length, *target;
> +	int ret;
> +
> +	if (!str || !buffer)
> +		return -EINVAL;
> +
> +	length =3D (u16 *)buffer;
> +	target =3D length + 1;
> +	ret =3D utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
> +			      target, buffer_len - sizeof(u16));
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((ret * sizeof(u16)) > U16_MAX)
> +		return -ERANGE;
> +
> +	*length =3D ret * sizeof(u16);
> +	return sizeof(u16) + *length;
> +}
> +EXPORT_SYMBOL_GPL(wmi_populate_string_buffer);
> +
> +/**
> + * wmi_calculate_string_buffer() - determines size of string buffer for=
 use with BIOS communication
> + * @str: the string to calculate based upon
> + *
> + */
> +size_t wmi_calculate_string_buffer(const char *str)
> +{
> +	if (!str)
> +		return -EINVAL;
> +
> +	/* u16 length field + one UTF16 char for each input char */
> +	return sizeof(u16) + strlen(str) * sizeof(u16);
> +}
> +EXPORT_SYMBOL_GPL(wmi_calculate_string_buffer);
> +
>   /*
>    * GUID parsing functions
>    */
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interfac=
e.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> index c2dd2de6bc20..611c6fac3f66 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> @@ -62,8 +62,16 @@ int set_attribute(const char *a_name, const char *a_v=
alue)
>  =20
>   	/* build/calculate buffer */
>   	security_area_size =3D calculate_security_buffer(wmi_priv.current_adm=
in_password);
> -	a_name_size =3D calculate_string_buffer(a_name);
> -	a_value_size =3D calculate_string_buffer(a_value);
> +	a_name_size =3D wmi_calculate_string_buffer(a_name);
> +	if (a_name_size < 0) {
> +		ret =3D a_name_size;
> +		goto out;
> +	}
> +	a_value_size =3D wmi_calculate_string_buffer(a_value);
> +	if (a_value_size < 0) {
> +		ret =3D a_name_size;
> +		goto out;
> +	}
>   	buffer_size =3D security_area_size + a_name_size + a_value_size;
>   	buffer =3D kzalloc(buffer_size, GFP_KERNEL);
>   	if (!buffer) {
> @@ -76,11 +84,11 @@ int set_attribute(const char *a_name, const char *a_=
value)
>  =20
>   	/* build variables to set */
>   	start =3D buffer + security_area_size;
> -	ret =3D populate_string_buffer(start, a_name_size, a_name);
> +	ret =3D wmi_populate_string_buffer(start, a_name_size, a_name);
>   	if (ret < 0)
>   		goto out;
>   	start +=3D ret;
> -	ret =3D populate_string_buffer(start, a_value_size, a_value);
> +	ret =3D wmi_populate_string_buffer(start, a_value_size, a_value);
>   	if (ret < 0)
>   		goto out;
>  =20
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h=
 b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> index 5278a93fdaf7..3f912109c55a 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> @@ -188,10 +188,8 @@ int set_bios_defaults(u8 defType);
>   void exit_bios_attr_set_interface(void);
>   int init_bios_attr_set_interface(void);
>   int map_wmi_error(int error_code);
> -size_t calculate_string_buffer(const char *str);
>   size_t calculate_security_buffer(const char *authentication);
>   void populate_security_buffer(char *buffer, const char *authentication=
);
> -ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const c=
har *str);
>   int set_new_password(const char *password_type, const char *new);
>   int init_bios_attr_pass_interface(void);
>   void exit_bios_attr_pass_interface(void);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-inte=
rface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface=
.c
> index e586f7957946..b95b64e354c0 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> @@ -64,9 +64,21 @@ int set_new_password(const char *password_type, const=
 char *new)
>  =20
>   	/* build/calculate buffer */
>   	security_area_size =3D calculate_security_buffer(wmi_priv.current_adm=
in_password);
> -	password_type_size =3D calculate_string_buffer(password_type);
> -	current_password_size =3D calculate_string_buffer(current_password);
> -	new_size =3D calculate_string_buffer(new);
> +	password_type_size =3D wmi_calculate_string_buffer(password_type);
> +	if (password_type_size < 0) {
> +		ret =3D password_type_size;
> +		goto out;
> +	}
> +	current_password_size =3D wmi_calculate_string_buffer(current_password=
);
> +	if (current_password_size < 0) {
> +		ret =3D current_password_size;
> +		goto out;
> +	}
> +	new_size =3D wmi_calculate_string_buffer(new);
> +	if (new_size < 0) {
> +		ret =3D new_size;
> +		goto out;
> +	}
>   	buffer_size =3D security_area_size + password_type_size + current_pas=
sword_size + new_size;
>   	buffer =3D kzalloc(buffer_size, GFP_KERNEL);
>   	if (!buffer) {
> @@ -79,17 +91,17 @@ int set_new_password(const char *password_type, cons=
t char *new)
>  =20
>   	/* build variables to set */
>   	start =3D buffer + security_area_size;
> -	ret =3D populate_string_buffer(start, password_type_size, password_typ=
e);
> +	ret =3D wmi_populate_string_buffer(start, password_type_size, password=
_type);
>   	if (ret < 0)
>   		goto out;
>  =20
>   	start +=3D ret;
> -	ret =3D populate_string_buffer(start, current_password_size, current_p=
assword);
> +	ret =3D wmi_populate_string_buffer(start, current_password_size, curre=
nt_password);
>   	if (ret < 0)
>   		goto out;
>  =20
>   	start +=3D ret;
> -	ret =3D populate_string_buffer(start, new_size, new);
> +	ret =3D wmi_populate_string_buffer(start, new_size, new);
>   	if (ret < 0)
>   		goto out;
>  =20
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/driver=
s/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 51d25fdc1389..c70ce5aa5ff2 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -29,46 +29,6 @@ struct wmi_sysman_priv wmi_priv =3D {
>   static const char * const reset_types[] =3D {"builtinsafe", "lastknown=
good", "factory", "custom"};
>   static int reset_option =3D -1;
>  =20
> -
> -/**
> - * populate_string_buffer() - populates a string buffer
> - * @buffer: the start of the destination buffer
> - * @buffer_len: length of the destination buffer
> - * @str: the string to insert into buffer
> - */
> -ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const c=
har *str)
> -{
> -	u16 *length =3D (u16 *)buffer;
> -	u16 *target =3D length + 1;
> -	int ret;
> -
> -	ret =3D utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
> -			      target, buffer_len - sizeof(u16));
> -	if (ret < 0) {
> -		dev_err(wmi_priv.class_dev, "UTF16 conversion failed\n");
> -		return ret;
> -	}
> -
> -	if ((ret * sizeof(u16)) > U16_MAX) {
> -		dev_err(wmi_priv.class_dev, "Error string too long\n");
> -		return -ERANGE;
> -	}
> -
> -	*length =3D ret * sizeof(u16);
> -	return sizeof(u16) + *length;
> -}
> -
> -/**
> - * calculate_string_buffer() - determines size of string buffer for use=
 with BIOS communication
> - * @str: the string to calculate based upon
> - *
> - */
> -size_t calculate_string_buffer(const char *str)
> -{
> -	/* u16 length field + one UTF16 char for each input char */
> -	return sizeof(u16) + strlen(str) * sizeof(u16);
> -}
> -
>   /**
>    * calculate_security_buffer() - determines size of security buffer fo=
r authentication scheme
>    * @authentication: the authentication content
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index d723e4b1cafb..eeb9a97ec465 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -83,6 +83,9 @@ acpi_status wmidev_block_set(struct wmi_device *wdev, =
u8 instance, const struct
>  =20
>   u8 wmidev_instance_count(struct wmi_device *wdev);
>  =20
> +size_t wmi_calculate_string_buffer(const char *str);
> +ssize_t wmi_populate_string_buffer(char *buffer, size_t buffer_len, con=
st char *str);
> +
>   /**
>    * struct wmi_driver - WMI driver structure
>    * @driver: Driver model structure
