Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1E152195
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606493; cv=none; b=VbGAT2W51674rkhcL4icTT7TZYD8O3m0V6NGPz0cuX0lLYpBDt2H+je/58GeH5fOl0DVXmiyT8AzNpDn+fxYrtlq9J6zK0KCvPtu87vTVJZ1/OAzRZGano7ePhbNKcgWz/uYgv+izJkwzXYWoFIkvGHZnyx7vwx5G2uYS63AIPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606493; c=relaxed/simple;
	bh=pSPf8Ya4jAqpRUEbsOi63Q72FMt9hoDpJ9qQl3K63h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMCWaIxl+0DlznKo7uHK1G7O6ljA6l1WA3QxaJhvo10KXhRWSTfd2eTOmwpETPWvty8vqkEICkJAsTImKYXQkhx6eyMXga0St/yBgz952oJ76SKRus0o23yooxzt3Y1hzVnuXidTn8ZmVrfZijsOu4OtLxVkY+uPS2RN5L72U0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eT4EBRLp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eT4EBRLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715606491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=miBTEp+pz9zfh0X37CZedTgZN6gOEycB10f5DtudF2M=;
	b=eT4EBRLp2YaTmWRo88YdWgZvU2R9/w4Lp1AO/uHFtGhHbe4QipuAbPFmM8XqAZpq5vnfDI
	6CXBRpU+HS1JfsSF15ZIc7KLFWTTKYH1t5srzlZohBNZ7ddf2yHU7Dsso3I6ExaT1D+eYI
	6S9Yaz4Ru8RJaPpMPZmcfKQ82Tx1kTU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-xMn-Uu9JNMKJJhs8PzSZxw-1; Mon, 13 May 2024 09:21:29 -0400
X-MC-Unique: xMn-Uu9JNMKJJhs8PzSZxw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5732229087bso2719345a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 06:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715606488; x=1716211288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miBTEp+pz9zfh0X37CZedTgZN6gOEycB10f5DtudF2M=;
        b=KDIvGxIesL8dk1gyw78V+EH4D+4MtXAMcZEuGw2udDWXX9bBZfYxvWdg1RlFZXQj+3
         hq+oZV175deYbFsDgnexUhu4nBwSSseUsZ0+/mGZXE7PNVtTNlC/cHgG5f1vxq+tBKPY
         ugwnVzQ08wlZarG7y8zs3Vlxez9SIuPDJxq88OflYQAAyTs42vLoMdY8DU9rMDwtdbmt
         cs+M4l7dQ/C6BK2tFgGBWfqvwc/pTviO8a/+0UmBT5C2MVeAmliYGOxxdyNttXEi2JsN
         gUa8Qa2nmxou8UzS9Vmd4KQKuYHYdClxggoFAatTszoD8nXfRFwwBa2Kt6Jj4hInYOoY
         CFQA==
X-Forwarded-Encrypted: i=1; AJvYcCWsd8rTiz4ePI9JYujbx9G7c2PQXumDhek1bntBM91xqbNwp0MKCL+ehUElcVoWPS7v306NheVpOGy5I6Fy/g9d9OwIJP5KGVKWoj93gdPOh/Q6NQ==
X-Gm-Message-State: AOJu0YzCl4D/HCkuRIXt6eM5x85vroa+hGNkomB68AmhXLh+r5JOe/Ib
	kjS3Uv1Jqjesgzqw1M+KgcOTvDEUZvlpN1rjnBVa/B+IeFmm6qCcvEUrEnpOA9Z8YWQnxGuWvsf
	fh0E1yVZ7LzE9ZyFs7xxUWzqONwBAn/WjPUEqF8iD7w9WXtrFhkm3FNazWtJy5zzLepDLZ5M=
X-Received: by 2002:a50:d7d8:0:b0:572:479e:9c23 with SMTP id 4fb4d7f45d1cf-5734d5ce195mr6858679a12.19.1715606488412;
        Mon, 13 May 2024 06:21:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcLPekujhY/Mi5MZw8WjtRi3MJ9n7oUTx2S6gyRNY7GPGbHSD7zwBVaJNfglOy6Qy36+xtg==
X-Received: by 2002:a50:d7d8:0:b0:572:479e:9c23 with SMTP id 4fb4d7f45d1cf-5734d5ce195mr6858659a12.19.1715606487997;
        Mon, 13 May 2024 06:21:27 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5735a4a485asm4738808a12.42.2024.05.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:21:27 -0700 (PDT)
Message-ID: <c9ec9611-615c-4a7d-9a72-89d6c7b4c680@redhat.com>
Date: Mon, 13 May 2024 15:21:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240512162353.46693-1-hdegoede@redhat.com>
 <20240512162353.46693-2-hdegoede@redhat.com>
 <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com>
 <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com>
 <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
 <7c535f53-5cca-4ac5-bcaa-f2f89d40f97d@redhat.com>
 <1c14872e-7b7d-b67f-9557-bd14fbe604d8@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1c14872e-7b7d-b67f-9557-bd14fbe604d8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/13/24 3:14 PM, Ilpo Järvinen wrote:
