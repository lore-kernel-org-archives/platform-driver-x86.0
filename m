Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102410940;
	Thu,  2 Jan 2025 16:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735834797; cv=none; b=PvfHqot8foPlEVer7HGjHTZzedE4xvtflqemDfPXNXvauJx4/vw/YnzxEh7H1jDSWnEsw5H2OpynvxVITVokzd+h4vzG2++WQ2zD3AhgzQtwIu7eLP1LmOmvSC+w1hJYkGa4n1ukweSx3LmbJZTr2vWGsPZjOpJE/K2wQT0O2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735834797; c=relaxed/simple;
	bh=qSB3e1FWTrA79wbm5DSDR58u9ZDOjlCcjS9p5UTwFmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP1OkDDt4UUI6G6cwXGgs2HQXdcpLHm3xkUzX3qUgASeg0llv4ZWVzkPVaNlKh4al6FmfY328lwGUDzl7H96IOxyJa3sN4h4F8tG0x5I3xJSmWvLl3LEePAxOn0xOw9iXl2djobeWqep7Zblvb4VjAAQ/rsqienINLnpgdYPlAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DxR0+fgr; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DxR0+fgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735834787; x=1736439587; i=w_armin@gmx.de;
	bh=XCgACkLLUN3BsFA9pWfE2chwzuZNPKQjU8uEjWt8EQc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DxR0+fgrBJmGButMbfOn2xUK3ZDzOlPLiajanrEW0xAkEMlcqMZ3Emk0iSe4O7FD
	 Kj6IN5UsnKkVUHZdogY7+6qt+yUO7DavGfUjKdPmpOP+xnK8lfKODY6UdXDcDF56w
	 RdKwoRzCCVJ2MTQ27y+2SCx9uTzczcds8BBUqfOM2NK5di6Ceo60WUMD8BThHPz3+
	 m75oUu7wPF0NdAp3lSQQBChai7r4EwIeDatXf74otTvjWnXQzvTmNbt/VhdoHnHko
	 lIYrDTZOLjJHsVR0DqSXySQa1HkNfL0Zd0vHIAAynoili2Kkbrh/xtz3I169JCJXs
	 oSvgEvFkjW+ZasPkMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1tc54N2J6m-00vuuj; Thu, 02
 Jan 2025 17:19:47 +0100
