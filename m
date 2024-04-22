Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E41282E2
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713790717; cv=none; b=isGFD9WnkeAFafeTXK3GGaUF1xb8BZvr8k/T320Lcu1Rri3EyZtSwhMdgbc27ovg58hJNGEZ6SyWkwsNIWuxMGqwKSLcy1yTrRG8YR4IKj0IZ3Dw5Fq3PYPCKTxhmlOWYXJMj5TOvoWhaf4Lc8McOHhyOovki8nMsHsPcIG/Bt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713790717; c=relaxed/simple;
	bh=sEbARKU125paJvYDXQIGJC6lCpOXddsL5PnOkjzUO4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDtMakWVRGlJs/V6sLNWe0OWoYkQvHLQ6N7XV4jNZwBs0U8nyTr2b0YtRk/YmSx6CtfWdvJpjO+GqyGOsEEF+HSsvBpCjWwKArwf2IL9xTe97byqSuYlvX4nxSWdCrw6S/9aL7AG4OOx494Ku2/dxOKk5/TDWOvZYsCvo7RWU7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6w6xi5x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6w6xi5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713790714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBfYDjfHaiTuVFTuqOkyhKbZWiYGQWWZtUr5iccxgc0=;
	b=a6w6xi5xWX0WQOyJTwzurDSNAx0ZjlexXeFDCrsB3hITmT7tENRTGqIoTZKnao0S8ZdktF
	AAz0q6y+oDvHqq0DVDO/CODXMvdqgxrssEgKMq2rmgh+JslfmGKMDpKNTnsJmYlEloq4pC
	87erqKAVfDnG9diTD6opclBSIyOLKWA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-eCNw6otVNL6pxZVzWbqOlg-1; Mon, 22 Apr 2024 08:58:32 -0400
X-MC-Unique: eCNw6otVNL6pxZVzWbqOlg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a555af96dd5so289447266b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 05:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713790711; x=1714395511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBfYDjfHaiTuVFTuqOkyhKbZWiYGQWWZtUr5iccxgc0=;
        b=dQ7ZLv6oX5Diwm5DfxGXBI7jcy5b0a//Rw55g1M0AaAusBqARJ6AyCgza8U0w2B118
         sCgYV0/2GhsuWWIa87K/J2GXaMRN4LYKWhzbIX7Hvvga4QbO2UTPBefYtFNU4wa79SvH
         V6h8Z8RHGTiYlylEEV36HJkEPdm+1PAnues3B2nyzru7cZ5twHNn/+p18jWr2Og4Fttp
         Kbhp5AE/oo+e4JLscDdJd458236feHoDPftqtApi9i6DH3F21T43980iXeQt4qASS7Sv
         5t7WucWUm/siwPC2njOopFflQkxwt9pFGgdcaQ9ACA/0gWEmqA0B6BwziYhFeutQggYc
         /GzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBXv244sxMgHpNGiRRz3gc/U1ZLPH6KkMSOx9uqNcVb2J15M/lcCX+Rreu1JC2YC6BjM+qdIv+OJs8IBbciW2c83f+OtIOAY97U/PWZoh3PwjSdA==
X-Gm-Message-State: AOJu0YxXR0RXggfXpKny+wqT6abgCfAtnWa+n0afjRW9NaLn26dRa/qK
	g6cm1p1QBtbB8bDCTZCHY72VxiJjBbWB6U9Ts2Yh8m03Z+eiz/vi9M7FKV8pz53VBIq2LqOxEMq
	biY+ARtrgxxWDpVffQsfkaqlYxHqrKTlrOk8ZY+1/lVi1/3he7e0BXXmqH17H7QZ3KT8UB2hjzt
	8WDe6RFA==
X-Received: by 2002:a17:907:9805:b0:a55:57ac:ea5b with SMTP id ji5-20020a170907980500b00a5557acea5bmr12121552ejc.47.1713790711494;
        Mon, 22 Apr 2024 05:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ/PQf19Tt2yD1HYj+Y/1YEx/yOGNOzSutEinyiDw/DqM4tUx4Znmgbtkj8NDHqY6HQjVSAQ==
X-Received: by 2002:a17:907:9805:b0:a55:57ac:ea5b with SMTP id ji5-20020a170907980500b00a5557acea5bmr12121541ejc.47.1713790711141;
        Mon, 22 Apr 2024 05:58:31 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090665c200b00a55bbc4fd16sm820363ejn.48.2024.04.22.05.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 05:58:30 -0700 (PDT)
