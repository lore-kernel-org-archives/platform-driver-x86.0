Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA11BF4F1;
	Fri, 27 Dec 2024 03:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271170; cv=none; b=NjCS9cTwGrincSUU9yyWNfrjUd0OfQdNx1sSlccwMLFloN8YbqlMdNnJNqx3ANDCZ+Maxy0FVDQIDGqqMPz+NXdNF+g675ZLYykDMuuqMdCmhWZaePkZPy1TVpIDuI6CCTzHSlsj+vNa1IuPJ/rE/7bZprhuO4DXvNsGiZMpHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271170; c=relaxed/simple;
	bh=pbBYcKxA/dij0OnGqjXVYawUbAmXAnQSkzul2dM8Drk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbaC7X3Wu9RAJItlIlK40sx84l/mkC50kUcikfvbVxDCZVrluG9w6eHUTkiWs6ILSlgcJKO0l4cd0S3mAkANSMmZ3pt5mhvy3jVo3bLSSlHziPAb37HviwtPJVHEdSXmKHHHfc8ANcQb9aMYqZm6LWzUu/zb0EQ7vNF2tPU90UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SMUxpLJU; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SMUxpLJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735271142; x=1735875942; i=w_armin@gmx.de;
	bh=JaXUkSGQiwdT+t1ML0u3rYCr2HiUTXQn4cCacE0mQXw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SMUxpLJUjFAIqCwxopBgEYbU444j9gzwy23KEND0xFSRNMtWrjskIZx9zwZJiYWE
	 mm8iYbwwXMimUks7+foRWAhrUmZGwaQrkA+hviF6thhXP6eD394tmQYmPhBAI+BVe
	 N3jVp/ywb1idNryai6BRCoJSRP+X0aYCigBF64ax8BNzXTwLwdZ3WRxtluQDs9Ysl
	 QZYPLh9wzyS1c4eRdJlREZRlIrbS/IDZwgRgET2qKGAKdmTxYHZVWp8faeAngyo/K
	 obCTzIvXhNgoH+hySD7byvQaqhX7iZPzYuXejHrk25gQxNzAE/5VjJIsIlpl4Ybhb
	 EfFnE0wN8l9pedIgRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59GG-1tPvMX3LW8-000KUV; Fri, 27
 Dec 2024 04:45:41 +0100
