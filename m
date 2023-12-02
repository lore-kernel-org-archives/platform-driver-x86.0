Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i56ARLIk"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1846918C
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Dec 2023 03:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701516739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xt2SJB3OEyXkH+gdUma+ns8reFuyKzbtvZneat4NxE4=;
	b=i56ARLIk0Sk67yph9IDy0QRddpNwOHc4Q+MG6rVpfQV6mlq/S4oue563cSK0qrhukvB18D
	v0ieWf9HJkmdLLqX6BOez7aAvgcm9dJNJXVnPaugvzcIqIODbClNMhKL+zme1xtuL7Hssf
	xtp8yf4hgP+xxjozYpeEDG4gjlNjtqI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-kVhS0GwLOB2B0XL-_qCgdQ-1; Sat, 02 Dec 2023 06:32:17 -0500
X-MC-Unique: kVhS0GwLOB2B0XL-_qCgdQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c9f594de2fso1276061fa.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Dec 2023 03:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701516735; x=1702121535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt2SJB3OEyXkH+gdUma+ns8reFuyKzbtvZneat4NxE4=;
        b=gUHRY4lTwhn6mxA5s2MknygpkKR2h2PqYtswpAf9HBjr8lA1Dc36L15ZNjxmjiLWZP
         xWBRI+9LGNhuVD7rBelWoF69L1MUSkPdbVLUgCBvikMwznHyv/7wM4NQoxYY0svz68N5
         avJ6Jax/59R9XMt/T9aTCjgdZe6ErnioplAzAa28eCU5obCZAhdVhNweIGvVAlBQgxGZ
         PYVNzK59kggU6R1wW6+6BMaiRh8BggF+iWOitBVruCQK6yGygtEEk8sHp6dN6JWh7TfO
         stm93ubUP3BvQnW4+Ckjkfda87WdbTsV+562BG5TWRontcPEmn3jK8M9olLtN+TcBC02
         oz5g==
X-Gm-Message-State: AOJu0YyY+40PV56MYodCkP8bAGiufaKqKT0UD/eObpCCrpZEHFOd/26w
	KN7TFduBlmAINsOjW+4b9mzbKO6KvKt715coa3D/tuBtambZqZMBpjvekaZjOqpK6j78WAWp/3V
	kr+XF14YkgMboASCC0kayapzAYh2sybG0DtegGQMWZQ==
X-Received: by 2002:a2e:381a:0:b0:2c9:caf4:18b0 with SMTP id f26-20020a2e381a000000b002c9caf418b0mr1464759lja.41.1701516735762;
        Sat, 02 Dec 2023 03:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4QhYhxIdH1bNNlbjq78o8Is9EW7Z3oPOwGwWPajwBN/LhgHcYYJLEsP75hTJr90U5m2gpOQ==
X-Received: by 2002:a2e:381a:0:b0:2c9:caf4:18b0 with SMTP id f26-20020a2e381a000000b002c9caf418b0mr1464757lja.41.1701516735423;
        Sat, 02 Dec 2023 03:32:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g26-20020a170906199a00b009e776cc92dcsm2928411ejd.181.2023.12.02.03.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 03:32:14 -0800 (PST)
Message-ID: <083d318a-48b2-47f0-aed0-8788e25138f4@redhat.com>
Date: Sat, 2 Dec 2023 12:32:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: select ACPI_PLATFORM_PROFILE
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 SungHwan Jung <onenowy@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20231130124452.3460-1-onenowy@gmail.com>
 <c13f1666-33a1-2df2-649-c7d32e64c70@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c13f1666-33a1-2df2-649-c7d32e64c70@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/30/23 14:00, Ilpo Järvinen wrote:
> On Thu, 30 Nov 2023, SungHwan Jung wrote:
> 
>> select ACPI_PLATFORM_PROFILE to fix the dependency problem for acer-wmi
>> to support platform profile.
>>
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202311301842.ppdT4zWK-lkp@intel.com/
>>
>> Signed-off-by: SungHwan Jung <onenowy@gmail.com>
>>
>> ---
>> I apologize that I missed dependency in kconfig.
>> I have submitted a single patch because the series of patches were alreay
>> merged to linux-next.
>> Is this enough or should I re-submit the patch-series including this patch?
>> (or modify this to apply before "platform/x86: acer-wmi: Add platform
>> profile and modekey support for Predator PHN16-71" commit?)
>> ---
>>  drivers/platform/x86/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 8e99a2f10147..81e6cd62a533 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -182,6 +182,7 @@ config ACER_WMI
>>  	select INPUT_SPARSEKMAP
>>  	select LEDS_CLASS
>>  	select NEW_LEDS
>> +	select ACPI_PLATFORM_PROFILE
>>  	help
>>  	  This is a driver for newer Acer (and Wistron) laptops. It adds
>>  	  wireless radio and bluetooth control, and on some laptops,
>>
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> I suspect Hans will just included that into the original patch so this 
> patch will not appear in the history at all.

Right.

Thank you both for the patch and the review.

I have squashed this change into the original patch introducing
the platform_profile support.

You can find the new version in my pdx86/review-hans branch and the
pdx86/for-next branch now.

Regards,

Hans


