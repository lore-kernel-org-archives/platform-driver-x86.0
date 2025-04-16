Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05B23A985
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 11:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801724; cv=none; b=TcvkofCJvjLzczierG4rhZBnwM9443cM+C5390nsl7rFOaK9VAickZgWWkXrP9XJWB8oicpciVKOofx90Wnq8+x7nbqQ6xskU/zqP4BICRdJzTCnAP1TLLGqee9QK+1Inw41zj0sGojWJYeRPa2gVxN9gI/1fak295Xlqv3u+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801724; c=relaxed/simple;
	bh=PgBHfqwjPWjxXqgNl9JxQSBiBEuDTyKbJgrMsIvxSA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bknyiaot7QiGOikJfCEM/pG3YjzUqab6EZJ+t9Y/yFdhMjJQLrwLHRJhymAxy05kZOH42XQSnVEv6oZ5rF60kov45aGtyRVHny7IHTrki0OXirM6loxmnxhGgmRz82mcsQU6KSDn/RGjEniEKg4JYOBH41nF0Mk/8pETAMbvSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhX+k2Ib; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhX+k2Ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744801720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ICtvPrm4Z+eNfHe3WDJwHaa3KQJJtYZVIANRAdT0i0=;
	b=RhX+k2Ib0VvphTLuGrKa6/o8VvJrbGz5gQHc2BoU6vujO1Rua1y9MKJ+/uIRhvf7EE9dEs
	hLPXFcC5v/HN76BIUdTDSnXrfbaz41icMCCnxP44PzM/dAhq0Io4XapO0nm7V7yM+ouGaM
	V+17/w9PJuJRDdPniwJ/ocarG6vX6OY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-h9oEmfbzMqSomw_tLcSvNw-1; Wed, 16 Apr 2025 07:06:28 -0400
X-MC-Unique: h9oEmfbzMqSomw_tLcSvNw-1
X-Mimecast-MFC-AGG-ID: h9oEmfbzMqSomw_tLcSvNw_1744801588
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac25852291cso694926966b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 04:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801587; x=1745406387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ICtvPrm4Z+eNfHe3WDJwHaa3KQJJtYZVIANRAdT0i0=;
        b=rLiaxfvhPSa+Haxo0iwy5wpKz2nHv9HxvIHGVYAvtwIGEuppejQDqDB9qseoB9XTNU
         4N4YefAxiKop43fjy/J21Dn26H5FNMJ90+F0PQfQ7+Q6yksEdO3wORzCA/8BWDmHouX2
         ztns5BE54JZtS0tmC4ggximDmn5gL3GXPN+XGe5lkst4uDf0/a4sJuyz5huIc1lL+Fa+
         rIdvqTdeXtlBa8ymVS9ni6jjY8l1IYn1QxW46kt/LnXOxeHsDfNA3tAc5omIpuAoapvL
         K9px/U0OByeVDocqEWTgdkTIr0cy91dttyQsq0tPvus9t43fXbJklSzT6KfEQv+hD0CT
         tCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZR7eL8yz5e2UH3vQC3nEY01Iy2PVkvxixbx+UNLonsRGO26N4wYnstEJv8jR96IlE+uCt+kIGTUFYr2q8DI4EBCjd@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHVoEupJncnpt+VzUTQalMF0FySD1Qt+RUYq79/JnMbEzc0DN
	WGFYOsg2Kixfnd/sQScoZkzU2rPr+ynXIqQDSwEsd5vNItDYdLC1mL4nXXezJ3tAB9NWar7m0N0
	Z8Tn0ka+BAmTXXfrSbWeh3+TTQ9+9e0WB9784NO1Np2+JMO3brCXIO11CRVR2p6Vkeg1J4jo=
X-Gm-Gg: ASbGncsnFj0MN8l7tdG2Y0Fy/wa73w0chMOAEHcWQ86ny0LFa40AZ1kYttDxR/LmQbt
	pJeoWqTdWBD7EQQLZlE4UDsk12DpXPojuMTb8wYmiJA1AW5x1ootJFuo1v5gNQhegxMxDg+q9c1
	IXXZrJMdDxyIEb6gNjwvsskLdmAzIgrYModK4xKFjFaJgguzb6HzrxUVIL6wFNdvmeSl/GJw0EX
	5z1afMXPqBTae0kP0pTiOJBU9XqYm6JK26MK3z2etxokV+l7lQkHZpKl/da2X/N8OUlrEPzcZeF
	KmgHO8Veigyl3E6Plwh43EHlTIjJqg0Z0UffBT/27VuFQm+wuw11NgdNWGEw6vz+vyUH2A7bABu
	ZJUWs2Vie/XXbGvFQc/dPsJGU88uX8YlI5Za6N94p7QocaxoAS/Qnf3HfDUvXqw==
X-Received: by 2002:a17:907:9495:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb4295ef50mr128432366b.22.1744801587534;
        Wed, 16 Apr 2025 04:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDoA8nzEZcTIq2jQTVVOvwP/uVf4iahJU3ebbXBX/F5D0KOMNh9b8oADhsz31b3PddVNCXzQ==
X-Received: by 2002:a17:907:9495:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb4295ef50mr128429166b.22.1744801587124;
        Wed, 16 Apr 2025 04:06:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d128c9esm106609066b.108.2025.04.16.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:06:26 -0700 (PDT)
Message-ID: <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com>
Date: Wed, 16 Apr 2025 13:06:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-9-hdegoede@redhat.com>
 <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for all the reviews.

On 2-Apr-25 10:56 PM, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>> pin defined in the INT3472 sensor companion device which describes
>> the sensor's GPIOs.
>>
>> This pin is primarily used on designs with a Lattice FPGA chip which is
>> capable of running the sensor independently of the main CPU for features
>> like presence detection. This pin needs to be driven high to make the FPGA
>> run the power-on sequence of the sensor. After driving the pin high
> 
> high,
> 
> (note comma) ?
> 
>> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.
> 
> complete
> 
>> Add support for this modelling the handshake pin as a GPIO driven "dvdd"
>> regulator with a 25 ms enable time. This model was chosen because:
>>
>> 1. Sensor chips don't have a handshake pin, so we need to abstract this
>>    in some way which does not require modification to the sensor drivers,
>>    sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
>>    is normal. So this will work to get the right value set to the handshake
>>    pin without requiring sensor driver modifications.
>>
>> 2. Sensors typically wait only a small time for the sensor to power-on
>>    after de-asserting reset. Not the 25ms the Lattice chip requires.
>>    Using the regulator framework's enable_time allows hiding the need for
>>    this delay from the sensor drivers.
> 
> ...
> 
>>                         if (ret)
>>                                 err_msg = "Failed to map regulator to sensor\n";
>>
>> +                       break;
>> +               case INT3472_GPIO_TYPE_HANDSHAKE:
>> +                       /* Setups using a handshake pin need 25 ms enable delay */
>> +                       ret = skl_int3472_register_regulator(int3472, gpio,
>> +                                                            25 * USEC_PER_MSEC,
>> +                                                            con_id, NULL);
>> +                       if (ret)
>> +                               err_msg = "Failed to map regulator to sensor\n";
> 
> A copy and paste mistake? Yes, I know that they are both represented
> as regulators, but don't we want a bit of uniqueness in the messages?

I actually did this on purpose to allow the compiler to use a single string
for these saving some space. The difference of which case we hit should be clear
from the earlier printed (dbg) message printed above the switch-case.

As for all your other remarks I agree and I'll fix them for v3.

Regards,

Hans