Message-ID: <375ed445-209e-4299-91cd-6e735ec79f93@redhat.com>
Date: Mon, 22 Apr 2024 14:58:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: Add
 lenovo-yoga-tab2-pro-1380-fastcharger driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20240406125058.13624-1-hdegoede@redhat.com>
 <20240406125058.13624-3-hdegoede@redhat.com>
 <CAHp75VdXbFxzwDas6z=oRW5hKJ9=CHW3SxVEtqaFTLq6yJQP-g@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdXbFxzwDas6z=oRW5hKJ9=CHW3SxVEtqaFTLq6yJQP-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/6/24 4:19 PM, Andy Shevchenko wrote:
> On Sat, Apr 6, 2024 at 3:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a new driver for the custom fast charging protocol found on Lenovo Yoga
>> Tablet 2 1380F / 1380L models.
> 
> ...
> 
>> +#include <linux/delay.h>
> 
> + err.h
> + errno.h
> 
>> +#include <linux/extcon.h>
>> +#include <linux/gpio/consumer.h>
> 
> + mod_devicetable.h

This one won't be necessary, see below.

> 
>> +#include <linux/module.h>
>> +#include <linux/notifier.h>
>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/pinctrl/machine.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/serdev.h>
> 
> + types.h
> 
>> +#include <linux/workqueue.h>
>> +#include "serdev_helpers.h"

Ack others added for v2.

> 
> ...
> 
>> +#define YT2_1380_FC_PIN_SW_DELAY_US    10000
>> +#define YT2_1380_FC_UART_DRAIN_DELAY_US        50000
>> +#define YT2_1380_FC_VOLT_SW_DELAY_US   1000000
> 
> Hmm... perhaps
> 
>   10 * USEC_PER_MSEC
>   50 * USEC_PER_MSEC
>   1 * USEC_PER_SEC
> 
> ?

Ack, changed for v2.

> 
> ...
> 
>> +static bool yt2_1380_fc_dedicated_charger_connected(struct yt2_1380_fc *fc)
>> +{
>> +       int ret;
>> +
>> +       ret = extcon_get_state(fc->extcon, EXTCON_CHG_USB_DCP);
>> +       return ret > 0;
> 
> This and other functions can be shorter by eliminating the ret
> variable, but it's up to you.
> 
>> +}

Ack, changed for v2.

> 
> ...
> 
>> +               ret = serdev_device_write_buf(to_serdev_device(fc->dev), "SC", 2);
> 
> Hmm... I would replace magic 2 in both cases by strlen("SC") or so.

Ack, changed for v2.

> 
>> +               if (ret != 2) {
>> +                       dev_err(fc->dev, "Error %d writing to uart\n", ret);
>> +                       return;
>> +               }
> 
> ...
> 
>> +static struct platform_driver yt2_1380_fc_pdev_driver = {
>> +       .probe = yt2_1380_fc_pdev_probe,
>> +       .remove_new = yt2_1380_fc_pdev_remove,
>> +       .driver = {
>> +               .name = YT2_1380_FC_PDEV_NAME,
>> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> +       },
> 
> + .id_table = ... (see below why)
> 
>> +};
> 
>> +MODULE_ALIAS("platform:" YT2_1380_FC_PDEV_NAME);
> 
> The _standard_ MODULE_ALIAS() is not an excuse to have no ID table.
> Just provide an accurate platform device ID table instead.

I personally have no strong preference either way (although
the MODULE_ALIAS way seems to be used the most in other code),
but in this specific case adding a platform_device_id table does
not work:

drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c:26:41: warning: initializer-string for array of ‘char’ is too long
   26 | #define YT2_1380_FC_PDEV_NAME           "lenovo-yoga-tab2-pro-1380-fastcharger"
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

from mod_devicetable.h:

#define PLATFORM_NAME_SIZE      20
#define PLATFORM_MODULE_PREFIX  "platform:"

struct platform_device_id {
        char name[PLATFORM_NAME_SIZE];
        kernel_ulong_t driver_data;
};

So the driver / pdev name can only by 20 chars, I tried shortening:

"lenovo-yoga-tab2-pro-1380-fastcharger"

to:

"lenovo-yt2-pro-fastcharger"

But that still is too long, making it even shorter will make
the name really cryptic, where as without using
the platform_device_id approach things work fine,
so I'm going to stick with the MODULE_ALIAS() for v2.

Regards,

Hans

