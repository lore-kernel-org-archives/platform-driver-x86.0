Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD18821;
	Fri, 27 Dec 2024 03:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735269695; cv=none; b=rME/xRyVLQ3st+CnbCK3Y1dqVYrp+NukU4XIAR4M34vQxL95P0uVsTYKI59UIvZa4C2YLYGyWUV8B0rSqxN3ljqsGdapgq6bIybWkj+SMMFhqwnmPYvPf1Zj1WgdbsND6+r8q55467rpXCRBUZtErzv00lVurnu0uZf77yIqKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735269695; c=relaxed/simple;
	bh=bYS56ZTlCaWupzT/dXcQrjWynV04wYt7wCTDwLFXLac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzfvx7li8FOjAibVXmtUaA21RWstRuZAz/p3gJxeeMeVsNkI9QrEZ4EBdbgdnzEZczJpxPpbbTnSlFiAi+tqj0aNetilkSeQD/p66ulqePXY685GgtCL64cVeYWemzhKF0IktvaOCHWMGA8GSLF7PeFoIFDq+q+m+Cfpjdefz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eGpko6PH; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eGpko6PH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735269676; x=1735874476; i=w_armin@gmx.de;
	bh=3w+JDg29HCYTEneY5N4Y96CuluXgfIHNWUS8W+8xseQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eGpko6PHR6RORywcLh9ROA9n4Q7okKTA4rTMBTk2Wnh9fDDv6B26BMSa1n7SnRly
	 MS6E8Xrq5AGwgR7O4Cmu4Fgx3qxwt/IdNtH0bMjjgqE5y2NX0o1QRHAELjvGxcQ9i
	 meWl4A3vb8FLpP+AdDDKTDGxsyzKwPm1TiZee+p41Unbpe28KrQ2Mn0NG0U9Srmp0
	 LfcqEuoRGItAgifOj2ZmzK2x+21CcmCR0BKWLVY3d+DkHS4IU7XitaJ24rpknFwj1
	 eJ7Nv00F0qXvqXsiQzewNIzX9d+tpFZ1qp74OgLS7+PRT6yesoFZ7x+lyD0jXdd1E
	 xU4dJ2ZBHS6tfnOGQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1tsvbN1UU9-00nC8t; Fri, 27
 Dec 2024 04:21:16 +0100
Message-ID: <367b6e24-d7d3-426e-96ed-e7ab6a36ad5b@gmx.de>
Date: Fri, 27 Dec 2024 04:21:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] alienware-wmi: Add WMI Drivers
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-9-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-9-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vsWLtD4dRoDy1MpWg4Y9lUR2yrbfz9aGpPgvuC+d5xUVYKfy6S6
 S00f1Bs0WJ5r3Slb1A3sn51qcWYP4O1rFJb5bqaVvfRyaHNnKHlA7rxkU1Upq7ho5tx3Mem
 W+SwHo/sAsbzOGIF0KjHb+hgs2e5EgBoObt8o7fj1duGdOWq17GYBZxzvoI/FflMXlrNFYM
 eWtXi46VyKl0wip4EHNbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LN+UnOj5a+g=;Nd6/g/ZWMZQ8Mu1OS9Rb27ZY5GA
 5WTfpg3eMFVGEVyVOgBGgrrVpoFhEykjS5EL8vtyLIcopF77k8UNIFwnd18Na8zL4IFgRjlUs
 vDUwib0uc5gMzYYC5e52NX988jj0Cy1A1Vm/8TrD9/rMSlYxYge+zBa0k0oM+ZmQ0mmqNTzZj
 KFyNcXcGP3AALt3li82gaYfZNM5yOq0hX5m1qgH40RzsCdhDlc7MV8Pr90piRaz7djQgdULrk
 rexYpmQ7I5CPcUR0gpm9NBBXzzPkJElHCehss1LWqVd5tCePVGdualwybT6C59G0tEZDkBh3q
 0vgwvHC5yDmwaz2/oGv+Ri+rKT0FIR5Y94DkqRbSJvr4E/3GYaZSJg5xdksXNQz8FQ/Ie4XRc
 tmwInEvYVeqZNu/R1CnRpvHns/Zagj9t0sIxesv3tUUWTR0dkQTvVpmNxd/lHfe6wd9Jg2ME8
 CJ5w9mbiHFlQ1o8C10luh9dU4xqXv9U+ZQxt+E+8EjI+6Po4wd3w6HSjYNNaS8flDplNJsC3q
 3uvtNTcBdny3d0sT2DMyBWo/AuNNd7fy6Prt2cLwXm82l2wZ0XomSAyO5lzTGCWDSd9D8ux/g
 gFUZwXDoJ3hu13HO6MRnBzkZKg98c/XooHr6+nq6Karoz6ibYUSbrBbzLjEHTd0JE9uIl+Cq6
 So9v8Nltoz2UACH+PfaXDledensmvdxc48fUOHn9imspRTMf2E815HY7tQqvC9DH2yk3Gl/LU
 UKWcQQGleZGWDev9DjDp9ZMSbXSUlklIwJ+3PGfpl+2OqTfaN6iFkbKLV6WC/IaZOCWurBdSF
 lTB+FIaSFTqHVYqnQM8EOZzTowv0OWeE2NtAHjG07bXmiDecQLXIrTlaQZWU/0vdE2+sP6qM5
 /o62TF/NIo8q69xyVctSHBJiIvjl4voaRvjU8ogtyJnVsFYSZMN0bVdHsqPjMs+nsR1gKeIK4
 dchetaD+ZdUvH5R6vK3U/LTUMpGai4neL+nZ70+lUOmzgsDgac6/zqE8J35Vmd2Jjrw9oWIt+
 HQ0Og0BVVHR7VOWsSU2Jit9ej3ttzGWbfzoy1O5UEEYB/qNU9TFoJxTztke8kBBuwQa1vC6x4
 kU6lpJ68zpPHrjHfcab1EvfUNEBtpZ

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Add WMI drivers for LEGACY and WMAX devices.
>
> This involves moving platform driver and device registration to a helper
> function, which is now called from the driver's preferred WMI device
> driver probe. However this is only done if !quirks->thermal because
> newer WMAX interface doesn't support any of the features exposed by this
> device.
>
> Only one driver is registered on module initialization to prevent
> registering duplicate platform driver and device.
>
> Aditionally, create_thermal_profile() now takes wmi_device * instead of
> platform_device *.

