Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115043546ED;
	Fri, 25 Sep 2026 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379884; cv=none; b=BUZa+zunrDe5CNpKnSZXRWzw0FJMS4k2pJ3hMQr8sQ/Wwm2wa96R+vxSDXFgLIMQ3fdQtov6D3jsRSuTu3qvWhW0tiz3xPDHLswvp6ljaTXCMiVBfT/0XlLeZDa19pSIkuPWnKU94y636jcYNDObusEw83NO1uQcd8PNaCacaic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379884; c=relaxed/simple;
	bh=7BvIB6RTuuyKkuMxlustZg0zEpVRivqhcr9LSB6db1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKsqj7qvz5QVb2aJeraOlMYHggH35X/ZUxOJLdbHY/d/el6VmE4+y8kxJweVD2AmvsSmg/G7Yg4E79EE665Ji0/zs9EPQ1h7FVnw+kHZ5Q+WQVxvSWshMK7hQRqD3yVvveI3U50AbZqk6BQrPZlTWhqKziH6OLryuSHLvbfAHks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZkjwqQaP; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZkjwqQaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790379879; x=1790984679; i=w_armin@gmx.de;
	bh=ArBwqECYR2KqVaKXjmyaJZiQuKvbIs3wfyFPYvXW6Fs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZkjwqQaPYC+sry+fVdrJ2fuVcesOQv0wK96FjgNo6WUoNDhSLnruQHdDxraZKAvH
	 tf7gzeiCwSJ4Kkx27i4qa1XNLh6xN4PmyccEjwBM4T+na7UpCfxPoZFP07q9yB4Tr
	 /EQRCaSheC/Wc0sITZytz71O2/bGYs2SpJ9GnNaAiXxAimKUM2AeK09O5U4C+IGt2
	 w1ow5GFmORTK8pyrcU6YwrRabXvDcD44+mjwQSCBH7saUY0pYlIEwK1HX40U5oVyw
	 1ApTFSZc2B/fShrAo0ZxYtiHpxVIQ1L3Mt9kIEaAi0N9qL/OMSBA9NAP7SLG2SVTx
	 trm+lDi6q0gWmytqBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGiJ-1xIKBA1G0h-00YK5R; Sat, 26
 Sep 2026 01:44:39 +0200
Message-ID: <00235605-05f0-48e7-8561-486b8ddc9c12@gmx.de>
Date: Sat, 26 Sep 2026 01:44:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86: uniwill-laptop: Add PCSpecialist Recoil
 16 AMD
To: Mohamed Jouini <amad3v@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925211635.1422516-1-amad3v@gmail.com>
 <20260925211635.1422516-2-amad3v@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260925211635.1422516-2-amad3v@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:exEeGHC/V/mjYtKiHHtRhXCKz96aXune1t4fjUkh9E+W/NhS7Mk
 5+LNnlRiLb6LdJPgND75F6J4a3yRsY2cLKP5lEJE7uifWZLKn1+/sYyg6EfSAzIl4hlx6JS
 eO9Q0b2w3VIy6kOdfPLucEi+QrwhBIDY5jSeLaoVkuNVnqK9IZ2N9uvoNRwj9XIDkLTett5
 gZ8UjLLilu1uQP6ktxXYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XnxdIpnl5hA=;mYc/UZvn0kBBfXmxeSKsjBKlOCg
 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
 CNwBmPHT1VqEQRZYW9yKLunn1g==

Am 25.09.26 um 23:16 schrieb Mohamed Jouini:

> The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AM=
D
> but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
> existing entry does not match it.
>
> Use the Stellaris 16 Gen7 AMD feature set, but with the percentage charg=
e
> limit instead of the charging profiles: on this firmware the "balanced"
> profile does not limit charging (the battery still charges to full),
> whereas the ACPI _BST method reads EC_ADDR_CHARGE_CTRL (CGLM) and report=
s
> the "charge limiting" state bit while it is set to 1-99. Setting
> charge_control_end_threshold to 90 on a full battery switches the
> reported status from "Full" to "Not charging", and charging stops at 90%=
.

Hi,

it is to be expected that the EC firmware will emulate a full charge to 10=
0 percent even
when battery health conservation is enabled. I strongly warn you against e=
nabling the
charge limit on machines other that Intel NUC-based models because apparen=
tly Uniwill
considers the charge limit feature as a preview on all other models, so ac=
cessing it
might permanently damage you battery!

I suggest you continue to use the battery charge modes.

Thanks,
Armin Wolf

> Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index eeead0159..beba5a76a 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2787,6 +2787,19 @@ static struct uniwill_device_descriptor tux_featu=
reset_4_nvidia_descriptor __ini
>   		    UNIWILL_FEATURE_USB_POWERSHARE,
>   };
>  =20
> +static struct uniwill_device_descriptor pcs_recoil16_amd_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE,
> +};
> +
>   static int phxtxx1_probe(struct uniwill_data *data)
>   {
>   	unsigned int value;
> @@ -3268,6 +3281,14 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>   		},
>   		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
>   	},
> +	{
> +		.ident =3D "PCSpecialist Recoil 16 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
> +		},
> +		.driver_data =3D &pcs_recoil16_amd_descriptor,
> +	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
>   		.matches =3D {
