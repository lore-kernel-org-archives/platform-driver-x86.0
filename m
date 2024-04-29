Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468093BBC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387659; cv=none; b=IPMDsq9b3rruvC7/aGjG3k19MaHp+2MnR+5sLIItXj1c5V55F8+LHflmg+jkYQOak0lK0bF1/Xt/vSKWIYpJ8B9xmlF90Vdffere9w0OsDRRfAbz002YLwmvg4cB0EddaSswubOcAAg8hOpd2RQBAQQcGFbVQ7ZMaj4iFmPpjpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387659; c=relaxed/simple;
	bh=XrLvrweP4iylJso4IC1Z6ZmEaYTuEWbu6CN8bR7TAD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ronWdyM8Nu2hodFVfKywVPZywbUro2grADFXj9RiNVQfLP429xD56hB2Cwluy4rIJX4MKNsdyUMa6+vC+7MQgjH5SydCx/v4mVG1A6OwIudseeEzx0gmLaCWSWzS6umetocXcVSq1oFZIsFnrzDZXOWt+lC8Mb5XUPO3jd81O54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J1aRsqYo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J1aRsqYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714387656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFsHepVEpsOeHhj6kl4HuJJ6ChryIakBusdqilmtruw=;
	b=J1aRsqYoMUmWYtk9+pqH7jWD2cZkqF6oHEqA1cQHZRvUQ8wYdRqnXpP/pzC+/OGLw3d5QD
	HZz/4F5dsoo9UrTn+oTBtJL4OVUK04BZvET8iAR4QZAru4YZ3LWohAcBIBD/wh3kGAeZzL
	1sz36Ze+quX8WTHbZ7HwMyptoy0C0lg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-NHFt0dR2OnGI2PyVhRqO_Q-1; Mon, 29 Apr 2024 06:47:34 -0400
X-MC-Unique: NHFt0dR2OnGI2PyVhRqO_Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5564a2e3a5so315484566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 03:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387653; x=1714992453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFsHepVEpsOeHhj6kl4HuJJ6ChryIakBusdqilmtruw=;
        b=O58XHk5Qo8VQY3CZT2BT7rFnzkraCafWZllcIbh0GKANAFYubhlDQnl59khCc/Im2q
         1sCVVyU6MiyVEQU1gOXvv4q/AnBA+gAu6r5reOF+0bE9+OvSp786cKNKX5qeAD+GqYNA
         H4c5yj5popGt3v4kRQcRTywgQHRUog7Yw2C5xwOByOc+VP71whEFtF7DfiUdd/Po5Fg4
         hA9fHmJ+OUDWMbpa8LPKKlAExIFg9UPUv2biEGkzInzB9bB2/k4dqDc/405uHoMVjJ6I
         LBrjqYRdDnS/guwQa9S7yaE+29+6g9JW/dclKZLIasPRPceR+onjkJAktHHroWUNsO0b
         hLTw==
X-Forwarded-Encrypted: i=1; AJvYcCWW0UfwPmMQfWgG6hyF77ERtI0lg9vkAB1Tigfe+CsZ50MqEcJSWoJebXYsOYjtg1z03XQHa306UgtBU2V1Fjg3m+atxav6dSOVYFfaxfreVjLCtg==
X-Gm-Message-State: AOJu0YxIGK4eMCscU9OBvBn9Lu9UtynwX8P/xI82j7Re++lzFh/jMqda
	y06aZc1W/OHiUL4X0mg5H9k1fD/P5dNciFOoah4FWcymV8vRSnlm98DzeXEnR/0/LwGPnMZwdxR
	uEFVe2EVX/Yt5cEKoFs8TLGnIRBomEPX6LrudmWWj5iNDLTJbWG6LiRvmA0KsceBH/lz22PYvcj
	4eTV0=
X-Received: by 2002:a17:906:2b13:b0:a58:eb9a:d431 with SMTP id a19-20020a1709062b1300b00a58eb9ad431mr3295879ejg.44.1714387653336;
        Mon, 29 Apr 2024 03:47:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB/HPLhY2T9UBRHuRm6rufXlqtVjrQunte5KqGb/lfs2SvSfgbXyVF+lBlP6Iz2vfLn9VEAQ==
