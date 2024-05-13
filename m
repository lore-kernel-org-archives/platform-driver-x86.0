Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF41A57CAF
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614406; cv=none; b=tV9giVqoZoRsiQERPNIS6Gal8cPFcPEFObGH42ZkNrlzqRS1P9FTWiokSWF364IjxkyHil/2Zpt1jZP3khg96dNEJOFmHSmRGw2Wyjobdut0WkdZKqBw1cQ/C8Hda2SYCCxfkmUqvbTz5MUagUxHPEFU2L7hnVuI9F3FCXY0ukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614406; c=relaxed/simple;
	bh=9AVgfTDkGEswF+DoceRMl8a4hnZJqoYMxn6rfwiRUP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4INULgcjwTxn46D0UmieMlbaATUz2YFQRQMZkchr5sv2dfqtR+GdX2vPqdiGawdg6xsg3zAq8SMn4RsFAXCgn6qqWqba1ZVPCzFPXPZqVAIlT3onRKng1wCi5WAIF3MavUmCv9N4jMcjcbzQTcjAkg3DR7Ofq0R6w1rKGRLtSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TSH8GOOh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TSH8GOOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715614403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85B8EEkExsbb6SV1Zkl/9DD+t/klIO06Uwr/CIyvVeM=;
	b=TSH8GOOhwKtHegWMFEqC4ToXElMZl4D1vaREZ88TOO9eSHrwdqVB3YSiBVcRjo3nWA6Ynl
	xgbAaxRM0TeqO7BzrSpaBQQcGzPcdLSQ31lv701OPs7qEZ8C5xkoqOwcZzrXR6QXYMYhaX
	p16NENeieo356tewwcL4x2Y1AJ/uoBA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-QvyaNLnsO96jkB-g5rrqVA-1; Mon, 13 May 2024 11:33:14 -0400
X-MC-Unique: QvyaNLnsO96jkB-g5rrqVA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-572f3859ff2so1756265a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 08:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715614392; x=1716219192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85B8EEkExsbb6SV1Zkl/9DD+t/klIO06Uwr/CIyvVeM=;
        b=UVqHgGmEokwp5z40k5kWDBpSWuh5FAiqhRrw0Gnu8MbgUkYn4pz7wdfIer/8KzCXy4
         Xu0T7WP/KI/9Cc/UAKpu1m8OW1ii4VLrHzAYl8O75ihsWaglrNpFgxmirBUgQ4NNQDyq
         r10uGxQOBQ7PUXDJl+iOjFUKtLI4RzxMNozNk2PBgcD6kuoqQeZmp+IwtbWDlh5n/zhm
         +WXrAGNbLLiUHSL1ug9Cfk/vChoHjQoYogGI8yfrlaG8ZiFTXpB3NXIkbFhXrc+gJ1S6
         CBYCRxg+2rCIHg78GCspQTqpE0sAaOAf04fXpCCRN0aBrEyNUIQ2fUdcJXN8HZYqlH8A
         S5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXEbK+ODIIOa9eVIUQceaLYmQ8THsvpmOQb1I01p/xNqOr8v+haau5h01nqpDQ2I9MyourYoZ8eAh1ZBkZCnCdcyzxE/97m+nhTeqrc8FFSxlBvlA==
X-Gm-Message-State: AOJu0YxPI1Z9iww/+VIyb+rhJZaA/w/NWuPD0bVp1DQXaWLRHMSdOOBl
	tqaEOT18CnHrORI4z37TOuzsXWrzF/K0RCWd1smWootILMIQSODAMrv+f4eye/cgnQl4EmyMec9
	JKg9LrT23/4DEyQVLuNm0h0it5a2uVz9IvMBh05W56iXLOhLD9qntsMWNDuxEpcV2o8hXahs=
X-Received: by 2002:a17:907:72d0:b0:a5a:5ecd:3744 with SMTP id a640c23a62f3a-a5a5ecd37damr342692066b.64.1715614392052;
        Mon, 13 May 2024 08:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED6k2/eAK60Uq9kitaOHz3oMSlJ9llXRBfDcGQtw8k/TrxYIwUWQ7Kv0ag8kTCX1LW3JpCoA==
X-Received: by 2002:a17:907:72d0:b0:a5a:5ecd:3744 with SMTP id a640c23a62f3a-a5a5ecd37damr342690266b.64.1715614391674;
        Mon, 13 May 2024 08:33:11 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b178b1sm610837166b.191.2024.05.13.08.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 08:33:11 -0700 (PDT)
Message-ID: <b1880f73-c8f5-4076-bb62-6c9ea620e99e@redhat.com>
Date: Mon, 13 May 2024 17:33:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight driver
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>,
 Roman Bogoyev <roman@computercheck.com.au>,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-2-hdegoede@redhat.com>
 <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
 <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
 <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/13/24 5:19 PM, Andy Shevchenko wrote:
> On Mon, May 13, 2024 at 03:18:10PM +0200, Hans de Goede wrote:
>> On 5/13/24 2:58 PM, Andy Shevchenko wrote:
>>> On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
>>>> +				const u8 *cmd, int cmd_len,
>>>> +				u8 *resp, int resp_max_len)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = mutex_lock_killable(&dell_bl->mutex);
>>>
>>> Can't be called via cleanup.h?
>>
>> I prefer to have the locking explicit rather then use cleanup.h .
> 
> Hmm... interesting, so you push-back the cleanup.h usage?

I'm in favor of the guard(mutex)(&smne_mutex); syntax, but this
is a mutex_lock_killable() for which that does not work AFAIK.

So in this case AFAICT we would need to use the cleanup stuff manually
and in that case I believe that in that case just sticking with
the current code is better.

> 
> <snip>
> 
>>>> +		case RESP_CMD: /* CMD byte */
>>>> +			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
>>>> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
>>>> +					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
>>>> +				dell_bl->status = -EIO;
>>>> +				goto wakeup;
>>>> +			}
>>>> +			break;
>>>
>>> No default case?
>>
>> Nope, this checks the validity of the first 2 bytes / the header. The data is not checked.
> 
> Why not
> 
> 		default:
> 			/* We do not check the data */
> 			break;
> 
> ?

TBH I don't see any added value in adding that.

> 
> ...
> 
>>>> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
>>>
>>> I would be on the safest side, i.e. not trusting that it will be NUL-terminated
>>> string, hence something like %*pE?
>>
>> Right, this is why the existing dev_dbg() already passes a precision and we do
>> want to actually stop if there is a 0 there, which %pE does not do.
> 
> I'm talking about the opposite, when it might go over the boundary.

AFAIK the way the precision is used in the current code limits things to at max the boundary,
stopping earlier if a 0 is encountered earlier.

Regards,

Hans


