Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1D138C
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712723589; cv=none; b=dOQF0rQx8mLt7D2Z0j4lq63YO72FmkKEW3qLYBkQW0RcvT94AfwuxY7EmNQ1I5clix7STtvPwZHXAxUVNx/BuUkpzEpR4H7IypG0+Pl2TB+jKrjJRh3K9FSaxwsVJ/YVgHg24+wjEqounNNliHHVvqcqXSax32NwA9VXCy75tNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712723589; c=relaxed/simple;
	bh=h9tgpqXFJcK+DYD0n9TmnkJ3NShANOlEk6vqoLQFEyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfxL5dqkqYExKgdVJqLw6m2BvOpmNMatL2sc17ALp8If5GiKGFXtmWeGyrzaTvl+Wi/4Gmg0M8+Q1TQdhaX2ZU2w7l8DDrappLz0M/0OS9yxNG55J42ZzkBjAX3HrbdY850sruxfwPD+iEpDlsIjFqnCU5JO9gcDO9NilNbdnns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KzsJSAjP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KzsJSAjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712723586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D96eMegMNvGOobQPUAcgBWo3TgJJp8g0UMvgonFv028=;
	b=KzsJSAjPAf4Yjmr0qJPN7QMbg0BP8vGFckSJ9uHXj7sZma+B+toyDWAGcpytEVUtnKu2ci
	LyTg95ttt3pbK47Ul2TV/23s3/2f8E1mO+o128hkbKxVd8jjB5E0hUDKTVZOQBQHMU8Sik
	NocYG8cyQEkxgQYJuLIsvUhwCToasyk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-qnrG8vG9PP2-73ppQHV32A-1; Wed, 10 Apr 2024 00:33:04 -0400
X-MC-Unique: qnrG8vG9PP2-73ppQHV32A-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6ece7b7b44fso3980827b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Apr 2024 21:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712723584; x=1713328384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D96eMegMNvGOobQPUAcgBWo3TgJJp8g0UMvgonFv028=;
        b=GkPTz/ts3vl1m0FxaxSjPhvXstVmTmWpWAiT5N5XkAVFOLRqpAp3yRN+p6kxzVm8aJ
         FN/y4if/XZGKqdXxd6hs59Drv3Wns1+NBsAacz7/XgpUlmNO+UozSDBKtngr0t9EhgtT
         wZp6WJKdUDW/wtSQ6OK89nrqLbK89G+HBSJX8I4OwOOJ67Nr3At8FjviNyD+2L+YdJUq
         qaslvDxhjtLjRKLHC/BGhEW3IPdZUC5mFNehgTBAwNH2UMjEnWb/SfbmeJQ/6qwdfjua
         UkGW06WxsN9a9v08kd0rXr2NZVhjDWYo5qgw5pCzTD2tD4A2km/geaee8BHzB0NBtkhI
         DvhA==
X-Forwarded-Encrypted: i=1; AJvYcCVdp1J6PEr+0ityq/Nf3d21gaCOJ/K+qiIt7OJUJW1bJF7FtiltQ38HPb2JuEU+EJuP+Sp7KBz5Xbr7IDqD6yDqCZQNzkG8k17IIDoIhCqXnN8ucA==
X-Gm-Message-State: AOJu0Yym4ZFR29wlrR4nPAnm437pl1ZzMBgug0Qr5SAJzAuwn8dfWujQ
	nhGQSW64aNVJeJmsYmXpzjtEjlU4FWGMdgD2R7+lFru3tmSyVwdI27k1vMqXJcnX6ISXE+W0dF0
	SVXeR9USjDajg0OBXaBOrn+xpQ7A5wQGwGWHfl0gRDEc1Rh/eIWg1EnrWJHjJ9rf3G/G3Cgw=
X-Received: by 2002:a05:6a00:4fd2:b0:6ed:4b2d:a764 with SMTP id le18-20020a056a004fd200b006ed4b2da764mr7587759pfb.11.1712723583669;
        Tue, 09 Apr 2024 21:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx0Sz3ojTpctz7giTqqx2R5V+bbs742ef5vHqDuJyANeevjTVtDt6gkz7oZGO6GFvy6D5EOg==
