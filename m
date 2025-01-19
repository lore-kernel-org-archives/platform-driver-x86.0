Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B97366;
	Sun, 19 Jan 2025 00:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737245046; cv=none; b=dp1IlINVSQCD6NcGzRysE9gekPmV8ldTjWVn69asjwsQcBtd9sTYFizn0xGUUMPvMPUUpumle6242RfcYg0kKe/WI1mdIRC5zCs6iLzipoAVn2d6Ky6YmBmcSE9o1gmmhoHplpJBbT2CbfitCuRP8+8kbLO0SklvSr976IitRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737245046; c=relaxed/simple;
	bh=Z/MBGNBk+Dmb54GikUqF82vvO0b8jgTk7O4iwrsZwB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/VRPwbzauR3C7ZbsimSFT8/JdoXTTV9qUv64Xl5mUhDbgnGsLl1l2QGeltcQqYjVLygo2nC6H1W5gBGuIR31tgvLzJkKXzQ0mJGqJmZlFXbnSslpJ6X17oZV4twbuhcToTkWnFVjgw/SUkUEoKs5iFo+WZk9vmLBPStCj5FlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=To4uat0B; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="To4uat0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737245033; x=1737849833; i=w_armin@gmx.de;
	bh=CmsdAN2REmC4znn/XznRyo5GCIknMfeZ9WlN56aPpeA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=To4uat0BcMOxa/9VcW2NlTY/mfzleWaZJ9MfdIn6fP8ynMjxKnxGkeOmK4KVtcVT
	 AWgP3YtP7vWuqm5JaNYhj5vrWJuBIMZnNFWOizisJVT+wIxv0EZzXDZd5pLHLN382
	 /Gvx6OS/C2NxDnkSv5derPDu4y/R+5s5NLjfRMqRgK/+iHn5UBa3u3MfY6KVyFH7+
	 TdKrVtEemB1U08fgZ+8yg3lea1v2/qWRx8B/jIMQBGntsHiRertCaV7zn3BAA4qWJ
	 gFq7y/4AWfaiT74IlLSLWD2Om+H23pRg7ZdJkWrhAfgMOw2AlMNnUX7HRHgaTh56u
	 v+nIGPqH3jZZGCIuDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.251.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1to65O3xZ0-00Yp6O; Sun, 19
 Jan 2025 01:03:53 +0100
Message-ID: <4c17debf-7da6-4283-970f-3c66f93d7582@gmx.de>
Date: Sun, 19 Jan 2025 01:03:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] platform/x86: alienware-wmi: Split DMI table
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-8-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250117081347.8573-8-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N+KRBb5MyV+veyajlS9SKr1FYYYo8kNBPimNaDbhSdh0OZaIAh4
 8+ha5uuqOYgUTIkv5BWKkKJ6mmY0abrBV+lAEq4tqUkz9EjEXa21jHRLHGls+9YKjNLn7ZJ
 Xb/ujrkrcKHgj2uC8sY5VTkMnm66OiQdkbNubU2p1DDqsIPP1mQFivUyngaoHjtNmhzX6AX
 uoX7YysIJeMk3tpgSbqfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u5E03/RB7RA=;ttWOH9AnKsSem8eWoAER01BcsUk
 TBiXhnW4lWRrxGK0ouNi/0Geg2tYrp4+zaZRd6cwa9bsi4OG81ZkrivJ2fPxC/k/P+olWpOd2
 oZ+yDTRPL5x8gEFc4Akw4OLdc6wSNMOGd0njPwHlTPEa3a0Zg5MJlAHn91HyukFcYOQ+3t8kS
 Djt/p4DxQcQiPMQ0RYzjwefW/jQB2PEmhnodZcwVI6MtSgtZFV6umK6naCNB523qh61w6GCpw
 3Gh0/DVKA7hQLpbV1h+eMaJTZHM43EvBp+lSzdAPgvbeoT3Gu7WuqsNqdqAoqCkdZumNmXN4H
 /Naz9D+mgMC52d0AvHoKOKc1O8PO4//HWFUXrjGSCCqZjp+knY5AW7mPc451Skg/zZq9K3E8F
 IMtHFuD789JzZgpWEkncml1VdxmzS9Etc7i5XOi6APFo/1gIzGBZEXJG1dyh4Z4d9n+b7TQAQ
 B4CVJmXYjFff4jio1ZBJGShlDrMozXQzJ91CG+2g62m4CWCh8YOqJ4bsxZe5YAGu/v0ULjTKE
 WOOmlNYcgU4gsgkYuSFjdw8JyHbJOwTjqJ9r9LbRmgaZsObRCHrbzQUyVc/roMEQil7LVwdmm
 RyVxo9RDOuknCMKLNpOGALu0mxJcyZPk3jQaECUJo4qXUKzk7id0E/5chqrbUyqOyQXPwbi/n
 d7z+bfeoxXigIxrU5z3Lb2Ku/i+zbcpFY5FcyeOaQEOuD4BO2ty3vRSelZ4CDJXFzg0RnJ1bC
 TYupKKbb6yAJF/cc/JM4CzJgJpWyriJFhH//XSfi608yRwm03tKd5xY/1vxBKRY+w0itdAQH8
 +/DrpTvs+nL9Z1x3IR1W416TmxW7V1RvVc+Ex4E8yRyMU6Et2DZcd1mUtwUsTFZK0JFncLGBm
 qMLhU+/ghfkflNmaYc9hRuq9WuMTxA0wtdmG0YNs7Hph91WxNT2Y/7a2iFYbdPgVOvPxU7xKs
 IXHiExa4WAU05EYyN0JQqPAc6qg3J4DKWFQdxlvtWvorMQAzfB2qAHN/GfnaoUmpMSdDfMPHM
 C6kq9YQyoHleAmy/BPbTbY8QaOUc0nwiIsix7wML8R677g7EgNGmD5Nwg3x7qezczkplU6+RS
 N07rcrySBvVMQKMhM87wO5S02UClTOE02YQMTck4dRGr8/yQyT+fT7NvH1ta+5nqN4r/5j+SA
 mmy+CptTCeJ+YPSBGSe8L529Xwd0iXYfLllpc92tQpg==

