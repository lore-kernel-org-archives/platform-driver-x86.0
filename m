Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984CA4D9549
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361670; cv=none; b=ScA7n3H9cBU9V3Ar8bSbC7hjOx4uQsGcSndeBU8bAjQNtQRQTDjF+b2vc/mF40ycc0L1tzFJ0I3Zs8Zk5xB8fSJtpPeVoY48fj9/SAYrH2LBOaZ4BilvpT63pqvzU0ErigJ5VrSVWch/ofcctk9LY3OnRPIrgjrbAfLcwxrb0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361670; c=relaxed/simple;
	bh=6nsC4thEMVpYxSMopfiYMK9fhYw9v8jiX1qIbYvwcFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbNdqjqVC6L07n9INmFj9ey7YBq6xqzkeJ3TMTg5fMNg+Sgj+DmtqP/sJsjsmVLgZRS70e4Pu6yKtxfYVnkHTHFr59XJSzqjMv3jguPMxE1LEObrgJJYQYoBojeZwo/AUfGfGj2FcEe38hpF/dJV8VJT3QQvVudSR9w1kg36UQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mH/AB48z; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mH/AB48z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790361651; x=1790966451; i=w_armin@gmx.de;
	bh=Q7Y9Lo8En1lsL5MX7SDXddlvaFlaSPWsB9erHRRKuhA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mH/AB48zQN4G8RzR0WZyZsaLro8SaZ8uFAi6dzOx9d5PrBFdNmvA3D0oUiPlyfCq
	 0fxE9pNfF24mMUNE3ebMEowKeKmQGqtPeopr9smkB2S2FOZTS9VCnXKRARyTDUT7S
	 2XH4HdEL++JMEz4RtR6BVID1bkZDI09aIiKiP+re/gkZRGwMOkSPix+wYfNYRkdut
	 QhTaNOSrARxau3vJB4r7IQJ2dAP24NTqdQWrKJQJhNHboIuXcuhMa32nPQ3t6iwI7
	 WzvtBB03IGzt6UH74MC49/QKr/RKy8Q+cFu1xnAEDGx27/hl/t5ghB3xtC+qwDV2z
	 zdwey0xqnMQhTIaimQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oBr-1wnARy2E2n-00yuUT; Fri, 25
 Sep 2026 20:40:51 +0200
Message-ID: <39972b87-3ace-4e91-b7e1-59d8d656dc67@gmx.de>
Date: Fri, 25 Sep 2026 20:40:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] platform/x86: think-lmi: think-lmi driver to load
 v1 or v2
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: prasanth.ksr@dell.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 derekjohn.clark@gmail.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-3-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260925160047.2063361-3-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I2/aNQDegtI/9SsEPMnKgv+uWfmo3dGudPGz6/TyPHx/OZ0LhnS
 JoHgTt6NzQduXmrh85361n1fpzwFD8BqcE+KHglCv0d6pjKPi62u+EneHPNGr0EvDJCeM+0
 LHpXi9N0NztZODcqBQtOlzzFlDzdLNyM+RuyT+p9kpOBbFu5tNaR8LDhlUrybi30YBLbB9N
 BHKqBr/CtU/bIrDCJ2EYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7r7xFUjckjE=;eoT3IXLp+KIJO2L9Xn9BZHxoSk9
 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
 Or998ExrhhZwJxhpe58WnWmFQFwu85zQBLCz4c=

Am 25.09.26 um 18:00 schrieb Mark Pearson:

> More preparation for think-lmi-v2 driver.
>
> Create think-lmi driver that will be able to determine if v1 or v2
> driver should be used.
>
> Add main GUIDs into think-lmi.h file

Wouldn't it be easier if think-lmi-v1 simply checks if TLMI_V2_BIOS_SETTIN=
G_GUID
exists during probe and simply aborts if that happens to be the case?

Thanks,
Armin Wolf

> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>   drivers/platform/x86/lenovo/Makefile       |  1 +
>   drivers/platform/x86/lenovo/think-lmi-v1.c | 36 +++-----
>   drivers/platform/x86/lenovo/think-lmi.c    | 99 ++++++++++++++++++++++
>   drivers/platform/x86/lenovo/think-lmi.h    |  6 ++
>   4 files changed, 120 insertions(+), 22 deletions(-)
>   create mode 100644 drivers/platform/x86/lenovo/think-lmi.c
>
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86=
/lenovo/Makefile
> index 98a3baa45fa6..c404cff99d35 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -4,6 +4,7 @@
>   # Lenovo x86 Platform Specific Drivers
>   #
>   obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop.o
> +obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi-v1.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
>  =20
> diff --git a/drivers/platform/x86/lenovo/think-lmi-v1.c b/drivers/platfo=
rm/x86/lenovo/think-lmi-v1.c
> index e215e86e3db7..26a62e1a709b 100644
> --- a/drivers/platform/x86/lenovo/think-lmi-v1.c
> +++ b/drivers/platform/x86/lenovo/think-lmi-v1.c
> @@ -34,7 +34,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command =
support");
>    * Returns: "Item,Value"
>    * Example: "WakeOnLAN,Enable"
>    */
> -#define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
> +#define LENOVO_BIOS_SETTING_GUID TLMI_V1_BIOS_SETTING_GUID
>  =20
>   /*
>    * Name: SetBiosSetting
> @@ -233,6 +233,7 @@ static const char * const level_options[] =3D {
>   };
>   static struct think_lmi tlmi_priv;
>   static DEFINE_MUTEX(tlmi_mutex);
> +static bool tlmi_initialised;
>  =20
>   static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct kobj=
ect *kobj)
>   {
> @@ -1818,13 +1819,17 @@ static int tlmi_analyze(struct wmi_device *wdev)
>   	return ret;
>   }
>  =20
> -static void tlmi_remove(struct wmi_device *wdev)
> +void tlmi_v1_remove(struct wmi_device *wdev)
>   {
> -	tlmi_release_attr();
> -	device_unregister(tlmi_priv.class_dev);
> +	if (tlmi_initialised) {
> +		tlmi_release_attr();
> +		device_unregister(tlmi_priv.class_dev);
> +		tlmi_initialised =3D false;
> +	}
>   }
> +EXPORT_SYMBOL(tlmi_v1_remove);
>  =20
> -static int tlmi_probe(struct wmi_device *wdev, const void *context)
> +int tlmi_v1_initialise(struct wmi_device *wdev, const void *context)
>   {
>   	int ret;
>  =20
> @@ -1832,23 +1837,11 @@ static int tlmi_probe(struct wmi_device *wdev, c=
onst void *context)
>   	if (ret)
>   		return ret;
>  =20
> -	return tlmi_sysfs_init();
> +	ret =3D tlmi_sysfs_init();
> +	tlmi_initialised =3D true;
> +	return ret;
>   }
> -
> -static const struct wmi_device_id tlmi_id_table[] =3D {
> -	{ .guid_string =3D LENOVO_BIOS_SETTING_GUID },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(wmi, tlmi_id_table);
> -
> -static struct wmi_driver tlmi_driver =3D {
> -	.driver =3D {
> -		.name =3D "think-lmi",
> -	},
> -	.id_table =3D tlmi_id_table,
> -	.probe =3D tlmi_probe,
> -	.remove =3D tlmi_remove,
> -};
> +EXPORT_SYMBOL(tlmi_v1_initialise);
>  =20
>   MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
>   MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> @@ -1856,4 +1849,3 @@ MODULE_AUTHOR("Corentin Chary <corentin.chary@gmai=
l.com>");
>   MODULE_DESCRIPTION("ThinkLMI Driver");
>   MODULE_LICENSE("GPL");
>  =20
> -module_wmi_driver(tlmi_driver);
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/=
x86/lenovo/think-lmi.c
> new file mode 100644
> index 000000000000..da1e54dab2d1
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Think LMI BIOS configuration supprt driver
> + *
> + * Copyright(C) 2025 Lenovo
> + *
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +#include "think-lmi.h"
> +
> +#define THINKLMI_DEVICE(guid, version)		\
> +	.guid_string =3D (guid),			\
> +	.context =3D &(const unsigned int){version}
> +
> +static int use_version;
> +module_param(use_version, int, 0444);
> +MODULE_PARM_DESC(use_version, "Force use of version (1 or 2)");
> +
> +static int tlmi_version;
> +static bool tlmi_initialised;
> +
> +static void tlmi_remove(struct wmi_device *wdev)
> +{
> +	switch (tlmi_version) {
> +	case 1:
> +		tlmi_v1_remove(wdev);
> +		break;
> +	case 2:
> +		pr_err("Not yet implemented\n");
> +	}
> +}
> +
> +static int tlmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	int ret, ver;
> +
> +	if (tlmi_initialised)
> +		return 0;
> +
> +	ver =3D *((const unsigned int *)context);
> +
> +	/* Until support is complete - we're going to ignore V2 */
> +	if (!use_version && ver =3D=3D 2) {
> +		pr_info("TLMI version 2 detected but ignored as support not ready\n")=
;
> +		return 0;
> +	}
> +
> +	/* Force use of version if requested */
> +	if (use_version && use_version !=3D ver) {
> +		pr_info("Ignoring version %d as requested\n", ver);
> +		return 0;
> +	}
> +
> +	tlmi_version =3D ver;
> +
> +	switch (tlmi_version) {
> +	case 1:
> +		ret =3D tlmi_v1_initialise(wdev, context);
> +		break;
> +	case 2:
> +		pr_err("Not yet implemented\n");
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +	if (ret)
> +		return ret;
> +	tlmi_initialised =3D true;
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id tlmi_id_table[] =3D {
> +	{ THINKLMI_DEVICE(TLMI_V1_BIOS_SETTING_GUID, 1) },
> +	{ THINKLMI_DEVICE(TLMI_V2_BIOS_SETTING_GUID, 2) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, tlmi_id_table);
> +
> +static struct wmi_driver tlmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "think-lmi",
> +	},
> +	.id_table =3D tlmi_id_table,
> +	.probe =3D tlmi_probe,
> +	.remove =3D tlmi_remove,
> +};
> +
> +MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
> +MODULE_DESCRIPTION("ThinkLMI Support Driver");
> +MODULE_LICENSE("GPL");
> +
> +module_wmi_driver(tlmi_driver);
> diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/=
x86/lenovo/think-lmi.h
> index 017644323d46..31359879629e 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.h
> +++ b/drivers/platform/x86/lenovo/think-lmi.h
> @@ -12,6 +12,9 @@
>   #define TLMI_LANG_MAXLEN       4
>   #define TLMI_INDEX_MAX        32
>  =20
> +#define TLMI_V1_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7=
"
> +#define TLMI_V2_BIOS_SETTING_GUID "4B79FBA6-FFD4-41B6-8EA8-E81CDA0F5FC3=
"
> +
>   /* Possible error values */
>   struct tlmi_err_codes {
>   	const char *err_str;
> @@ -137,4 +140,7 @@ struct think_lmi {
>   	const struct tlmi_cert_guids *cert_guid;
>   };
>  =20
> +void tlmi_v1_remove(struct wmi_device *wdev);
> +int tlmi_v1_initialise(struct wmi_device *wdev, const void *context);
> +
>   #endif /* !_THINK_LMI_H_ */
