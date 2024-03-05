Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DC4F211
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629689; cv=none; b=Fz4Qc8aKQjTBRKhNQ+VCHCxk7GCE8WKM9WEc8y4RS+0/wkJL2rMKzaD0zLyF+A3hfAEb+CihSO4HaEobrq53ZInhrUrh/SUv9Cv81kHgtfHetHrB3lMD7T2DaUoDdV4pNfTbhNfyaHBwZdH85Mjxgbbj6zdMnymvVySte/3I+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629689; c=relaxed/simple;
	bh=h455HCdulbwhayh3eDpkrvibMajOVPDkVlKDVe+2pGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LH0oTAqrob9A/Jy5qLki3jc5T7+H2eOxh6fFmB/lwpbtPQ5SGUTBwxC0XPCq5HatDcGgVzlR97OiobbY3T0gyG/RzXr0+CbmK/BigVNIm6EUY2iVeTadJVrdOC+Jxa+MAbARTxRdMZaP/7S5MRlTZiG3oFJwljvxHlD9WkWTVDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cl0DrYVE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cl0DrYVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709629687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eacxxgxORnICKYWOMS/sQ3/ShQ0nCl3n/H8AgYX9QXY=;
	b=cl0DrYVE3annZWpkVMWws1RJktdWEftdEmf64Zai/oA0eqMzu5JEDv6pcxVUTVqajyWvnQ
	VoV/l0lgGn+mK9pTmzFK2kTfHZsvv9nDosAURCsz2IxsU29T5GoyyR/h7WHVTNZKzI4QaQ
	spyVChy+sT8q5Ti/aSISPrLOj4vyM68=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-T28n1-1lPCOnvMLstSaxRQ-1; Tue, 05 Mar 2024 04:08:05 -0500
X-MC-Unique: T28n1-1lPCOnvMLstSaxRQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a440b057909so326014166b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Mar 2024 01:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709629684; x=1710234484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eacxxgxORnICKYWOMS/sQ3/ShQ0nCl3n/H8AgYX9QXY=;
        b=QKpVUGgc+lNUl2kieSsNWKHkfVruNq5ppvsVmu+Ky5qnneYa59ou3XiB0sqbuYIIkp
         2Prit6/f0DVhh+0d6YvkespMY8/iMJK9dJ6Us3fm8N7eUzlTtEZTGvbq3SYZ3HSaUpEX
         JxhHO6iS8v+YK701EK2537NBtRZ7SvTVdUt00L7KpXWTGWynn++JcEqeqS+dd1u/HSKn
         CnZUzRvJSRJLYDbw6PFy/NAOo2M7Z/zMUUvGGmBve2I/Bd8xjzGitZ/dPVmoY8f+46HT
         nBBj5Td6gwjkijT0yq5knhKNGbIrdeH3/pwysBxEoDH64WpL8BYpu1ilhBoh0QN0Z627
         1RZg==
X-Gm-Message-State: AOJu0Ywl833nSq11cGXyLyFvp8ChoT9EQulzTCSj+pmGx7/0MFvtKVit
	vckOJ7CldW+QSxgvbF5rBxxFwquZG/NU5UymOGQOwltDhLOuAqdW3SSxuE162ZCrG/XISL2WUTg
	fHMtHYUsqcDycW9t4V3HeMzEBytXvhiu2+aDdgDVNSl5ywISskSltiDxMhytU/0xHOhtVbsk=
X-Received: by 2002:a17:906:4a10:b0:a43:2c94:9420 with SMTP id w16-20020a1709064a1000b00a432c949420mr8184630eju.60.1709629684117;
        Tue, 05 Mar 2024 01:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtF0rrCgWZbp3f9P+Y1akZetFZZA93pf4sDbU0Tv7kLUmNzeybTEuO1Txnj/aLi1hKRdcCtg==
X-Received: by 2002:a17:906:4a10:b0:a43:2c94:9420 with SMTP id w16-20020a1709064a1000b00a432c949420mr8184619eju.60.1709629683794;
        Tue, 05 Mar 2024 01:08:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ld1-20020a170906f94100b00a451e507cfcsm2644192ejb.52.2024.03.05.01.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 01:08:03 -0800 (PST)
Message-ID: <6b8bca7a-feb4-4269-9f00-2cb04d8a6235@redhat.com>
Date: Tue, 5 Mar 2024 10:08:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: wmi: Support reading/writing 16 bit EC
 values
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240304221732.39272-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240304221732.39272-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/4/24 23:17, Armin Wolf wrote:
> The ACPI EC address space handler currently only supports
> reading/writing 8 bit values. Some firmware implementations however
> want to access for example 16 bit values, which is prefectly legal
> according to the ACPI spec.
> 
> Add support for reading/writing such values.
> 
> Tested on a Dell Inspiron 3505 and a Asus Prime B650-Plus.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/wmi.c | 44 +++++++++++++++++++++++++++++---------
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 1920e115da89..900e0e52a5fa 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1153,6 +1153,32 @@ static int parse_wdg(struct device *wmi_bus_dev, struct platform_device *pdev)
>  	return 0;
>  }
> 
> +static int ec_read_multiple(u8 address, u8 *buffer, size_t bytes)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < bytes; i++) {
> +		ret = ec_read(address + i, &buffer[i]);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ec_write_multiple(u8 address, u8 *buffer, size_t bytes)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < bytes; i++) {
> +		ret = ec_write(address + i, buffer[i]);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * WMI can have EmbeddedControl access regions. In which case, we just want to
>   * hand these off to the EC driver.
> @@ -1162,27 +1188,25 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
>  			  u32 bits, u64 *value,
>  			  void *handler_context, void *region_context)
>  {
> -	int result = 0;
> -	u8 temp = 0;
> +	int bytes = bits / 8;
> +	int ret;
> 
> -	if ((address > 0xFF) || !value)
> +	if (address > 0xFF || !value)
>  		return AE_BAD_PARAMETER;
> 
> -	if (function != ACPI_READ && function != ACPI_WRITE)
> +	if (bytes > sizeof(*value))
>  		return AE_BAD_PARAMETER;
> 
> -	if (bits != 8)
> +	if (function != ACPI_READ && function != ACPI_WRITE)
>  		return AE_BAD_PARAMETER;
> 
>  	if (function == ACPI_READ) {
> -		result = ec_read(address, &temp);
> -		*value = temp;
> +		ret = ec_read_multiple(address, (u8 *)value, bytes);
>  	} else {
> -		temp = 0xff & *value;
> -		result = ec_write(address, temp);
> +		ret = ec_write_multiple(address, (u8 *)value, bytes);
>  	}
> 
> -	switch (result) {
> +	switch (ret) {
>  	case -EINVAL:
>  		return AE_BAD_PARAMETER;
>  	case -ENODEV:
> --
> 2.39.2
> 