X-Received: by 2002:a05:6a00:4fd2:b0:6ed:4b2d:a764 with SMTP id le18-20020a056a004fd200b006ed4b2da764mr7587733pfb.11.1712723583260;
        Tue, 09 Apr 2024 21:33:03 -0700 (PDT)
Received: from [192.168.1.240] (117-20-68-143.751444.bne.nbn.aussiebb.net. [117.20.68.143])
        by smtp.gmail.com with ESMTPSA id it24-20020a056a00459800b006e6be006637sm9251859pfb.135.2024.04.09.21.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 21:33:02 -0700 (PDT)
Message-ID: <5fe3b171-afc0-47de-802c-28470ce40674@redhat.com>
Date: Wed, 10 Apr 2024 14:32:56 +1000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
 <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
Content-Language: en-US, en-AU
From: Peter Hutterer <peter.hutterer@redhat.com>
In-Reply-To: <ZhXpZe1Gm5e4xP6r@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 11:20, Dmitry Torokhov wrote:
> On Tue, Apr 09, 2024 at 02:47:05PM -0700, Dmitry Torokhov wrote:
>> On Tue, Apr 09, 2024 at 03:23:52PM +1000, Peter Hutterer wrote:
>>> On 09/04/2024 09:31, Dmitry Torokhov wrote:
>>>> Hi Mark,
>>>>
>>>> On Sun, Mar 24, 2024 at 05:07:58PM -0400, Mark Pearson wrote:
>>>>> Add support for new input events on Lenovo laptops that need exporting to
>>>>> user space.
>>>>>
>>>>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>>>>> Add a new keycode to allow this to be used by userspace.
>>>>
>>>> What is the intended meaning of this keycode? How does it differ from
>>>> the driver sending BTN_LEFT press/release twice?
>>>>>
>>>>> Lenovo support is using FN+N with Windows to collect needed details for
>>>>> support cases. Add a keycode so that we'll be able to provide similar
>>>>> support on Linux.
>>>>
>>>> Is there a userspace consumer for this?
>>>
>>> Funnily enough XKB has had a keysym for this for decades but it's not
>>> hooked up anywhere due to the way it's pointer keys accessibility
>>> feature was implemented. Theory is that most of userspace just needs
>>> to patch the various pieces together for the new evdev code + keysym,
>>> it's not really any different to handling a volume key (except this
>>> one needs to be assignable).
>>
>> What is the keysym? If we can make them relatable to each other that
>> would be good. Or maybe we could find a matching usage from HID usage
>> tables...

There's a set of  XK_Pointer_ keysyms defined in X11/keysym.h, including XK_Pointer_DblClick1 and XK_Pointer_DblClickDefault.
Unfortunately they're not hooked up to anything atm, see this draft MR:
   https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/659
Because they're not hooked up anywhere they'll also need to be hooked into the client space, same as the various XF86FooBar symbols we've added over the years.

If we were to add KEY_DOUBLECLICK we can patch xkeyboard-config to bind that to the existing XK_Pointer_DblClickDefault symbol (it would get XF86DoubleClick assigned by the current automated scripts), so in theory that key would work like any other key with that symbol assigned.

> I was looking through the existing codes and I see:
> 
> #define KEY_INFO		0x166	/* AL OEM Features/Tips/Tutorial */
> 
> We also have KEY_VENDOR used in a few drivers/plafrom/x86, including
> thinkkpad_acpi.c and I wonder if it would be suitable for this vendor
> specific debug info collection application (which I honestly doubt will
> materialize).

fwiw, I suggested KEY_DOUBLECLICK because that is the action the user takes. Whether that starts a particular application is mostly a question of configuration, defaulting to something that emulates a double-click seems prudent though. And if someone wants to remap that to the compose key that'd be trivial too then.

Cheers,
   Peter

