Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115545C18
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567729; cv=none; b=iwaBl/rZ4SGU3iMml5H8sFxccIjY5e5Fu1VMhIcVeAUuX+4E8o7GPgUJuONGvPb7teSdbp0LfuKQK6PTo/IS2+Ndhas6JFAh3itMpb5FVf9CS0QAMc+r8AQDuGVh+lUF2KfY5h2B+bDvSu6HEzQ9C7gttRIghMMShVs1H6+jOys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567729; c=relaxed/simple;
	bh=asGobc019j08RuOq7OP/wG0s8ZQ9xn2yL9smM3nJ+xU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUew6h5c9nIaUYLdnZahG8F1a5FaW3ESwR+cyh4le5iOsnxTYQtMkMdlAs5uvySY9mV90lm2Ou4m4cRoFhp4vXD1rHSLfh6aEZD7tB2w5qdvVSj9nZsQ0Y4K5VeF6b2e33+86kfISyD1i8rS9wL+CjLfUh/P4MvwLdYX1XXWMYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FJd5xn3g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FJd5xn3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712567725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8DmEdF9PVJOVunYZMZnW6a0uyQDKE4iSfKL1kTCHBE=;
	b=FJd5xn3gqi9P0sgbO7dwrJYPLkZfef+wiY66V/9jLEOMomfkug1uZe8+MZ16HACTTcHV3I
	KQ5tgQUPERrmJRD9uxU3Jbv52ieqr1QOy6TQLYpGWqUJL5C2VzbJssjVDaNKOzWrKJkPvB
	AV+WIjZntTegW5E6M/y30KD0xN0xVsQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-sCpFlnnkOP2rrmQqCHM_xQ-1; Mon, 08 Apr 2024 05:15:23 -0400
X-MC-Unique: sCpFlnnkOP2rrmQqCHM_xQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51b97efbb8so181725666b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 02:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567722; x=1713172522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8DmEdF9PVJOVunYZMZnW6a0uyQDKE4iSfKL1kTCHBE=;
        b=Xqy8ydll5ftwoV4EbpY9ldU6znDWpo6i6dspy1TKPuhNb6RlFKAW2i+lG58Rkdi5l6
         OEMPskgN3FbF12B3Z4lFBFlVGriZ7JpD/V0CQad8o6I/GDzhR9oD9kdIsJdILXxwCGqG
         fKx7td9XQI4mhGHnqbc1tEkJmu7AJJ6NBU0jl5W/vGEkEDPA9u6JD9xBicW+hNykRt2W
         50hlquE9FX1xzha5sTm/ovNxiEJc/yn90B3CYeiEu6mrazfdhBmPWG2AIq4ZZ9kqjpL7
         Ik1gb+A7DicHrXvsla2H1+2rVXtZ7qlwjuLqsA6vN61hVP/hXiCpZBBdLNKWnULO2tO1
         zckQ==
X-Gm-Message-State: AOJu0YwoypBmT8mBaO2wdEH1PUAAgUxqN58wYUYufoY44/6QdFcsx3m8
	BVX4oSvVxohjrcqijrL1uHgUt3F5o3JhT4grS2wwFOVDYm3AATKDeDM0tRQNP6Bd2Hpk4DGvG2V
	L+tNAEYtkjhLwWF7l66TMFn1B/bfObnFzaPiQpwnJKIblkxWHEKqHtGsgEF/YczyCFPRyKIo=
X-Received: by 2002:a17:907:ea2:b0:a51:b663:f562 with SMTP id ho34-20020a1709070ea200b00a51b663f562mr5716160ejc.38.1712567722588;
        Mon, 08 Apr 2024 02:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4KhbtGYWZidFk07omnOzdiC5kXr7j/whcyOw4N64xz0YmOnGmbb/MLD0IAXnUSEW/ifHkxQ==
X-Received: by 2002:a17:907:ea2:b0:a51:b663:f562 with SMTP id ho34-20020a1709070ea200b00a51b663f562mr5716143ejc.38.1712567722277;
        Mon, 08 Apr 2024 02:15:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709063fce00b00a4e8a47107asm4153521ejj.200.2024.04.08.02.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:15:21 -0700 (PDT)
Message-ID: <510b6294-c103-4975-aa4f-5fb396287eea@redhat.com>
Date: Mon, 8 Apr 2024 11:15:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: quickstart: Miscellaneous
 improvements
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20240327215208.649020-1-andy.shevchenko@gmail.com>
 <a2362908-feab-416c-b5ae-13d560089ee6@gmx.de>
 <CAHp75VcnsxanOpP+v+EFqpO1TLXyuz1_55Qvttrib9=T1Y1Y+Q@mail.gmail.com>
 <1ff02eec-084b-4d4b-9629-cd1a104e6213@gmx.de>
 <Zgb9vPkaR9V8hbic@surfacebook.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zgb9vPkaR9V8hbic@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/29/24 6:43 PM, Andy Shevchenko wrote:
> Fri, Mar 29, 2024 at 01:23:25AM +0100, Armin Wolf kirjoitti:
>> Am 28.03.24 um 09:50 schrieb Andy Shevchenko:
>>> On Thu, Mar 28, 2024 at 1:35 AM Armin Wolf <W_Armin@gmx.de> wrote:
>>>> Am 27.03.24 um 22:52 schrieb Andy Shevchenko:
> 
> ...
> 
>>>>> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>> that is the reason for removing this?
>>> Yes, it's a dead code. Likely the cargo cult line was copied from
>>> another driver.
>>>
>> In that case: Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> 
> Thank you!
> 
> You need to use a whole line for the tag.
> 
> P.S.
> It seems Hans hadn't folded anything from here, so I will send a patch
> (series?) next week.

Sorry about being a bit slow with merging this. I usually process
the pdx86 patch-queue on Monday and last Monday was a bank holiday.

I'm merging this (and the other quickstart driver fixes) today:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

