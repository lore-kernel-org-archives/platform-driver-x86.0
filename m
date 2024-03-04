Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08290481B7
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562305; cv=none; b=gKn2HDOuUIY1qJXHWYMsFd84/OxuJoonSGoPfaNRNcZqgsu1hI14NSjmhIArIWoCDIk7SAyF8A5fh2rKFnUHwcPre8hdFAgS7Ub+ZKSu+PLbhZa0qilOv2heFnEPH4NXL0smoNyuvSXpfPc8qwSkCL0j6NnqlpcAWkJi34QKn40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562305; c=relaxed/simple;
	bh=YQ9NKviSJxS0RJmDBg1hhCeOBZWfpk3AufNhwkgg06A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYzVoUL35/Q91sdsIYsy/4Qr+jev14Xc4X1TrcQjsc6F2C3SSi/MX0XzFUCSddi9DSwkNDUaZrX2pJKvgRpz35D1df5P3x97GuI2Om8nSnwVBzINkg0EkvUd+cnHzYnYZA+yaXEYZwzzBe8JFGsbnxpC8hoAFY0bqd8JJ4qOBvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JT1o/Fz+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JT1o/Fz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709562302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGtc+XIMoLGSEPEOeiE2UoypYbns1xCmCnLrlDSYB4o=;
	b=JT1o/Fz+OvjD7nBqNLEtE/5Ja9EfYOFznEAywWqXornxYeaFk46w1HRLUlgPDFElLxorN3
	sdll1Rja57E1uOblOCku76pMKbCt77HhC0EkvCykAoFSnHeHkhKxpYD43Ph4nlQ8Gg++Wq
	ZsabW2jbS+kbLDtkVldTGSMzHQtiXEg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-NNatg2EFM1GGZFFZ-L_LNw-1; Mon, 04 Mar 2024 09:25:01 -0500
X-MC-Unique: NNatg2EFM1GGZFFZ-L_LNw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a44d0cb0596so152456466b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 06:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709562300; x=1710167100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGtc+XIMoLGSEPEOeiE2UoypYbns1xCmCnLrlDSYB4o=;
        b=MEPRZToZyOPCDKlTQRyVXog1MFC8WrU+FHaZo9SbQnpKRaiQYIPoryAD65eRQsdeeY
         XWBtTfP5MKvpk7icU62hCoABq/U4QWK9wTMWlE6+Trx3gAVlC4+7lfJlQmnQ8t8rCTUK
         3XCeX7pEDbbj0Hoxug03cTxdGXIMTI452eLzAF/qZI6/Wia42y7Pn8cWbgGs61FBnNAQ
         m6s22h0RouGwvBiU9VA8NDt71Uhwfllu3KtzzRWpAztPXrD8pdeqjjaIbGfunPuuMqTr
         08EEoG+pfwMmg8rurWb9gOqbmgAOpKGVSo37GqaELqASq+gnpuDLI2nXcav8vFSq3xgm
         G95Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAqaqpKhk/iLJYHY3xFtMOo4JmLT9DPoEEreGcebaIT53+fm2/mCMsdRjLRJGkGN62gyiK0uY5mxEpx/OnN6X+Qs2RUjGZtnV5z9WszN0W976qSQ==
X-Gm-Message-State: AOJu0YwCzu0i/y5gquIkz3kyZxlzzE9Xqrd6Sob/SpgN/jzWEEZxeBd3
	yWHL94tO7XaInat8i2R/+KG9DYwVXrbxIaeu9tBcZ2n92uoHZFQy0hbadcu7CLZBspjEoYGtxrO
	6m506MgFzi25nB+0t3YY1JRJSFHrOPJp4/tz5gllahCntf/LIX1zo0z9xLXEQ6KxjKmd2IbQ=
X-Received: by 2002:a17:906:844:b0:a44:442d:89b3 with SMTP id f4-20020a170906084400b00a44442d89b3mr5675713ejd.48.1709562299996;
        Mon, 04 Mar 2024 06:24:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG52JPEF49Ue9FqgX6eTg+CM3K5uTRVIUi7Nj78f956wp3hSFtKfG68F+Srdm8WP+GazJX8Hg==
X-Received: by 2002:a17:906:844:b0:a44:442d:89b3 with SMTP id f4-20020a170906084400b00a44442d89b3mr5675704ejd.48.1709562299700;
        Mon, 04 Mar 2024 06:24:59 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s22-20020a170906501600b00a42e2bc82dbsm4871387ejj.169.2024.03.04.06.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 06:24:59 -0800 (PST)
Message-ID: <3cb6a678-e1e6-4849-927c-5157e269b9c0@redhat.com>
Date: Mon, 4 Mar 2024 15:24:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: p2sb: Defer P2SB device scan when P2SB
 device has func 0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "danilrybakov249@gmail.com" <danilrybakov249@gmail.com>,
 Lukas Wunner <lukas@wunner.de>, Klara Modin <klarasmodin@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <gl7rsalwdwdo4rdes6akcnd7llrz75jjje2hchy5cdvzse6vei@367ddi3u6n2e>
 <a26554d3-bee9-4030-a06c-f886ba2fffb0@redhat.com>
 <r6ezdjqb5hz5jvvaj2beyulr2adwht2sonxw3bhcjdvwduyt66@2hlsmnppfsk2>
 <7935add6-a643-43dd-82a8-b7bcfb94d297@redhat.com>
 <6sbllfapnclmu5sjdtjcs4tyzkkr76ipg3i3rtqyyj7syhtkwd@d2l6zq2co7zt>
 <a5dac02b-c16a-45d1-8157-0dae1b034418@redhat.com>
 <d6a95bd9-dac2-4464-af84-9394a36b7090@redhat.com>
 <2c3gyhvwncqgfa6t3tb6fj3fk3nkbzpmlgfyzwjgwmmlnhxssu@d25ihdnpwado>
 <8afa1f78-8b89-4bbc-95e5-35eea76356e4@redhat.com>
 <ZeXWLVHxOAZCHoJZ@smile.fi.intel.com> <ZeXX37B1xT4bt018@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZeXX37B1xT4bt018@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/4/24 3:17 PM, Andy Shevchenko wrote:
> On Mon, Mar 04, 2024 at 04:09:49PM +0200, Andy Shevchenko wrote:
>> On Mon, Mar 04, 2024 at 02:59:57PM +0100, Hans de Goede wrote:
>>> On 3/4/24 1:13 PM, Shinichiro Kawasaki wrote:
>>>> On Mar 04, 2024 / 12:04, Hans de Goede wrote:
> 
> ...
> 
>>>> Thanks for sharing the insights.
>>>
>>> Looking closer at the actual unhiding I don't think accessing func 0
>>> is the problem. The unhiding is always done on function 0 even when
>>> retreiving the bar for function 2 (the SPI function).
>>>
>>> So taking that into account, as mentioned in the bugzilla, I think
>>> the problem is probing the other functions (1, 3-7) by calling
>>> pci_scan_single_device() on them.
>>
>> So, why we can't simply call pci_dev_present() on the function in a loop?
> 
> pci_device_is_present()

That takes a pci_dev as argument which we only have after calling
pci_scan_single_device() and the calling of pci_scan_single_device()
on some of the other functions is what is suspected of maybe causing
the issue.

Also it is likely that if pci_scan_single_device() is actually
a problem that then what is a problem is running it on an actual
present device. Devices which are not there also should not get confused
by trying to probe them ...

Regards,

Hans