Message-ID: <a4bb4c1f-a41a-48bd-b7aa-9b9428637a27@gmx.de>
Date: Thu, 2 Jan 2025 17:19:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/20] alienware-wmi: Add a state container for thermal
 control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-11-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-11-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UiPiy9Mivy/Wry0AyQLuOiVFT9WnM3J12ZycRs4/BeUMrXrJjDc
 ub9IMh5PpCez8keLeiExa+PClp5KkssGMFf6YTg12YIe0+5DU0s3ShG0GySyFxd6y+JprsG
 4a45kX32ST+seyhgdCcDqIzBLekT2CAZ1w5ageTZpL4sysIsZcNQHvovoaiAVdzAMgEUvcu
 k8CesD4s7C1Al7JwLBb4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KIoxw+fzMoo=;DCeinly92/mvTo966tpmSfgbghX
 el5BmVG9Ixo9xSGynp0EmuZ6zpHChvNIKp7aTNUr9wGSvPWFmRPcAj8z9/1Lor+sTg0mPALSA
 cpCwB+tsEZLU/5N9oef2n2ozSKkw/4B6dQjB/hlXJqXBK4rv9Q4Y634q+AeloznKUqO1cK3bZ
 UQu/HJKFtxSljkXYzfCPJ5LMxIwHSpkw90T9G9SCc2CgaOXxN62+ecgGglImo3YWkVQE3ZNXt
 tW0PDJk9oI2UneQVYufOdszzSM0tHivVXyCPL9R3E5rhK9z7tJshxdDDPdreMhMtxpvmMBA4B
 NqJkAN0rSOZgdit+e2FwbztyUWmRHy6novGbBwdPDSsWRFxtBskOUrM61jgnHpqkdHChLWJuI
 B7+uvqHIuKX3DEARFu2DhKGNcaSbA7iWn1lIPGo2etXeEi6FCxYVLmCjZCZnQgq4DACnhdzKK
 9c0+T7GS/r7z00xHf5RA6YvaPLmN4fS851dU2r7pFd8VpC7+RFHTqFzx0vb9yTd7eWwJjChmb
 FADT4nr/GohRTYduFCHmvjI+8ePoNwCnlADjY8dlP/8+9NhurJMud/XKSg0zRhJt1nKgb1/Mm
 QJhYWyiVYMzPuThg5UjBJ8oBBC7N+xx2z+w5cv2GyvqRJFYQJ4ELJ7iJenBysmYIQsMGDsX4W
 6n/jFI1z1+AlHt59G63RGi+GyG+2J99WKpb7op8+WKwca5q6BK+X4GROphqT/MGGuM2CJdCiA
 vMFx5Crke2/dGJ+LamUhrz28Nq76OEwGYuZJD9PT0AFYY9GoAC7GgHBYI06CD/pozYk1t6PmI
 muPfbymrV3aY3sTMEOz5ITtXkeR0LkrFzmCYcoTtcGA8AB4/wpdi6R8e0ljKw2IVgTzk9rdvf
 jPv41zY4FdY49HUG0cHKZ7+U+JlWErIPe5Ai7ptrJ+vTVrfxtsLLklcmCT6pEOO/gEWE9OB5C
 jGr+l1o4XLvvi6JqgZzb5Lt3LQLZS7IrNS7VMKqv054bFYnhTNFKsWUwiYk3gdHRVvCR9qMAj
 2IU9w7wxHBf4j7iqDCy4fe8nuzTsBItGayMnKXnmZbCXWHX2M4tj8sjEnsg4XZrbTbw2BPGON
 mJRdm9k4/psOok/H8hsNmsNd8SR+go

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Refactor all thermal control methods to use the newly defined awcc_priv
> state container instead of global variables.
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 66 ++++++++++++++++-------
>   1 file changed, 47 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 87a7997579c9..512384635c4c 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -403,6 +403,12 @@ struct wmax_u32_args {
>   	u8 arg3;
>   };
>
> +struct awcc_priv {
> +	struct wmi_device *wdev;
> +	struct platform_profile_handler pp_handler;
> +	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAS=
T];
> +};
> +
>   struct alienfx_priv {
>   	struct platform_device *pdev;
>   	struct quirk_entry *quirks;
> @@ -416,9 +422,6 @@ struct alienfx_platdata {
>   	struct wmi_device *wdev;
>   };
>
> -static struct platform_profile_handler pp_handler;
> -static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFI=
LE_LAST];
> -
>   static u8 interface;
>
>   /*
> @@ -1051,6 +1054,8 @@ static int thermal_profile_get(struct platform_pro=
file_handler *pprof,
>   static int thermal_profile_set(struct platform_profile_handler *pprof,
>   			       enum platform_profile_option profile)
>   {
> +	struct awcc_priv *priv =3D container_of(pprof, struct awcc_priv, pp_ha=
ndler);
> +
>   	if (quirks->gmode) {
>   		u32 gmode_status;
>   		int ret;
> @@ -1071,11 +1076,12 @@ static int thermal_profile_set(struct platform_p=
rofile_handler *pprof,
>   		}
>   	}
>
> -	return wmax_thermal_control(supported_thermal_profiles[profile]);
> +	return wmax_thermal_control(priv->supported_thermal_profiles[profile])=
;
>   }
>
>   static int create_thermal_profile(struct wmi_device *wdev)
>   {
> +	struct awcc_priv *priv =3D dev_get_drvdata(&wdev->dev);
>   	enum platform_profile_option profile;
>   	enum wmax_thermal_mode mode;
>   	u8 sys_desc[4];
> @@ -1105,33 +1111,55 @@ static int create_thermal_profile(struct wmi_dev=
ice *wdev)
>
>   		mode =3D out_data & WMAX_THERMAL_MODE_MASK;
>   		profile =3D wmax_mode_to_platform_profile[mode];
> -		supported_thermal_profiles[profile] =3D out_data;
> +		priv->supported_thermal_profiles[profile] =3D out_data;
>
> -		set_bit(profile, pp_handler.choices);
> +		set_bit(profile, priv->pp_handler.choices);
>   	}
>
> -	if (bitmap_empty(pp_handler.choices, PLATFORM_PROFILE_LAST))
> +	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
>   		return -ENODEV;
>
>   	if (quirks->gmode) {
> -		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
> +		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
>   			WMAX_THERMAL_MODE_GMODE;
>
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE, pp_handler.choices);
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
>   	}
>
> -	pp_handler.profile_get =3D thermal_profile_get;
> -	pp_handler.profile_set =3D thermal_profile_set;
> -	pp_handler.name =3D "alienware-wmi";
> -	pp_handler.dev =3D &wdev->dev;
> +	priv->pp_handler.profile_get =3D thermal_profile_get;
> +	priv->pp_handler.profile_set =3D thermal_profile_set;
> +	priv->pp_handler.name =3D "alienware-wmi";
> +	priv->pp_handler.dev =3D &wdev->dev;
>
> -	return platform_profile_register(&pp_handler);
> +	return platform_profile_register(&priv->pp_handler);
>   }
>
> -static void remove_thermal_profile(void)
> +static int alienware_awcc_setup(struct wmi_device *wdev)
>   {
> -	if (quirks->thermal)
> -		platform_profile_remove(&pp_handler);
> +	struct awcc_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	priv->wdev =3D wdev;
> +
> +	ret =3D create_thermal_profile(wdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Please directly return the result of create_thermal_profile() here.

> +}
> +
> +static void alienware_awcc_exit(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv;
> +
> +	priv =3D dev_get_drvdata(&wdev->dev);

Please assign priv directly.

With those minor issues being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
> +	platform_profile_remove(&priv->pp_handler);
>   }
>
>   /*
> @@ -1271,7 +1299,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   	int ret;
>
>   	if (quirks->thermal) {
> -		ret =3D create_thermal_profile(wdev);
> +		ret =3D alienware_awcc_setup(wdev);
>   	} else {
>   		ret =3D alienware_alienfx_setup(&pdata);
>   		if (ret < 0)
> @@ -1287,7 +1315,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   static void wmax_wmi_remove(struct wmi_device *wdev)
>   {
>   	if (quirks->thermal)
> -		remove_thermal_profile();
> +		alienware_awcc_exit(wdev);
>   	else
>   		alienware_alienfx_exit(wdev);
>   }
