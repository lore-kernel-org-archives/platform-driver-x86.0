Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5614EC79
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 20:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569825; cv=none; b=k6oPhWxuZyl+4ZcHiI1AxZTVzDCvgaJTnOKLCG8Hx3fDjEkhB01eihur1ch9SAJ5+F/qAHXzsToIiY/TaeWmKcU8ldqPN+U5Xzr+klsPWRKy6b+kbgP2gXdbIsEF0DSyHKht670vbzTTK+11cOCiHH0C1WeAotDgER4OSNAFKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569825; c=relaxed/simple;
	bh=t12owULa2Uk3B4uxPPmsB4a79oGho0TYNcWr/T2cVIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+oqE15oyCh82/Xj6HAlg+5wnRKqy6Wgif8rx3yldeHkkdBvOh3DS6LezzleeUlDd0yWTANKbPS59HtiEVl7PAY+wfVi9VKjq9CIqETmqxRak/nAjt88XsmevdnI9qZ4DzMSoasNGxRpM+Q46QF+KdhEPLGr+xmQymP4sAznn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HcG2o0Pl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HcG2o0Pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711569823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5gtlylC0qzrEzSYUPIkmlPoES5wXwK/DFLxhK4lKIc=;
	b=HcG2o0PlhnzpwHAEPpvRhdbojVJkdvZANNe6PwosBojAoHFSEeMs+6O7u3lt/HJ+4gt8iz
	PSR1GN9LsZI9r2FLz8N5NIoBYc6FWOHIWbxfwgrpkaA2wf56mcAaHpPONBl1XgnZ1Mw6bU
	ocIn6qg13tiPrxecAExFABGR5Hw9fQE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-OWKvpAx_NUasROm-LJ2HiA-1; Wed, 27 Mar 2024 16:03:41 -0400
X-MC-Unique: OWKvpAx_NUasROm-LJ2HiA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-515becfa19fso107567e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 13:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569820; x=1712174620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5gtlylC0qzrEzSYUPIkmlPoES5wXwK/DFLxhK4lKIc=;
        b=kYba0AXUUwgU4hcpHXwusAyFmq0MxrWbFYhk8o5g+lAvHVvbHdrWWpfEAC9JIbGjuf
         pkAvugX/t+wCMptVDNOLAN9sO5d2ZH+F0jakNWnva/eLdQLeiDDvpWsW/H9PAtZrLPt6
         C6u8xRzoJrPjuGvRzJoHDLA99I1C9RhUIqFN5TiT0BQrc4FSb9GAr2YMDWN5Nwx1/1nY
         2Xtbyd/Fb3rUCt3B6Q6j03SU4+YB0u6w8kFvfH60LF6DKfDXZbBUhWQxeSOnSPXdAv+P
         TemgQd2WiWeSJuNYiII03d4EnBAMW3T+GeNtCkVzjdzhIF7BLt/AIrWjg2BX46HfDzNb
         WpNA==
X-Forwarded-Encrypted: i=1; AJvYcCX7f9tj9/+WAV+O+els0FhrhL7qB1bDl8+0QjKCAcTE37+REUfgxT9toJXvYCrj3NBzDXd7Apcs/ePiVDYTvPqMKfKy+vi050jd9vXfsE3r9rVj9Q==
X-Gm-Message-State: AOJu0YzpKCwqCN5FoCl7TRMA8doMJKKqioF7yDOMAHtNHjdFljOlx/Te
	sEWBqxYQIM7MMSE1z/5djdIftQEKUP9TXca5h4VkrEAvL3DYchC/yxLnLjWYKcHdUU42rs7l5EA
	7e4Coh9JAexm4seeZfM6Nbj3nr4QiedIEQ3GLk6Is87Xi9iQigXJg5EnT3j0ZzkVUqq3pT0E=
X-Received: by 2002:a05:6512:52b:b0:513:226c:651d with SMTP id o11-20020a056512052b00b00513226c651dmr448052lfc.2.1711569820064;
        Wed, 27 Mar 2024 13:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgOaSquNs/XdTRHz1ZCegoSjmGEMwnfQhgHJRMfn2tZOUBOK1WoIRggVRj1OyU/ET5d7bPfQ==
X-Received: by 2002:a05:6512:52b:b0:513:226c:651d with SMTP id o11-20020a056512052b00b00513226c651dmr448028lfc.2.1711569819620;
        Wed, 27 Mar 2024 13:03:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090609a200b00a3efa4e033asm5796770eje.151.2024.03.27.13.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:03:39 -0700 (PDT)
Message-ID: <4b6aa3ef-82f1-43d4-9544-89f591f49e41@redhat.com>
Date: Wed, 27 Mar 2024 21:03:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86: add lenovo wmi camera button driver
Content-Language: en-US, nl
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>,
 "ilpo.jarvinen" <ilpo.jarvinen@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <je8phmmtfz-je9zfg1v9s@nsmail7.0.0--kylin--1>
 <030beaf8-12e1-400a-b064-f17384e32714@redhat.com>
 <ZgQbz5pBTuY64pNF@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZgQbz5pBTuY64pNF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/27/24 2:14 PM, Andy Shevchenko wrote:
> On Wed, Mar 27, 2024 at 11:54:55AM +0100, Hans de Goede wrote:
>> On 3/26/24 3:54 AM, 艾超 wrote:
> 
> ...
> 
>>>>> +config LENOVO_WMI_CAMERA
>>>>> + tristate "Lenovo WMI Camera Button driver"
>>>>> + depends on ACPI_WMI
>>>>> + depends on INPUT
>>>
>>>> No COMPILE_TEST?
>>>
>>> I compile this driver and used Evtest tool to test it on lenovo A70.
> 
> What I meant here is to add respective COMPILE_TEST to the dependency(ies).

Neither include/linux/input.h nor include/linux/wmi.h offer
stubs when disabled so this will not work.

Besides x86 has a lot of compile test coverage in general,
so I don't see much value in adding || COMPILE_TEST to
dependencies.

Regards,

Hans


