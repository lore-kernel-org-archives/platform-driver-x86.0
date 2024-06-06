Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A517E8EB
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667629; cv=none; b=Bc7G+XHvQmBKDbsumGJbTL5AuGMYk1AYhFjM8TRgRjAOf5mebkGCXOntphrM6v1P2X6eK3KoCwm7YTATjtPvcG0S+EbUY8r507Wa82oGLPw25eRrCHxZX0pdyhxeD1lpCuQjwFvBSP5naStuq8/FVHfe40r1OfdUUVYSNtEGQig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667629; c=relaxed/simple;
	bh=OKrWD4tOdXVJBlVFBMqDGcjT1rYT3HlZVNBKuy96eA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dht2EzaZz4Jj9XpkUItcwI2qXsbhr+Tx6G4beBmBcWuPL8gwf+Oa5G337wK4rDWu4ojPdbxBltRF/wk1Nk7yrOSzPznLn2T5sFkzCncfXdzj5niUqX4pZ4J8ONXpipN2vWFMy05y8ZLYT24gKeu0wobw7T4xt6WdpxbFtVSUozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmJfYUqa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmJfYUqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717667627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9rUrzJjZko2Iw3f3+zK1QF9Mdz370vXHXH1MDphNK8=;
	b=ZmJfYUqagDjGk4QN5/lQc/IWpOptkj9A8WqeW5Xy2cKUPiZwK7hr+pY+/JkuXWm6vVw0tm
	ignpr4FJsF2CqAiarj/1wlQE0vONiblYFh1CZ0n7rvRIyl9Yrgzl7S6ajPW2g49DTbQklC
	5ILK6e3IGYvLoEVk87PiVvS4IaSBzOc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-XagK4KkeMQKe-fKn8tBTsA-1; Thu, 06 Jun 2024 05:53:45 -0400
X-MC-Unique: XagK4KkeMQKe-fKn8tBTsA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42120e123beso8149135e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Jun 2024 02:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667624; x=1718272424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9rUrzJjZko2Iw3f3+zK1QF9Mdz370vXHXH1MDphNK8=;
        b=j4n1IBvWDVZGR0t80cqKmbStFPwQdcRjytY5doMAa46qPIoIzQKOrGAl3+1Q8D/e6i
         iBvHdJYixcNxv9sjiB4F7AR+N9puccg02mrXWpaLYqqhlYwWbcnv1BKh/20gTABdZtan
         uw+juBOKTXmqCsojTjv4dd3nu00ZzAV9E/wL2mjjrZRmaIMzEjF8hMO6caC7glZwaslt
         WbzHxA4uk9oMqb06An/MSfUZfYhSGxXqrBHcLMp0PWGdoaC8P7DCiUxFOFQyKflMnslQ
         mNPW1hqOz2NGzA+Sc1bHyjCn66UEJptnhoWQH14s4lMW6N8OsmX1VRHiqNCUq9i4pdPN
         5+xg==
X-Forwarded-Encrypted: i=1; AJvYcCUrOLzU7O9uoESkodT+Ob0MNc5nLn97k0Md6vyhUJZFYAoZw3FQstFauN0SFH2YYT0i0W39PX9lJ5gDfkKGKvRG07DBRSb8Nd5k7znxLcvTQjav/A==
X-Gm-Message-State: AOJu0YzrJZ5OHYnDMEr3M3puIM/wXKVa6v/G8XdaQdH+jyZM5RPDOOiU
	4Rczahylt1fbRHpPwANX4/NRHT6M5U8hNWPC8AgHLutm9vF/zo8zMwi7J4+F31DFEY/jjg0XJRa
	Jxw3Lrc0DAn4GoAWTYF1DSJg4NDQWS3+fdgcydXoV+AVtMlsa5acr1JxAdJt31eEBQCa0LYY=
X-Received: by 2002:a05:6000:b41:b0:354:f8a9:351 with SMTP id ffacd0b85a97d-35e8406dd83mr4727355f8f.3.1717667624157;
        Thu, 06 Jun 2024 02:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF5gfi1+scnkAQWAZIkTvX0i5PmX29J29SdadoblzycAnzsfmoVfewxnuf+86GgbXImXCwgQ==
X-Received: by 2002:a05:6000:b41:b0:354:f8a9:351 with SMTP id ffacd0b85a97d-35e8406dd83mr4727337f8f.3.1717667623783;
        Thu, 06 Jun 2024 02:53:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8072a101sm72627566b.201.2024.06.06.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 02:53:43 -0700 (PDT)
Message-ID: <fc03506c-210f-4d79-9a99-8bc9b0587d25@redhat.com>
Date: Thu, 6 Jun 2024 11:53:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: "Luke D. Jones" <luke@ljones.dev>, Jiri Kosina <jikos@kernel.org>,
 ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
 <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>
 <dflqwdl4fo3wv4zjj4jl6sbot6cotscksgpyrbiu3j77lyrwal@s6nomonx4gv6>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dflqwdl4fo3wv4zjj4jl6sbot6cotscksgpyrbiu3j77lyrwal@s6nomonx4gv6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Benjamin,

On 6/6/24 10:49 AM, Benjamin Tissoires wrote:
> On May 29 2024, Hans de Goede wrote:
>> Hi all,
>>
>> On 5/29/24 3:28 AM, Luke D. Jones wrote:
>>> Changelog:
>>> - v1
>>>   - Split the patch in two
>>>   - Move function body to asus-wmi and export
>>>   - Use array of names and for loops
>>>
>>> History:
>>> - https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u
>>>
>>> Luke D. Jones (2):
>>>   hid-asus: use hid for brightness control on keyboard
>>>   hid-asus: change the report_id used for HID LED control
>>>
>>>  drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
>>>  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
>>>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
>>>  3 files changed, 75 insertions(+), 2 deletions(-)
>>
>> Jiri, Benjamin since the first patch now also touches pdx86 files
>> we need to coordinate merging this.
>>
>> There also is a long list of patches pending for
>> drivers/platform/x86/asus-wmi.c
>>
>> So I would prefer to take this series (both patches) upstream through
>> the pdx86 tree to avoid conflicts.
>>
>> May we have an ack from one of you for merging this through pdx86/for-next ?
> 
> Sure:
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Thank you for the ack.

> But I haven't seen the v2. Are you sure you want to take this series as
> it is?

No I plan to wait for v2, I just thought it would be good to have
an ack to merge this through the pdx86 tree beforehand.

Regards,

Hans


