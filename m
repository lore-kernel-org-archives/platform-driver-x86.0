Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028C201271
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063702; cv=none; b=rB3VWUDh3wFZzJ6PxI3h2pfRX/GrUVhLNKRAFBkIwtHQVdgRI0vabKX4i1plp6yIgfAsXRpIZ6UkiTRO3aEKerJ1hQoiQHgXjwtzRBzYkMLPax8tt7fjPYNW+UMV3gaNDru5qyKz/gLOdHmf3qDBWLrT5OuGj8tIBdfLwXIxW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063702; c=relaxed/simple;
	bh=vLZFLOpNyqcwLqtWy2kZAiZzRj6jnvuSGo5VfFpmTgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KxLzQamxV03G9aK8JMlNfOzjfAcH+fAiLp9sgl/fX0OpxMiPvYlpzQj0ez5IbcOLMKYMQZT+/j2QYYbgSecR1U5SSFav7SetMcTshiqmTwbKns6SwejbRrfg5vWxUK3p4jVaXpeaeUfvkwzuSLAPg5CVh01bmTD8RjQXuAppS60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e1ruX6y7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1ruX6y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740063699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0ZVoJBVUuph7FksXGULPqDRZsB0dlI9g/OwJ4sdyQU=;
	b=e1ruX6y7HaAzi72RP1BqIZLrpnBqWSmwLgnQM1VpvvBLkwp2zEv9vSflbkJOdisAd1Ch8g
	1jVoYTcEg34lKBA6BsXt1NG1TYpP5mQGfYVXY6gfw6Fir/3Ko+8UuZceK/lVG8qAq5xjje
	49xHZZx0lcrcF9/Dg23uSzvTWb139ZU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-nZClXtrvMVuUckFURue1Kw-1; Thu, 20 Feb 2025 10:01:32 -0500
X-MC-Unique: nZClXtrvMVuUckFURue1Kw-1
X-Mimecast-MFC-AGG-ID: nZClXtrvMVuUckFURue1Kw_1740063691
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-abbe5ac2e05so215163166b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 07:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740063691; x=1740668491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0ZVoJBVUuph7FksXGULPqDRZsB0dlI9g/OwJ4sdyQU=;
        b=QvQNOfhmyo+Rn4oxHYWjJi84Q+731PVl9ETBpyiFo7Yl/uzsjPMn7LsyNl70m0p26n
         BWZEHPR0Jka+flhqUnjbKI3eYn4F1bDdIQMzyU/U86R2Kx+bJ6gJJKz1R4BvluPBfLwu
         r4+K1Ssycr5XwbkH54LnAsWNlsSkJtOVaSo9vNRA4hd20rXmPjx/drBWgu+k2sAiEKqg
         Wi8lRskMPBnhhAgb+wJiz/qPUc3kHkJlJvMmGPDa15Ba0rDM7MU/I+axRcA77JnjUD4r
         H2PzSIi6E8SrGRzaq7Vv3IGZe16nTxmZuWEcDPu2NiZ681o9iU2H0JnGs7Sb2mUfzKs6
         EVcA==
X-Forwarded-Encrypted: i=1; AJvYcCWI+QwDsCtXokwoE92ELLfI8+ELeJIrJmsnDd5nSE4jnvvPEmOsOhwTCibjI+Q7p8UdjgZ0tWifIkm8gFz9JOlMnWgN@vger.kernel.org
X-Gm-Message-State: AOJu0YztyVdOn2jUxf70JrRR7vqGYC0iBsLd5dHRcMvnpU3VlvC8PJes
	W5OqV0vF96fhu5bm896BHWRd+HqEqoRFhlP7Y4MxxNv9HVGHDIzj3gFhkpKiJGbvf2eNlo38KBI
	nZyxBXxa23Duo39JlZeCT15e/tYUHcwYlBCtHoutFd/xMeXyeFOTF8fshtxcf3R9ufyAeI6g=
X-Gm-Gg: ASbGncsmcqpnoSCDlxJ3gLvUrOtRhfkYGY5alS7yyJZ93X9BslqDsS1OBUlAiAoCxV5
	ccda1qomgshOZh8gAd2cxIDpki+kxLZO4CZNNOR2cKKi8llS21/Qsrt3oqhJh+bfbh4piWM0Ys7
	WMM8x4PXGsTyv6qm+JJZ62uFg/mJKaYzcfVwiujPP8O3IWG8lv0NZzr0mGwRF2mxfk5Pxzat2aj
	zG0oz/VGmxlxfBbIu7GRQ4tZplDstmeg/Ud8DfVkzkg+bsmS3LQV0HGAnmTMgSK+0HaVBIN48bQ
	YeSis1via0Y2x/JIu979D/EdfY4Hp7f/FqYWwfpTJILXy/Ps0ETWWQEiELqDMwJqNExsQTtpTSq
	YVthv5Vrig6rjh2hAVIzeVxjmrXioGeQVVWh3Awv4/ao7nYcWSk5cF1w=
