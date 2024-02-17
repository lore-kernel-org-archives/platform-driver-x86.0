Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5941CFBE
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2024 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708162765; cv=none; b=ZxZKm/wQ70Q8patN48dDMJgYDNZ366uHhx1SmFLLVBBd1slJycTGRRaeSEUnVMUitQkyla4ksoATvWTGK2uhEUSzXkSTcdEhiUI2LjWfBx07YHR4uzsXud4yjc3zvTDE8jtsheteiA9ffhiXm4eNF6OXxqvwtxYyTEv/+zyDOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708162765; c=relaxed/simple;
	bh=a03t2nRfjKyTIklAu5cqpmOPhUg4sXgiIvX+jLA8onw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R86+y6IFVPvaBgcO8XD6ud0lAoEw6QDmVzKe4iQuWDzh5l3NaxHJag/xadSMvf5kVA+n8Zvoi1iLIDK7M9+RSqn/vvskRNJa5u/kOiCDXIHc4s3SqNG4AT0nV4VEe/Lh+4zuEi4K2ffkjVOa6PEGJ2ZGKioEsnC0cfaCTgX3gVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=buWFVdLx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="buWFVdLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708162759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MX9Wwr6QPCas9gQQNWcotvJptaNSA6EzCByhSRkjei4=;
	b=buWFVdLxpvwHVuTxo5LMdFLqegU7TDTgOGPTkX+O47Z+uPDp0wAHdaq8o/JO9dKZDmKjzP
	n+eTZw7RE+DndieyYOLvVN1w8o9Sz8chM/m2SHkXrmDY1INOpLo6y1sPTHs8V4bp8tOYnz
	d7z8WY9Pr/z6eQxEk4Kzs0q2mni2tXs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-jteYxOjVOw-0_tnqjBtXFQ-1; Sat, 17 Feb 2024 04:39:17 -0500
X-MC-Unique: jteYxOjVOw-0_tnqjBtXFQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-561601cca8eso1732350a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2024 01:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708162756; x=1708767556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MX9Wwr6QPCas9gQQNWcotvJptaNSA6EzCByhSRkjei4=;
        b=SwS7Z/+9yQyQwufKf2LvaBMdROBd05fQVi/UUOqofPzYfKzoiJsRYV5y5hETHzkSPx
         g4IBGZfsY+Y2+lzsUXDfatv7SNKL83mVrHBhNjzPkCwP4cFC7XtEezNzO+/BdpJXhbo4
         LM8/2YnJzvEcAhYs8d2KYtiIZNy3l3uWhE3ZybkGd1/XsH07QO5JDpuVN9eqxS9Y0V8n
         qSnqVhyfxFy55iM31djWial5gcFf/Inpl/8xiAYwy4fhn5+du9Gw3mZzcWqXrXs68P+N
         ZsZdlRXAtDoJ95MdEyKG2GSAnfqDiyVIsIJ8RD93JQuApcS75FB7MjZXLWLly/9CK0gT
         2OMA==
X-Forwarded-Encrypted: i=1; AJvYcCXnDgPb56ZZchLaB3EMRCPAfhteMXM1O3k19J+bvZHMl9pvdlrFCzxTuhb42+um/lxVuTey9ZbP/dsN/ug7xHoXrqUqpe8peVqljEEWsGk2F6ldjg==
X-Gm-Message-State: AOJu0Yxs8Yo69zsIgk3siPltdOl7s2KbPXRwvCaBurPsyyjRpMQAHM0G
	iD1Egbsksf6V2DgeLoevf3JsUyRrw61srMvRvWov48YaOQsVVirwI4R2sOGEy+LgQ73ouiv3bfj
	hLWiIJMbSjZ6ITi2rDzAl23J887zoIQlGN8iI2WuHa5T8SPrQAKoBvsPVb29UbFjMlMMzdC8=
