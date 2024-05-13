Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48431153BC0
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715610190; cv=none; b=NhRrVebjra8r7j9xsi7xtPirkMoxVeVEupm87wiZzwdM9McStGu0cjCgUZBb8oAcFkshlpx7i/lTD/xaNNP75yZPagoh0TwBPyzm4cd2rwfXSL8kA7tVizI6v9ydvhCjL77V3zD4itc/w0oRgyV8fXZUcz8AKgcXOYPcRnku42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715610190; c=relaxed/simple;
	bh=HqEKRN1x+z9uWrF2wyGR0u28fRVe/zCiOgtWswaxYr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHeK17o0FnyggglekcRAEruxl2079slotqeUo2kglZFQetHlfVQqLpz8lpOo5FCHWle9vMwe00ZTHLgMHKdPRqqvNgDAXL8vJSYllu3w1VXKl97w/fD0nEQE3Mkb0P3AJ6eWVE3sr+i9X9U39jhEJkfhvKCFaQtPSam/Vr/u6rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eDEOONRw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eDEOONRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715610187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mp2/uEcW8J3ufrMRsZn04QMiS867qdRBetXsziR/dA=;
	b=eDEOONRwBebB08IS0uuXobTTPhqq1nBw+raxBkyHFyzkbKDR1wc4Es+7FBiUGIXa2HcyIU
	SpjICnaCYiCthd0DbU2twiK3gF3rF0NJDMAeLRqRZnWkBtMUjQJp2f+7UI0GuIA2RUCMjY
	VTsLlRm4kF80zjg0mzAAtcRJzEKqGko=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-rUY7IsBeMV2ykCVFv7lMMA-1; Mon, 13 May 2024 10:23:05 -0400
X-MC-Unique: rUY7IsBeMV2ykCVFv7lMMA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59bfd32b8fso257855566b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 07:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715610184; x=1716214984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mp2/uEcW8J3ufrMRsZn04QMiS867qdRBetXsziR/dA=;
        b=Kb4ikiPXIZbwLSKvr1WPiVDaP26mN+v1Y75jEPeo67wBOj0eA3/Y5qWnXdYRdJX7YB
         mJOaKqzE90kpN1pf32xn/PIh8sEPozW7pkrNrFKamF+hOgMrIfcXxHWRzT6MX/Se7yZb
         8wjkncEHFwSOLXM67x9fWZe+c+e7USDZk5pQQp30ecEdWGZ5qhGGVI78M2kiJul4oph8
         IGlYE9gLeNYZOLjsq97Q0U9b/RIolzvRUMKsL6oCiJETml86PMl/SpOFwW8mmv3QyrCS
         +ajDt+o4oJJ+sjZslnt4kKHgMNpfpmkg3cmAq7s/r9gfw3NQKSOql2s7DaIE19OrkCHF
         hkCw==
X-Forwarded-Encrypted: i=1; AJvYcCXSI/aUT6joJAluqdmiPhxJ7AGdZky8HQknxQI9R03VtdDOdRsaXT6TTsJcRqfDGaPGmDGjP4iR0MhfwgRKv9RhJrX3eNjRdRuvx+oywUk7E7j7Gw==
X-Gm-Message-State: AOJu0YyRiQuMgPyoj9ngczp9W7zDB3r5XhIThlPjrio159RRyynRAXIZ
	E+UQ1Uwa2wJW2NPafQgj0lYIh/v3adJwugNtP48S3AiDZtnCGjHGoMHFH6PHD54fQ0K5Vw5Ld8D
	9Ei5/1b0nCMd6xFuNXzR7uk1BfeVTjVXXR7dKzAPC7GicVkUbg3ylt0Tn3d5BpNt44+jzw1w=
X-Received: by 2002:a17:907:1b14:b0:a59:d0fc:7ac5 with SMTP id a640c23a62f3a-a5a2d57d672mr820645866b.32.1715610184450;
        Mon, 13 May 2024 07:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVN0vc57LoPdLZfWYzLvOZQKD2M+pPELYE6s6q6wWYzn0zFRMZsZFwbHBpAIHJcaRiF6d5ZQ==
