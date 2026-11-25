Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619363;
	b=d8Jb3frR9F2sakTfds4BCjDoYhj2jcwsYX7JEvKyDilq9kgJwOgy+fTPi9mDjw6U8wXr
	 zXlvzobc31ij0rZ9DDLcPNQv3nGNYE2Yyia7nQaS0Y5JBcxHhjEddsgidCpLB8nyPJSBp
	 JnGRdJ9pcmvERzNA3vW4+XZWbMqkwEDHKaGwgrsXGAo3myHAKuyZaic1Krc72OfBDH95O
	 sVWxbZ7eeVkhHilbBVRKTKj4JY6pj1Rj7b0iaNbcjY9MHufU22TRSZnCplMiVNNF0P4AJ
	 X127fks2p5QcjP1QydHZ/SKoYXj6zyWRp1l4VIk0yQBbnsWhX2oojJgpF94qTJ9v9Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619363;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cw6WqeSI8Sbldj9sBKcSk0EfyCmtivDG/+cdqzNXI4U=;
	b=fmKd3i5vSQ7nebgSdgNNy2MnPGC7hVLZC2hYEX56pU9OYsiYHTHUSUno6d6QEF99vwkL
	 DvGnmGAkhsJY/vkySJzG5DI9zElBJpFCh+dp8LsLkafl5ZZ4AnQ6KphS+wmwMnveR8LJO
	 aW4Y7txs2d48tF+ZFQPO5xmVbqMSCD2lK+a+BydlqhAOh8OE20LJRiXhrPDasNKK/vlej
	 Dv8kaaksRkTKaANDczP8AVe9o1BpZgBoOK1c0FdnyfgHuCd0NkDKgEgHBZ/G1yfgKqqdO
	 jGmIwWr013KRpS9obLhtQNA1+CHcm4ONbNQCtNigC+EEaGUd5FHCsJonjQWzRt0OxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrXGqfgA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED71606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrXGqfgA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB7E1F000C0;
	Wed, 25 Nov 2026 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619362;
	bh=cw6WqeSI8Sbldj9sBKcSk0EfyCmtivDG/+cdqzNXI4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HrXGqfgAjY8lerVmWZ2+YkIxO+l+HTvOhAw1DnAGn6Gk1TBKGvrNqJsSsgxmOznr9
	 hQKHREjkviHw7tBDxXKjj7r7XINnTWKCgbG8C/MnQWiDLoQ5k1pUaw83JuKnD0jyXV
	 fB6Ww+QsgCLA1XXfPOIe8O4NGegW63S3rygHNZuCEKHWbpW9rFYVrmWUFKSaiHXuue
	 yII4A3GxnugTExhuWlKtYbKHK9f/3DB7pITH9HqviszmucYom893IO2N69e7FDbYtk
	 tGZvPn7X9M3GcfEexcQgmK4nhs4vYT3aPrbKa4n8AHhLug61qOczElLSXjd1gdE/zR
	 ChPOh/5AcQ+Dg==
Message-ID: <1638fde5-80da-47b5-957f-1485ef9269d0@kernel.org>
Date: Wed, 25 Nov 2026 16:09:19 +0100
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
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Digma
 CITI 1804 tablet
To: Artur Bakirov <darkonline.android@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20261125100819.337-1-darkonline.android@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261125100819.337-1-darkonline.android@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Nov-26 11:08, Artur Bakirov wrote:
> Add touchscreen info for the Digma CITI 1804 (CS1069EW) tablet,
> an Intel Atom x5-Z8350 (Cherry Trail) tablet with a Silead MSSL1680
> touchscreen.
> 
> The firmware, extracted from the Windows driver of the tablet, is
> submitted to the gsl-firmware repository as gsl1680-digma-citi-1804.fw.
> The same settings were tested with the i2c_touchscreen_props kernel
> parameter on a 6.18 kernel: touch works across the whole panel and the
> Windows logo works as home button.
> 
> Link: https://github.com/onitake/gsl-firmware/pull/269
> Signed-off-by: Artur Bakirov <darkonline.android@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/x86/touchscreen_dmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index d83c387..606bdbb 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -369,6 +369,20 @@ static const struct ts_dmi_data dexp_ursus_kx210i_data = {
>  	.properties	= dexp_ursus_kx210i_props,
>  };
>  
> +static const struct property_entry digma_citi_1804_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1152),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-digma-citi-1804.fw"),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data digma_citi_1804_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= digma_citi_1804_props,
> +};
> +
>  static const struct property_entry digma_citi_e200_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -1308,6 +1322,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "S107I"),
>  		},
>  	},
> +	{
> +		/* Digma CITI 1804 (CS1069EW) */
> +		.driver_data = (void *)&digma_citi_1804_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Digma"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CITI 1804 CS1069EW"),
> +			DMI_MATCH(DMI_BOARD_NAME, "J210Z"),
> +		},
> +	},
>  	{
>  		/* Digma Citi E200 */
>  		.driver_data = (void *)&digma_citi_e200_data,

