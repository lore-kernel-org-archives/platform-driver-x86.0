Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2B420F06E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639433; cv=none; b=Y/0Urrz3O7/jcHEY12u169zqx3E5VT4HJx/W8MjxxMv93h3vWe31UInwV/dQ329DIk72oKo6qYqOtlwE2u7P6wadp1NyIPHdY4N8+dXuYk0e+qNICKpI2oIwHis23iaibltHDGWvBD3QM2C7XDnFdlmKa1J8FS8nV6oRXQ5EM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639433; c=relaxed/simple;
	bh=NOT055cwEg1QbuqgHvDilpED9o7SoWzt0s4LipQ9IqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGpjoyoPvCgpYGFzwnKVgPlvjEw+lYuzFE4dw1ZhFlVmPnFFKwkDzV5J6iaMiSZYka7yJHvmB1DGaq30h2uHTaPEH8dAZdVLr/HjOUtldMvG0YUOkbBlwdr6ewbJ0RLcJEfK7mW897RjO7svOig2Qvd35z3Wyr00jRejbsqIHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVnRLR4u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVnRLR4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737639430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQOul09Cztgd6QCo67y0M/CAweUIVpGf19UAkpGM7XA=;
	b=KVnRLR4umfTrVWummBygr7F+kNUUpQxov99LKo5F1p0bOd0ystSmDBOQWRYZiZfcyLKYy0
	Q9nZHLyigF8f0iv81FFVWjI3VMZApaob87nwytlNvosbpEHe5IPzdQB9mSi8NZ67JEqlll
	FiADQwr/DuoKmPIB69AcalmsE+/hq+E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-1OBuz-ceM3apaPtDFTtYmg-1; Thu, 23 Jan 2025 08:37:09 -0500
X-MC-Unique: 1OBuz-ceM3apaPtDFTtYmg-1
X-Mimecast-MFC-AGG-ID: 1OBuz-ceM3apaPtDFTtYmg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-388d1f6f3b2so416935f8f.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 05:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737639426; x=1738244226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQOul09Cztgd6QCo67y0M/CAweUIVpGf19UAkpGM7XA=;
        b=NUYz89YPMiSEbhPjbJN4OyaE6mZfoGhP35smqhpZfR6EmUJzv3mYLeQ5rxuLc8MGZ0
         /7DkAQwctrdX1a6l6Yjds+TEYhm84rftF2v3FqTsLYFwmT4qsBR+MOhTqjFnKycegCXJ
         LnTeuMBz7G/ysF3U8gRG2JHqFK1b983jxCFKq5Hhz6/Vgr3sbaJtPRUi/AwNjrJ2D3MR
         GEV3st1a8FR7qG854osOhfxySQ36XaC4uGK9TFYbTPVzubJg83efgzTtGdtQxp3YPVTe
         bJcZQh21KUWq/aNK0ogAZ65B8WVz8H79oMaj7YYJeqmZp2HiAwMpiw+zi5NbA6MiozGR
         z3jg==
X-Forwarded-Encrypted: i=1; AJvYcCWRb615WVp2FEGMKLaE6gHbu0PSL/1TNiAoft51H+zO7HAP2kQWwpLA35tXFc3efP4Dap1pi1asR4IRumGMYu5PfeSS@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjVb4l9xG3k9N3ijlakEJewm9RXG8yZGR0DNRtxNzMYK0L4Sg
	93CT6jXZjAAQ/ieI1zLc9CPeE2AVRsBlu6z8EX13dFKVtOk/89NNb975qKa68LvRLfGa2eaffLq
	Lj6Uur6ElGm/eL19clmbDLVFcZ3pak+xxgySwB1UbFWl7CMIKNElh3tQL7ioN51Sd3EwIKavDhr
	bhDgg=
X-Gm-Gg: ASbGncskLtV1rn6jXED93atS+M7Nex1VgulkAaRuqfF8N2XRdgewgBeAsNJ3/2/CbGB
	+eihtObFIgVAK+srReJLw5xuauWaIxf/71yh32f4y5YQh/6PLY+yWnF08aNolYIKAYcxu2/sIdk
	vYzGngwjluuTUtqv54jeJRY7bvt+UGBsZ/nPNSxaN4ZSpoZ7bbx0wPmgeI3FeEGZr3Tt17nHyUg
	6BbP4v/DfZXK5EMEc7x5O2GPTPfD9Od8nfBiU1Uoru5UUp8hjQ581HIXtutbvBR1OgbNpV2DYc7
	N9xdQjs0ojeTpoNov6R/LJ+JP/SlMwFd4si476JG8jEqQO3w+IN16V+pZPY/sl/UotAIWnWQUup
	4F5J/NjGJsB0A+Y/bYHKOOiRxqO9Uks7ujZbrXBgikeXD/ns=
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38bf5656b93mr23373420f8f.8.1737639426534;
        Thu, 23 Jan 2025 05:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXNPw/prl60ym9zrVU6V0PANh/AF90ItqKwWBFDMLateBji2TwIVkix0IJi3SHrOv29EnAOQ==
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38bf5656b93mr23373399f8f.8.1737639426220;
        Thu, 23 Jan 2025 05:37:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ac88sm19658204f8f.54.2025.01.23.05.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 05:37:05 -0800 (PST)
Message-ID: <17c7fb24-d12c-42c9-9ab1-dd8eac6ea9ac@redhat.com>
Date: Thu, 23 Jan 2025 14:37:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, linux-media@vger.kernel.org
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com> <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 23-Jan-25 10:14 AM, Sakari Ailus wrote:
> Hi Andy,
> 
> On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
>> On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:

....

>>> -	int3472_get_func_and_polarity(type, &func, &polarity);
>>> +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
>>> +				      &polarity);
>>
>> AFAIK, we don't have hard attachment to the 80-[character limit rule, please
>> use more room on the previous line.
> 
> There's no reason for the line to be above 80 characters.

I known that under drivers/media the consensus is to try and stick to
the 80 chars length limit. But under drivers/platform/x86 we have
embraced the new 100 chars limit and we prefer to use the full 100 chars
over unnecessarily splitting statements over 2 lines.

We are of the opinion that a single slightly longer line is easier
to read then a statement split over 2 lines, so please change this to:

	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &polarity);

Regards,

Hans



