Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73F4D5BD
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 19:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715543248; cv=none; b=e/kXW/UKprWXPnEJ7Mx5Mdn34+cn6m/ljvAzANKcCELTMCGMimhixKnvbkjdjPQueY2Gjs3j29wdNJSzFyo+3NZvGLYwErfRHogQz1TN7r7LkG3sU8avaHhuiHhlLN8vGQLkLbvEBDyx8xwJYlry+2ObkfrS17QX6Bb3e0zmH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715543248; c=relaxed/simple;
	bh=5AiGpkqU+isZ1rSCxr2Ap1gJEg4sPUIJfVelv8dEGNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lpupecib09osn65nMwq1K5uejwoIn62/S0yr9oIQAxvxT2qlFyZACfQoKf23IhW/KQgqu3hjIWF3RnNcPEULrbTIj2jBUoN8ROZDuQtXKhkSOfT3CARB67vm2L6SkGZxB+o71SSzK9VYkrsfp3x6v5ZGu0WUqjJ96RMWuVHqud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWLg50lT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWLg50lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715543244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CE7u7uIxgYcyylLEBqk2QgmaXCLwtIX8dPUDleBVYrQ=;
	b=JWLg50lTYHu+onXXMT/9vCCpgnwAFQt/5q1XLjNy5K2Vj7qBzCiZb8lc7tLA43LXuzVIWm
	Zc7PQVuIad64V9dPJ4f8AGzk9NqgtL2bYQKThIX0umdNYxnNMwp7AAPaQf3yysk2xwD1I5
	FiQpOHC7iDcXk4SXgXrcc/PTJkJqTaA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-q0RkpeYpP3GpDLe31doKTg-1; Sun, 12 May 2024 15:47:22 -0400
X-MC-Unique: q0RkpeYpP3GpDLe31doKTg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59ad2436f8so223616366b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 12:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715543241; x=1716148041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE7u7uIxgYcyylLEBqk2QgmaXCLwtIX8dPUDleBVYrQ=;
        b=rgSw6os8f9yCe1jwvApvvLyL+VOww5zFTzK//m1TjegIoUCZB0RTjDHUx0dyGHsrxc
         4No7ooDN74Q5f9SfY4By/8wSmvEcCSGWTnMqbg+0h7tebtBl4jq65eTiz9/H5lEW2uga
         3Ah+6Hd/hdQ4yFYQbZEvaKxcIjHw3sDrteu7GKlpSPNeAMRVGVP8LAEHAoEz3kDptUsU
         Pe6napoqXuYkHJlMGaS6kpOLHNXB68rllRebH9sBQJZEOaesUbSyT5L9Vw/5vdiPw2zy
         0GiyFtGezN7UeXgUKNM+CaovNQ4vCol6v1FPjHGXW3l+kakJyeu98cuIQB/FWj0NIyER
         dwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpa22XgfC/rUDwbfsxv2/HBvNUXHjHWnXTeseppO2x70twIfl346gnJaHZk5R+G56MUulrDiQwYCGEB/Sv+dBZIVHFx+lh73VOoUyzqfIrsRqsrw==
X-Gm-Message-State: AOJu0YwaJnC7MKFhKodBWgCDHvLb6IYsYEwv5rueQCtv5bh6z54Ytu+j
	Jny3g/15b8Y7bN+Actdi8trj3sGKjWgOwb31X4XtvWZZhiIpOqjL4uqLrUQoq8jJhz3UUuvGLl6
	PSsr6+ottQkY2eONJbtnygTqnJ2SQg0DQ3rw49GDbyfP3XDwns5l8jO0C0h2rplk7++FJZe8=
X-Received: by 2002:a17:906:2298:b0:a5a:3579:b908 with SMTP id a640c23a62f3a-a5a3579bb63mr439383966b.38.1715543240855;
        Sun, 12 May 2024 12:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvICpmQ4pD8hgqQPkZ6FdctCTO6NIy9ExknQMeYqrOOwtH57/OmXRPWNXyufSABNi1TZ/4Zg==