X-Received: by 2002:aa7:d354:0:b0:560:4e74:9cf8 with SMTP id m20-20020aa7d354000000b005604e749cf8mr4810419edr.34.1708162756174;
        Sat, 17 Feb 2024 01:39:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC3RioWUNRKgtA9vo7sBhku6N1rpGOaTDRhubhV+wf/pZlN6CPWu0yoq79+sIPxLjSecWWgg==
X-Received: by 2002:aa7:d354:0:b0:560:4e74:9cf8 with SMTP id m20-20020aa7d354000000b005604e749cf8mr4810389edr.34.1708162755725;
        Sat, 17 Feb 2024 01:39:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c6-20020aa7d606000000b005621e66c8ddsm750172edr.17.2024.02.17.01.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 01:39:15 -0800 (PST)
Message-ID: <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>
Date: Sat, 17 Feb 2024 10:39:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Trolli Schmittlauch <t.schmittlauch@orlives.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
 <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
 <0a103f43-0340-4c01-8a26-ecdfc186915a@amd.com>
 <d20ee821-c0e8-43c3-944c-125bf4064a16@localhost>
 <687a566b-95cf-4fa6-bc8e-7ef0b0475a3f@leemhuis.info>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <687a566b-95cf-4fa6-bc8e-7ef0b0475a3f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 09:13, Linux regression tracking (Thorsten Leemhuis) wrote:
> [/me among others adds Shyam (author of the culprit) and Hans (committed
> it) to the list of recipients]
> 
> For the newly joined, this thread starts here:
> https://lore.kernel.org/all/ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost/

Thanks (1)

Trolli, there are 2 PMF fixes pending for 6.8, one of which is
suspend-resume related:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20240216064112.962582-1-Shyam-sundar.S-k@amd.com/
https://patchwork.kernel.org/project/platform-driver-x86/patch/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/

I plan to merge these and send them in their way to Linus next week.

Can you build a 6.8-c4 with those 2 included and see if that fixes things ?

You can download mbox files from patchwork and then do "git am <file>"
to apply them.

Regards,

Hans


1) Note I'm subscribed to the regressions list so I was already following this.




> On 17.02.24 00:26, Trolli Schmittlauch wrote:
>>>> Still, I had the time to bisect the vanilla kernel and landed at 
>>>> 7c45534afa4435c9fceeeb8ca33c0fdc269c2240 as the first bad commit.
> 
> Reminder, that's 7c45534afa4435 ("platform/x86/amd/pmf: Add support for
> PMF Policy Binary") [v6.8-rc1]
> 
>>>>  Could be a red herring though[]
>>> If this turns out to be accurate, it's actually quite interesting.
>>> You can prove it's accurate by doing a module blacklist for the
>>> amd-pmf driver (even on 6.8-rc4+).
>>>
>>> If that works, it's a great hint at the problem scope and we need to
>>> pull Shyam into the conversation.
>> I just checked this with Linux version 6.8.0-rc4 (nixbld@localhost) (gcc
>> (GCC) 12.3.0, GNU ld (GNU Binutils) 2.40) #1-NixOS SMP PREEMPT_DYNAMIC
>> Sun Feb 11 20:18:13 UTC 2024.
>>
>> Blacklisting the "amd-pmf" module indeed resolves the issue, good catch.
>> I've attached to s2idle logs of 4 successful cycles without amd-pmf. To
>> be honest, I don't know why the script considers the kernel to be
>> tainted. I have compiled the kernel via the NixOS packaging
>> infrastracture though without checking whether the distro applies any
>> patches, but a guix user had also confirmed the issue in the Framework
>> forum so I guess this issue is vanilla enough.
>>
>> Looking forward to resolving this. I guess for most use cases I can just
>> keep the module blacklisted for now?
> 
> Ciao, Thorsten
> 
> P.S.: To be sure the issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, the Linux kernel regression tracking bot:
> 
> #regzbot introduced 7c45534afa4435 /
> #regzbot title platform/x86/amd/pmf: system freezes after resuming from
> suspend
> #regzbot ignore-activity
> 

