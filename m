Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01F539C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715613494; cv=none; b=uxnZaj8BhXiXIsTKMyftD8iRN7AMa3AztlPjMbYnHPPMuRAS/8s2Ha/B/VfAEp5+cfvmDx9A4A/ZNCpFOR+APW1GDrV6a9TkWqlMiPE3ScsnnJvFBt45T0WgPaM2oaGEvWt+/NGCtnSKgPak3kwwwKTXsrxS3ScfYTDyj1d+D8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715613494; c=relaxed/simple;
	bh=G9NHOtIsgrxO2Hn0PtItsOwG89LFf6Y/04pQFMGLdKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKzEinNuXyENbFugd0SDLLqcF3Rr1ONz58yYP7IQCzB7A1IFyCs1fw364adHcFr9zP8+KqDNlz+fUjsjW++C5TBINpf5PrSrDvkN5EzIPvNvvgPP8bW5m8alZ1d6UykDui+ztPYmo832mNjPwAiUBJlON31f3fnfqfBMZhCZcQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hi/zJ2C0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hi/zJ2C0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715613491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S2Iw4AKDNWXqmro5/QU/ylOBgrSfiDV0ZCPhhE4jrZ0=;
	b=hi/zJ2C0WSt/c5vUFywBMraG3luWbUmDbjMOuVBTVLvr+3KiA3JvP91GD+OsfPNInVCm3N
	8lHf8SiXy8FojZfisEbBIhBPt5kdbLW6tP0l7W0NJBX2LhqxPxd1wwOaedbeOiLG8Ma+6Z
	+ilE86u9dzRyp8EQiDeJg6PrJk3nW64=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-lzCjOAGdO3aGncTW892lwQ-1; Mon, 13 May 2024 11:18:05 -0400
X-MC-Unique: lzCjOAGdO3aGncTW892lwQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2e237935dfdso38262101fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 08:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715613483; x=1716218283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2Iw4AKDNWXqmro5/QU/ylOBgrSfiDV0ZCPhhE4jrZ0=;
        b=pCBTsz62ZLT4k9nxsD+z+OMjHUkTMHU7kA6+k6xJ64TD/c9MawMGNAENCb5CaV2aqp
         9lDId057/asqpsIZwG6EKtXk2z1HYi8nFlkJrmB7bAhArxyXL4cD4oeH2UiixCV/2h8n
         qq4PkB+L6K37/71NkMC/pvBJyWTG4IBVfavxXkdZ/BZcUc8c6hBtsFEL4pnQ6h8yxNsj
         YtTHzhAr4O1k5tO7fsNESQ9VtruoqX9dDE8pUMCQ3qiGswcP38KylftfZsUP19c2zAin
         +VkAvRwkbbSHQ6b4Naylc4UYD/+lH1nFB8ggzY/hKbViHqz1XfqONRSn5rZXrE1+wnee
         rl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/2e6SCVukOzEwjgfX00oCJH03Ze2gpThlv/qXOpepUYd6Xv5GEgM8XPUHmIsBIu0yC5dmpAAgjGPgUHOmQu1LvxpjqIPj/E25tPbhz+LEeef5A==
X-Gm-Message-State: AOJu0YzooE1kcoDQliGsF5R2txWL9dVwCZ0izYXmHpOZyBEz4TTO573A
	5xHOIWNlwyQyq51q/ArLKkm6hbdcKHXDJymC4QE8KpSYEEHOyO0+pVR1T2G6K+QJxzzA6ut9O2E
	7kerRHez22QMeFlYRnAC5Hc4bmDy58ouNLhf0z4zOwwh+IlMdrQTkLwTgwfY+/R0BKVEqU4s=
X-Received: by 2002:a2e:f12:0:b0:2dc:d2c5:ed0 with SMTP id 38308e7fff4ca-2e51ff4d522mr65876811fa.12.1715613483355;
        Mon, 13 May 2024 08:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvUCpofdPpotCWdRp8PxMnp9J9BpEP5Ogij31d7VeS+010Y04q3y72EqxqWUqWucCiGBk06Q==
X-Received: by 2002:a2e:f12:0:b0:2dc:d2c5:ed0 with SMTP id 38308e7fff4ca-2e51ff4d522mr65876651fa.12.1715613482886;
        Mon, 13 May 2024 08:18:02 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733fff8774sm6161916a12.82.2024.05.13.08.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 08:18:01 -0700 (PDT)
Message-ID: <a01188df-4a54-471f-b7fd-f167d23df5e7@redhat.com>
Date: Mon, 13 May 2024 17:17:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: Add new Dell UART backlight driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>,
 Roman Bogoyev <roman@computercheck.com.au>,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240513144603.93874-1-hdegoede@redhat.com>
 <20240513144603.93874-2-hdegoede@redhat.com>
 <e969f26d-6d6c-ffbf-97e2-cfd0122568f4@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e969f26d-6d6c-ffbf-97e2-cfd0122568f4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/13/24 5:07 PM, Ilpo Järvinen wrote:
