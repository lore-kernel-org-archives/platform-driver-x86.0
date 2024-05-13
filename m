Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DCE147C78
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715598196; cv=none; b=juxPp8J0pDVUZ40sQUNGZ+dBDsgJ1Cdxtt2Z8Qa0LnFvTrTfVYZxRh79Y0SoPxa9CKnVwOpZoxv2b3qdYgQx+ciPNhWrHrJ0slTSbbjwU/gNEBhQSgaGzaW2QnORiwjCDMVzNjQaZPHJ3egDDfhSL6gAI5l9zcxMnZtxDySIDOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715598196; c=relaxed/simple;
	bh=J8GX5F3xXLLbVopa0orX+eWokDyD+nKM24CsLTuzFvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPqN8+q7GyS70S4CRRTRUnrzk12bnSqRiX6mQTfLhgFY3gOOp211LbDQUT8/WfdSyagniF8Bo9uTcg66+QtxCtExWZByBU8u4TxbsP2ctJLBtvQv7x76sdSfffNxci/IGItyvVsX5EH370B8+d8yJiztp2Ow7GLF8WL7B28hq/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hE3BqFA3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hE3BqFA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715598193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ntG3vcvnp96yL0pmixa5ceTQvekd15Mgj8G25V27DI=;
	b=hE3BqFA3yxJeIFZpdmueazdTDLv+NG9tCDm2A9Slm7mE1f+kD2hcfSTJ1roE3HGEbXJ1SD
	xdfmyZZTHPwI3lgc9oRHTfaQn8QJmYh2z1D1QNi0PO6KKi1Y6xzjx2HoPgHIGbaBPswgeN
	xxYXZYFwGCTBjgCKodlkxyU6G4aDd40=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-cS4Gc2e_NwuOkhYvJ8Tt1g-1; Mon, 13 May 2024 07:03:06 -0400
X-MC-Unique: cS4Gc2e_NwuOkhYvJ8Tt1g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59c2583f0bso238118966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 04:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715598185; x=1716202985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ntG3vcvnp96yL0pmixa5ceTQvekd15Mgj8G25V27DI=;
        b=ZxFx4qhDy6Va69qsEESzqRtUwIM5s80A23YdNBYdu+Um7ac5YZfLmZzSh71o+fiV8f
         Aphj5p1QKFkC/9ovtusxN4Qdnk6oL5ePGyDdDnPsX0hVUIfBxdrxIq36sGaFh9tZhdLD
         2IiRVsTCQEsA84WIuQiBeA6wnCLEcALJqpy+ElN7OvDKu+EsF5fiR664cDGDbzTTMcU4
         y54LRXmDJLrE2/6LlrSqb1LdUqB+y4E/TpsynZLkYOthat4IJQsekgMXceCklG9lKGtC
         HKd8sQqZPjZhtkS9UR+SUA/MXLTT4QFdccMMVClQxSrJjygAu7Uhr42C8I7iDEIaTbUq
         m/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWwW7d0yZ3L7Rz0wJJJ+Dku9brmUJ+1URz9OezU9xOfHWfdTb2iVRemfLtYoNOHAieRxmxwAB+eAyi+qRG5OoSWQuNoI7G1ZIW0UtxIb5VwuQAwEw==
X-Gm-Message-State: AOJu0YxUInYSY2QmSMxb8eKzZSZmWCadO14G1KffO3vsW3Ep1d/MP3Gx
	gtLBSY8F7wmdylfEd51uc3do+1wYqmKlsyg3o7agX0TQaRXMo8Oj1Lr/II2COppf+IB9PjYlL8p
	4wd+XqQQm6sSx7An5O/3HyPL7I6uI+7QAVhZy5MCfb/xovjOXFa/OLUbaOnd3hptihOiV4RJ4lY
	j9LuE=
X-Received: by 2002:a17:906:4886:b0:a59:a83b:d435 with SMTP id a640c23a62f3a-a5a2d55aa50mr597889566b.18.1715598185193;
        Mon, 13 May 2024 04:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW13mkQ5mX/77406WPvKpZRIizV+xh3dnj/ZZJspemwjZ5x7FAcnt6Kas/DIyuCgkwc0w90w==
X-Received: by 2002:a17:906:4886:b0:a59:a83b:d435 with SMTP id a640c23a62f3a-a5a2d55aa50mr597887766b.18.1715598184840;
        Mon, 13 May 2024 04:03:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01472sm582468766b.159.2024.05.13.04.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:03:04 -0700 (PDT)
Message-ID: <8f65b433-d823-4cf4-9614-8e18eda6c4e1@redhat.com>
Date: Mon, 13 May 2024 13:03:03 +0200
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
Content-Language: en-US
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

I have taken a look but this only seems applicable to tools which are listed in tools/Makefile
which includes scripts/Makefile.include. this are mostly tools which distributions may want to
package as part of a kernel-tools package. I don't expect distros to package this, so this
seems to not be applicable to this emulator.

Regards,

hans

