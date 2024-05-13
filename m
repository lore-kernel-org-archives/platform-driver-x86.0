Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5859164
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606309; cv=none; b=RqEkfIDy91o9EPzgQRf5pUfspQj83Loqz3l+rdBBJLtiOiTnudDZVpUCTt4HQJ2EX/BCdrKHqczgqk4BG3YZIP8zPGg0hQ+EcC2kaQ/Vz6D9rV1QG3UdAir93KrgP1JxkKsdPVz7cTIctOZnrmjPscMD9jdCYYa3lPGPeUQA2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606309; c=relaxed/simple;
	bh=H21Zt6xnTBAYYWHFQ4L2K9PIl1xHd5fRbQ5xs9F5rPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4zPSB6WfkbdCvBuEeWgbTI/Rt5sHKf0i3PkG21Sg0vSn+Y7UgECWh+7ESR6Y+0Lp61Y5S1znJua6ZhdLqQfUFPcRHoKDtj0xD0qJ1WIpppciijHkJ2tCEu7tFprjzCCNJByN8dcbFjwNITkVSZeM4H7RJfrLD5UFclmR4qkhAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UfMBRy0w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UfMBRy0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715606306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1T3XDT+7jNPsbuy8HrepgCrpAVg/jsS6UMy8hR57f4=;
	b=UfMBRy0w3PPznQHHk4oPpTn9gIjBHm55MevOm2oGGIpoKeptGJW4mUQPCIbv9s4nlO3Y4d
	jfaFGyjE6ra/L1UhfXOzUbMCcMB1UPkx+sX+XvgOle2gGKbyQAiZO8df/gaDcinuU7kKRF
	Yd3jUllvtT2NqOhvD7UnZXVAW62tXPQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-R3giOLQ5OAS_RQZ2gIx2dg-1; Mon, 13 May 2024 09:18:15 -0400
X-MC-Unique: R3giOLQ5OAS_RQZ2gIx2dg-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2e3003fae2dso28582831fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 06:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715606293; x=1716211093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1T3XDT+7jNPsbuy8HrepgCrpAVg/jsS6UMy8hR57f4=;
        b=t6Fsg2t1GnfG82AMoTSSRna3iaqNIoviGflEOkHMdeiLReW+EHXf0gGdDknqTFdbms
         JoS9qBaYK00rN7OQ9viZl4l9zNcQfoKLEQrCpA+6wM46f73YhP0K0BVpxTxh5QKLqB4N
         2k6z1v4FMiCpm2dTUX2+1gq/usXZq5rzkb6rKVAX9UGdsO2VAxApDzWHIXN32N8e/ugb
         DJrnnl9Jowi/DvVXWJ78A0pvAjZPb7o9PDb6hSYtwxIvfwvodLseEiFV+3dB3oXYxkpT
         FEX5FAxLAZ2+O8L0NCME12b5DJVtbZaDBZfC8UWd8vRbsauviswANS4lUSXo1IgWyWV2
         GJHA==
X-Forwarded-Encrypted: i=1; AJvYcCVScys9Bx/VQbYWluMIIjDt+9M4mti3nOKRpSCxVInnFPjx8RQLqOwEoJ97EAMJLPExbMiTXIZa905zO7S35srJOVWthgLdqF9ShjNSUU6vqV0m+g==
X-Gm-Message-State: AOJu0Yzl4uCZugpmIez/0iS0Rn4gkaHHq1NjlLW8HTpXFqZkVRsAsadi
	Gkbi5ukttXuSmwOqUombbBFs09QQDEq7EOcOqUaidpO6RrNfgBwMy3DJzKs0QSiFKjjG44SRNn8
	ll1Ci3tkxZV0MFR+oTe8NKy6j1QpCkygcUn2+tkw89Bbuh3i5fC84XoKbq44/D00HoVXrqu0yUV
	noxHc=
X-Received: by 2002:a05:6512:3117:b0:51e:1bed:13b3 with SMTP id 2adb3069b0e04-52210174834mr6704888e87.32.1715606293468;
        Mon, 13 May 2024 06:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx/o6G9Y218kup3klm7ZpP5L0Ecxqu9VNcT+p17L5Ubsk8kLSO3UW49x+gmcBj7KbTzy7+PA==
X-Received: by 2002:a05:6512:3117:b0:51e:1bed:13b3 with SMTP id 2adb3069b0e04-52210174834mr6704872e87.32.1715606293062;
        Mon, 13 May 2024 06:18:13 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad5fdsm1765883e87.24.2024.05.13.06.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:18:12 -0700 (PDT)
