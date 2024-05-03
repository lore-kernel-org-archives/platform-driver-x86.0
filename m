Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5C153584
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 May 2024 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744662; cv=none; b=orea3GZ4GNdL3cg7Z8tGtqpoUMHu8dX9MyRiUYB2Q7ZPxzj6Y1ZyF0VSY1vAGCUsnFOetyxMH6ubTtkTt30nbUpAY1LiY6361V55tKGskwJZLTTMfktLEDbN4fojklPjbWFyDax8rr6ein93Rrq5Ft58ZCrhHHSiNRZHqMdinW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744662; c=relaxed/simple;
	bh=c1otjCUr6/46Yb0CCCZ/Kv82KCQ+4RRahotV1mpW2bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmkOvgP3n5fiqhU+351pAkopuEurwkTxsX6Z5wrFUvzPT+U9iU7DVgnuBy98+1x1+uvY6l0UVVULxF9vme4NakONmURGr+dQrTahwBqZexrk9ABMIs5Rnvj/6uX0EG/y2gxGgSJxmP82CdUkuPXihgYNGgQtGHUAUimoKXITkLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dacXh2RZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dacXh2RZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714744659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHAnt3kV8i2lFHc2XkUBb5R3EM8KnMK0NS1IZLqYFQc=;
	b=dacXh2RZk5iwOQ6RPxXu/5gPD0ntfCdFVoL340LGMZgc2wp7V+ohdj7c5FY4CHrgVkTemG
	ZKeBFwJVmjFaUHbMa9bXDMjBHuLHbtAyzHecLYGiEppAbUkKJrN/Jziozm6saGzd/UjiQC
	W5CBy4+4acIiNGxOw4ubPwx4xU7OlSk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-_UJoO-6EO_SMmCbH5MlQVQ-1; Fri, 03 May 2024 09:57:37 -0400
X-MC-Unique: _UJoO-6EO_SMmCbH5MlQVQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-572a805f8fcso1627496a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 May 2024 06:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744656; x=1715349456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHAnt3kV8i2lFHc2XkUBb5R3EM8KnMK0NS1IZLqYFQc=;
        b=uV2+RDM5EQ95uQeA6twuW2lSLBO/g4VdGEYtAl5E5Bs5AGvNHKxg93WMrwFaYlOyh1
         LwLysLsgI4S5PvLWeB2J0LckBPkqcZQORK819IV0L7HrPC+SIje+5A+bCe4kbhl5yTbR
         s+MhS8OPEFBFgVmtC5Rrul3jGFjTLtiMw9IHL/hjPCgIHk6wsqNLYe1SRiy+MnXBZHHu
         Y2c1akqUeG+KszDKEretc8Dm38ikaaVQJ8bnePM0inNuJAg5EOLzycs4aTDDvqrfNsjk
         YAR9ZlvRkG9P5MCoefuXfZXKlRt2WxnEQ2YA7DcE0SONyPaw+zC8XxLNiy/yh9Vv7jKv
         EU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQDYgxaqRuBytfUG62yOCjzDgQTqIZj+K6emDg5lQ8eJN6hQwYQwALKVNZSvNjLC0HXlw3z1qj0kHc8NP5/it4zSvhy6Mo9MOCUu8VfHTfzFyDxA==
X-Gm-Message-State: AOJu0YzRg9DbBe5CMMOUVOgrl3fKK9Fm9mucbv+v6PM9Yq1ZYYTS63DL
	Kx+t7BQ/G8PTplXsx94dJB6eVyw+2uvjDB3mr2NvJ4EBGOnW8FTKWspCuS9/ulYcyFXeWl/lv9L
	8IbY3/szfLIJ1gBtSu4G3F5I3b3jK4lBxVsxSQYIXuigrSnrb07Hau+qB+8IFXnPrqDaYLWA=
X-Received: by 2002:a50:cd93:0:b0:572:4e6b:c31 with SMTP id p19-20020a50cd93000000b005724e6b0c31mr1712648edi.34.1714744656634;
        Fri, 03 May 2024 06:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsh5w9dz9XrIXDm8tg48qsQqC1SjQyRh4dvyIngfpi43NIJJn8TFScktjkZPnUKAHnLhEpw==
X-Received: by 2002:a50:cd93:0:b0:572:4e6b:c31 with SMTP id p19-20020a50cd93000000b005724e6b0c31mr1712637edi.34.1714744656304;
        Fri, 03 May 2024 06:57:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402074400b00572b2ad900fsm1684546edy.46.2024.05.03.06.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 06:57:35 -0700 (PDT)
Message-ID: <10b4ac92-dd72-445a-9727-f6e40c68b12a@redhat.com>
Date: Fri, 3 May 2024 15:57:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
To: Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kate Hsuan <hpa@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240502211425.8678-1-hdegoede@redhat.com>
 <20240502211425.8678-4-hdegoede@redhat.com>
 <CAHp75VdSHGXuvGtPBuQSeDLTg0FjPNStcgG3-p07cfVLi_D_YA@mail.gmail.com>
 <88d18069-3327-463e-afa6-b80645dfbb7f@redhat.com>
 <20240503070322.GA1227636@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240503070322.GA1227636@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/3/24 9:03 AM, Lee Jones wrote:
> On Fri, 03 May 2024, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 5/3/24 5:43 AM, Andy Shevchenko wrote:
>>> On Fri, May 3, 2024 at 12:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> The mutex must be initialized before the LED class device is registered
>>>> otherwise there is a race where it may get used before it is initialized:
>>>>
>>>>  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>>>  WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
>>>>  ...
>>>>  RIP: 0010:__mutex_lock+0x7db/0xc10
>>>>  ...
>>>>  set_brightness_delayed_set_brightness.part.0+0x17/0x60
>>>>  set_brightness_delayed+0xf1/0x100
>>>>  process_one_work+0x222/0x5a0
>>>
>>> ...
>>>
>>>> +       mutex_init(&chip->mutex);
>>>
>>> devm_mutex_init() ?
>>
>> That is not in Torvald's tree yet.
> 
> Neither is this.  :)
> 
> Since we're nearly at -rc7, I think it's safe to say you have time.

Ok I'll prepare a v9 with this addressed and Andy's Reviewed-by
added.

Regards,

Hans



