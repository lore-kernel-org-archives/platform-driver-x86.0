Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA9DF6C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605681; cv=none; b=WMfoH8/Gsdo2cft8s2Ey0QmSjgQf7giA2PWc3ocHWrbBqX0kgAIEczV0GZBUsYnR0Bc7dobupZS6yVHA/ZzyDIWIxfh2s9Yr+kJVLLn+6aiJVxsuswxWQR8sV/0czCC4vSIMOdUwXBk6JV7YWaO+LRi5gX0jRfo1R7Jzm9d9Acs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605681; c=relaxed/simple;
	bh=YlpW8gPFZOUyVOpzmedxNEEU6/9OEsL8gwjpNHCHNxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvK7NMPgv1fmAzp6phnNYHC7JjI2s+QT4dTU4v9xMV25wXxPNnDBhFDkY1k+r+G3KMbgDYEk62y2n54Xp5Pe3cDAFE0UfPk8Q6Q71rm2ICWclpO44FACa5lkfUE3gUQi17KjW+bXz8NUTH5MbmERZrbSdQElmLrCw9qDx3ickpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZLPDdha9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZLPDdha9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715605679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0k/Ljhs+eYUbFSPNwWL/w8faqYF0m5Lob2573u2Kfic=;
	b=ZLPDdha9eVpVll8z5mcAWLptJEUPaFWv1M+koZDgaB+H6yPAElcLxdfOxhuOVscY85Q6Yw
	ayqOXvNV41m/Ct7W2BYQ3fZdNxSN25Djo7fmKZ+VSUYAccBIlq42MyGxWJYrMeqQhAx56/
	TTKo1eSsldwOj5k4Vk4xRvj/rzwwb6k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-S6wddSQ0NRemTebZJ6JJ1g-1; Mon, 13 May 2024 09:07:57 -0400
X-MC-Unique: S6wddSQ0NRemTebZJ6JJ1g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a59c942611bso263393766b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 06:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715605676; x=1716210476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k/Ljhs+eYUbFSPNwWL/w8faqYF0m5Lob2573u2Kfic=;
        b=dsqwLM7hM4B1fOi+GeZaOXMvAewFNrJLp0B6A2itVv4Y8+XwK396aZra3UzzmFls1w
         X4QVK3LwORIuRx5UMxjiLQqS8/KZs1RcJNHSqtV+e1zvuONQ7g3bNT0vhFb/abjFUg3V
         cXXIblsHWhltfSo6+iAvU2N8AtdoJisdh9Q/l4hBw3tvQXUynOjdRA4JQstEqUufQ4jP
         mLizQqMHTA63RKc0dUXze+SzxDu8oUN5Ez9DORWCbaoXA8MCFoKCaLyKArtSstW2Q7B+
         dlLdb5QVi33gQH5lZBYKAGyu2z+WbdL0rfYaJBNIKtyzrBu6247l+eT5M0whTEv2K/dO
         1j6A==
X-Forwarded-Encrypted: i=1; AJvYcCXpUzk4n+qvI8nvURidhdXtViQUkXD+G+wC3TI/3MuaxU2LPCGj4xJpa8NOvpfiOGOq5fL8aUugkPoWyHJpUSqWJQWxKpM03EnWLyu2gkuJh6WG7w==
X-Gm-Message-State: AOJu0YwXlHfpqh5teNAY9elFv7FpTGhA6NBVvPlWHcrp24g26mgIWzVe
	zlyqZvZJ/UFfV6RbaOXC6s9RSoZzLWkhly0cIJ3sonA3dE0C67Ttqe9Rt0PNxJFO9rpc6eUn5+s
	LfqNfSxBqaTA4Mv+Bs1n+dbF2neUQFytO/Z7s0k0akjSpQSbex9YDAfDhw7wAUWHeKmOReHwYWs
	04nRM=
X-Received: by 2002:a17:906:f592:b0:a5a:1562:518d with SMTP id a640c23a62f3a-a5a2d53b998mr853635966b.14.1715605676333;
        Mon, 13 May 2024 06:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUsvrAahNLEhXh6/OZpnVRGTc+hlb6YjuFwtUSwCNovEcWkLWpc2C9IYFcVJ9XmWhyzZeGZw==
