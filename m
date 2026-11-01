Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553446;
	b=C9NZq4/TBKeSU8Ryo27CmDFxDLhGhOp23o01V2+qBoOqEt7pDCP/AQuFXTavbDhNhAln
	 TSFKJDzLaJplmcaGH1uSHktx/SfhOkWRX1A0peu7fy4ylsswBS5YvYk6p22w2zyzIOVVG
	 T1n7FBG484t1gJ2knWNNJR68FX312DJdyVziFneHg5q9Nt61wtEt7y1EWf8UBLWVvsUEo
	 fUhFrsPjO3FCIYkTEoruHZocCRMfcq9jU4QlgNGlXut4zxDovS3M4eSKtvVMo+Nkm6iZo
	 C97GeToDR5LeNo9MC2s/ryzoSMokLRc+dyJtXl9i9jdwcIX9kLi96TivNpy9AKMH1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553446;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=x/OUTsZyLLVprYXSSUx3mVYubzv32ZbBuaaPtXo4r9Q=;
	b=lMhFBGEmXMLd9uv7yNeJj7cSeyuJQ+ZcPCHR7Z0QVoTfWhxIKdFVHf0ZXvvkXXhcQD2T
	 m/KYpfsJ/Q01tCC/2bwsDO1mMVduJ1u2CYsRq7bJ+NkLaPVqfJnJ5W6eluUbIlsbfZMbf
	 USBx5l4DMawU6lBYZsbqK8HAq9ZeJiAUjMrbHZ97AI7Pw90BES03wI38ZZ37QjPNjvsa2
	 H1eQ3aYkypn0jfW5NXsqgCdtqYBuNKFjBPIelUhrisQi5X+cKe6jShidgEc9QsaXjpw2b
	 VJDr/wp5089fFEilbNpTgxKhgQ7QB5p2yJEw/m+aaB31C4b/+RloaLj4r+f89dcH/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=nkUMNegJ;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E6E606A325;
	Sun,  1 Nov 2026 17:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E6E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=nkUMNegJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793553440; x=1794158240; i=w_armin@gmx.de;
	bh=x/OUTsZyLLVprYXSSUx3mVYubzv32ZbBuaaPtXo4r9Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nkUMNegJZbV9DO99imcONWo8oeyMOykzvMZm8cE/9QyPX9vl9ryNhIusQyxfF0Yo
	 tT0M2p8eDuih2rw2Lqc3+ST8V+BGhGxTSP/SJhbuEuRr+J77nqLynhQZWxH/gNwpS
	 3Y9m7esyIAJoYOwFgUGrUi/M5Fmsh+DD3Iq4FHHWyvkFWF+u0eXHPrFg4ZLcyDHY6
	 uCd3ppGAgDOyMmGU4ko9hylleAWk+JjiWuGtNnP5+0JsiHUMbyES7Q24fJOdBXArO
	 5r57Nuv2Mg4YjowA9wUVt1e3HMYY2lno1V9kqG6p65VCizinopv0JF6SP8X+yu0ie
	 n/4+cv4iwFZN8nIS5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1x1jLE34tr-00O2uO; Sun, 01
 Nov 2026 18:17:19 +0100
Message-ID: <36f3b14c-f349-4a07-919e-73a2b1427c29@gmx.de>
Date: Sun, 1 Nov 2026 18:17:18 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: uniwill: Add MECHREVO Jiaolong 16K
 (GM6BG0Q)
To: dydydd <admin@qb.edu.kg>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023034822.141263-1-admin@qb.edu.kg>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261023034822.141263-1-admin@qb.edu.kg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r1A6b59FMLJO+wlqK7Jd29cwW6MpJPJvNYgsZRtdpUEm01q83R9
 yql0KJIdcYO7Ivj2AfoQZEjzI9t+TDmvIy5ii4mKkMTBG5IAHXDTcqSMO5EOTe+coJVHVH6
 7nv5BTuw9WZ6VOhHZsQDCINWZoXEASyUMSaNH0CIj4IeUzabcl9MJDpsz57pSsoD1GWl0OS
 F177fNQ0p3/YAwhPJXbKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sI8UMtBWCP4=;Q0WbBJ9QpIy1MOV5pAYmmwDY4gK
 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
 T9u7u4

Am 23.10.26 um 05:48 schrieb dydydd:

> Add a DMI entry for the MECHREVO Jiaolong 16K, which is built by Uniwill
> on the GM6BG0Q board (BIOS project ID "IDQ", EC version 1.24).
>
> The feature set was determined by testing every sysfs attribute exposed
> by the driver on the actual machine:
>
>    - fn_lock, super_key_enable and touchpad_toggle_enable are writable a=
nd
>      take effect
>    - the battery exposes charge_types (Trickle/Standard/Long_Life) inste=
ad
>      of charge_control_end_threshold, so BATTERY_CHARGE_MODES is used
>    - cpu_temp, gpu_temp, fan1_input and fan2_input report plausible valu=
es
>    - the keyboard backlight is RGB with four brightness levels
>    - ac_auto_boot and usb_powershare_high are writable
>    - usb_c_power_priority switches between charging and performance
>    - ctgp_offset is writable

Hi,

thanks for the patch, did you verify that the individual sysfs attributes
are not only writable, but also generate the desired effect? The EC will
simply ignore any write request for unsupported features, so having a
write succeed does not necessarily imply that the feature is supported
on a given machine.

Thanks,
Armin Wolf

> This machine has no lightbar, so UNIWILL_FEATURE_LIGHTBAR is left out.
>
> Tested on: MECHREVO Jiaolong16K Series GM6BG0Q, BIOS N.1.19MRO15,
>             EC 1.24, AMD Rembrandt, NVIDIA RTX 4060 Mobile.
>
> Signed-off-by: dydydd <admin@qb.edu.kg>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 26 +++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec..94ed83ed 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2677,6 +2677,24 @@ static struct uniwill_device_descriptor machenike=
_l16p_descriptor __initdata =3D {
>   	.kbd_led_max_brightness =3D 4,
>   };
>  =20
> +static struct uniwill_device_descriptor mechrevo_gm6bg0q_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};
> +
>   static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor _=
_initdata =3D {
>   	.features =3D UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_LIGHTBAR |
> @@ -2877,6 +2895,14 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>   		},
>   		.driver_data =3D &machenike_l16p_descriptor,
>   	},
> +	{
> +		.ident =3D "MECHREVO Jiaolong 16K GM6BG0Q",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6BG0Q"),
> +		},
> +		.driver_data =3D &mechrevo_gm6bg0q_descriptor,
> +	},
>   	{
>   		.ident =3D "XMG FUSION 15 (L19)",
>   		.matches =3D {
