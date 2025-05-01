Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C62DC781
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096764; cv=none; b=K2ZpDF+irEGClxWE4zCpWbhcy9IIPOtnHZEVHXI7l2kbvEIT6BP8exiZqs6t3wcPzdkiAIXbi2toYg4EKMgrqrFoywRixL31/WjXrkGEMn87EyQLkKxMvm0MBTiG0zB9mz1wZ/nK0qMJ6N5/4b45CpcmpiQq1Q2vs1J5JnswcOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096764; c=relaxed/simple;
	bh=himYIgEPUKZSQgfvZxoB+xkpPmWaCZVrn6CutK2Jbus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMyH8hrIhZrz56/M2lADcaJ4OFh/a5oX3gXDwrYlVkUVpq9in25h+KPYJA74c7LiMPiRjyXYSeDOAyY4TgqxfZmSxjpKCQYuw+LE2ESL1Dd1Fm0PNPHP0KQvX2wHk+6bSDZMApLLfKqFCFZdJxrFAZzF2OeqnTg/CPjdGHnKS1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bx3QIVyU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bx3QIVyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746096761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkADofXUlRPsYz1jQOi1Srh9V92Ud1juGEKLSA1h6ZQ=;
	b=bx3QIVyUDCFc/np0bjDGqCxJf8u2wIy6qWmQDogDe+ZeZCnlje7hPx0h6asBAwR+9A7mLu
	zlD3mGdhQYfTZp3Ltv0c8YX1pricY8diToZsakeD4doiauSrtt/K6IzJCbHhad1oBRm6ev
	lchais3wgB6RQkChBADwM+87vUVOi9k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-h38bnYzzMNSq_vngdDQmoQ-1; Thu, 01 May 2025 06:52:40 -0400
X-MC-Unique: h38bnYzzMNSq_vngdDQmoQ-1
X-Mimecast-MFC-AGG-ID: h38bnYzzMNSq_vngdDQmoQ_1746096759
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e6caac1488so870735a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 May 2025 03:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096759; x=1746701559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkADofXUlRPsYz1jQOi1Srh9V92Ud1juGEKLSA1h6ZQ=;
        b=pevQpsRdQQSlgDIGkU4iTN1O9KI3YKhk8TfdvgzZVTjkkdSjcrSW2knZ9pTtmoHiIH
         S3ElshrJBof+UDHFgruWGpBvaD1mVtYjUUdwwtBhJo0CQyi/wVtVADuGR73ZmnlQQVua
         +Mxg3JP45YHi5VMIODsSGNzgnOKwkjnl2yHWFX4mBJUy/CUB20vZtKLoYCGKhNeHQcIU
         Q8Mne/ASEvZ/jY3anIWEjSMvSyBHhy7XwDmbDaSSQgQ6UHiCI6zhnZ6r7sg70qucgvzn
         F9OtCSEGdyWKJ3VEIHwuzRkk3PKqYXMJ1IUvxd38p1abDz34HPJ/2lAIoGt2aA+eeb4w
         re9A==
X-Forwarded-Encrypted: i=1; AJvYcCUI553+SelA5SXxTxAx8R2etQgYbYSnxUSx9uffXVjnQMVXdfmIW7Px8TWc33AuffQZmo0mlz29SWGjQvdJp514dGfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQ+Q5bSyaKoxsCbuwSrNBu1jVo5SQW14AUw6e13n1n9ZMEAFp
	fAM+qNZVTwfxaU2311OncwzHSsKbURqOl4NeqoERgS03oRVSgVGN+WpgdYKnJKl8clJ5XIDotwR
	84QCUxtzIpMJPgIIbEiaaJUWQBzIAfjtFlAS5TNDC+YWZv16NAXd4/6kYHwktmflng94fL60=
X-Gm-Gg: ASbGncsivCanvyi6G93e7sEr54s3lwdsEvazWLJrC+UMBj2DAiN1FbPdKre9cUkxR8G
	cUZcjjy97L6sJETG7+iVySEpmAUoA5TMncYjspYEfpAJqsVwVaCf0DV5p+JCrRyN+Swm0/w8XRD
	HrIssfiZMISxDEPUZJsMpYbUXIO7S69jXmDyhCHaiMOn3tmLG/gXH2bmOalK7pOAnx8w5f+VsTs
	+LrzAsbpdcZeiHEg7c8z52BxY+/F3nXeRGrt9M/x188vFrtDYjAfgRnYmLRfEB4zWWXGGba8269
	XlY1ooQ6REPVWArjDvod3Uwu6aUTHXRgZ7yuC++PrH+3pKzV3T6NaCeD/HCfTHDbCcUE4YupM7r
	0oWA67AoilI8MmhJYiAV97QdT6vlhxMfO5QT11zjNwkznILKOq1qbYWA5uGE9IQ==
X-Received: by 2002:a50:8a83:0:b0:5ed:17d9:91d4 with SMTP id 4fb4d7f45d1cf-5f9319854afmr275212a12.8.1746096758890;
        Thu, 01 May 2025 03:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHROFDRzRi5Iho10Y/YYT9IQR0fxN+PA6/KRQbHg6l3jHH8vNn8I1ql2DE13Iq7tChdRIjZyw==
X-Received: by 2002:a50:8a83:0:b0:5ed:17d9:91d4 with SMTP id 4fb4d7f45d1cf-5f9319854afmr275199a12.8.1746096758560;
        Thu, 01 May 2025 03:52:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f92fd8b460sm283775a12.40.2025.05.01.03.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:52:37 -0700 (PDT)
Message-ID: <446ef648-60ae-4b66-8c80-1f692b6c9df9@redhat.com>
Date: Thu, 1 May 2025 12:52:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging
 states
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 debarbos@redhat.com
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.org
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
 <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
 <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
 <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
 <0344362d-66b0-4001-b115-65dbda31a149@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0344362d-66b0-4001-b115-65dbda31a149@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Apr-25 9:45 PM, Mark Pearson wrote:
> Hi
> 
> On Tue, Apr 29, 2025, at 4:12 PM, Armin Wolf wrote:
>> Am 29.04.25 um 20:08 schrieb Derek Barbosa:
>>
>>> Of course. I will label the two scenarios as Scenario 1 & Scenario 2
>>> respectively.
>>>
>>> Scenario 1 (below 80%):
>>>
>>> Battery roughly at 75%
>>
>> I see, interesting. I CCed Mark Pearson, he works with Lenovo and maybe 
>> has some additional
>> info regarding this unknown 0x6013 event.
>>
> 
> Looks like it is 'EVENT_SMART_OVERNIGHT_CHARGE_CLIP_CHANGED'. I'll need to check with the team in Japan what this actually means.

From the name it sounds like it is an event to indicate that
the charge limits (start/stop thresholds) have been changed,
which is exactly what happens when hitting the toggle in GNOME
which triggers this.

So I guess we can just ignore these events.

Regards,

Hans

