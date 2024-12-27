Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8688821;
	Fri, 27 Dec 2024 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735269990; cv=none; b=O1YNFc4avykt+Nx3ODMIHzgAhDQIiKqTnAEcfxmw4AMmcubC6NFROfkaD1lKt39gxvWxUorcTml1QILxCv4IuW+h+wkxVrRKuWleSqtt5kEAsyis2lzrkFoLlx4f0ZqO3ZvxnqEec/CGoq0+4xciyigHtWaGR2o8KdbrAYixkkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735269990; c=relaxed/simple;
	bh=Z/BTsiiYcKiko0rKNZAbFhXm8oaY9G1yk6uYc3+2e2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NaUuQLkMQfnFYSKRGIGjf3dBhKgJtbAGFPXECpZw6wTZQsa/4XbPdP7bg2kJHdusn0W73AFDtlMETamwu2w6l6QyrmIDuY1LMDzjfgUWWyVSv2ImFgeICj5q5FEOmH3Rw7EjNPTIMpjK//jTfZGL5p613TPAqUBTPUe2syBPhzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IjOp9KHi; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IjOp9KHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735269967; x=1735874767; i=w_armin@gmx.de;
	bh=04xATs1AsgrEXRCL9+8cnrA+LZYL9Sf/NXHvtKVxWy8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IjOp9KHiyL/NmIYNFhcvNpW0wdNZKTl+XMozD05HcZ13sVNavAbfxaIsmrQRNfrl
	 lshHwZUxs//F1xdxRKp+DZpYCGYLoX6P/R1E0n43oLiwVSMJnLY4byhI20jpAUuZB
	 fehqJskMrx2r50v7eK42mGltwGfr5vo3BE4lWlZJNlhnxxbLWCmJ5wvo20t8R0sFU
	 ASOd1M0NCxuxEp33ZIjeWYX1LK+2u9I9EXvr1vEFBsZjqVrD4c0mjf95ljtGMp2aO
	 /ppdmltuJY2VDykAP8sXMl9icMEnXD4o0YZnuBTaOcFD4dJxHTwPzqD9EAc/pC3Oe
	 5Qy1Dj/ER1/bOf91WA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1tdbru1w0L-016voK; Fri, 27
 Dec 2024 04:26:07 +0100