Message-ID: <78a38f62-d63f-482e-8fc2-89924f8d040e@gmx.de>
Date: Fri, 27 Dec 2024 04:45:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/20] alienware-wmi: Refactor thermal control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-13-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-13-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mVQZoutd1yEfz9tpyq6qjIHAvWiBjl3B4CYgKxRVve0hgPpiWSL
 fhZ7S+DwdHtActkeFjkorOCFPCc1S/sDNQF8pyA3hoyW6EJyFvgkcJ4zvWYN7qbNlmkFRpD
 1qCcAYGnNGwUDHwo0Pb3ildP6bdFhHpvF+d93sMpKt3/S2SAQjYBbouS0XYsidGDi+Tjc+u
 /RV9GVpiB/qJzh/xchQ0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FaACdXmGHe4=;1DCbctYrg8jUrCd1h8VVXcXqe2m
 xcTHAnvTGJJNYgHg8tBNQiozpu9vYIQInIYxFpHfCBYSxVNjttpDiaqZXys1XzT9cOY1LL6IG
 hsy8+6Rj44Go/lUvVxpqbKjFeLcpYB9eafEA+TBOo/JFtzpNqoHiETwTAhqLGLNafio0yVIXF
 xb2ThG43jtgCpNMHGWfCmMEz/1EXd35if2CqyWfYbK3i8eOkgzHZQuKATmj8ulpb3cBxNVVD8
 hCnSRcQlXjiV7xq84W2vY5hYUsNupZCZ+wcD53BwUWofYLoqyP+Ht7z7/ht+benE547aojIUq
 KI69DGdSf3OCVnl0IdjKQ9mUqjEgHRsOTATEup/omgGznl9ivt8GHv/0xUnjvKxExffWInBAn
 pltjcwEHwNZndLmb9fs7P01BglLtGwi4LYykmkAi5JLX8Y/NFB17cK3R3DVUtmT0i+1KWoL+p
 K6CZ44EBJUzRJd1/nSqMn1jiNq8oicniEm/yHId8Cq+PbwnC3VUvSKFCf7ukambgZV0Xvujn8
 f0T3OFzZ3O4TML/o+OHxsxGXfMh0HSjAScxxRByGeE9Lglr0Xagog/z8HeJpBualJhWoiEW2P
 XET6n0GuxUn/2b/PDDpWniDhYq9MESvKiVZZxHCGS9NHgYbHhg5t7IQ8L2EvsIi4suAk/qEZs
 e/cYh3NF5uPI+dRWOdTzIUw1ZdmEeWhNvhuWKfxahk0xNVZus+C3MqWcgLJa8DVOCxelARyzV
 gGzQ7mVvwyEoxIx2GiTocvAdqKl/kBHkWnXHT6AHaT9iwT5gQn0I4ZOgShrQ8jzeBq3zhH56O
 3T5DIH1HTjX7D7eKOOq0i1UNOOgRzr1YB5I8im6zQGN2B2go/lhmji2qnPLGMEyHawV0nSSqF
 Gac/f2/UsNOqAyNYetOLamWnl+M7+pevb1+IPH3y1PpMxOSd04EXjhV44cQ9zFQMCXnsoKSB1
 10DB+fKf23rkF58mV9pnO31bbcfC1IT5V8ZOCk9iF19jDHpbqgCCBGdJ/zmeDJvTXZakKT2Py
 51jdJIPG6AeRCl71Ss9HVMONdrIg8wFJlJsWI6Qs5RupPAcx9FJnUr6/NVUCYhLXrNLo+69HP
 3LpCUeLYKOnQe1fwmJAahsxkd5bHmk

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Refactor thermal control methods to use alienware_wmi_command() instead
> of alienware_wmax_command().
>
> Drop alienware_wmax_command() as there is no more users left.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 69 ++++++++---------------
>   1 file changed, 23 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index b9da5fe657a9..0a0b72dc61ea 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -650,34 +650,6 @@ static enum led_brightness global_led_get(struct le=
d_classdev *led_cdev)
>   	return priv->global_brightness;
>   }
>
> -static acpi_status alienware_wmax_command(void *in_args, size_t in_size=
,
> -					  u32 command, u32 *out_data)
> -{
> -	acpi_status status;
> -	union acpi_object *obj;
> -	struct acpi_buffer input;
> -	struct acpi_buffer output;
> -
> -	input.length =3D in_size;
> -	input.pointer =3D in_args;
> -	if (out_data) {
> -		output.length =3D ACPI_ALLOCATE_BUFFER;
> -		output.pointer =3D NULL;
> -		status =3D wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> -					     command, &input, &output);
> -		if (ACPI_SUCCESS(status)) {
> -			obj =3D (union acpi_object *)output.pointer;
> -			if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> -				*out_data =3D (u32)obj->integer.value;
> -		}
> -		kfree(output.pointer);
> -	} else {
> -		status =3D wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> -					     command, &input, NULL);
> -	}
> -	return status;
> -}
> -
>   /*
>    *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
>    *	It can toggle between standard system GPU output and HDMI input.
> @@ -932,7 +904,8 @@ static bool is_wmax_thermal_code(u32 code)
>   	return false;
>   }
>
> -static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data=
)
> +static int wmax_thermal_information(struct wmi_device *wdev, u8 operati=
on,
> +				    u8 arg, u32 *out_data)
>   {
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D operation,
> @@ -942,9 +915,8 @@ static int wmax_thermal_information(u8 operation, u8=
 arg, u32 *out_data)
>   	};
>   	acpi_status status;
>
> -	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_THERMAL_INFORMATION,
> -					out_data);
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION=
,
> +				       &in_args, sizeof(in_args), out_data);
>
>   	if (ACPI_FAILURE(status))
>   		return -EIO;
> @@ -955,7 +927,7 @@ static int wmax_thermal_information(u8 operation, u8=
 arg, u32 *out_data)
>   	return 0;
>   }
>
> -static int wmax_thermal_control(u8 profile)
> +static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
>   {
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D WMAX_OPERATION_ACTIVATE_PROFILE,
> @@ -966,9 +938,8 @@ static int wmax_thermal_control(u8 profile)
>   	acpi_status status;
>   	u32 out_data;
>
> -	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_THERMAL_CONTROL,
> -					&out_data);
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> +				       &in_args, sizeof(in_args), &out_data);
>
>   	if (ACPI_FAILURE(status))
>   		return -EIO;
> @@ -979,7 +950,8 @@ static int wmax_thermal_control(u8 profile)
>   	return 0;
>   }
>
> -static int wmax_game_shift_status(u8 operation, u32 *out_data)
> +static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation=
,
> +				  u32 *out_data)
>   {
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D operation,
> @@ -989,9 +961,8 @@ static int wmax_game_shift_status(u8 operation, u32 =
*out_data)
>   	};
>   	acpi_status status;
>
> -	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_GAME_SHIFT_STATUS,
> -					out_data);
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> +				       &in_args, sizeof(in_args), out_data);
>
>   	if (ACPI_FAILURE(status))
>   		return -EIO;
> @@ -1005,10 +976,13 @@ static int wmax_game_shift_status(u8 operation, u=
32 *out_data)
>   static int thermal_profile_get(struct platform_profile_handler *pprof,
>   			       enum platform_profile_option *profile)
>   {
> +	struct awcc_priv *priv;
>   	u32 out_data;
>   	int ret;
>
> -	ret =3D wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
> +	priv =3D container_of(pprof, struct awcc_priv, pp_handler);
> +
> +	ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PR=
OFILE,
>   				       0, &out_data);
>
>   	if (ret < 0)
> @@ -1039,7 +1013,8 @@ static int thermal_profile_set(struct platform_pro=
file_handler *pprof,
>   		u32 gmode_status;
>   		int ret;
>
> -		ret =3D wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> +		ret =3D wmax_game_shift_status(priv->wdev,
> +					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
>   					     &gmode_status);
>
>   		if (ret < 0)
> @@ -1047,7 +1022,8 @@ static int thermal_profile_set(struct platform_pro=
file_handler *pprof,
>
>   		if ((profile =3D=3D PLATFORM_PROFILE_PERFORMANCE && !gmode_status) |=
|
>   		    (profile !=3D PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> -			ret =3D wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> +			ret =3D wmax_game_shift_status(priv->wdev,
> +						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
>   						     &gmode_status);
>
>   			if (ret < 0)
> @@ -1055,7 +1031,8 @@ static int thermal_profile_set(struct platform_pro=
file_handler *pprof,
>   		}
>   	}
>
> -	return wmax_thermal_control(priv->supported_thermal_profiles[profile])=
;
> +	return wmax_thermal_control(priv->wdev,
> +				    priv->supported_thermal_profiles[profile]);
>   }
>
>   static int create_thermal_profile(struct wmi_device *wdev)
> @@ -1070,7 +1047,7 @@ static int create_thermal_profile(struct wmi_devic=
e *wdev)
>
>   	priv =3D dev_get_drvdata(&wdev->dev);
>
> -	ret =3D wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
> +	ret =3D wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
>   				       0, (u32 *) &sys_desc);
>   	if (ret < 0)
>   		return ret;
> @@ -1078,7 +1055,7 @@ static int create_thermal_profile(struct wmi_devic=
e *wdev)
>   	first_mode =3D sys_desc[0] + sys_desc[1];
>
>   	for (u32 i =3D 0; i < sys_desc[3]; i++) {
> -		ret =3D wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
> +		ret =3D wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
>   					       i + first_mode, &out_data);
>
>   		if (ret =3D=3D -EIO)