X-Received: by 2002:a17:906:2298:b0:a5a:3579:b908 with SMTP id a640c23a62f3a-a5a3579bb63mr439382966b.38.1715543240515;
        Sun, 12 May 2024 12:47:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a178a9f0fsm489436066b.69.2024.05.12.12.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 12:47:20 -0700 (PDT)
Message-ID: <ebd60bb3-fb6b-4f01-a513-5b3ee7d81b45@redhat.com>
Date: Sun, 12 May 2024 21:47:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools arch x86: Add dell-uart-backlight-emulator
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240512162353.46693-1-hdegoede@redhat.com>
 <20240512162353.46693-3-hdegoede@redhat.com>
 <CAHp75Vccu8gse93ZcYGq08eoMtJ5+vGTWOs2yvBkSSit783bzw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vccu8gse93ZcYGq08eoMtJ5+vGTWOs2yvBkSSit783bzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/12/24 9:32 PM, Andy Shevchenko wrote:
> On Sun, May 12, 2024 at 7:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Dell All In One (AIO) models released after 2017 use a backlight controller
>> board connected to an UART.
>>
>> Add a small emulator to allow development and testing of
>> the drivers/platform/x86/dell/dell-uart-backlight.c driver for
>> this board, without requiring access to an actual Dell All In One.
> 
> ...
> 
>> +++ b/tools/arch/x86/dell-uart-backlight-emulator/Makefile
>> @@ -0,0 +1,19 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Makefile for Intel Software Defined Silicon provisioning tool
>> +
>> +dell-uart-backlight-emulator: dell-uart-backlight-emulator.c
>> +
>> +BINDIR ?= /usr/bin
>> +
>> +override CFLAGS += -O2 -Wall
>> +
>> +%: %.c
>> +       $(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
>> +
>> +.PHONY : clean
>> +clean :
>> +       @rm -f dell-uart-backlight-emulator
>> +
>> +install : dell-uart-backlight-emulator
>> +       install -d $(DESTDIR)$(BINDIR)
>> +       install -m 755 -p dell-uart-backlight-emulator $(DESTDIR)$(BINDIR)/dell-uart-backlight-emulator
> 
> Is it possible to fix this to (at least) honour `make O=...` cases?
> (See, e.g., tools/gpio.)

I'll take a look at what the tools/gpio Makefile is doing.

> 
> ...
> 
>> +/* read() will return -1 on SIGINT / SIGTERM causing the mainloop to cleanly exit */
> 
> Interesting...  usually we handle error codes, such as EAGAIN and
> EINTR from read() syscall separately.

EAGAIN cannot happen since the fd is kept in its default blocking
mode. Other errors are also not expected to happen and would likely
lead to aborting the program anyway.

So just having an empty signal handler and then exit on the
EINTR error from read() is a nice KISS way to exit the main loop.

> 
>> +void signalhdlr(int signum)
>> +{
>> +}
> 
> ...
> 
>> +               fprintf(stderr, "Error opening %s: %s\n", argv[1], strerror(errno));
> 
>> +               fprintf(stderr, "Error getting tcattr: %s\n", strerror(errno));
> 
> (and so on)
> 
> Wouldn't perror() call be better?

perror() takes a fixed string, so for your first example it won't work since that
requires printf style formatted string support and once I made the choice there
to use fprintf(stderr, ) I used it everywhere for consistency.

> 
> ...
> 
>> +               switch ((buf[0] << 8) | buf[1]) {
> 
> byteorder.h is part of UAPI, you can use it, but OTOH it might be too
> complicated for the small thing like this.
> 
>> +               }
> 
> ...
> 
>> +       return ret;
> 
> Hmm... Hopefully you checked the possible returned codes, in user
> space it's only a positive 8-bit value used.

That is a good point, actually in normal use ret will be (len + 3)
from the last write() call done in the loop. So you're right that
needs some work.

Regards,

Hans


