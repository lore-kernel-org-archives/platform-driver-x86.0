Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD213859EF
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429401; cv=none; b=ZKhTwffU4T566AwwRt5jIJvXYOmJl172q+TBiOZHiIN4S71LDppzjmtnvbnqCbQEaReBNn3wT/tqDZV+aHeRSuyeym3yfRgaxE2Z7tnNOZpngh9EXqwnqErymroSP7h/T0lsmcIUpqPHZizBW9tn9JkVt3+JkjsgZX+bqG6V7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429401; c=relaxed/simple;
	bh=0eZV5nmOkRJHD2avaPSFKlUPU9Glaybxodgnn5vykl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bu0cRCbMfXkBfqEJYUTIhH9I1sY/aA6QFJAJ+dKm6NjqOFmcC2NsLH+3HvF3kgYvUW4vqBJFr88UUfTQaihzSUsZFbzkc/4XnGi7zJxsVgZhm5B88lMAL0EmPIDuetCX4qRq5LPZBUWaazafDYI/VXxncZ4SWHKP3JpuPVzOqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kTedV1+V; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kTedV1+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785429392; x=1786034192; i=w_armin@gmx.de;
	bh=1432RJcvHKbdVXQAdKDoT0OvfCBuZRxa9keGD2ewGps=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kTedV1+VCBaCq2rQAIMXYHr8v7bLdTse5CWUJXGBrOAPlvrYwyz8XdS8PQ2BwvIr
	 tVgqqBkOGt1l1N7Dl571bU6b2tH0hlB/dHAnHDFF/F2xcx1lSg5iJT587qSQb+ox0
	 9wWogR7i8RwLjlqC70aVHExbtLGxHyLHwKOkFKFy+VEFgQzSevLm6+yYHOrXL7Fvz
	 WCytJp6cVEJGwoIb4CXzC3vUlK5tRwBBndz1UZWKa/Q8b88Zfo19kR4Y0JH1KZWuw
	 lZrQr0yFj1a3ghtsBn8cfss70I/cNB8C7oSX1QeJvlg1bwouF/vT0IrdKrdHSnEej
	 Gl2n7nAFWal7oWrezw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQkE-1xBWqF3lTc-016E54; Thu, 30
 Jul 2026 18:36:31 +0200
Message-ID: <eca5ecb2-7306-4dc6-bda1-faa35220b79b@gmx.de>
Date: Thu, 30 Jul 2026 18:36:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the
 modern API
To: yahia <yahia.a.abdrabou@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20260721222025.29917-1-yahia.a.abdrabou@gmail.com>
 <20260721222025.29917-2-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260721222025.29917-2-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DwdZfiJOip3kAQX6M1uIFKNNtJlEKifx4VwEoOi9GjH3zcP0+Nf
 7jH1Mt2Uk3631n7bZQH+hV+UV29mePQixu3P6bZU9jVkbmaweWytXF/YuHAbqrCx1U9UQY+
 zn33v0uiC23CMH7BihkXIgEY15vCgvCTgx1bxWwqGw92xl4OEMajWVmRfTV82YvBUoa+DGO
 4LLbazKHAFeB62cad7JpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e3CXkn7qF/M=;X5I9KzWJYD3oBJjlqdHOviHhjhC
 +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
 JaWqbRSSyxA/lkKq2pMd4x62g==

Am 22.07.26 um 00:20 schrieb yahia:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
>
> hp_wmi_perform_query() currently uses the deprecated GUID-based WMI
> interface wmi_evaluate_method().
>
> Migrate hp-wmi to the modern bus-based WMI API by registering a
> struct wmi_driver and replacing wmi_evaluate_method() calls with
> wmidev_evaluate_method().

Hi,

using the WMI device as a global variable is not a good idea, especially w=
ithout locking.
I suggest that you instead perform much of the setup done in hp_wmi_init()=
 inside the
WMI driver probe() callback and replace the usage of global variables with=
 a state container:

https://docs.kernel.org/driver-api/driver-model/design-patterns.html

Doing so requires that you first move the WMI event handling into a proper=
 WMI event driver,