Message-ID: <95e34926-4f06-4443-9798-9089f6073786@gmx.de>
Date: Fri, 27 Dec 2024 04:26:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] alienware-wmi: Add a state container for thermal
 control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-10-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-10-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lynFwQl40XX4r1NmeW/8DaDYUBL3TXxqSujSp6B7L/wHH2EV08j
 LweO11Df1tXq55k6CLgz/zEBH/GiXo6YzGJ9IDx5uWo3ZZGn7t9sz5WiiaZ1RNJXfxtJ71Z
 2uYL6f6aRD0NAZTpsx9Po+XB16PNfjYY4XZ+cjUDfpJ0medliTBl/tDXPsW/6Dxjya8p+MB
 y8XH7RWE8UXu6mx/vjeAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RJbi6pYjX5Q=;upEV2YJVA5PGZjZYVHXrSSrP3le
 HLmTvH2tUyv00nY++OZpp/U0BuMoPRrwd9g290uXXTnTsx1D2xDiDwkLnIcgo72h95aY8zjji
 DwAe/1zpF1pd/5kgkeiia2S1X5knnKNOuF0Q6dPpM/+QGNwEiE4ZcWitx8LX2Q1gnPMxiBcz1
 zNvFrgEyHT75P7EvlGFmF0Mq5RC/MrK+qSpMACifQMn/ZhlhDsLyeMlaIZWQB8OV9S6Vf8+YO
 UGKz+lm+EAazVPCUUzexKqbdLYqntF3rF/IyW5AbHmidQs47UCg96kzJ4lnhG/JIVk0GFtDrC
 JZVohJFdndDEjW9E97saOTQsNUQuglCIJj8Q9hMCRuqALzBD2grg+W21AADxP4o6RQnLgfLdG
 Ilh5egGrAa/nTJhvHgTFp6ML8RP4YAFmbrgIl9nYD5+kCxMnAGx/B+1zV0CJDRfd9LnZawVnH
 1DJEQC19ilzVWRBAaXsoEihuGUAek1bv9E/S93VQv7v6wmOQzv6zm0RlOE85AUg+rKFPL0XhX
 Yu530C9q2J8VamrX2/uRV5UIzqonFMo72Ps03ahqvIDXMjoR21PTngZvoB98njpmebfp0YSgb
 IFjnHo42XAkDqpjZ8RXrTrWST9a+V18J4OukYa4i8h00ErNyYaCvYEOiYuNIycTsQFOkiYxp4
 IKuOXfdDrg4wTrWpych+pH28UNmuHIVcoOLWcc26HszaPU9k6Nr28N2WvTwbmeJWnGnR3bGqL
 6GjdV1P2c+lzayZrDy+SYST9+k0XmZEgoVV5nTK2rHZ7NPC36PcWlERMpKp6vyqL3skVJVIPx
 Q+o4eF7L7+kjtmBcpkNLY3dtqCEIc+avTXXTTsZCGlLaupvWxqt4WULWRHJ/nSROuQzUyIsCl
 HcnJt4rcOlqqMqfu/5z2MjM1g5G4KX7Z4JwqzTNSGIZZDONE5gnh9BykHm3yIeKIzQyIC5kAq
 psksqglpQLM+oDzrlI38fUlRI/kkBaOTIAcICvYNxjmmNcvP3iN3Ve6NXHRhN34dEchE7Kb/5
 dc3OrinjPM9C+nWQuQjanQEV+cWQ0eEcQcmepxmiLdrkLMnRObaPv0nLrCRduKdflAKis7X0J
 82rbBTLLkM1U++clNM0BzKM9kGhvdE

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Refactor all thermal control methods to use the newly defined awcc_priv
> state container instead of global variables.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 71 +++++++++++++++++------
>   1 file changed, 52 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index f2f6842e27e6..c4ca141d628e 100644
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
>   	struct led_classdev global_led;
> @@ -415,9 +421,6 @@ struct alienfx_platdata {
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
> @@ -1027,6 +1030,10 @@ static int thermal_profile_get(struct platform_pr=
ofile_handler *pprof,
>   static int thermal_profile_set(struct platform_profile_handler *pprof,
>   			       enum platform_profile_option profile)
>   {
> +	struct awcc_priv *priv;
> +
> +	priv =3D container_of(pprof, struct awcc_priv, pp_handler);

Please merge those two statements.

> +
>   	if (quirks->gmode) {
>   		u32 gmode_status;
>   		int ret;
> @@ -1047,18 +1054,21 @@ static int thermal_profile_set(struct platform_p=
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
>   	enum platform_profile_option profile;
>   	enum wmax_thermal_mode mode;
> +	struct awcc_priv *priv;
>   	u8 sys_desc[4];
>   	u32 first_mode;
>   	u32 out_data;
>   	int ret;
>
> +	priv =3D dev_get_drvdata(&wdev->dev);

Same as above.

> +
>   	ret =3D wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
>   				       0, (u32 *) &sys_desc);
>   	if (ret < 0)
> @@ -1081,33 +1091,56 @@ static int create_thermal_profile(struct wmi_dev=
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
> +
> +	priv->wdev =3D wdev;
> +
> +	ret =3D create_thermal_profile(wdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Just directly return the result of create_thermal_profile() here.

With those minor issues being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +}
> +
> +static void alienware_awcc_exit(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv;
> +
> +	priv =3D dev_get_drvdata(&wdev->dev);

Please merge both statements.

> +
> +	platform_profile_remove(&priv->pp_handler);
>   }
>
>   /*
> @@ -1242,7 +1275,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   	int ret =3D 0;
>
>   	if (quirks->thermal)
> -		ret =3D create_thermal_profile(wdev);
> +		ret =3D alienware_awcc_setup(wdev);
>   	else
>   		ret =3D alienware_alienfx_setup(&pdata);
>
> @@ -1252,7 +1285,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   static void wmax_wmi_remove(struct wmi_device *wdev)
>   {
>   	if (quirks->thermal)
> -		remove_thermal_profile();
> +		alienware_awcc_exit(wdev);
>   	else
>   		alienware_alienfx_exit(wdev);
>   }