X-Received: by 2002:a17:907:3f12:b0:ab6:dbd2:df78 with SMTP id a640c23a62f3a-abbcd062a2bmr895621666b.35.1740063690146;
        Thu, 20 Feb 2025 07:01:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcZqiN8acQVCXMevh7y2ltA/OP5GO6kso9I8F4YhIdUUMpqIONbZG26TY27Xx8rrwlXOGgyg==
X-Received: by 2002:a17:907:3f12:b0:ab6:dbd2:df78 with SMTP id a640c23a62f3a-abbcd062a2bmr895589566b.35.1740063687861;
        Thu, 20 Feb 2025 07:01:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba8b1df9bsm682523966b.114.2025.02.20.07.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:01:27 -0800 (PST)
Message-ID: <710eaee1-0717-49e5-aec1-a50a0205fd3a@redhat.com>
Date: Thu, 20 Feb 2025 16:01:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
To: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>,
 ilpo.jarvinen@linux.intel.co, platform-driver-x86@vger.kernel.org
References: <bea773df-9fd0-455e-87c9-d46f9d5b6feb@d-systems.ee>
 <c455b3c7-f408-4d7c-979f-83f07f94e845@d-systems.ee>
 <e0f47976-622f-4903-98a4-ace0317dada1@redhat.com>
 <f28bbd5e-37ff-43ac-9338-8f5becb0c43d@d-systems.ee>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f28bbd5e-37ff-43ac-9338-8f5becb0c43d@d-systems.ee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 20-Feb-25 3:04 PM, Dmitry Panchenko | d-Systems wrote:
> Dear Hans de Goede,
> 
> Thank you for the reply and suggestions. I have obtained kernel sources using distro's packet manager (apt-get source linux-source) for the running kernel in order to build single module. Building the whole kernel on a super low-power device is not an option. The distro's source is not a git repository. Is it possible to provide patch without git? Or the only option is to git clone linux source, replace hid.c and git?

The kernel workflow is very much setup expecting that git is used.

As I mentioned in my previous email, I can take your patch, apply
it manually and then send out a new version in the proper git format-patch
format for Ilpo to pickup and merge that.

You will of course be kept as author of the patch and
your Signed-off-by will also be kept.

Shall I do this (send out a v2 with the proper format) ?

Regards,

Hans





> On 20.02.25 15:47, Hans de Goede wrote:
>> Hi Dmitry,
>>
>> On 19-Feb-25 11:08 PM, Dmitry Panchenko | d-Systems wrote:
>>> Hello,
>>>
>>> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events. Adding Surface Go 4 to button_array_table fix this.
>>>
>>> The patch is attached.
>>>
>>> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
>> Thank you for your patch. Unfortunately this is not in the correct format
>> for submitting patches. It is close though, good job for a first try.
>>
>> To turn this into a proper patch, make the changes from your attached
>> patch to a git clone of a recent kernel tree (e.g, Linus Torvald's tree)
>> and then after making the changes do:
>>
>> git commit -as
>>
>> and for the commit message use:
>>
>> """
>> platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
>>
>> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events.
>> Add Surface Go 4 DMI match to button_array_table to fix this.
>>
>> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
>> """
>>
>> and then do:
>>
>> git format-patch HEAD~
>>
>> to get a 0001-xxxxxx.patch file, followed by:
>>
>> git send-email 0001-xxxxxx.patch
>>
>> to send an email.
>>
>> Note this also requires that you first setup a ~/.gitconfig for your
>> name + email, as well as send-email config, e.g. I have:
>>
>> """
>> [user]
>>          name = Hans de Goede
>>          email = hdegoede@redhat.com
>>
>> [sendemail]
>>          from = Hans de Goede <hdegoede@redhat.com>
>>          smtpserver = smtp.corp.redhat.com
>> """
>>
>> Or alternatively I can send a v2 patch for your putting things in
>> the right format.
>>
>> Regards,
>>
>> Hans
>>
>>
> 

