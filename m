Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE3219E7
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594112; cv=none; b=GF+Xh9zEPrynwwipOMUWWPK6S7IUVNB5E82pzr1LGAYroJwC+bW6SQjHLPaGhhqbnDOyBDZ0OO9kSWvsMIDjxKg69UFzrYh7+GawweaLsC0SZFcX41jc6iAsYKsK20a+J8otB6kwZtWW2Iq+hSmoEKlk+DpBHNZZczXSQprsXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594112; c=relaxed/simple;
	bh=xw88ETaLhxYz7wntFMi9impILWx+0ilWyegGBa3Ml+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSYp2LvBDT9wstuojGfpaTRXkqJueX578XWB4wUWk8N0o2x79nWoyqt0VpeeT4ljg/chTLaVATYmIrdqRe69L8oWJs9KpPHQ/YBSgVezId7KA2o8m/mO3A/57qgoJJ5hy2l9HDBPuVzNKjl/ZJRDGyXfufnkHbeHNc2NfOJzGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jgrx0bkJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jgrx0bkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715594109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XX13R0vp9lyBvI/HXptT5qNlnTDqrRjHSlha3jARZRQ=;
	b=Jgrx0bkJuGSHy/gs3glmrEpn0qnF9kaiZ/Zi0VBekNQwKpnpjqvaKLOuI7jGuNaaUP+TS8
	kmjJ7YpAq9QRpZyqcxZ7HMeBHJpA+lFgNRIylI6Wr0VqxLP9CwSYd8UT3yEsDbzhsyoKug
	ezzNmijpelLolJ+/+Ve2zrRD82e7K6Y=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-8hdOk6ckMbqNQ4lnZWpOdw-1; Mon, 13 May 2024 05:55:07 -0400
X-MC-Unique: 8hdOk6ckMbqNQ4lnZWpOdw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51f22618c20so3602243e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 02:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715594106; x=1716198906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XX13R0vp9lyBvI/HXptT5qNlnTDqrRjHSlha3jARZRQ=;
        b=eykuKarckvexIGOrmaowBlutkvbfv6mL8zUdAVlvnehoMjcg0qGpgFYe459jDYWET/
         XB05yzK72pqTgwo3QuWtMJQy8iLo7uwRCKeeakqJPm3srRioU8Qu+RrLCUxz2RFA8Nmj
         a4F9l4W1VQDcsHHJvKxXQQ5GOxlbDXHo0rNzn5GSBYIlKo2oGtOf0MH25MOVZMIGiXpm
         cO1goRnA2vkpHW4kRT2Liq7vYNXzZcGkcKnqKDnwWONkxntIoxAkDeQBe3TaFwXSsOsI
         +xL2YKtOb69WY+RrbdDEygIhyITXYWPBt9NxSJq5f0zAb9H+4nJXRPpDtnWcjOcNS3d4
         V1kA==
X-Forwarded-Encrypted: i=1; AJvYcCXBhC5gU1MYmoIAcZAOcKqPHt9MdFVeFpVGWm7FDeEWg/DWEJ9kOV0OVuQLGEeCNTRmoHzVAltz0VzgdJKFJw1bZ7/4/fGD00OqQxMGo+9PLudjYg==
X-Gm-Message-State: AOJu0YwP1dKY9arQd6iElB+lkw8WzVzNsG5J/Y57e24SKCK1+6PPzFVe
	E2kcaHfIOs7h5JGIFn1CO6kde/a+r9Z4wexefnovvchflFMLMqlmkSWNKuIrVf1E7AQUPCIjAxn
	8T5D3JCvKIezL7lPCn/klTEUNm1AHFv8Mn9nUk4OeXBuu/90Shpq/LEjmfFT2frX8wBYjoiA=
X-Received: by 2002:ac2:5b5e:0:b0:51c:cc1b:a8f6 with SMTP id 2adb3069b0e04-5220fc7be0emr7606130e87.20.1715594106177;
        Mon, 13 May 2024 02:55:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nygSwY6XtYMEjjI4jWCJgsSduQu7Zu6mOGOSsiDU0HzHrxzsn6t/eZGeOIvg1hae0lBrPA==
X-Received: by 2002:ac2:5b5e:0:b0:51c:cc1b:a8f6 with SMTP id 2adb3069b0e04-5220fc7be0emr7606110e87.20.1715594105551;
        Mon, 13 May 2024 02:55:05 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d85sm572951666b.72.2024.05.13.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 02:55:05 -0700 (PDT)
Message-ID: <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com>
Date: Mon, 13 May 2024 11:55:04 +0200
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
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for the review.

On 5/13/24 10:34 AM, Ilpo Järvinen wrote:
> On Sun, 12 May 2024, Hans de Goede wrote:

<snip>