Since the HDMI, Amplifier and deepslp groups depend on the WMAX interface =
i would
register them inside wmax_wmi_probe() using device_add_groups() (you might=
 need to
rework alienware_alienfx_setup() for that).

In the end the only code shared between both drivers should be related to =
the LED handling.
Everything else AFAIK depends on the WMAX interface and should therefore b=
e inside the
WMAX driver.

Thanks,
Armin Wolf

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 186 +++++++++++++++++-----
>   1 file changed, 146 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 4b68d64bd742..f2f6842e27e6 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -15,6 +15,7 @@
>   #include <linux/platform_profile.h>
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
> +#include <linux/wmi.h>
>
>   #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
>   #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF549=
2"
> @@ -39,8 +40,6 @@
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
> -MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
>
>   static bool force_platform_profile;
>   module_param_unsafe(force_platform_profile, bool, 0);
> @@ -412,7 +411,10 @@ struct alienfx_priv {
>   	u8 lighting_control_state;
>   };
>
> -static struct platform_device *platform_device;
> +struct alienfx_platdata {
> +	struct wmi_device *wdev;
> +};
> +
>   static struct platform_profile_handler pp_handler;
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
> @@ -1048,7 +1050,7 @@ static int thermal_profile_set(struct platform_pro=
file_handler *pprof,
>   	return wmax_thermal_control(supported_thermal_profiles[profile]);
>   }
>
> -static int create_thermal_profile(struct platform_device *platform_devi=
ce)
> +static int create_thermal_profile(struct wmi_device *wdev)
>   {
>   	enum platform_profile_option profile;
>   	enum wmax_thermal_mode mode;
> @@ -1097,7 +1099,7 @@ static int create_thermal_profile(struct platform_=
device *platform_device)
>   	pp_handler.profile_get =3D thermal_profile_get;
>   	pp_handler.profile_set =3D thermal_profile_set;
>   	pp_handler.name =3D "alienware-wmi";
> -	pp_handler.dev =3D &platform_device->dev;
> +	pp_handler.dev =3D &wdev->dev;
>
>   	return platform_profile_register(&pp_handler);
>   }
> @@ -1153,19 +1155,138 @@ static struct platform_driver platform_driver =
=3D {
>   	.probe =3D alienfx_probe,
>   };
>
> -static int __init alienware_wmi_init(void)
> +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
>   {
> +	struct platform_device *pdev;
>   	int ret;
>
> -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
> -		interface =3D LEGACY;
> -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
> -		interface =3D WMAX;
> -	else {
> -		pr_warn("alienware-wmi: No known WMI GUID found\n");
> -		return -ENODEV;
> +	ret =3D platform_driver_register(&platform_driver);
> +	if (ret < 0)
> +		return ret;
> +
> +	pdev =3D platform_device_register_data(NULL, "alienware-wmi",
> +					     PLATFORM_DEVID_NONE, pdata,
> +					     sizeof(*pdata));
> +
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&platform_driver);
> +		return PTR_ERR(pdev);
>   	}
>
> +	dev_set_drvdata(&pdata->wdev->dev, pdev);
> +
> +	return 0;
> +}
> +
> +static void alienware_alienfx_exit(struct wmi_device *wdev)
> +{
> +	struct platform_device *pdev;
> +
> +	pdev =3D dev_get_drvdata(&wdev->dev);
> +
> +	platform_device_unregister(pdev);
> +	platform_driver_unregister(&platform_driver);
> +}
> +
> +/*
> + * Legacy WMI driver
> + */
> +static int legacy_wmi_probe(struct wmi_device *wdev, const void *contex=
t)
> +{
> +	struct alienfx_platdata pdata =3D {
> +		.wdev =3D wdev,
> +	};
> +
> +	return alienware_alienfx_setup(&pdata);
> +}
> +
> +static void legacy_wmi_remove(struct wmi_device *wdev)
> +{
> +	alienware_alienfx_exit(wdev);
> +}
> +
> +static struct wmi_device_id alienware_legacy_device_id_table[] =3D {
> +	{ LEGACY_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> +
> +static struct wmi_driver alienware_legacy_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi-alienfx",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D alienware_legacy_device_id_table,
> +	.probe =3D legacy_wmi_probe,
> +	.remove =3D legacy_wmi_remove,
> +};
> +
> +static int __init alienware_legacy_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_legacy_wmi_driver);
> +}
> +
> +static void __exit alienware_legacy_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> +}
> +
> +/*
> + * WMAX WMI driver
> + */
> +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct alienfx_platdata pdata =3D {
> +		.wdev =3D wdev,
> +	};
> +	int ret =3D 0;
> +
> +	if (quirks->thermal)
> +		ret =3D create_thermal_profile(wdev);
> +	else
> +		ret =3D alienware_alienfx_setup(&pdata);
> +
> +	return ret;
> +}
> +
> +static void wmax_wmi_remove(struct wmi_device *wdev)
> +{
> +	if (quirks->thermal)
> +		remove_thermal_profile();
> +	else
> +		alienware_alienfx_exit(wdev);
> +}
> +
> +static struct wmi_device_id alienware_wmax_device_id_table[] =3D {
> +	{ WMAX_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> +
> +static struct wmi_driver alienware_wmax_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi-wmax",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D alienware_wmax_device_id_table,
> +	.probe =3D wmax_wmi_probe,
> +	.remove =3D wmax_wmi_remove,
> +};
> +
> +static int __init alienware_wmax_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> +}
> +
> +static void __exit alienware_wmax_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> +}
> +
> +static int __init alienware_wmi_init(void)
> +{
> +	int ret;
> +
>   	dmi_check_system(alienware_quirks);
>   	if (quirks =3D=3D NULL)
>   		quirks =3D &quirk_unknown;
> @@ -1180,43 +1301,28 @@ static int __init alienware_wmi_init(void)
>   			pr_warn("force_gmode requires platform profile support\n");
>   	}
>
> -	ret =3D platform_driver_register(&platform_driver);
> -	if (ret)
> -		goto fail_platform_driver;
> -	platform_device =3D platform_device_alloc("alienware-wmi", PLATFORM_DE=
VID_NONE);
> -	if (!platform_device) {
> -		ret =3D -ENOMEM;
> -		goto fail_platform_device1;
> +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> +		interface =3D WMAX;
> +		ret =3D alienware_wmax_wmi_init();
> +	} else {
> +		interface =3D LEGACY;
> +		ret =3D alienware_legacy_wmi_init();
>   	}
> -	ret =3D platform_device_add(platform_device);
> -	if (ret)
> -		goto fail_platform_device2;
>
> -	if (quirks->thermal) {
> -		ret =3D create_thermal_profile(platform_device);
> -		if (ret)
> -			goto fail_prep_thermal_profile;
> -	}
> +	if (ret < 0)
> +		return ret;
>
>   	return 0;
> -
> -fail_prep_thermal_profile:
> -	platform_device_del(platform_device);
> -fail_platform_device2:
> -	platform_device_put(platform_device);
> -fail_platform_device1:
> -	platform_driver_unregister(&platform_driver);
> -fail_platform_driver:
> -	return ret;
>   }
>
>   module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	remove_thermal_profile();
> -	platform_device_unregister(platform_device);
> -	platform_driver_unregister(&platform_driver);
> +	if (interface =3D=3D WMAX)
> +		alienware_wmax_wmi_exit();
> +	else
> +		alienware_legacy_wmi_exit();
>   }
>
>   module_exit(alienware_wmi_exit);