Message-ID: <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
Date: Mon, 13 May 2024 15:18:10 +0200
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
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/13/24 2:58 PM, Andy Shevchenko wrote:
> On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:
>> Dell All In One (AIO) models released after 2017 use a backlight controller
>> board connected to an UART.
>>
>> In DSDT this uart port will be defined as:
>>
>>    Name (_HID, "DELL0501")
>>    Name (_CID, EisaId ("PNP0501")
>>
>> Instead of having a separate ACPI device with an UartSerialBusV2() resource
>> to model the backlight-controller, which would be the standard way to do
>> this.
>>
>> The acpi_quirk_skip_serdev_enumeration() has special handling for this
>> and it will make the serial port code create a serdev controller device
>> for the UART instead of a /dev/ttyS0 char-dev. It will also create
>> a dell-uart-backlight driver platform device for this driver to bind too.
>>
>> This new kernel module contains 2 drivers for this:
>>
>> 1. A simple platform driver which creates the actual serdev device
>>    (with the serdev controller device as parent)
>>
>> 2. A serdev driver for the created serdev device which exports
>>    the backlight functionality uses a standard backlight class device.
> 
> ...
> 
>> Reported-by: Roman Bogoyev <roman@computercheck.com.au>
> 
> Privately? I mean no links to the report?

Yes by private email.
 
<snip>


>> +/* 1st byte Start Of Frame 3 MSB bits: cmd-len + 01010 SOF marker */
>> +#define SOF(len)			(((len) << 5) | 0x0a)
> 
> This kinda too short to be somehow unique, potential collision might be if
> somebody introduces this in the header which somehow will be chain-included
> here. Perhaps a namespace? DELL_SOF?

Ack will fix for v3.

> 
> ...
> 
>> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
>> +				const u8 *cmd, int cmd_len,
>> +				u8 *resp, int resp_max_len)
>> +{
>> +	int ret;
>> +
>> +	ret = mutex_lock_killable(&dell_bl->mutex);
> 
> Can't be called via cleanup.h?

I prefer to have the locking explicit rather then use cleanup.h .

<snip>

>> +static int dell_uart_get_brightness(struct dell_uart_backlight *dell_bl)
>> +{
> 
> 	struct device *dev = dell_bl->dev;
> 
>> +	u8 get_brightness[GET_CMD_LEN], resp[GET_RESP_LEN];
>> +	int ret;
>> +
>> +	get_brightness[0] = SOF(GET_CMD_LEN);
>> +	get_brightness[1] = CMD_GET_BRIGHTNESS;
>> +	get_brightness[2] = dell_uart_checksum(get_brightness, 2);
> 
>> +	ret = dell_uart_bl_command(dell_bl, get_brightness, GET_CMD_LEN, resp, GET_RESP_LEN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (resp[RESP_LEN] != GET_RESP_LEN) {
>> +		dev_err(dell_bl->dev, "Unexpected get brightness response length: %d\n",
>> +			resp[RESP_LEN]);
> 
> 		dev_err(dev, "Unexpected get brightness response length: %d\n", resp[RESP_LEN]);
> 
>> +		return -EIO;
>> +	}
>> +
>> +	if (resp[RESP_DATA] > DELL_BL_MAX_BRIGHTNESS) {
>> +		dev_err(dell_bl->dev, "Unexpected get brightness response: %d\n",
>> +			resp[RESP_DATA]);
> 
> 		dev_err(dev, "Unexpected get brightness response: %d\n", resp[RESP_DATA]);
> 

Ack will fix for v3.

>> +		return -EIO;
>> +	}
>> +
>> +	return resp[RESP_DATA];
>> +}
> 
> ...
> 
>> +		case RESP_CMD: /* CMD byte */
>> +			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
>> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
>> +					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
>> +				dell_bl->status = -EIO;
>> +				goto wakeup;
>> +			}
>> +			break;
> 
> No default case?

Nope, this checks the validity of the first 2 bytes / the header. The data is not checked.

> 
> ...
> 
>> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
> 
> I would be on the safest side, i.e. not trusting that it will be NUL-terminated
> string, hence something like %*pE?

Right, this is why the existing dev_dbg() already passes a precision and we do
want to actually stop if there is a 0 there, which %pE does not do.

Regards,

Hans



> 
> 