X-Received: by 2002:a17:906:f592:b0:a5a:1562:518d with SMTP id a640c23a62f3a-a5a2d53b998mr853631666b.14.1715605668885;
        Mon, 13 May 2024 06:07:48 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0125bsm605722066b.143.2024.05.13.06.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:07:48 -0700 (PDT)
Message-ID: <7c535f53-5cca-4ac5-bcaa-f2f89d40f97d@redhat.com>
Date: Mon, 13 May 2024 15:07:47 +0200
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
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/13/24 2:12 PM, Ilpo Järvinen wrote:
> On Mon, 13 May 2024, Hans de Goede wrote:
> 
>> Hi Ilpo,
>>
>> Thank you for the review.
>>
>> On 5/13/24 10:34 AM, Ilpo Järvinen wrote:
>>> On Sun, 12 May 2024, Hans de Goede wrote:
> 
>>>> +	u8 resp[3];
>>>> +
>>>> +	set_brightness[2] = brightness;
>>>> +	set_brightness[3] = dell_uart_checksum(set_brightness, 3);
>>>
>>> Also, couldn't these be accessed through a struct to eliminate most of the 
>>> magic indexes?
>>
>> With the checksum at the end, this would require a VLA in the middle
>> of the struct (get_version return buffer contains more then 1 dat byte)
>> We could treat the checksum as an extra data byte, but then we are
>> mixing struct usage for some fields + using an array of bytes
>> approach for the data + checksum. For consistency I prefer to just
>> stick with one approach which means using the array of bytes approach
>> for everything.
> 
> Ok.
> 
>>>> +	const u8 get_brightness[] = { 0x6A, 0x0C, 0x89 };
>>>> +	u8 resp[4];
>>>> +	int ret;
>>>> +
>>>> +	ret = dell_uart_bl_command(dell_bl, get_brightness, ARRAY_SIZE(get_brightness),
>>>> +				   resp, ARRAY_SIZE(resp));
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (resp[0] != 4) {
>>>
>>> sizeof(resp)
>>
>> Ack.
>>
>>> but isn't this already checked when reading it??
>>
>> No dell_uart_bl_receive() checks that the response will fit in the supplied
>> buffer and that it has a valid checksum but the controller may send a
>> response smaller then the passed in buffer and it will actually do this for
>> the get_version command.
> 
> Ah, I see now that it checked against constant rather than the actual 
> value.
> 
>>>> +		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
>>>> +		return len;
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < len; i++) {
>>>> +		dell_bl->resp[dell_bl->resp_idx] = data[i];
>>>> +
>>>> +		switch (dell_bl->resp_idx) {
>>>> +		case 0: /* Length byte */
>>>> +			dell_bl->resp_len = dell_bl->resp[0];
>>>> +			if (dell_bl->resp_len < DELL_BL_MIN_RESP_SIZE) {
>>>> +				dev_err(dell_bl->dev, "Response length too small %d < %d\n",
>>>> +					dell_bl->resp_len, DELL_BL_MIN_RESP_SIZE);
>>>> +				dell_bl->status = -EIO;
>>>> +				goto wakeup;
>>>> +			} else if (dell_bl->resp_len > dell_bl->resp_max_len) {
>>>> +				dev_err(dell_bl->dev, "Response length too big %d > %d\n",
>>>> +					dell_bl->resp_len, dell_bl->resp_max_len);
>>>> +				dell_bl->status = -EIO;
>>>> +				goto wakeup;
>>>> +			}
>>>> +			break;
>>>> +		case 1: /* CMD byte */
>>>> +			if (dell_bl->resp[1] != dell_bl->pending_cmd) {
>>>> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
>>>> +					dell_bl->resp[1], dell_bl->pending_cmd);
>>>> +				dell_bl->status = -EIO;
>>>> +				goto wakeup;
>>>> +			}
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		dell_bl->resp_idx++;
>>>> +		if (dell_bl->resp_idx < dell_bl->resp_len)
>>>> +			continue;
>>>> +
>>>> +		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>>>> +		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
>>>> +			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>>>> +				dell_bl->resp[dell_bl->resp_len - 1], csum);
>>>> +			dell_bl->status = -EIO;
>>>> +			goto wakeup;
>>>> +		}
>>>
>>> Why is the checksum calculation and check inside the loop??
>>
>> The loop iterates over received bytes, which may contain extra data 
>> after the response, the: 
>>
>> 		dell_bl->resp_idx++;
>> 		if (dell_bl->resp_idx < dell_bl->resp_len)
>> 			continue;
>>
>> continues looping until we have received all the expected bytes. So here, past this
>> check, we are are at the point where we have a complete response and then we verify it.
>>
>> And on successful verification wake-up any waiters.
> 
> So effectively you want to terminate the loop on two conditions here:
> 
> a) dell_bl->resp_idx == dell_bl->resp_len (complete frame)
> a) if i == len (not yet received a full frame)
> 
> Why not code those rather than the current goto & continue madness?
> 
> Then, after the loop, you can test:
> 
> 	if (dell_bl->resp_idx == dell_bl->resp_len) {
> 		// calc checksum, etc.
> 	}
> 
> ?

