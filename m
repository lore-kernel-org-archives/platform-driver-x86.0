Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E071FB4
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Sep 2024 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726329514; cv=none; b=qFSb+YMQgYb7Bq+s5eCyk6e9hM2d+h/lJa0Gs67oK6I5/u78PLr7RYicEoYr5IIQrQtkdnNibHA3J5Uu+0HcW29m+VxnqSu7+eXbGrnpdN2i4CrlYunQz/+jN8v1jRnHmTTmtjP2lgKOPD46uPeBpQd7muiXCgPTGGoyRSzK/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726329514; c=relaxed/simple;
	bh=c1/oQd8Y0PTk6wRQWqCMzo5A4vAqOi1s/Ov+eurZ/1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nWDOQ6/5vSt5GA1khw/ok6wDXQTZiWZirJh/OAAFZUWrkwQiSeY9nUwwnu+ue5WORtv2+/TQj9a1ABEq6N3WdFmrguvdL7zOVmqRreFmy+6cVCxRqlLh8U1BfRhrr91aNGPUQHJFUKmYtsXCpLuWeN7EX0TJiM0PEjdTXPh4mjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwvXn1cc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwvXn1cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726329510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvlttbR82pqWDdE53xc15k3Lbml8HLRNnwRA4WHOaLI=;
	b=bwvXn1cct10yO2BcVio9/UL1737sbC3A29uUCp8boViiTnD1XC915a1WMWnm3omWsDrBwf
	utvfThNiUWm4dgzBotcsYl5pabV3tGF+o81z/D3S4oKg8IMs+z3K+pOABBbAD5RCTUswVw
	mZR2mUl+rC0gbmS5wy1lIoOusvO9ZSY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-8abfvdRFPu2oMELjR3NZ5Q-1; Sat, 14 Sep 2024 11:58:27 -0400
X-MC-Unique: 8abfvdRFPu2oMELjR3NZ5Q-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c24e546f3fso1774880a12.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Sep 2024 08:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726329506; x=1726934306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvlttbR82pqWDdE53xc15k3Lbml8HLRNnwRA4WHOaLI=;
        b=gue1bwVUQzEgnX7FCK/EOEnEgnT2PG1ruqdlvscrW4qgNqMTv2/6OuW0tBip5UoOEZ
         61pgTDYm2GFpmfVrBvP02dOXrByUTamOZwlmbCSEHyR27gsHER5bLjVHbgb4w0nhnoDd
         fabmZpJbEnplV3TBU2P+HZlW3mw9fDP1gdQyvlunGS/RQwaear73r+WuW96b0G6gVYQo
         /wrbb/7WMRWt/rmtno2HpLCuGrMk7q3iy2IyQw66lb9v27Qcmtoi+aQn4toUxUmH3hqz
         VKIRDbNECA8qiVcCoSTFeOJ9AKwgEw6aZwQDumUnsBgN4/p5RFrRpLngZJhOy+4p7Rne
         einw==
X-Forwarded-Encrypted: i=1; AJvYcCXGeNQsivPKdFNFCqnPd6NZKwRTVTv9UJuTVDFnngXijwEvrttcoQC0EzeffcR93lLpqfvF3QUDrt6AFYPjB81x9qPj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy36BO6gInKDVdicmkYItfCCewXwT9zCg6/UFG1YSBQDg52GjXU
	JOA4ykYT01bfkfS+92nCnQmcU3a8IlqKv+rNP6EQrBS3dvs7F6eNGPcTXglKWHts7cJ6szd2SCQ
	FCRki/DlWYWEr3qWI5cj2HxGIm9s2N6Rsoqh8p+uU94/LSwuOZmAITVHh2urizLKIu2NvWyzSfq
	UUylU=
X-Received: by 2002:a17:907:e29f:b0:a86:7b01:7dcc with SMTP id a640c23a62f3a-a9029435ad1mr956284966b.18.1726329506240;
        Sat, 14 Sep 2024 08:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXQy1/rNakcKa+qJWNGlazuhXB44t9vb4TvVkU5s51DxshmEVHsnYAeRe9cm9c0ePX3yAchg==
X-Received: by 2002:a17:907:e29f:b0:a86:7b01:7dcc with SMTP id a640c23a62f3a-a9029435ad1mr956282766b.18.1726329505723;
        Sat, 14 Sep 2024 08:58:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109671fsm96344266b.11.2024.09.14.08.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 08:58:25 -0700 (PDT)
Message-ID: <fc7e7327-dcba-4f13-bea1-a12499e76fdb@redhat.com>
Date: Sat, 14 Sep 2024 17:58:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: add nanote-next quirks
To: Ckat <ckath@yandex.ru>, platform-driver-x86@vger.kernel.org
References: <e8dda83a-10ae-42cf-a061-5d29be0d193a@yandex.ru>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e8dda83a-10ae-42cf-a061-5d29be0d193a@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/11/24 9:12 PM, Ckat wrote:
> Add quirks for the nanote next (UMPC-03-SR).
> 
> After checking with multiple owners the DMI info really is this generic.
> 
> Signed-off-by: ckath <ckath@yandex.ru>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> 
> base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index f74af0a689f2..0a39f68c641d 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -840,6 +840,21 @@ static const struct ts_dmi_data rwc_nanote_p8_data = {
>  	.properties = rwc_nanote_p8_props,
>  };
>  
> +static const struct property_entry rwc_nanote_next_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1785),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1145),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-next.fw"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data rwc_nanote_next_data = {
> +	.acpi_name = "MSSL1680:00",
> +	.properties = rwc_nanote_next_props,
> +};
> +
>  static const struct property_entry schneider_sct101ctm_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -1589,6 +1604,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_SKU, "0001")
>  		},
>  	},
> +	{
> +		/* RWC NANOTE NEXT */
> +		.driver_data = (void *)&rwc_nanote_next_data,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
> +			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
> +			DMI_MATCH(DMI_BOARD_VENDOR, "To be filled by O.E.M."),
> +			/* Above matches are too generic, add bios-version match */
> +			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-V005"),
> +		},
> +	},
>  	{
>  		/* Schneider SCT101CTM */
>  		.driver_data = (void *)&schneider_sct101ctm_data,

