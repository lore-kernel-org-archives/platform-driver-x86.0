Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68611217712
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938679; cv=none; b=dVOph3v0uWBkb2TTBAPkKJJuPoTenS3ZFSSmTTRf7Q4WUDtfPOw5EskSiRsP3eIHxFFFX7qblU5vmYwmYQOjNpCDtJJ6V5n6yC9qQawYmQb1f6RWiqXCphH2EyQty8UIrqHpPYX1cfthPkOeo33onBB8GMsP1ZMbFk16xgET4/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938679; c=relaxed/simple;
	bh=nASdt59jVL1Dgw8JvULqZfL0lnSmaAnwE09/m3a+pak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qyx0cbFsYVK4SKzdPYS2Zr4pijLQTeXlJnuhbUm0r5IcIJJbszegVaVgpicHmMfEcgDRjk1mv+lmHsgwWrr0T00YbzSxsgsda2qTdiC6Ipbuy/4BaYXaAd38SKGHeCJT3uerFPCvYsyA+soiZ33Vff5YEYelrx2Hklw9IEgbUoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFu3N/Gt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFu3N/Gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745938677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn/GY8I1spCQohPx/slQw60U0OxACbUyIp3MyA0lx2Q=;
	b=WFu3N/GtgsIXwm5ssisToi1fBjmBMAICPMg8bpwrr/SaJm3P2Ic4bm4Ut5c3j4O14V34DD
	Lr1lKvbehcuqTdeSCKMJZ+NpgaO+BRNTDv+kZFZ83OBaEeEEufahijeha2RrNd5y6JzuQ9
	fUWDo6nHDtJLw5AW/vCULuXYjxS7U/8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-XMEWSN22O8WA3H3Or8bl2Q-1; Tue, 29 Apr 2025 10:57:52 -0400
X-MC-Unique: XMEWSN22O8WA3H3Or8bl2Q-1
X-Mimecast-MFC-AGG-ID: XMEWSN22O8WA3H3Or8bl2Q_1745938670
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb98b5b0bdso546703866b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 07:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938670; x=1746543470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn/GY8I1spCQohPx/slQw60U0OxACbUyIp3MyA0lx2Q=;
        b=wthQgnykAyMoVYpIJ8JZj9Gocjbqabhs/5fOJ9QH9eUyEFZ+B4Vlkk9eAhk2VtVTeE
         K8ZnyXTyLmKKbtMTLMbuzOa5eqLFv23v18SxsNqHICLhH5uVG6VZttVp5F/Gl2LGYhj7
         Zdwz73heWBtbmrOEXqo5YeU3R0fNBccSX+eRUnWhan6NX+SGlE/djnr+kCjVCEFprktc
         t/wTVYxFNsG3Z1yX/3ffKDgAUn8ZhmSyuNOkCUFckVNo+5afxzFglVdq/whv13Vna0Wb
         +46qjRynXM8KgMQwT76hwT/4q9h9ZOpozpIJAqn+G3RmfzXqWOw43b0GSqkApl9egrgO
         P4Ug==
X-Gm-Message-State: AOJu0YxtRb3jK1dyks1xH53ufqclWDDkFjPgy7bqM4M2OSGzHsQr0mes
	DP3YN8Yh07EX34KsBryvHgjV4hjgFrKBHoIuCk04ZB/kE/Hp4UJ8aBfA4F7BwknMI16zPEpJMFF
	XnP3GfL6q0kaK4BIbc+ctaklgo3lWhl/cFgKrN5qmV4xtCRPvFNzYAxnqmaYEwsbQirk84GlazO
	uMwR6cxQ==
X-Gm-Gg: ASbGncvNKKJBBFEvX4xSyPL7AUjh17VMAKFq0cAgx9T2CbIs7/Q/AUm7MhcIiLijMZQ
	I3bOUYbaKBu+U6qomJ36rzem9DLftO7/Jt8b+0Xe+qMIFK1jz2UbHjQEeVuk4CUhleSJu9m5NYA
	fPjjTl9mvr76DnQNfWcHm9tjFZvP+1Ia66/oGxS29FXUOv7DLKMtDoexfm9316kBaLFUhgvFpw6
	8QGfgCBzExSKm27YsrbyD3TxEKQ8CsCBJASQD1o90fuybrdmvIF5vzj1IaOKgXeTh/s94YS5Fgk
	kzaqKaqunYPePt6ug0nR6WTPLgtmOSskHzQZkTBHuhZ0Kwpx9Ayajwk3pjS5EfpSLKuJJgib5TW
	JM/gR5QRbikpxlWVqw+cwknvsLsBmctiuEHUm4P2ob2ICt7Iz/spDovW0cDlt0FX2
X-Received: by 2002:a17:907:60d0:b0:acb:63a4:e8e5 with SMTP id a640c23a62f3a-acec4ccfc22mr390401366b.6.1745938670152;
        Tue, 29 Apr 2025 07:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC2qIn8yyft62Bx3II7JKbx8cJK8PO9xPqf0eQ2DZFVM+F4Y9qXBW4+ZMSJNqsPTVQUWOmuQ==
X-Received: by 2002:a17:907:60d0:b0:acb:63a4:e8e5 with SMTP id a640c23a62f3a-acec4ccfc22mr390399266b.6.1745938669787;
        Tue, 29 Apr 2025 07:57:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm787754866b.169.2025.04.29.07.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:57:49 -0700 (PDT)
Message-ID: <20fbb859-169f-4055-9400-8b373f29f287@redhat.com>
Date: Tue, 29 Apr 2025 16:57:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as
 mutually exclusive drivers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Gregory Price <gourry@gourry.net>
References: <20250425102357.266790-1-suma.hegde@amd.com>
 <b5e59360-0990-104a-f87c-6acd20dd6b74@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b5e59360-0990-104a-f87c-6acd20dd6b74@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 29-Apr-25 16:35, Ilpo Järvinen wrote:
> On Fri, 25 Apr 2025, Suma Hegde wrote:
> 
>> amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
>> amd_hsmp is for legacy platforms. To achieve this, it is essential to
>> check for the presence of the ACPI device in plat.c. If the hsmp ACPI
>> device entry is found, allow the hsmp_acpi driver to manage the hsmp
>> and return an error from plat.c.
>>
>> Additionally, rename the driver from amd_hsmp to hsmp_acpi to prevent
>> "Driver 'amd_hsmp' is already registered, aborting..." error in case
>> both drivers are loaded simultaneously.
> 
> This rename has userspace visible impact through sysfs, no?

Not really it will only change the name under /sys/bus/platform/drivers
and the name one needs to echo to bind / unbind when doing manual binding
I don't expect anyone to be doing manual binding / unbinding especially
not in a scripted manner where this would really manner.

> I'm just 
> wondering what's the expected fallout once this patch goes to stable 
> kernels?

I would not expect there to be any fallout from this rename going
to stable series.

Regards,

Hans



