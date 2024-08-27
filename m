Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B5176FD3
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749533; cv=none; b=IvCHjQikN3qmxIRRVWVCH4AzzwkiATMwwL6esUT5srBjjWdAZ9tMEiCPSoFB8qTaTLC6j7VfqtJOdKiPUIhYlmYrkz18r+hgr9ONSMMI/PWTDuKmqXyC4UJVeMP6mrJsX39A9sLfiBOa4+G45AJ2QbtPLzPPrcnwD+gvn2cjEso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749533; c=relaxed/simple;
	bh=6MJOEhJa/JatPJXsyYOm05fUkSrsn3SRjV56Hm6O2b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4Wv2u0yw2PRnBK83vTh6oCC1jHAlxj4cBeFOB4Ayl5gcVDU1PmVth7HgAsywf2V82GlZIcS6hxvyAx1YQ0yWoCZTvLboy8Ln8MBuCKmvpTopyDDsM7DIAzEd/ZZ443dSq1VmRGUiEsFtRX74Q4m76GHK4LSIdztfAOwCPe8Pis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L70EMzDP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L70EMzDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724749530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8AvRIiEgd+T2ByFA4V3B4ba6CEhrT0LmOrF0twKr2Q=;
	b=L70EMzDP21f9VSwUDi01CJR2GjT51Rnl93y0kwknlY6J1NvprnBkb9w/Psu6PB3HKc2v4x
	bQ/8Yxy1l6CmP8Vw513bURQvuLcLtMxr67RkxaRHG+q57SyTHuLEWg6/hfiuMEkkfd193Z
	hL5t8lT4EfDqPGcPUkHeBj+09QA6Jpg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-9phNdoGIN5yecohFEzOPrg-1; Tue, 27 Aug 2024 05:05:29 -0400
X-MC-Unique: 9phNdoGIN5yecohFEzOPrg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f4f3e7b76aso34221051fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 02:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749528; x=1725354328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8AvRIiEgd+T2ByFA4V3B4ba6CEhrT0LmOrF0twKr2Q=;
        b=a4uyqYIagxCjAdlBs1U49WC7GKo+NXKDjIJ+WSlCwvXfLM25fI0YBMF2OE1hiJFL3W
         3ECBjZObBYRp4TftRrH3X4+YboLZ2nHLLV7nvShGCG8Ilk3GY7vO3rBy8wfuqPF+MVji
         LIkz6OBvMkYjdSioaYfvkFBUzOni5h2Nsw5jDlCJmzbF22q4O6EvzWJySQOhBAh+JPOr
         gvAVEOtz2+vX0pxlOwIQATRZVBkGmsENRjIPzJWVMcd+gOvv3I66Uo4E7Cp5wddaoQsi
         rWbAupc8lItg4IufhlJndfZQfmr/3ghMik4GXEYbRoVttXAF5OrPsYXUnHc3XMLC2qv6
         DMiA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ITEwUeQU1z25v9TYly8/reBvPTSW8U/rWFzVGJd8eJ8YRbFR/6g/4lUNBUh5FJIIBFDhR8OcLqtw7vBtfk7n4OLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxde2ey/2y1EXUu0iuvXpwCZITTQ1OJD2Vmvdmlovf11+6KKaKx
	TffqpB9Vfrt34I6KaEHumhf2/M4ab4DKKUxcXMTKXBZCiRaxDzF7Z85r94D2T7vLbsHuCtwNqoJ
	4ccNa5Wt5THv9jjU5hlh6Le0tJivdBnXfX6dBN//tbDRcH0MFE4zv6WxML7KSTiKg28aalWO7pF
	vAWdo=
X-Received: by 2002:a2e:9186:0:b0:2ef:2543:457c with SMTP id 38308e7fff4ca-2f4f49135e2mr71941291fa.24.1724749527485;
        Tue, 27 Aug 2024 02:05:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSqUHC32MG1RXcP//rWHTciaJ+jrI4azojVO+P8tX3v+DwkqqD6jBq+iB43z3IKRAv39Dj2w==
X-Received: by 2002:a2e:9186:0:b0:2ef:2543:457c with SMTP id 38308e7fff4ca-2f4f49135e2mr71941101fa.24.1724749526872;
        Tue, 27 Aug 2024 02:05:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4829ccsm761675a12.95.2024.08.27.02.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 02:05:26 -0700 (PDT)
Message-ID: <65362768-f64b-42d9-8f74-e4f5190af95c@redhat.com>
Date: Tue, 27 Aug 2024 11:05:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: serial-multi-instantiate: Don't require
 both I2C and SPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20240814132939.308696-1-rf@opensource.cirrus.com>
 <ZszhKCKYl9161RIP@surfacebook.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZszhKCKYl9161RIP@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 8/26/24 10:10 PM, Andy Shevchenko wrote:
> Wed, Aug 14, 2024 at 02:29:39PM +0100, Richard Fitzgerald kirjoitti:
>> Change the Kconfig dependency so that it doesn't require both I2C and SPI
>> subsystems to be built. Make a few small changes to the code so that the
>> code for a bus is only called if the bus is being built.
>>
>> When SPI support was added to serial-multi-instantiate it created a
>> dependency that both CONFIG_I2C and CONFIG_SPI must be enabled.
>> Typically they are, but there's no reason why this should be a
>> requirement. A specific kernel build could have only I2C devices
>> or only SPI devices. It should be possible to use serial-multi-instantiate
>> if only I2C or only SPI is enabled.
>>
>> The dependency formula used is:
>>
>>   depends on (I2C && !SPI) || (!I2C && SPI) || (I2C && SPI)
>>
>> The advantage of this approach is that if I2C=m or SPI=m then
>> SERIAL_MULTI_INSTANTIATE is limited to n/m.
> 
> ...
> 
>>  static void smi_devs_unregister(struct smi *smi)
>>  {
>> +#if IS_REACHABLE(CONFIG_I2C)
> 
> There is no explanation why ugly ifdeffery is used here, while normal
> conditionals elsewhere.

Note that this has already been merged as is, as you've figured
out yourself the reason to use #ifdef here is because
there is no i2c_unregister_device() prototype declared when
CONFIG_I2C=n

> 
>>  	while (smi->i2c_num--)
>>  		i2c_unregister_device(smi->i2c_devs[smi->i2c_num]);
>> +#endif
>>  
>> -	while (smi->spi_num--)
>> -		spi_unregister_device(smi->spi_devs[smi->spi_num]);
>> +	if (IS_REACHABLE(CONFIG_SPI)) {
>> +		while (smi->spi_num--)
>> +			spi_unregister_device(smi->spi_devs[smi->spi_num]);
>> +	}
>>  }
> 
> There are ways to solve this:
> 1) add a stub for I2C=n for i2c_unregister_device();

Yes that would be an option to clean this up a bit as a follow-up
patch series.

Note no need for a stub, just move the declaration out of
the #if IS_ENABLED(CONFIG_I2C) block, using if (IS_REACHABLE)
only requires a prototype.

> 2) resplit this driver to have several built modules:
>    core, I2C parts, SPI parts.
> 

Regards,

Hans


