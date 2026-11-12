Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445741;
	b=fu8SKI3oyTkmc6ysQXTdMlRE0p43Xs4FOAQq1YIjiQm32jVnJ9oc/68/O5U1medOHT7Q
	 sgNEudJegGPCo31JMUZi2ZsQVOy7A+ML+++21BLibqJj7feBBA2UF1rzwskRWRCGP4OCt
	 PTlwoq85HeBFVc32XTeWwlCw00Y3XNSo0MdHumFjtMqOKYrnSLMSw4UKZMwpyhVWwbYFI
	 ZiApplLzyJC6izxa0huaTpLo8sfIouObjQOmqs7ZLLuSkj8znedDO9Gk6mF2Wn7Gnr/QW
	 VEq9SgOV5u4xkjqIXOId5jZsavGKx1tSlIDeddH21DXEQJ+JVEzrPAhgVwZ1CVD0nXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445741;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=XJOtDpVWu2aVsgUTrhf4mclK/fWWuiWHRrw0xIUggOM=;
	b=fzoTNyxcd7x9Y9cdOP5lZ58e6FYAw0/NfRPmnapaShfefUDGENdAvnGAS8/cEUfzdNBn
	 jwD/BCRDJyynA2Ulruv+vz13MLjH/EqPVLtWcTVK7JtQ2Y7xTubGgkQpPLcinqU0kmEcX
	 TlTE2elcoBMSo0IBV+lW7mn8TYiGWzkyWL01l4WVXPQQFTUIkfwddiEaywy7DsUAyMXD3
	 jT5+SaCeO8r2yZET60xoAqBT17WlzGoNkF0Kgu7mJuGpiv2JxdYk8pTyShoxFGFcnd7N2
	 Q1OLzgNiE2mcdxdF98xKr1oK5Perth5mpaSThhi4JegaIIjnLaZ2cOoegYk7cmUKc3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rkkIyNNA;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC0C606A883
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 01:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC0C606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rkkIyNNA
DKIM2-Signature:  i=1; m=1; t=1794445738;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:QMgh+/8Mpjtnd2F8G27nrZPKe6QZ
   NMJ/iI6IAIbbY/vby1UGW26mYLQHOjfEdPGdoUUhKPK677A55R44KviZYVn1h91JQfazpj7DoqJ
   rc8KN6wF6/spbwKPJmkDOXR9enoVTxB8yHcPAx2BeyLFEH2J6e7TZMjxW+jhAmmM9WcQowqQQZ7
   8HsftU6eoTKTcePraMHORq70ulwEPo+29THFU1MZWncYbGKhpPnq/lyWYH8vv4FA9jz1xSC4yer
   1f+dG10qy8VO8kR9wnJ32l+Sm75IIKadZGYVheYoTKKXTFU4iX9rn61ISlfEc+2vgfUCDAJiqHf
   ft1cBisJng0ENQ==;
Message-Instance:  m=1;
 h=sha256:
   hJks+ckeN85vfTJkfCrQz5hdCxg1V0OnnPT8n7pJEIM=:
   brdRDOfeTsE/uPDtQKhtwSd8AWp4G5TW5NkahEssPmI=,
  sha512:
   9q5OSDgBRQ5K81tc8nweue0MdwYfaPCBFT4bET1H3eLPc77u7Uu7UL2D0CBSeyU/ud6DevxF9kePaxLQFf5G5w==:
   IxjOtG3fwdSqHX1lN3q+t8xutUCvgx1I7cFlEaS46wT2v55fKzwailPBWtW+n1caADHMsJ9WaktPlSQmCaNCmA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794445728; x=1795050528; i=w_armin@gmx.de;
	bh=XJOtDpVWu2aVsgUTrhf4mclK/fWWuiWHRrw0xIUggOM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rkkIyNNANAULS2gro4BAUAvhCGviMMhl1XUo64UibaHf4uQ03TtxQb0lhKvTjK3g
	 QvZ7jTeICbdj4T5C/4ARFKTH7YwIaMPnbdp488/7L+hKOrhRtP3wReEBhlU0kSN68
	 7W2TYrXTYeqfqW7hgJoAmuqAroW5eGC48+bP3cDvmW2rfFa7NAaik/mrSG0EsKBDw
	 2fZ0NuL53hus6BzELoUUxctDlnawUPWB/vkZF+L7wVpA0iIdkOirBUXnBSGd22CwT
	 SSB3o/FhiI1KrSM6i8F6VkETPw0mKfaojFl2+t3U1VpPijv0awyXoSY9WN3gmmgzE
	 1zED+MwQaylFMrh8Kg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS9I-1wmFFi14dm-00oDEI; Thu, 12
 Nov 2026 02:08:48 +0100
Message-ID: <dfceb33e-f6c5-486f-a4bf-ebc092d7480f@gmx.de>
Date: Thu, 12 Nov 2026 02:08:47 +0100
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
Subject: Re: [PATCH v2] platform/x86: uniwill-laptop: Add TUXEDO Stellaris 16
 - Gen8 - Intel
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111131316.504815-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261111131316.504815-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:oNqqJs0AwXl5BpU6wiolsQ0JNgGUiCf8CqiQMoU5Gja+vCKu3+t
 kcAVKQ2UHW2M9dem2jMQ0D9AxN1pDOAAZM3qlgO04SmxHIr4rmj6ZBHdl3wCVb3HMYxy3fW
 ysabVr2D3rzgqi0Rge2QJ0hVL1xKpbxzGfWaB8ciZ6eaVwtNUB448TXf/Pzw0M7/J/g0D5O
 8WqZOd6gjXuhO5DQoUfDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lFZCKRPSUM8=;FaBvKL5pN8OnhCg0wc2KfLLp57d
 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
 bjMj2lWIK9rUZ3p5FSA==

Am 11.11.26 um 14:06 schrieb Werner Sembach:

> This commit adds 2 new entries for new boardnames. It can reuses an
> existing device descriptor because the TUXEDO Stellaris 16 - Gen8 - Intel
> has the same featureset as its predecessor.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> This commit was built on top of Armins latest series:
> https://lore.kernel.org/all/20261110165318.631010-1-W_Armin@gmx.de/
>
> V2: Better changelog
>
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index dc99bf8a8568c..e2a6a704e942e 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -3629,6 +3629,22 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>   		},
>   		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
> +	{
> +		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx"),
> +		},
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
> +	},
> +	{
> +		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx_mLED"),
> +		},
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
> +	},
>   	{
>   		.ident = "TUXEDO Book BA15 Gen10 AMD",
>   		.matches = {
