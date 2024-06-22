Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37014B965
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jun 2024 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066096; cv=none; b=L+t630/TphNStwyb1R+GKqskt7JWLr0MQ7hq14zdRPv17NT5krk8ReV9TcPSMpL4PT6ra83PIIkiAyLOqa1aoyGRUnmlX66EjzIOlVnx50cjKDPKJwE9f6toDSXKecyLa0xdr80OzmGHH8OQsFnpNImOxcbw9w+EC4o5UUqh710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066096; c=relaxed/simple;
	bh=Q1HSyFOe87RqTHoBjPgVIZg8ifNLeDsmBdusQK5rwKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJtq4bGKtAcKqRHWf1R/DMAATYqpM5phhQITnPe8exbdEfYNJCGzJ9UvQF4FOzi8B7vJbyH4epM0UryB5Tvefef0sUYkWQTGRmGuJIK8hI+a+R1ZFoCP9QwHu2kynsZnP256IoBLURDv/HJD/d1QWJ2g5F8g+DXMs7JTVVAy0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dchGygiW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dchGygiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719066093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0B5ArVEHgAF62aRHc5z36Mvy81HoBV1hNDzhJEyDGM=;
	b=dchGygiWYKWwdIOY63HLJMhRGCJAuEiytvNr01eFtxnOb+BDl6/AM6Dha7CRGvE1uAmvpH
	qtZmiNDaU4WLosjBVbGnZUTGOZwao/k3uo24sUhxnhv7EgEStACS2Cn4mhENBS2sLW9d7M
	TJ9/uQJNyz0AiZtAzAOk9Dz9VDx6A44=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-07LRDWBNMHiq_talYM6ZPQ-1; Sat, 22 Jun 2024 10:21:32 -0400
X-MC-Unique: 07LRDWBNMHiq_talYM6ZPQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6f2662d050so136134266b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jun 2024 07:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719066091; x=1719670891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0B5ArVEHgAF62aRHc5z36Mvy81HoBV1hNDzhJEyDGM=;
        b=PvjM9sn07hKXS+oXj7cQ7Y+Tjx5jQuyL1W0CxrvJkkYBpyOT2jA/uOKwQhP7x1JvrK
         OKVs6k+3MQMsxUl5+Ggnz/BLktG8v60c7ZEJUpHdZQMBcgtKwB3xJ2rCMox68dz6H1ES
         /QddmNhpBQjaqpJ+cbTlz4OSWCNF0kenKMgWflwRt3u3OyVKNiAQjX2h26n6w9cKDbVv
         Ikuat0i/07NTaCsKfxfRcotdki95rIl9Sb0DRrS36ysWpi4RKCBybzyUBkR9XDsJrjyM
         IdEQtiuLvt7yasScrABTkI1wyWC45Vw/7TuOFFMjFNanYNOdTXtv8b31zyC6g/n2VzQt
         Exsg==
X-Forwarded-Encrypted: i=1; AJvYcCVXb71k5vXkSNPdO/1YBCpUrttfi+Q+yApuynWLTBv8Q0jpVpdhGol/8V+MGUFbTR+J+NcIU5yMqf4ZzitA6BlHqPgHQ6BbzLwhvAt3Q1EUVJIj7Q==
X-Gm-Message-State: AOJu0YwBv+BmsuEIRulp6JuaVoITCdfgdTzM3Hbkzr+nWSnozFZlIcqf
	gxiYXuF5Fq48Oxws6ssEG15os2tqvVVSoanx0CJXQI2xyZl1+qHM1NaVU+iaBz0ZaetE5Ejx7w7
	SUvScT8WWitkQg18MX5eQCyBLHEYO2GHIhGy1ur/lIpwwEJ2OxKQu6r+bVpylZTTGtn2pR8M=
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id a640c23a62f3a-a6fb5ffab3cmr728979066b.12.1719066090969;
        Sat, 22 Jun 2024 07:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs3T9hSU2pbcAZvwc+koXaEYMbOjl0DbvomzqGa0zg81KYoYYbuAmffo7OpiaB+X4raBCQhg==
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id a640c23a62f3a-a6fb5ffab3cmr728977466b.12.1719066090466;
        Sat, 22 Jun 2024 07:21:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560632sm200510166b.160.2024.06.22.07.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:21:30 -0700 (PDT)
Message-ID: <fbc82ede-f23d-422e-ac76-7363e84764ee@redhat.com>
Date: Sat, 22 Jun 2024 16:21:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-7-hdegoede@redhat.com>
 <20240622133237.b5xsetcxnfu4vu6u@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622133237.b5xsetcxnfu4vu6u@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/22/24 3:32 PM, Pali Rohár wrote:
> On Friday 21 June 2024 14:25:01 Hans de Goede wrote:
>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>> of the accelerometer. So a DMI product-name to address mapping table
>> is used.
> 
> This is statement which I got from Dell for 10 years old Dell models.
> 
> I have already stated that poking of address in kernel is a big risk
> specially for all current and any future dell hardware. Hiding it just
> under the kernel parameter is still a risk, specially as neither its
> name, nor description say that it is dangerous:

I think you are overstating how dangerous this is. lm-sensors detect
scripts has been poking i2c addresses for years without problems (1) and
still does so till today.

Besides the kernel message telling users about this option does mention that
it is dangerous:

>> @@ -370,6 +511,7 @@ static int smo8800_probe(struct platform_device *device)
>>  	} else {
>>  		dev_warn(&device->dev,
>>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
>> +		dev_info(&device->dev, "Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
>>  		if (!smo8800->irq)
>>  			return -ENODEV;
>>  	}

> But anyway, why this code is being introduced?

Because users have been asking about an easier way to find the address for
not yet supported Dell models:

https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/

This is the whole reason why I started working on this patch-set in
the first place.

> Have you communicated
> with Dell about this problem?

Dell is on the Cc of this thread, as well as the previous v2 posting:

Cc: Dell.Client.Kernel@dell.com

Regards,

Hans


1) There were some problems more then a decade ago, but those were only
at specific addresses on some really old (by now) ThinkPads and for
the other case the i2c_safety_check() function was added.