>> +	dell_bl->status = 0;
>> +	dell_bl->resp = resp;
>> +	dell_bl->resp_idx = 0;
>> +	dell_bl->resp_max_len = resp_max_len;
>> +	dell_bl->pending_cmd = cmd[1];
>> +
>> +	/* The TTY buffer should be big enough to take the entire cmd in one go */
>> +	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
>> +	if (ret != cmd_len) {
>> +		dev_err(dell_bl->dev, "Error writing command: %d\n", ret);
>> +		ret = (ret < 0) ? ret : -EIO;
>> +		goto out;
>> +	}
>> +
>> +	ret = wait_event_timeout(dell_bl->wait_queue, dell_bl->status, DELL_BL_TIMEOUT);
>> +	if (ret == 0) {
>> +		dev_err(dell_bl->dev, "Timed out waiting for response.\n");
>> +		dell_bl->status = -ETIMEDOUT;
>> +	}
>> +
>> +	if (dell_bl->status == 1)
>> +		ret = 0;
>> +	else
>> +		ret = dell_bl->status;
> 
> I wonder if it would make dell_bl->status easier to follow if you'd first 
> make it -EBUSY instead of 0 and set it to 0 on success?
> 
> It would basically be normal errno behavior without extra values then and 
> you wouldn't need to map it into return value here.

Ack, done for v2.


> 
>> +out:
>> +	mutex_unlock(&dell_bl->mutex);
>> +	return ret;
>> +}
>> +
>> +static int dell_uart_set_brightness(struct dell_uart_backlight *dell_bl, int brightness)
>> +{
>> +	/*
>> +	 * Set Brightness level: Application uses this command to set brightness.
>> +	 * Command: 0x8A 0x0B <brightness-level> Checksum (Length:4 Type:0x0A Cmd:0x0B)
>> +	 *          <brightness-level> ranges from 0~100.
> 
> Why ~ character, is this just - ?

Yes just -, the ~ came from the original driver I based this on I'll fix this for v2.

>> +	 * Return data: 0x03 0x0B 0xF1 (Length:3 Cmd:0x0B Checksum:0xF1)
> 
> All these commands return header + echo cmd + (optional) data + checksum. 
> I'm not sure why they all need a comment about it...
> 
> It's also slightly misleading to call it "Return data" which can be 
> misinterpreted to mean the return value of this function which is not 
> correct (code calls it resp(onse) anyway so if it's necessary, use 
> response data instead).
> 
>> +	 */
>> +	u8 set_brightness[] = { 0x8A, 0x0B, 0x00, 0x00 };
> 
> Use #defines instead of literals.

Ack, will fix for v2.

> 
> I think it makes the entire comments about the commands mostly useless 
> when these are converted into properly named defines.

Ack, will drop.

> 
>> +	u8 resp[3];
>> +
>> +	set_brightness[2] = brightness;
>> +	set_brightness[3] = dell_uart_checksum(set_brightness, 3);
> 
> Also, couldn't these be accessed through a struct to eliminate most of the 
> magic indexes?

With the checksum at the end, this would require a VLA in the middle
of the struct (get_version return buffer contains more then 1 dat byte)
We could treat the checksum as an extra data byte, but then we are
mixing struct usage for some fields + using an array of bytes
approach for the data + checksum. For consistency I prefer to just
stick with one approach which means using the array of bytes approach
for everything.

> 
>> +	return dell_uart_bl_command(dell_bl, set_brightness, ARRAY_SIZE(set_brightness),
>> +				    resp, ARRAY_SIZE(resp));
>> +}
>> +
>> +static int dell_uart_get_brightness(struct dell_uart_backlight *dell_bl)
>> +{
>> +	/*
>> +	 * Get Brightness level: Application uses this command to get brightness.
>> +	 * Command: 0x6A 0x0C 0x89 (Length:3 Type:0x0A Cmd:0x0C Checksum:0x89)
>> +	 * Return data: 0x04 0x0C Data Checksum
>> +	 *              (Length:4 Cmd:0x0C Data:<brightness level>
>> +	 *               Checksum: SUM(Length and Cmd and Data) xor 0xFF)
>> +	 *              <brightness level> ranges from 0~100.
> 
> ~ -> - ?
> 
>> +	 */
>> +	const u8 get_brightness[] = { 0x6A, 0x0C, 0x89 };
>> +	u8 resp[4];
>> +	int ret;
>> +
>> +	ret = dell_uart_bl_command(dell_bl, get_brightness, ARRAY_SIZE(get_brightness),
>> +				   resp, ARRAY_SIZE(resp));
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (resp[0] != 4) {
> 
> sizeof(resp)

Ack.

> but isn't this already checked when reading it??

No dell_uart_bl_receive() checks that the response will fit in the supplied
buffer and that it has a valid checksum but the controller may send a
response smaller then the passed in buffer and it will actually do this for
the get_version command.
 
>> +		dev_err(dell_bl->dev, "Unexpected get brightness response length: %d\n", resp[0]);
>> +		return -EIO;
>> +	}
>> +
>> +	if (resp[2] > 100) {
> 
> Add #define.

Ack.

<snip>

>> +/*
>> + * There is no command to get backlight power status,
>> + * so we set the backlight power to "on" while initializing,
>> + * and then track and report its status by power variable
> 
> Missing .

Ack.

<snip>

>> +static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
>> +{
>> +	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
>> +	size_t i;
>> +	u8 csum;
>> +
>> +	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
>> +
>> +	/* Throw away unexpected bytes / remainder of response after an error */
>> +	if (dell_bl->status) {
> 
> As mentioned above, != -EBUSY ?
> 

Ack, done for v2.

>> +		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
>> +		return len;
>> +	}
>> +
>> +	for (i = 0; i < len; i++) {
>> +		dell_bl->resp[dell_bl->resp_idx] = data[i];
>> +
>> +		switch (dell_bl->resp_idx) {
>> +		case 0: /* Length byte */
>> +			dell_bl->resp_len = dell_bl->resp[0];
>> +			if (dell_bl->resp_len < DELL_BL_MIN_RESP_SIZE) {
>> +				dev_err(dell_bl->dev, "Response length too small %d < %d\n",
>> +					dell_bl->resp_len, DELL_BL_MIN_RESP_SIZE);
>> +				dell_bl->status = -EIO;
>> +				goto wakeup;
>> +			} else if (dell_bl->resp_len > dell_bl->resp_max_len) {
> 
> Unnecessary else because of the goto.
> 
>> +				dev_err(dell_bl->dev, "Response length too big %d > %d\n",
>> +					dell_bl->resp_len, dell_bl->resp_max_len);
>> +				dell_bl->status = -EIO;
>> +				goto wakeup;
>> +			}
>> +			break;
>> +		case 1: /* CMD byte */
>> +			if (dell_bl->resp[1] != dell_bl->pending_cmd) {
>> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
>> +					dell_bl->resp[1], dell_bl->pending_cmd);
>> +				dell_bl->status = -EIO;
>> +				goto wakeup;
>> +			}
>> +			break;
>> +		}
>> +
>> +		dell_bl->resp_idx++;
>> +		if (dell_bl->resp_idx < dell_bl->resp_len)
>> +			continue;
>> +
>> +		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>> +		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
>> +			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>> +				dell_bl->resp[dell_bl->resp_len - 1], csum);
>> +			dell_bl->status = -EIO;
>> +			goto wakeup;
>> +		}
> 
> Why is the checksum calculation and check inside the loop??

