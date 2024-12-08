Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62914D456
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Dec 2024 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733667394; cv=none; b=uGkgA7YJl7x6JlgFsSk7lhOd0wCVAQxC8y8y9AVKun4uaMIVDDjX8gZHW7pzlF10OYLXUF/pl1DxQTJoWaglmhs3cP824qzOJmJQZPt1rhNnk0w1Gvr/VwTI+z7/n3FjYro1x9RWq2lIt8Iu/selzYZ72CQMSAoRgZIWiS/WJxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733667394; c=relaxed/simple;
	bh=qibCK1hvQJTJSeIn/wYbQXe8lTxlQDqbeqkYuYpAJio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXs0yyx9tgIgjdkuu8dr/uqfIHQZ76UpcKOJQYj8hWTIhZIumQ4NY+l5aOjskcxPNchf7Ftqdbjtx7BhmLnEqZsmq5c86FOKDwft849olSEKIB6vvu4TZtd/kC48uYWXu33ETGBaHph5HVlbGH6jUsul0HpUbH4iSqq0ksHvpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=goIM9CAZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goIM9CAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733667390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtgAYi3CZu7Gvu98RmmHunIM9V9jwYhq94mbfnzHUtk=;
	b=goIM9CAZXeEQXUM8nH6IzZbo0hRGEWUqLl1vpIA7x0oBWTZtHMAnQGPJpUl/x4DRBMEFXQ
	QoO7j5J+uia6nSG0m4fImQW+GWSZtH3kZ1Wei6behoFLGRLf0H59H41VS6OH78ziooKhvz
	/lJLjQ26G9sr70b/BgnpGDnMnOS2Qaw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-1tmy_MdMPyGuq5ZDR0-9Gw-1; Sun, 08 Dec 2024 09:16:29 -0500
X-MC-Unique: 1tmy_MdMPyGuq5ZDR0-9Gw-1
X-Mimecast-MFC-AGG-ID: 1tmy_MdMPyGuq5ZDR0-9Gw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6245a9625so242858766b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Dec 2024 06:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733667388; x=1734272188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtgAYi3CZu7Gvu98RmmHunIM9V9jwYhq94mbfnzHUtk=;
        b=tvJLIimXA+pbx1ifc4YVXaaZXzN7PuOix6ZGn5NZNT07HNayPBg8nykOTHHQRB4hpV
         ZyEhJnWrtum9eMbUWkSQxycE16ClG67ANhiPUPU7BbXHtxcym8cNTNxzUYU6Oy/eGxme
         d5tFGybU2Ph863wNtWWbQYW07gUvlXG1mZAWAErf2lz0FcBx3VW+qQbH3ZNIf64F/1sl
         ZoVY5xlVPVG43nV4snlUHT6NlT4oIueHeHHukgIsOmPFA3W7HuGhrueoiY15FrKYZzHB
         Kb5EKCjsiiIsusUH0nrMvRi3BrSqbgVJ9cTmU+gN1MrGBZnky3CkHlohewy+matxnnbr
         hhgw==
X-Forwarded-Encrypted: i=1; AJvYcCWkjeDGgCHqnf3k8qDIhb/q0d763hKd94ni6xQat8lIA5IrlIvDwKHGASvpKTyOhzEfP1sA1FKwLcaPBoMU8ZQT5X8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZVWR/XDNC8rDNWRHPApE1URWmUrHOD6Ou2Lvf+A1sylgMsJV
	n7aR0PfDUGRM9ZMTIyfrq3z7EKxZHHGgwRwVFarEH6NY/UzgU5VAJudLM04RBTE+F23lQ6/mryq
	Xn3aj7dTm71MMGCbLScqUpFfV823jGAghoP7uHRV4g+1EkuYQRQoOiqxSy3+godVSsjwImjo=
X-Gm-Gg: ASbGncsGv1/XxbTchBk0wl8KwDJK70dVN79+n5pdq6BOAGIfIRzA+PXIq7drS5eFToQ
	WKPXFcez6llrqviL3KiuRXXd4tkSTWJjNQsy32exVT17BjTrQ5+ZVj6ejA4vM+dqMq6el7Abvc9
	iqFplmUO1ksHN1E5Gi2C0JbYoZH9qwHhGZE/w8XlNKKAQnT6N5fAJ+xE3le0kOkwnLYrHJpKiBP
	0xRtDgljfo2Gbsvyq0L3lmrypCfzD7s4GOHPE0D8SXFGkYjyQ66r/Cd7S/6ePekgUJJk8kT9tue
	3jsfnA2m8Jaoxgv9lYdaQpL1dbxbshrVtssfV162gSP+i371GLxSxSrszj9mz5jFxhdFitkQh71
	ls/SPYOscLYGYQkCYn/Qsz7EV
X-Received: by 2002:a17:906:1da1:b0:a9a:161:8da4 with SMTP id a640c23a62f3a-aa63a2432c6mr755711466b.55.1733667388180;
        Sun, 08 Dec 2024 06:16:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmhMtD35zleacvwXr6JgM+PcmQ3SbsEH2hFGUGbs4AFOBfBdpkD+2qmVi2SiYfteP8ShniEQ==
X-Received: by 2002:a17:906:1da1:b0:a9a:161:8da4 with SMTP id a640c23a62f3a-aa63a2432c6mr755710266b.55.1733667387831;
        Sun, 08 Dec 2024 06:16:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa659f14faesm227061066b.101.2024.12.08.06.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 06:16:27 -0800 (PST)
Message-ID: <6c680113-72ef-4974-a518-3f14a510140a@redhat.com>
Date: Sun, 8 Dec 2024 15:16:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] platform/x86: x86-android-tablets: Make variables
 only used locally static
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20241204204227.95757-1-hdegoede@redhat.com>
 <20241204204227.95757-3-hdegoede@redhat.com>
 <Z1FsSKVp8SldyLre@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z1FsSKVp8SldyLre@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Dec-24 10:03 AM, Andy Shevchenko wrote:
> On Wed, Dec 04, 2024 at 09:42:13PM +0100, Hans de Goede wrote:
>> Commit 06f876def346 ("platform/x86: x86-android-tablets: Add support for
>> Vexia EDU ATLA 10 tablet") omitted the static keyword from some variables
>> which are only used inside other.c .
>>
>> Add the missing static keyword to these, this fixes the following warnings:
>>
>> drivers/platform/x86/x86-android-tablets/other.c:605:12: sparse: sparse: symbol 'crystal_cove_pwrsrc_psy' was not declared. Should it be static?
>> drivers/platform/x86/x86-android-tablets/other.c:612:28: sparse: sparse: symbol 'vexia_edu_atla10_ulpmc_node' was not declared. Should it be static?
> 
> I believe you can shorten these lines like
> 
>   .../x86-android-tablets/<and so on>
> 
> (Note '...' instead of PDx86 root path.)

Fine by me, note that the warning will still not fit on a single 75
char line then though.

Ilpo do you want me to send a new version of the series for this?

> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you.

Regards,

Hans