Ok, I've added the following change for v3:

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index bf5b12efcb19..66d8c6ddcb83 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -87,6 +87,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
 	dell_bl->status = -EBUSY;
 	dell_bl->resp = resp;
 	dell_bl->resp_idx = 0;
+	dell_bl->resp_len = -1; /* Invalid / unset */
 	dell_bl->resp_max_len = resp_max_len;
 	dell_bl->pending_cmd = cmd[1];
 
@@ -219,7 +219,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 		return len;
 	}
 
-	for (i = 0; i < len; i++) {
+	for (i = 0; i < len && dell_bl->resp_idx != dell_bl->resp_len; i++, dell_bl->resp_idx++) {
 		dell_bl->resp[dell_bl->resp_idx] = data[i];
 
 		switch (dell_bl->resp_idx) {
@@ -228,46 +228,41 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 			if (dell_bl->resp_len < MIN_RESP_LEN) {
 				dev_err(dell_bl->dev, "Response length too small %d < %d\n",
 					dell_bl->resp_len, MIN_RESP_LEN);
-				dell_bl->status = -EIO;
-				goto wakeup;
+				goto error;
 			}
 
 			if (dell_bl->resp_len > dell_bl->resp_max_len) {
 				dev_err(dell_bl->dev, "Response length too big %d > %d\n",
 					dell_bl->resp_len, dell_bl->resp_max_len);
-				dell_bl->status = -EIO;
-				goto wakeup;
+				goto error;
 			}
 			break;
 		case RESP_CMD: /* CMD byte */
 			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
 				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
 					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
-				dell_bl->status = -EIO;
-				goto wakeup;
+				goto error;
 			}
 			break;
 		}
+	}
 
-		dell_bl->resp_idx++;
-		if (dell_bl->resp_idx < dell_bl->resp_len)
-			continue;
-
+	if (dell_bl->resp_idx == dell_bl->resp_len) {
 		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
 		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
 			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
 				dell_bl->resp[dell_bl->resp_len - 1], csum);
-			dell_bl->status = -EIO;
-			goto wakeup;
+			goto error;
 		}
-
 		dell_bl->status = 0; /* Success */
-		goto wakeup;
+		wake_up(&dell_bl->wait_queue);
+		return i;
 	}
 
 	return len;
 
-wakeup:
+error:
+	dell_bl->status = -EIO;
 	wake_up(&dell_bl->wait_queue);
 	return i + 1;
 }

Regards,

Hans



> 
>>>> +		dell_bl->status = 1; /* Success */
>>>> +		goto wakeup;
>>>
>>> Huh? Now I'm totally lost how the control flow is supposed to go in this 
>>> function. Can you rethink this loop so it actual makes sense and doesn't 
>>> misuse gotos like this?
>>
>> This is the receive() callback from the UART the loop consumes bytes received
>> by the UART. The gotos stop consuming bytes in 2 cases:
>>
>> 1. An error (unexpected data) is encountered.
>> 2. A complete frame has been successfully received.
>>
>> The checking of the checksum + goto wakeup at the end of the loop is for 2.
>>
>> The:
>>
>> 	return len;
>>
>> after the loop indicates to the UART / tty-layer that all passed data
>> has been consumed and this path gets hit when the driver needs to wait
>> for more data because the response is not complete yet.
>>
>>>> +
>>>> +wakeup:
>>>> +	wake_up(&dell_bl->wait_queue);
>>>> +	return i + 1;
>>>> +}
> 
> 