X-Received: by 2002:a17:907:1b14:b0:a59:d0fc:7ac5 with SMTP id a640c23a62f3a-a5a2d57d672mr820643566b.32.1715610184092;
        Mon, 13 May 2024 07:23:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a5c930d2esm246003066b.93.2024.05.13.07.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 07:23:03 -0700 (PDT)
Message-ID: <9167c36f-9eac-49a3-a6d3-55f7fb9556c1@redhat.com>
Date: Mon, 13 May 2024 16:23:03 +0200
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
 <c9ec9611-615c-4a7d-9a72-89d6c7b4c680@redhat.com>
 <7163ebe9-6cca-c21f-78b7-e6aeda2961b3@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7163ebe9-6cca-c21f-78b7-e6aeda2961b3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/13/24 3:34 PM, Ilpo Järvinen wrote:
> On Mon, 13 May 2024, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 5/13/24 3:14 PM, Ilpo Järvinen wrote:
>>> On Mon, 13 May 2024, Hans de Goede wrote:
>>>> On 5/13/24 2:12 PM, Ilpo Järvinen wrote:
>>>>> On Mon, 13 May 2024, Hans de Goede wrote:
>>>>>> On 5/13/24 10:34 AM, Ilpo Järvinen wrote:
>>>>>>> On Sun, 12 May 2024, Hans de Goede wrote:
>>>
>>>>>>>> +
>>>>>>>> +		dell_bl->resp_idx++;
>>>>>>>> +		if (dell_bl->resp_idx < dell_bl->resp_len)
>>>>>>>> +			continue;
>>>>>>>> +
>>>>>>>> +		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>>>>>>>> +		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
>>>>>>>> +			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>>>>>>>> +				dell_bl->resp[dell_bl->resp_len - 1], csum);
>>>>>>>> +			dell_bl->status = -EIO;
>>>>>>>> +			goto wakeup;
>>>>>>>> +		}
>>>>>>>
>>>>>>> Why is the checksum calculation and check inside the loop??
>>>>>>
>>>>>> The loop iterates over received bytes, which may contain extra data 
>>>>>> after the response, the: 
>>>>>>
>>>>>> 		dell_bl->resp_idx++;
>>>>>> 		if (dell_bl->resp_idx < dell_bl->resp_len)
>>>>>> 			continue;
>>>>>>
>>>>>> continues looping until we have received all the expected bytes. So here, past this
>>>>>> check, we are are at the point where we have a complete response and then we verify it.
>>>>>>
>>>>>> And on successful verification wake-up any waiters.
>>>>>
>>>>> So effectively you want to terminate the loop on two conditions here:
>>>>>
>>>>> a) dell_bl->resp_idx == dell_bl->resp_len (complete frame)
>>>>> a) if i == len (not yet received a full frame)
>>>>>
>>>>> Why not code those rather than the current goto & continue madness?
>>>>>
>>>>> Then, after the loop, you can test:
>>>>>
>>>>> 	if (dell_bl->resp_idx == dell_bl->resp_len) {
>>>>> 		// calc checksum, etc.
>>>>> 	}
>>>>>
>>>>> ?
>>>>
>>>> Ok, I've added the following change for v3:
>>>>
>>>> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
>>>> index bf5b12efcb19..66d8c6ddcb83 100644
>>>> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
>>>> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
>>>> @@ -87,6 +87,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
>>>>  	dell_bl->status = -EBUSY;
>>>>  	dell_bl->resp = resp;
>>>>  	dell_bl->resp_idx = 0;
>>>> +	dell_bl->resp_len = -1; /* Invalid / unset */
>>>>  	dell_bl->resp_max_len = resp_max_len;
>>>>  	dell_bl->pending_cmd = cmd[1];
>>>>  
>>>> @@ -219,7 +219,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>>>>  		return len;
>>>>  	}
>>>>  
>>>> -	for (i = 0; i < len; i++) {
>>>> +	for (i = 0; i < len && dell_bl->resp_idx != dell_bl->resp_len; i++, dell_bl->resp_idx++) {
>>>>  		dell_bl->resp[dell_bl->resp_idx] = data[i];
>>>>  
>>>>  		switch (dell_bl->resp_idx) {
>>>> @@ -228,46 +228,41 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>>>>  			if (dell_bl->resp_len < MIN_RESP_LEN) {
>>>>  				dev_err(dell_bl->dev, "Response length too small %d < %d\n",
>>>>  					dell_bl->resp_len, MIN_RESP_LEN);
>>>> -				dell_bl->status = -EIO;
>>>> -				goto wakeup;
>>>> +				goto error;
>>>>  			}
>>>>  
>>>>  			if (dell_bl->resp_len > dell_bl->resp_max_len) {
>>>>  				dev_err(dell_bl->dev, "Response length too big %d > %d\n",
>>>>  					dell_bl->resp_len, dell_bl->resp_max_len);
>>>> -				dell_bl->status = -EIO;
>>>> -				goto wakeup;
>>>> +				goto error;
>>>>  			}
>>>>  			break;
>>>>  		case RESP_CMD: /* CMD byte */
>>>>  			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
>>>>  				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
>>>>  					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
>>>> -				dell_bl->status = -EIO;
>>>> -				goto wakeup;
>>>> +				goto error;
>>>>  			}
>>>>  			break;
>>>>  		}
>>>> +	}
>>>>  
>>>> -		dell_bl->resp_idx++;
>>>> -		if (dell_bl->resp_idx < dell_bl->resp_len)
>>>> -			continue;
>>>> -
>>>> +	if (dell_bl->resp_idx == dell_bl->resp_len) {
>>>>  		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>>>>  		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
>>>>  			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>>>>  				dell_bl->resp[dell_bl->resp_len - 1], csum);
>>>> -			dell_bl->status = -EIO;
>>>> -			goto wakeup;
>>>> +			goto error;
>>>>  		}
>>>> -
>>>>  		dell_bl->status = 0; /* Success */
>>>> -		goto wakeup;
>>>> +		wake_up(&dell_bl->wait_queue);
>>>> +		return i;
>>>>  	}
>>>>  
>>>>  	return len;
>>>>  
>>>> -wakeup:
>>>> +error:
>>>> +	dell_bl->status = -EIO;
>>>>  	wake_up(&dell_bl->wait_queue);
>>>>  	return i + 1;
>>>>  }
>>>
>>> Thanks, this is way easier to follow.
>>
>> I'm glad you like it.
>>
>> There is a little bug in this version though, the goto error on the checksum fail
>> case returns i + i, which should be i in that case, I'll just drop the goto there and
>> instead always use the return i already present at the end of the
>> "if (dell_bl->resp_idx == dell_bl->resp_len) { }" block.
> 
> It could have been solved more logically incrementing i and resp_idx here:
> 
> 		dell_bl->resp[dell_bl->resp_idx] = data[i];
> 		dell_bl->resp_idx++;
> 		i++;
> 
> so that the inconsistent state is eliminated.
> 
> I also realized (I know I was the one who suggested it) that reverse logic 
> would be better for the incomplete frame check:
> 
> 	if (dell_bl->resp_idx < dell_bl->resp_len)
> 		return len;
> 
> 	// checksum logic...
> 
> Perhaps the success and error return paths could then be merged too.

Interesting suggestion, I also realized that the 2 response-length checks are a
range check so I've folded those together. So here is what I have now for v3,
note that the i++ is now done when copying data over:

	i = 0;
	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
		dell_bl->resp[dell_bl->resp_idx] = data[i++];

		switch (dell_bl->resp_idx) {
		case RESP_LEN: /* Length byte */
			dell_bl->resp_len = dell_bl->resp[RESP_LEN];
			if (!in_range(dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len)) {
				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
				dell_bl->status = -EIO;
				goto wakeup;
			}
			break;
		case RESP_CMD: /* CMD byte */
			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
				dell_bl->status = -EIO;
				goto wakeup;
			}
			break;
		}
		dell_bl->resp_idx++;
	}

	if (dell_bl->resp_idx != dell_bl->resp_len)
		return len; /* Response not complete yet */

	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
		dell_bl->status = 0; /* Success */
	} else {
		dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
			dell_bl->resp[dell_bl->resp_len - 1], csum);
		dell_bl->status = -EIO;
	}
wakeup:
	wake_up(&dell_bl->wait_queue);
	return i;
}

Regards,

Hans