> On Mon, 13 May 2024, Hans de Goede wrote:
>> On 5/13/24 2:12 PM, Ilpo Järvinen wrote:
>>> On Mon, 13 May 2024, Hans de Goede wrote:
>>>> On 5/13/24 10:34 AM, Ilpo Järvinen wrote:
>>>>> On Sun, 12 May 2024, Hans de Goede wrote:
> 
>>>>>> +
>>>>>> +		dell_bl->resp_idx++;
>>>>>> +		if (dell_bl->resp_idx < dell_bl->resp_len)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>>>>>> +		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
>>>>>> +			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>>>>>> +				dell_bl->resp[dell_bl->resp_len - 1], csum);
>>>>>> +			dell_bl->status = -EIO;
>>>>>> +			goto wakeup;
>>>>>> +		}
>>>>>
>>>>> Why is the checksum calculation and check inside the loop??
>>>>
>>>> The loop iterates over received bytes, which may contain extra data 
>>>> after the response, the: 
>>>>
>>>> 		dell_bl->resp_idx++;
>>>> 		if (dell_bl->resp_idx < dell_bl->resp_len)
>>>> 			continue;
>>>>
>>>> continues looping until we have received all the expected bytes. So here, past this
>>>> check, we are are at the point where we have a complete response and then we verify it.
>>>>
>>>> And on successful verification wake-up any waiters.
>>>
>>> So effectively you want to terminate the loop on two conditions here:
>>>
>>> a) dell_bl->resp_idx == dell_bl->resp_len (complete frame)
>>> a) if i == len (not yet received a full frame)
>>>
>>> Why not code those rather than the current goto & continue madness?
>>>
>>> Then, after the loop, you can test:
>>>
>>> 	if (dell_bl->resp_idx == dell_bl->resp_len) {
>>> 		// calc checksum, etc.
>>> 	}
>>>
>>> ?
>>
>> Ok, I've added the following change for v3:
>>
>> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
>> index bf5b12efcb19..66d8c6ddcb83 100644
>> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
>> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
>> @@ -87,6 +87,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
>>  	dell_bl->status = -EBUSY;
>>  	dell_bl->resp = resp;
>>  	dell_bl->resp_idx = 0;
>> +	dell_bl->resp_len = -1; /* Invalid / unset */
>>  	dell_bl->resp_max_len = resp_max_len;
>>  	dell_bl->pending_cmd = cmd[1];
>>  
>> @@ -219,7 +219,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>>  		return len;
>>  	}
>>  
>> -	for (i = 0; i < len; i++) {
>> +	for (i = 0; i < len && dell_bl->resp_idx != dell_bl->resp_len; i++, dell_bl->resp_idx++) {
>>  		dell_bl->resp[dell_bl->resp_idx] = data[i];
>>  
>>  		switch (dell_bl->resp_idx) {
>> @@ -228,46 +228,41 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>>  			if (dell_bl->resp_len < MIN_RESP_LEN) {
>>  				dev_err(dell_bl->dev, "Response length too small %d < %d\n",
>>  					dell_bl->resp_len, MIN_RESP_LEN);
>> -				dell_bl->status = -EIO;
>> -				goto wakeup;
>> +				goto error;
>>  			}
>>  
>>  			if (dell_bl->resp_len > dell_bl->resp_max_len) {
>>  				dev_err(dell_bl->dev, "Response length too big %d > %d\n",
>>  					dell_bl->resp_len, dell_bl->resp_max_len);
>> -				dell_bl->status = -EIO;
>> -				goto wakeup;
>> +				goto error;
>>  			}
>>  			break;
>>  		case RESP_CMD: /* CMD byte */
>>  			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
>>  				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
>>  					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
>> -				dell_bl->status = -EIO;
>> -				goto wakeup;
>> +				goto error;
>>  			}
>>  			break;
>>  		}
>> +	}
>>  
>> -		dell_bl->resp_idx++;
>> -		if (dell_bl->resp_idx < dell_bl->resp_len)
>> -			continue;
>> -
>> +	if (dell_bl->resp_idx == dell_bl->resp_len) {
>>  		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>>  		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
>>  			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>>  				dell_bl->resp[dell_bl->resp_len - 1], csum);
>> -			dell_bl->status = -EIO;
>> -			goto wakeup;
>> +			goto error;
>>  		}
>> -
>>  		dell_bl->status = 0; /* Success */
>> -		goto wakeup;
>> +		wake_up(&dell_bl->wait_queue);
>> +		return i;
>>  	}
>>  
>>  	return len;
>>  
>> -wakeup:
>> +error:
>> +	dell_bl->status = -EIO;
>>  	wake_up(&dell_bl->wait_queue);
>>  	return i + 1;
>>  }
> 
> Thanks, this is way easier to follow.

I'm glad you like it.

There is a little bug in this version though, the goto error on the checksum fail
case returns i + i, which should be i in that case, I'll just drop the goto there and
instead always use the return i already present at the end of the
"if (dell_bl->resp_idx == dell_bl->resp_len) { }" block.

Regards,

hans


> 

