Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75637276023
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718703; cv=none; b=LpvhZDHPcWHZhUHKP8kB1VJR8OxQ/ozKpnR9yn+DuLxXrGLlvr9m9HbVUnLEoDYj0qvuCx+TWX1AgypviO5K3t+f9KFaCbLnD3jygqePWryyP6IDIlhSGs6WGhtjfRxf1m2Fgy+KuG5ferjxiYOerByZOV76yQyyKyKfPujZyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718703; c=relaxed/simple;
	bh=Kg7ZSS7djINgfvXim743KFOjolzOhMc+GyHr07cHwS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLy90B732vBY8vOkUCGi5uFXCMAhra2IhF+5Mo8kQhoRrfhK2C1reZ00dqGmmxilvgu20xDuCu/p7IKpfLRryvhsW64epXB8Tx9UYTdcIm00V+yA5BdieLPzw/qReUVENDqvtKEJF/ox3AGekSGmD9pjZSJO+ghQS2dM7JpnAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EKPaZ4ZB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EKPaZ4ZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746718699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zah8ICy0Doer0Ijy3M3n6/uX4Bvln4wQcKl/L3riev8=;
	b=EKPaZ4ZBWxAAVGpXYLiGX8cx9oA/+0pfk2nPnyTo54ZRAZ00AjiiW1/tJz+/r9Yne18AVU
	/9E2jhlJ4TzLJTZDCZ7/pLk7mqo654D8focQF3MPdVC24j98465ZGY1CxDUHdZu+DDCvfk
	fS4A/aLPr04ObLvP9EEn00xH0/QojMw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-E4fwzhm_NUeeyvaVMCjfUg-1; Thu, 08 May 2025 11:38:18 -0400
X-MC-Unique: E4fwzhm_NUeeyvaVMCjfUg-1
X-Mimecast-MFC-AGG-ID: E4fwzhm_NUeeyvaVMCjfUg_1746718697
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb5a03afdcso89198666b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 May 2025 08:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718696; x=1747323496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zah8ICy0Doer0Ijy3M3n6/uX4Bvln4wQcKl/L3riev8=;
        b=XsTe8i05qogIQPemxxpxWqdUIkd9nB8eTby7LeZSLsMcYzQ+zp+aR5Dutq23eMgj7p
         dToqkFpbIMmrZNblOMJtDqAPe5HBrobXdck2HRb/l1+80H3N5V3Xa4M2vXS4DOtBl2Af
         YQtqZG07AFH3uo2aZ5b7owNCPS/u9eUz20NSLYHE4Q5ZrYryzh8rM9XyWYN3vsO8e2dD
         EhznvBxFuRG8VHObZAhjU9YKOSZUJaDC1bVPszjRGuSZ/gQYWdPnJwi1adoecQrXZkqT
         oRQ0ncCmdzOg8GyTeWwrDvv68VTqXBNMtlvatmVbvasdzx5VADt2xgUNtQkkr8dg7JKv
         m0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVuIrFl31jNvGkHhIamrbQQTpxNYq0ZdPmP+HaVVa3y/kpxpJNA7XPEQmuPDvnOqELQSjDco8T5pGcxZFmJmPnAxVMH@vger.kernel.org
X-Gm-Message-State: AOJu0YyWA8KwszpgsqWH4tqwa1Vl0MZ9niNkaPsxwILKCqhL6R3PAesb
	qnfTqkNlJITXh2EnLPWWN5qC0KnaPUEmWbToY9o7vO6xHqZj/k2i4yT2LRSs3ve9PlqLBGPzAgp
	N2JKJKW0Ej3V75PJZIEbrcjkeH3MltuqPJn78NWughsSWNUMx+uPLoWw9HM7cSQwBS+dU9PM7eB
	wVJXM=
X-Gm-Gg: ASbGnctE5Hkl5nfRrhNOnPin8khh5z664EtX19BGa1mi82JEZEJHQiQ2ySx1PJ56XWW
	VJNl1y5Bqv6+Ad66WFsUaAiyQ3bUo5HEj/vi46bvO9EpWJMPs83m3sp8p1Tojl860yH1k3HiCFU
	9Q9MzZjiVz/SfYp5ThgouyK/Ov+416z46rLxwWEWqDMARC9zbzB99fCRxIIyubqMfgS7yPlF0Cm
	ByqZLuWlH38Q9aGRTNybvzMy6exJvFIjsSGmQVrFD7ssvi/UKNjLISBWUCmB5YxpBvxX7QyzLtr
	6zTBQKTXDnbBdoMjNGevW8x5z8QO7imTBuwyFiOecKT9NMI/MpSIEinhFQeSfjGpoa4WkoE1+n0
	+ah4fvXtIsHRl+2lBXgmYZiE0Pzp09Q0RSxus7wYehGkcp11nGG3E3g5ZVN64cQ==
X-Received: by 2002:a17:907:c717:b0:aca:d6f2:c39e with SMTP id a640c23a62f3a-ad219050108mr11598166b.23.1746718696161;
        Thu, 08 May 2025 08:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR/9XOm0biwaQbqFwHU9vQrmx7eOt8QvIVprAI7w9rV+fjT6BvjgYJwKaYDN6TmE7S2cw2og==
X-Received: by 2002:a17:907:c717:b0:aca:d6f2:c39e with SMTP id a640c23a62f3a-ad219050108mr11595866b.23.1746718695757;
        Thu, 08 May 2025 08:38:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197be8ffsm1093166b.155.2025.05.08.08.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:38:15 -0700 (PDT)
Message-ID: <f1e91522-60b3-4bdd-9e00-c32c1c1d1f4f@redhat.com>
Date: Thu, 8 May 2025 17:38:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <CAHp75Vf3jUuALHGk3fXEDRnWKh-z0prSgQ6sYhK_dcrxAiyEYw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf3jUuALHGk3fXEDRnWKh-z0prSgQ6sYhK_dcrxAiyEYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 4:55 PM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> This patch series does some small refactoring of the int3472 code to allow
>> re-using the sensor GPIO mapping code in the atomisp driver and then the
>> final patch in the series moves the atomisp driver over.
> 
> I just realised that the AtomISP variant is very likely a predecessor
> of INT3472, and hence a lot of code has to be shared between two.

Yes at least the sensor-module identification _DSM and the GPIO-type/map
_DSM have the same GUID. So the INT3472 device is clearly derived from
the atomisp case,

The weird thing is that the atomisp got a bunch of things more correct
from an ACPI modelling pov. The _DSM and the GPIO resources are on
the sensor ACPI-dev rather then a separate dev and regulators on the PMIC
are simply handled through ACPI power-resources rather then having the OS
have to figure all the PMIC stuff out like on IPU3 and IPU6 models with
a separate camera PMIC.

Regards,

Hans


