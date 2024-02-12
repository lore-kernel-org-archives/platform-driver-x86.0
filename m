Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CCD39AFD
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707739780; cv=none; b=NkEaU47nhwSqR7hPEwm67yAzkZXC3NfIkg2f3AZQY438AybRBQE9d6zIJ1yAsUmHi+PWbBaBL7xPv4OSVmyjHLE19LebN8Zz/P6qW7f7clX0ZEAGjUWUSViLVUPL1vTMK5PNIPqr1fK4lIw69YJfEVQPRbYmmjeOFTBdXIUh0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707739780; c=relaxed/simple;
	bh=CRP+6sd1mZiVAx4elecYTdX3jm8WXINfXnannUd6wic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4ctC7awjOrXbRJ4AXNeVvHy5IriW2Fg61IHQyRvwnyK57ui9OWYFyQqBC4mFJhBevVcV/AQRL7zZ6GwZaUaronfNGfU+mOi/wLiYpz2/Z7XK8KTLcQIabx0ixY2ljzU+zFYW32fWMPlq1ndikUEasl1hpVczfVDhenYLGjppO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B93OrIIR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B93OrIIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707739777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7/Sm+1LqFoTBqev4MGAcIxpEvauc0U68qkgFOVjGMs=;
	b=B93OrIIRJNPbd/yQ+enAO4HRIf2XS3adwQVm6bg79oxucYSuteIj6T5mig1qPhTMPo4HxO
	tDGj7GMQrGomTNRxIIrwj6EkT571K89TCnCP7XzZl17ZuColduo1neshI4cU81c1Q4jdFq
	o4bbai8GYv/BZt95yFk5vAPvquQmSHE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-oJGKy6sGN3K-DVUiBC6HIg-1; Mon, 12 Feb 2024 07:09:35 -0500
X-MC-Unique: oJGKy6sGN3K-DVUiBC6HIg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-559555e38b0so2885331a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 04:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707739774; x=1708344574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7/Sm+1LqFoTBqev4MGAcIxpEvauc0U68qkgFOVjGMs=;
        b=BrJnIJZLlIW0dwt9wDqsmAo81A/MtA2mOJ58vRsECuMZIIiViK+48jL102obiGyWTe
         5zcibMyD1TpfvQNAbkM6OIp1vA7TENirnQ58kah0oWSCtIj9S0ZAie8fQTkdow+9NeEb
         NR67MY61GBPetqdLGTEyhuxqGZw83Mnn4Es7R/zlX/dlxLbTr0F/t27px40bQPTZ/QjV
         H5kw5jJ1PvoJs+lQNGuyAzDR5nMF+Gn6oQ6ylFm9DX7Aw0riBisLBKgXh/NmQbcnO1ov
         Ji/AUqwAa2hI2FdS9D+/zmc35OMSxfe1N5bFDrROf+ay/4u7ChnhUAAI/USUIuOs2CIg
         2s4Q==
X-Gm-Message-State: AOJu0Yxfj8MDdZeFLbG7pjsCiWG76MluF/aEwkOaCLvfbRgdcqLgahD3
	Qt/wboOoJId24F9pO1IMTC1y/dOV25U/bU43/z72ZkLsgUma88+TYLVOo+5+ANi0X6WWpL3k4ZY
	dgf1LigUuL9QC34I8gh3NfU40k8iCBcROToBSwCyxewxVsG7DXNHJq2lIJqnaB6vbFWK8gOo=
X-Received: by 2002:aa7:d68e:0:b0:55f:d9d1:6de1 with SMTP id d14-20020aa7d68e000000b0055fd9d16de1mr3858112edr.16.1707739774739;
        Mon, 12 Feb 2024 04:09:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1siHMV0G/qrnmfAMEAeMWYUI7nsUwbQlvJWYm3As9tK1w4ZXvL55VKkPgQKXoS1GdrMg8bQ==
X-Received: by 2002:aa7:d68e:0:b0:55f:d9d1:6de1 with SMTP id d14-20020aa7d68e000000b0055fd9d16de1mr3858098edr.16.1707739774467;
        Mon, 12 Feb 2024 04:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpMhuyW9qHepSm7XZbwBkhCSrfxrPtUDsli2xngBLLSjDqc5N9ILr6oWWvWUT1Sspq7Fwt0b28G5U/DVnNoW4=
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ck5-20020a0564021c0500b00561a727f1bfsm1188327edb.29.2024.02.12.04.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 04:09:33 -0800 (PST)
Message-ID: <c5039e32-cc35-4181-ac0c-e438e24cdf95@redhat.com>
Date: Mon, 12 Feb 2024 13:09:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Allow partial (prefix)
 matches for ACPI names
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240212120608.30469-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240212120608.30469-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/12/24 13:06, Hans de Goede wrote:
> On some devices the ACPI name of the touchscreen is e.g. either
> MSSL1680:00 or MSSL1680:01 depending on the BIOS version.
> 
> This happens for example on the "Chuwi Hi8 Air" tablet where the initial
> commit's ts_data uses "MSSL1680:00" but the tablets from the github issue
> and linux-hardware.org probe linked below both use "MSSL1680:01".
> 
> Replace the strcmp() match on ts_data->acpi_name with a strstarts()
> check to allow using a partial match on just the ACPI HID of "MSSL1680"
> and change the ts_data->acpi_name for the "Chuwi Hi8 Air" accordingly
> to fix the touchscreen not working on models where it is "MSSL1680:01".
> 
> Note this drops the length check for I2C_NAME_SIZE. This never was
> necessary since the ACPI names used are never more then 11 chars and
> I2C_NAME_SIZE is 20 so the replaced strncmp() would always stop long
> before reaching I2C_NAME_SIZE.
> 
> Link: https://linux-hardware.org/?computer=AC4301C0542A
> Closes: https://github.com/onitake/gsl-firmware/issues/91
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Note I plan to merge this into fixes sometime this week or next week.

I'll also merge the follow-up patch into fixes since it is trivial
and that avoids the need to backmerge fixes into for-next.

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 7aee5e9ff2b8..969477c83e56 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -81,7 +81,7 @@ static const struct property_entry chuwi_hi8_air_props[] = {
>  };
>  
>  static const struct ts_dmi_data chuwi_hi8_air_data = {
> -	.acpi_name	= "MSSL1680:00",
> +	.acpi_name	= "MSSL1680",
>  	.properties	= chuwi_hi8_air_props,
>  };
>  
> @@ -1821,7 +1821,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
>  	int error;
>  
>  	if (has_acpi_companion(dev) &&
> -	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> +	    strstarts(client->name, ts_data->acpi_name)) {
>  		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
>  		if (error)
>  			dev_err(dev, "failed to add properties: %d\n", error);

