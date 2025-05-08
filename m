Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1222B8DB
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712606; cv=none; b=TkAN7kWN1Y6anPns+AQc0+yn0JXk/fCVVmTlyYdsfliKOE1yGlhP6rCqPdrGCMCriQrOVHxITeDupSBD9y//A/q+3knwwi7Z8ZFKFi4CfXZTo9Wka0T1mpb/3lmZEjGfrqJCufY32dCKAe25AQMApEGJ5w9qWg3BJwIy3t2hvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712606; c=relaxed/simple;
	bh=c6C0IDh8jGfLHYAmrhCgs46oNWjgnTtyZ8KVsxZOoT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHai0TqboktyQG5glPpWRNfijx1DFSIPLC5QK6fTFgs1htHxtNycZ0pbiPjo8jhhzNncjBuDQrMP7FM5MRYbwK8X3ZEkvfTnKFR83VwoLfsjKvGXnRPoH5WmcDcfMlYijDFgv+u0hqJGSsZzopivRhWKaSIzG6zX/626fyErark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjYb4tRx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjYb4tRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T8aqjWnvUph2fimAuP0M4LAoZzE8Kq74Pp22qiTivI=;
	b=cjYb4tRxQ39lG7WnJY0VcN3C3IwaAHpH4UaAGRNVLYN8mylRw5u2LEfG3Sx1XwQ9faIgRc
	dtqM5WA0cJz7T1ARkr7Jv7eQ/TTARPDADmkSv0MH7UPFufiT4gt4nA/4yBiHct5YlXPu3j
	iEa6UskiaQ+7vChcHIgNMuZZayx8fTs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-uTnFzd40MfqRKCKMp-hVxA-1; Thu, 08 May 2025 09:56:42 -0400
X-MC-Unique: uTnFzd40MfqRKCKMp-hVxA-1
X-Mimecast-MFC-AGG-ID: uTnFzd40MfqRKCKMp-hVxA_1746712602
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac710ace217so80421466b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 May 2025 06:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712602; x=1747317402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4T8aqjWnvUph2fimAuP0M4LAoZzE8Kq74Pp22qiTivI=;
        b=jBVs2L8o/ShLAxpnXn/tmqiwPZ+Nk483hZzasrHeCSX1e0izekAxyUMNLdPgICiuJn
         /FeGoMTmu9FRWGMp64psG5+t7Of7XJDy5gYOxudg4DeuRd9dDTUb1iSy4ktP109r9hpC
         7KrWubBohJM1sP4Iw2FOTVuM2Ib7XkFQ0YZtP4DPLcU7tLdSRfXq0e1m0zqAFnBiu2xD
         tz90pvebrCOLofXUEgj5Fis/qOInQwJ2TqIl1IK3esWFXmef851WRPw8VIC2sGHj/6gO
         6OKRoRtfnYDDUvnQYNZRNMisk2COsqsmOl43Pme+Wjz8KUaw0k6zd4M0CqtEFnNMrAg1
         3k8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7jDo/Axif0hQdVaR4fi5kjwEbYPGkqRxEz3RdJIuAuY3Aq0lX4W7lj6xRhmuMHEH5aaLjba2/NiMLZeweni0dLzCF@vger.kernel.org
X-Gm-Message-State: AOJu0YxYA0jbmFma3Ryc01aT6rHrNTcKQn5I1uMTvPzdVl6bXiJ4NoxV
	guvgM62jPUQ4jYUbYSme/jZG/vEs+k+2v9A4nS6XQkrSAZgR0rhJvr2nMXSxKiLXB5xpJZP7Lgm
	ds12gW5Y7dIX8qir6Kvhzmub6y7Akp/OcTE8JPrdU7bF9WK5/nOBjwFPTVtthC6EPSkH/IQ0=
X-Gm-Gg: ASbGncvajOMyfjhHk3pkWbvNKUFhrocFupHm8V3/i4hgpOzuNdhcBJFb/Z/UIBxyVAY
	XsKGnrD/t4I99Ru8O3NaEfZL8Y2cOUEB3Woef92P05xLc0cIgWo30r5B85Fzl0dwrku9lRWHjZV
	zm/u5YLM/rhimx+nqE0s42lIXYDGkcHBXG6kv5iH5ioOZjiC7MaqtGuYbIusg5LeZu6LVKkL2dc
	/ESMS0WuYH5ibog9zWQQ6RKTVIfaDpapA6VNqsgL6PGWx6RJb2EmkoxJlQJJT9lX1YpN35jE/k7
	JNgIfQ0WfGgDxwfE3Lx65XDFNI46fxaPUPWHy3pxkK2a3d0deIeqicOTTpcDDpxSD/hxAyvCu+S
	A+LWNekCku1fBpEmrZdMPAfOnul4fiT1RCE0TzEp1mEUxvWDQX5QzglkXXuifpQ==
X-Received: by 2002:a17:907:181a:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1fe6c087fmr295870566b.21.1746712601581;
        Thu, 08 May 2025 06:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHONZfcA79C9YJCxJXm9PYVFvyZiVs0xzW0M3ZiHJd3VPv1yoYEcXa7Qpf6U9oWkZRVxppOhg==
X-Received: by 2002:a17:907:181a:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1fe6c087fmr295867766b.21.1746712601203;
        Thu, 08 May 2025 06:56:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146d4dsm1096324666b.15.2025.05.08.06.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:56:40 -0700 (PDT)
Message-ID: <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Date: Thu, 8 May 2025 15:56:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
 <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
 <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 3:48 PM, Ilpo Järvinen wrote:
> On Thu, 8 May 2025, Hans de Goede wrote:
>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
>>> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>>>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>>>> driver.
>>>>
>>>> Besides avoiding code duplication the int3472 version of the code also
>>>> supports more features, like mapping the powerdown GPIO to a regulator on
>>>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
>>>
>>> ...
>>>
>>> Don't you need the Kconfig(s) update to have proper dependencies all
>>> over these cases?
>>
>> Yes I do, I thought about doing this already but forgot to actually
>> do it, thank you for catching this.
>>
>> When I've some time for it I'll prepare a v2 of just this patch
>> addressing this and your s/then/than/ remark.
>>
>> Since you and Sakari are happy with them patches 1-5 can be picked up
>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
> 
> Thanks for the quick reviews.
> 
> I took patch 1-5 into the review-ilpo-next branch with one typo in 
> change log fixed (reser -> reset).

Great, thank you!

Regards,

Hans