> On Mon, 13 May 2024, Hans de Goede wrote:
> 
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
>>
>> Reported-by: Roman Bogoyev <roman@computercheck.com.au>
>> Tested-by: Roman Bogoyev <roman@computercheck.com.au>
>> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> Co-developed-by: AceLan Kao <acelan.kao@canonical.com>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Rework dell_uart_bl_receive() loop (based on suggestions from Ilpo)
>> - s/SOF/DELL_SOF/ to avoid future namespace conflicts
>>
>> Changes in v2:
>> - Address various review remarks from Ilpo and Andy
>> ---
>>  drivers/platform/x86/dell/Kconfig             |  15 +
>>  drivers/platform/x86/dell/Makefile            |   1 +
>>  .../platform/x86/dell/dell-uart-backlight.c   | 398 ++++++++++++++++++
>>  3 files changed, 414 insertions(+)
>>  create mode 100644 drivers/platform/x86/dell/dell-uart-backlight.c
>>
>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
>> index bd9f445974cc..195a8bf532cc 100644
>> --- a/drivers/platform/x86/dell/Kconfig
>> +++ b/drivers/platform/x86/dell/Kconfig
>> @@ -145,6 +145,21 @@ config DELL_SMO8800
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called dell-smo8800.
>>  
>> +config DELL_UART_BACKLIGHT
>> +	tristate "Dell AIO UART Backlight driver"
>> +	depends on ACPI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	depends on SERIAL_DEV_BUS
>> +	help
>> +	  Say Y here if you want to support Dell AIO UART backlight interface.
>> +	  The Dell AIO machines released after 2017 come with a UART interface
>> +	  to communicate with the backlight scalar board. This driver creates
>> +	  a standard backlight interface and talks to the scalar board through
>> +	  UART to adjust the AIO screen brightness.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dell_uart_backlight.
>> +
>>  config DELL_WMI
>>  	tristate "Dell WMI notifications"
>>  	default m
>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
>> index 1b8942426622..8176a257d9c3 100644
>> --- a/drivers/platform/x86/dell/Makefile
>> +++ b/drivers/platform/x86/dell/Makefile
>> @@ -14,6 +14,7 @@ dell-smbios-objs			:= dell-smbios-base.o
>>  dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
>>  dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
>>  obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
>> +obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
>>  obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
>>  dell-wmi-objs				:= dell-wmi-base.o
>>  dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
>> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
>> new file mode 100644
>> index 000000000000..4e73fa035aca
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
>> @@ -0,0 +1,398 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Dell AIO Serial Backlight Driver
>> + *
>> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
>> + * Copyright (C) 2017 AceLan Kao <acelan.kao@canonical.com>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/serdev.h>
>> +#include <linux/string.h>
>> +#include <linux/types.h>
>> +#include <linux/wait.h>
>> +#include "../serdev_helpers.h"
>> +
>> +/* The backlight controller must respond within 1 second */
>> +#define DELL_BL_TIMEOUT		msecs_to_jiffies(1000)
>> +#define DELL_BL_MAX_BRIGHTNESS	100
>> +
>> +/* Defines for the commands send to the controller */
>> +
>> +/* 1st byte Start Of Frame 3 MSB bits: cmd-len + 01010 SOF marker */
>> +#define DELL_SOF(len)			(((len) << 5) | 0x0a)
>> +#define GET_CMD_LEN			3
>> +#define SET_CMD_LEN			4
>> +
>> +/* 2nd byte command */
>> +#define CMD_GET_VERSION			0x06
>> +#define CMD_SET_BRIGHTNESS		0x0b
>> +#define CMD_GET_BRIGHTNESS		0x0c
>> +#define CMD_SET_BL_POWER		0x0e
>> +
>> +/* Indexes and other defines for response received from the controller */
>> +#define RESP_LEN			0
>> +#define RESP_CMD			1 /* Echo of CMD byte from command */
>> +#define RESP_DATA			2 /* Start of received data */
>> +
>> +#define SET_RESP_LEN			3
>> +#define GET_RESP_LEN			4
>> +#define MIN_RESP_LEN			3
>> +#define MAX_RESP_LEN			80
>> +
>> +struct dell_uart_backlight {
>> +	struct mutex mutex;
>> +	wait_queue_head_t wait_queue;
>> +	struct device *dev;
>> +	struct backlight_device *bl;
>> +	u8 *resp;
>> +	u8 resp_idx;
>> +	u8 resp_len;
>> +	u8 resp_max_len;
>> +	u8 pending_cmd;
>> +	int status;
>> +	int power;
>> +};
>> +
>> +/* Checksum: SUM(Length and Cmd and Data) xor 0xFF */
>> +static u8 dell_uart_checksum(u8 *buf, int len)
>> +{
>> +	u8 val = 0;
>> +
>> +	while (len-- > 0)
>> +		val += buf[len];
>> +
>> +	return val ^ 0xff;
>> +}
>> +
>> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
>> +				const u8 *cmd, int cmd_len,
>> +				u8 *resp, int resp_max_len)
>> +{
>> +	int ret;
>> +
>> +	ret = mutex_lock_killable(&dell_bl->mutex);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dell_bl->status = -EBUSY;
>> +	dell_bl->resp = resp;
>> +	dell_bl->resp_idx = 0;
>> +	dell_bl->resp_len = -1; /* Invalid / unset */
>> +	dell_bl->resp_max_len = resp_max_len;
>> +	dell_bl->pending_cmd = cmd[1];
>> +
>> +	/* The TTY buffer should be big enough to take the entire cmd in one go */
>> +	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
>> +	if (ret != cmd_len) {
>> +		dev_err(dell_bl->dev, "Error writing command: %d\n", ret);
>> +		ret = (ret < 0) ? ret : -EIO;
> 
> This does nothing because you return dell_bl->status.

Ugh, thank you for catching that.  This is fallout from changing the initial
status value from 0 to -EBUSY.

Ive squashed the following fix into my review-hans branch to fix this:

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index 4e73fa035aca..87d2a20b4cb3 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -95,7 +95,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
 	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
 	if (ret != cmd_len) {
 		dev_err(dell_bl->dev, "Error writing command: %d\n", ret);
-		ret = (ret < 0) ? ret : -EIO;
+		dell_bl->status = (ret < 0) ? ret : -EIO;
 		goto out;
 	}
 

Regards,

Hans