see https://docs.kernel.org/wmi/driver-development-guide.html (sections "W=
MI event drivers"
and "Handling multiple WMI devices at once") for details. You can use the =
uniwill-wmi driver
as an inspiration regarding WMI event handling coupled with notifier block=
s.

Thanks,
Armin Wolf

> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 49 ++++++++++++++++++++++++++++----
>   1 file changed, 44 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 8ba286ed8721..5845b169df39 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -14,6 +14,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  =20
>   #include <linux/acpi.h>
> +#include <linux/wmi.h>
>   #include <linux/cleanup.h>
>   #include <linux/compiler_attributes.h>
>   #include <linux/dmi.h>
> @@ -506,6 +507,14 @@ struct hp_wmi_hwmon_priv {
>   	struct delayed_work keep_alive_dwork;
>   };
>  =20
> +struct wmi_device *hp_wmi_wdev;
> +
> +static const struct wmi_device_id hp_wmi_guid_table[] =3D {
> +	{ .guid_string =3D HPWMI_BIOS_GUID },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(wmi, hp_wmi_guid_table);
> +
>   struct victus_s_fan_table_header {
>   	u8 num_fans;
>   	u8 unknown;
> @@ -606,7 +615,7 @@ static int hp_wmi_perform_query(int query, enum hp_w=
mi_command command,
>   	args->datasize =3D insize;
>   	memcpy(args->data, buffer, flex_array_size(args, data, insize));
>  =20
> -	ret =3D wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
> +	ret =3D wmidev_evaluate_method(hp_wmi_wdev, 0, mid, &input, &output);
>   	if (ret)
>   		goto out_free;
>  =20
> @@ -2717,14 +2726,40 @@ static void __init setup_active_thermal_profile_=
params(void)
>   	}
>   }
>  =20
> +static int hp_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	hp_wmi_wdev =3D wdev;
> +	return 0;
> +}
> +
> +static void hp_wmi_remove(struct wmi_device *wdev)
> +{
> +	hp_wmi_wdev =3D NULL;
> +}
> +
> +static struct wmi_driver hp_wmi_wdev_driver =3D {
> +	.driver =3D {
> +		.name =3D "hp-wmi-wdev",
> +	},
> +	.id_table =3D hp_wmi_guid_table,
> +	.probe =3D hp_wmi_probe,
> +	.remove =3D hp_wmi_remove,
> +};
> +
> +
>   static int __init hp_wmi_init(void)
>   {
>   	int event_capable =3D wmi_has_guid(HPWMI_EVENT_GUID);
>   	int bios_capable =3D wmi_has_guid(HPWMI_BIOS_GUID);
>   	int err, tmp =3D 0;
> +	err =3D wmi_driver_register(&hp_wmi_wdev_driver);
> +	if (err)
> +		return err;
>  =20
> -	if (!bios_capable && !event_capable)
> -		return -ENODEV;
> +	if (!bios_capable && !event_capable) {
> +		err =3D -ENODEV;
> +		goto err_unregister_wmi;
> +	}
>  =20
>   	if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
>   				 sizeof(tmp), sizeof(tmp)) =3D=3D HPWMI_RET_INVALID_PARAMETERS)
> @@ -2733,7 +2768,7 @@ static int __init hp_wmi_init(void)
>   	if (event_capable) {
>   		err =3D hp_wmi_input_setup();
>   		if (err)
> -			return err;
> +			goto err_unregister_wmi;
>   	}
>  =20
>   	if (bios_capable) {
> @@ -2771,7 +2806,8 @@ static int __init hp_wmi_init(void)
>   err_destroy_input:
>   	if (event_capable)
>   		hp_wmi_input_destroy();
> -
> +err_unregister_wmi:
> +	wmi_driver_unregister(&hp_wmi_wmi_driver);
>   	return err;
>   }
>   module_init(hp_wmi_init);
> @@ -2794,5 +2830,8 @@ static void __exit hp_wmi_exit(void)
>   		platform_device_unregister(hp_wmi_platform_dev);
>   		platform_driver_unregister(&hp_wmi_driver);
>   	}
> +
> +	if (hp_wmi_wdev)
> +		wmi_driver_unregister(&hp_wmi_wdev_driver);
>   }
>   module_exit(hp_wmi_exit);