Am 17.01.25 um 09:13 schrieb Kurt Borja:

> Split thermal features into a new DMI table to support upcoming file
> split. While at it:
>
> Rename quirk_entry -> alienfx_features,
> Rename quirks -> alienfx
>
> and change hdmi_mux, amplifier and deepslp types to bool, because they a=
re
> already being implicitly used as bools.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 337 ++++++++++------------
>   1 file changed, 158 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 877b3d9d7cab..5d9816521072 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -113,102 +113,68 @@ static const enum platform_profile_option wmax_mo=
de_to_platform_profile[THERMAL_
>   	[THERMAL_MODE_BASIC_PERFORMANCE]		=3D PLATFORM_PROFILE_PERFORMANCE,
>   };
>
> -struct quirk_entry {
> +struct alienfx_quirks {
>   	u8 num_zones;
> -	u8 hdmi_mux;
> -	u8 amplifier;
> -	u8 deepslp;
> -	bool thermal;
> -	bool gmode;
> +	bool hdmi_mux;
> +	bool amplifier;
> +	bool deepslp;
>   };
>
> -static struct quirk_entry *quirks;
> +static struct alienfx_quirks *alienfx;
>
>
> -static struct quirk_entry quirk_inspiron5675 =3D {
> +static struct alienfx_quirks quirk_inspiron5675 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_unknown =3D {
> +static struct alienfx_quirks quirk_unknown =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_x51_r1_r2 =3D {
> +static struct alienfx_quirks quirk_x51_r1_r2 =3D {
>   	.num_zones =3D 3,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_x51_r3 =3D {
> +static struct alienfx_quirks quirk_x51_r3 =3D {
>   	.num_zones =3D 4,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 1,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D true,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_asm100 =3D {
> +static struct alienfx_quirks quirk_asm100 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_asm200 =3D {
> +static struct alienfx_quirks quirk_asm200 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 0,
> -	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D false,
> +	.deepslp =3D true,
>   };
>
> -static struct quirk_entry quirk_asm201 =3D {
> +static struct alienfx_quirks quirk_asm201 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 1,
> -	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
> -};
> -
> -static struct quirk_entry quirk_g_series =3D {
> -	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D true,
> -	.gmode =3D true,
> -};
> -
> -static struct quirk_entry quirk_x_series =3D {
> -	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D true,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D true,
> +	.deepslp =3D true,
>   };
>
>   static int __init dmi_matched(const struct dmi_system_id *dmi)
>   {
> -	quirks =3D dmi->driver_data;
> +	alienfx =3D dmi->driver_data;
>   	return 1;
>   }
>
> @@ -240,42 +206,6 @@ static const struct dmi_system_id alienware_quirks[=
] __initconst =3D {
>   		},
>   		.driver_data =3D &quirk_asm201,
>   	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware m17 R5",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware m18 R2",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware x15 R1",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware x17 R2",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
>   	{
>   		.callback =3D dmi_matched,
>   		.ident =3D "Alienware X51 R1",
> @@ -303,60 +233,6 @@ static const struct dmi_system_id alienware_quirks[=
] __initconst =3D {
>   		},
>   		.driver_data =3D &quirk_x51_r3,
>   	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G15 5510",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G15 5511",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G15 5515",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G3 3500",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G3 3590",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G5 5500",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
>   	{
>   		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. Inspiron 5675",
> @@ -431,6 +307,103 @@ struct alienfx_platdata {
>
>   static u8 interface;
>
> +struct awcc_quirks {
> +	bool gmode;
> +};
> +
> +static struct awcc_quirks g_series_quirks =3D {
> +	.gmode =3D true,
> +};
> +
> +static struct awcc_quirks generic_quirks =3D {
> +	.gmode =3D false,
> +};
> +
> +static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> +	{
> +		.ident =3D "Alienware m17 R5",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Alienware m18 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Alienware x15 R1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Alienware x17 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5510",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5511",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5515",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3590",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G5 5500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +};
> +
> +struct awcc_quirks *awcc;
> +
>   static int alienware_wmi_command(struct wmi_device *wdev, u32 method_i=
d,
>   				 void *in_args, size_t in_size, u32 *out_data)
>   {
> @@ -612,7 +585,7 @@ static DEVICE_ATTR_RW(lighting_control_state);
>   static umode_t zone_attr_visible(struct kobject *kobj,
>   				 struct attribute *attr, int n)
>   {
> -	if (n < quirks->num_zones + 1)
> +	if (n < alienfx->num_zones + 1)
>   		return attr->mode;
>
>   	return 0;
> @@ -620,7 +593,7 @@ static umode_t zone_attr_visible(struct kobject *kob=
j,
>
>   static bool zone_group_visible(struct kobject *kobj)
>   {
> -	return quirks->num_zones > 0;
> +	return alienfx->num_zones > 0;
>   }
>   DEFINE_SYSFS_GROUP_VISIBLE(zone);
>
> @@ -746,7 +719,7 @@ static DEVICE_ATTR_RW(source);
>
>   static bool hdmi_group_visible(struct kobject *kobj)
>   {
> -	return quirks->hdmi_mux;
> +	return alienfx->hdmi_mux;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
>
> @@ -795,7 +768,7 @@ static DEVICE_ATTR_RO(status);
>
>   static bool amplifier_group_visible(struct kobject *kobj)
>   {
> -	return quirks->amplifier;
> +	return alienfx->amplifier;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
>
> @@ -868,7 +841,7 @@ static DEVICE_ATTR_RW(deepsleep);
>
>   static bool deepsleep_group_visible(struct kobject *kobj)
>   {
> -	return quirks->deepslp;
> +	return alienfx->deepslp;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
>
> @@ -1009,7 +982,7 @@ static int thermal_profile_set(struct device *dev,
>   {
>   	struct awcc_priv *priv =3D dev_get_drvdata(dev);
>
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		u32 gmode_status;
>   		int ret;
>
> @@ -1075,7 +1048,7 @@ static int thermal_profile_probe(void *drvdata, un=
signed long *choices)
>   	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
>   		return -ENODEV;
>
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
>   			WMAX_THERMAL_MODE_GMODE;
>
> @@ -1308,7 +1281,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   	struct platform_device *pdev;
>   	int ret;
>
> -	if (quirks->thermal) {
> +	if (awcc) {
>   		return alienware_awcc_setup(wdev);
>   	} else {
>   		ret =3D alienware_alienfx_setup(&pdata);
> @@ -1329,7 +1302,7 @@ static void wmax_wmi_remove(struct wmi_device *wde=
v)
>   {
>   	struct platform_device *pdev;
>
> -	if (!quirks->thermal) {
> +	if (!awcc) {
>   		pdev =3D dev_get_drvdata(&wdev->dev);
>
>   		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
> @@ -1355,6 +1328,22 @@ static struct wmi_driver alienware_wmax_wmi_drive=
r =3D {
>
>   static int __init alienware_wmax_wmi_init(void)
>   {
> +	const struct dmi_system_id *id;
> +
> +	id =3D dmi_first_match(awcc_dmi_table);
> +	if (id)
> +		awcc =3D id->driver_data;
> +
> +	if (force_platform_profile)
> +		awcc =3D &generic_quirks;
> +
> +	if (force_gmode) {
> +		if (awcc)
> +			awcc->gmode =3D true;
> +		else
> +			pr_warn("force_gmode requires platform profile support\n");
> +	}
> +
>   	return wmi_driver_register(&alienware_wmax_wmi_driver);
>   }
>
> @@ -1368,18 +1357,8 @@ static int __init alienware_wmi_init(void)
>   	int ret;
>
>   	dmi_check_system(alienware_quirks);
> -	if (quirks =3D=3D NULL)
> -		quirks =3D &quirk_unknown;
> -
> -	if (force_platform_profile)
> -		quirks->thermal =3D true;
> -
> -	if (force_gmode) {
> -		if (quirks->thermal)
> -			quirks->gmode =3D true;
> -		else
> -			pr_warn("force_gmode requires platform profile support\n");
> -	}
> +	if (!alienfx)
> +		alienfx =3D &quirk_unknown;
>
>   	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
>   		interface =3D WMAX;