X-Received: by 2002:a17:906:2b13:b0:a58:eb9a:d431 with SMTP id a19-20020a1709062b1300b00a58eb9ad431mr3295867ejg.44.1714387653020;
        Mon, 29 Apr 2024 03:47:33 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ky17-20020a170907779100b00a55926df215sm11523706ejc.72.2024.04.29.03.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:47:32 -0700 (PDT)
Message-ID: <1243e74b-3aa8-4e96-8eea-5d49c747bd20@redhat.com>
Date: Mon, 29 Apr 2024 12:47:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: Add
 lenovo-yoga-tab2-pro-1380-fastcharger driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20240422131649.46002-1-hdegoede@redhat.com>
 <f6260783-5ff9-2ab4-81bc-9d3ad8d363b2@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f6260783-5ff9-2ab4-81bc-9d3ad8d363b2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/22/24 3:36 PM, Ilpo Järvinen wrote:
> On Mon, 22 Apr 2024, Hans de Goede wrote:
> 
>> Add a new driver for the custom fast charging protocol found on Lenovo Yoga
>> Tablet 2 1380F / 1380L models.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2 (from review by Andy):
>> - Add a couple of missing includes
>> - Couple of small coding style fixes
>> ---
>>  drivers/platform/x86/Kconfig                  |  11 +
>>  drivers/platform/x86/Makefile                 |   1 +
>>  .../lenovo-yoga-tab2-pro-1380-fastcharger.c   | 337 ++++++++++++++++++
>>  3 files changed, 349 insertions(+)
>>  create mode 100644 drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index cd0ec10240b6..318f2f77c97a 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -133,6 +133,17 @@ config YOGABOOK
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called lenovo-yogabook.
>>  
>> +config YT2_1380
>> +	tristate "Lenovo Yoga Tablet 2 1380 fast charge driver"
>> +	depends on SERIAL_DEV_BUS
>> +	depends on ACPI
>> +	help
>> +	  Say Y here to enable support for the custom fast charging protocol
>> +	  found on the Lenovo Yoga Tablet 2 1380F / 1380L models.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called lenovo-yogabook.
>> +
>>  config ACERHDF
>>  	tristate "Acer Aspire One temperature and fan driver"
>>  	depends on ACPI && THERMAL
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 5521a87f0718..2640475a9f97 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -66,6 +66,7 @@ obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>>  obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>> +obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>>  
>>  # Intel
>> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
>> new file mode 100644
>> index 000000000000..035d8cc86079
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
>> @@ -0,0 +1,337 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Support for the custom fast charging protocol found on the Lenovo Yoga
>> + * Tablet 2 1380F / 1380L models.
>> + *
>> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
>> + */
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/extcon.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/notifier.h>
>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/pinctrl/machine.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/serdev.h>
>> +#include <linux/types.h>
>> +#include <linux/workqueue.h>
>> +#include "serdev_helpers.h"
>> +
>> +#define YT2_1380_FC_PDEV_NAME		"lenovo-yoga-tab2-pro-1380-fastcharger"
>> +#define YT2_1380_FC_SERDEV_CTRL		"serial0"
>> +#define YT2_1380_FC_SERDEV_NAME		"serial0-0"
>> +#define YT2_1380_FC_EXTCON_NAME		"i2c-lc824206xa"
>> +
>> +#define YT2_1380_FC_MAX_TRIES		5
>> +#define YT2_1380_FC_PIN_SW_DELAY_US	(10 * USEC_PER_MSEC)
>> +#define YT2_1380_FC_UART_DRAIN_DELAY_US	(50 * USEC_PER_MSEC)
>> +#define YT2_1380_FC_VOLT_SW_DELAY_US	(1000 * USEC_PER_MSEC)
> 
> Add include for *SEC_PER_*SEC.
> 
> Once that's taken care of,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you. I've added the include while added this to my review-hans
(soon to be for-next) branch.

Regards,

Hans