The loop iterates over received bytes, which may contain extra data after the response, the:

		dell_bl->resp_idx++;
		if (dell_bl->resp_idx < dell_bl->resp_len)
			continue;

continues looping until we have received all the expected bytes. So here, past this
check, we are are at the point where we have a complete response and then we verify it.

And on successful verification wake-up any waiters.

> 
>> +		dell_bl->status = 1; /* Success */
> 
> As mentioned above, change this to = 0 

Ack, done.

?
> 
>> +		goto wakeup;
> 
> Huh? Now I'm totally lost how the control flow is supposed to go in this 
> function. Can you rethink this loop so it actual makes sense and doesn't 
> misuse gotos like this?

This is the receive() callback from the UART the loop consumes bytes received
by the UART. The gotos stop consuming bytes in 2 cases:

1. An error (unexpected data) is encountered.
2. A complete frame has been successfully received.

The checking of the checksum + goto wakeup at the end of the loop is for 2.

The:

	return len;

after the loop indicates to the UART / tty-layer that all passed data
has been consumed and this path gets hit when the driver needs to wait
for more data because the response is not complete yet.

>> +
>> +wakeup:
>> +	wake_up(&dell_bl->wait_queue);
>> +	return i + 1;
>> +}
>> +

<snip>

>> +	memset(&props, 0, sizeof(struct backlight_properties));
> 
> Just assigned = {} when declaring.

Ack.

>> +	props.type = BACKLIGHT_PLATFORM;
>> +	props.brightness = ret;
>> +	props.max_brightness = 100;
> 
> Use #define.

Ack.

<snip>

>> +	ret = serdev_device_add(serdev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
>> +		serdev_device_put(serdev);
>> +		return ret;
>> +	}
>> +
>> +	ret = serdev_device_driver_register(&dell_uart_bl_serdev_driver);
>> +	if (ret) {
>> +		serdev_device_remove(serdev);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * serdev device <-> driver matching relies on OF or ACPI matches and
>> +	 * neither is available here, manually bind the driver.
>> +	 */
>> +	ret = device_driver_attach(&dell_uart_bl_serdev_driver.driver, &serdev->dev);
>> +	if (ret) {
>> +		serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
>> +		serdev_device_remove(serdev);
>> +		return ret;
>> +	}
> 
> The last two error branch could use normal rollback with goto.

Ack, will fix for v2.

Regards,

Hans

