Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F019306B0A;
	Mon, 19 Jan 2026 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768857705; cv=none; b=SLbXLWFnc3+ls9RMxZ7ZSbXGuD3s/bqcF/UCTTRPx/7q9WNgdg7wfmVmyYIEHiHpxLEZpJ2aJPXKxz4ux50B+H5vwI3uvFog0eeUZct1ZE+AjWCYBoNbq77fkZ+G64lcl2Lyz9OJuqlGPBL5yw3PitsEYVomxtqyY8PMXReGCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768857705; c=relaxed/simple;
	bh=i8/Yb6Ke1+0/AdG5ReL1o/jSRHvQYwganaWBNLpiTSQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HB+gEUk5Hjt9MCj8RR4toXEhxKltLPCEi43u+hVUUC9DEcmqUGF5McrwnOrbV9rDHkT/E4RMM5aZ5HP6aAEYLPuPiaNHqZvrS83D9KXUAUDUE1ToCN2lfb+3tpMbv7xdaR+VGu1gKyJbMPn7rcBIauSzyuNm2SQCNPOOpx5TwgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bFs6jGDE; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bFs6jGDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768857693; x=1769462493; i=w_armin@gmx.de;
	bh=4acH7YfKpMviYj8eTcb1+/LnfT/0wJBHNPcSZCdACPg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bFs6jGDEdq6p3QjQnH9oUcRJmNIymSx7O1wr0gZqRIGOp5fM3+03V4ErONnEtjVL
	 gztvIbRWztpUkxQofhbg6QW9iKL6CvxVapPcDbwHIThso7596QLX7qHlzyIzd+Zjh
	 CW8wknmQDcXugrBu7PU6Y0gLVakfaayn5hSTYVbsSYsbC6kKRtCPvW62+kLf1zEG4
	 0A1Q2B2xUTfqjBfbiVfjLMVYuiI2jX8lrU+XBPqIdSjSHq+ujPLqviu/Q77pS7wjN
	 KJqH/bMTyK+vveFqZ0GG5CTiuxhFTRKRTQ+Hw2KeyxppdiqZgRmR9hp/Ss/s7cUUU
	 aICWX3X3zTfhKY5O1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1po0-1vfkpQ3Pa4-008R7r; Mon, 19
 Jan 2026 22:21:33 +0100
Message-ID: <2eb1b234-99cd-449d-88d5-623c108e2ce4@gmx.de>
Date: Mon, 19 Jan 2026 22:21:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: acer-wmi: Extend support for Acer Nitro
 AN515-58
From: Armin Wolf <W_Armin@gmx.de>
To: pranaypawarofficial@gmail.com, jlee@suse.com
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260108164716.14376-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260108164716.14376-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:21GyCEyjfHsxWETgfshoR9QeE59jqVnCIGmG2CsdccMxxEcufi7
 oVxVlPqLYfaiG7a1L2vFX9bElKfydBaviffI9i2F4i/tNjiaqnrGfrekDd53PZhI1MoagAv
 1XBm5W4tH+RNseIxeAhhl8TA/WOGBmDFtPCe+oB3YPqogk6QljkT2KpJDEUbQo3tLpK6Kum
 50VUTbIVQJjgakyhJt4wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1gw8ApcX3YY=;zFpAudvzsOV7+hrf54wRlZfUzMP
 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
 s7LRQFaXmwhKmt0S4D7HJ92fwP5nH

Am 08.01.26 um 17:45 schrieb Armin Wolf:

> The Acer Nitro AN515-58 additionally supports fan control. Modify
> the quirk list to enable said feature on this machine.

Any updates on this?

Thanks,
Armin Wolf

> Reported-by: Pranay Pawar <pranaypawarofficial@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/CACy5qBaFv_L5y_nGJU_=
3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com/
> Tested-by: Pranay Pawar <pranaypawarofficial@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/acer-wmi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer=
-wmi.c
> index bf97381faf58..54ca3edf532a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -455,6 +455,11 @@ static struct quirk_entry quirk_acer_travelmate_249=
0 =3D {
>   	.mailled =3D 1,
>   };
>  =20
> +static struct quirk_entry quirk_acer_nitro_an515_58 =3D {
> +	.predator_v4 =3D 1,
> +	.pwm =3D 1,
> +};
> +
>   static struct quirk_entry quirk_acer_predator_ph315_53 =3D {
>   	.turbo =3D 1,
>   	.cpu_fans =3D 1,
> @@ -655,7 +660,7 @@ static const struct dmi_system_id acer_quirks[] __in=
itconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
>   		},
> -		.driver_data =3D &quirk_acer_predator_v4,
> +		.driver_data =3D &quirk_acer_nitro_an515_58,
>   	},
>   	{
>   		.callback =3D dmi_matched,
