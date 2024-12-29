Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1F192598
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Dec 2024 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483923; cv=none; b=a/VFLDcKCXZzmDZtrZZEdfXhmCqF7hjQsfKO46N7OK6QRFEUTT/Dn4rkpbChWK7ixWyrXpTvT5UXUekfQ35DOl0LXwMh6mTBlQhTJWQx7DT4e++fHJNU00yT3ilBCKCwEXbrPzRCAo/fnapOX+elVsuGrPiwQEnejWfoWw2yVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483923; c=relaxed/simple;
	bh=NH+R1Gq5a4ptQDjw4VRo6cce3Q3VMA+UUnZJpCGlVLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/FlSSMOMewVVSJu6ExYP6PeGbzWlxp/0Ck6wF09CbBVgfGMRmahhC4mqiR+GQQi3JtE3bDiUcHBq/fclz70Yf6Gtz5DgmCGylyg1BrtPxRF3q/9dDplsWSWhG96GlCd7CByjlEocWaicQKpSpGWp+rxkpm1NE7hbLsOfq2FqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6ckRCNd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6ckRCNd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b364538so4804875f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Dec 2024 06:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735483920; x=1736088720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RkB7UfRiNg6MyNlWMJbO93WwIH7bFs9T4rAheWdhbk=;
        b=e6ckRCNdSqMFd3uZRSm5JGkr0zPLgH0I5ANLlyX33gNReQr8+2aO58MsnQqN3ioguy
         5Jio11Ml17/FE2tLS2mODCvwHHgTEM1sNxSVm8WXircvWOo1SPqBjdZJJzSAgndsnQ5+
         obAI/A1lDWs1HQjtQSW4O3hfXd237r6CfawSO0Yh1kaoYoX29sZPzMR2Y6jjquoRhu+t
         hxw0k07S3Yx3+hBf/Sll/eybPnwpWF4prOQndr95tw8Aes8KkOfXUoJZjXX3xIHvq+8D
         18Lv8ii5fbbsL4w7l6UA3tRLb+IcvQglxqzhUmOUdMVIpQ7t5Ib2CbsWaBrSjxZ2mN4T
         s2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483920; x=1736088720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RkB7UfRiNg6MyNlWMJbO93WwIH7bFs9T4rAheWdhbk=;
        b=SnPVgU8VfeI85RmxqNtgOVLBGVD1APkr8K4hi6nfCq/ilQR18y+x1chJZ4BHjcc6dC
         O9pcv5vAvffoMMP1okhZXV9KoYS3IDgRdyVTNIe7Pk+bLtHK6svvVJ1rEMHigOXOBm3G
         yp4u0hqh5GcoN+HLhyhHj1lV4XaXkBenEPX+LK5ghMJppZr0+hkxh9aG/gh5zhYQ3dhw
         ISRDDu3uXq4BGn7r0XKFnYM6FUm3oxjPbUrOI0C+bRFxRDgNFwTY1oH9i/lRVeLiAUJA
         5A3M/sh+bi3wpo2qi9ThFFwJ6C+qasta1lTD9A3lVPzr1fak+m/RviKCoYk/fczaTelJ
         reFg==
X-Forwarded-Encrypted: i=1; AJvYcCW+v50TTNY35DVbG3nMwdOVNYC0sGCvs1fsZA7/2Sme09xhVNR5IY9bI9GoB5nR4XI1EUC/xSZ2+VnMvslMlFraRc3O@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6IKKdw36aBy5ovQdg2TKaBL17a5bAyBcQA+18R1kernoi024
	yRTuaYbtmuGQWOAiLVQwV1tMGdutBv6F5HN1JZbH1sfdV94U+6bTXZkH1wppgqQ=
X-Gm-Gg: ASbGnctJWFIga3GhnuTbk/CnKkDpEXGmWMG2954P8dJNBrfr/pchT3qRZppyHoI/DgM
	NEgBiNIhW6IFoL9/1F/EtLIQsXOdJMzOvpDnByYu8oWuGxHwqbCho/9nnZb6HEwHrxc2uTJT7NC
	AJFQ4OToYJO8N72Ek8RB3wquMmFOoHhDcVvxZOOypDmjtGHOG1stQKvYdKhNihi0heD0fJhNsV/
	6KbpQpRwZ8JYTxdwkVpcz8r9HD9hU+xeNLBaiAG1NSTmCosEWZPFkxrwBgIKXEuUo+eJg==
X-Google-Smtp-Source: AGHT+IFGQdUBCOz+F0Jdt8T/X7wzDgUoFUYLmOZIeAMTzUhMqCz8ekRTaHkUH6qYyBefzRQQ0RDeZQ==
X-Received: by 2002:a05:6000:704:b0:385:ea40:b46b with SMTP id ffacd0b85a97d-38a229ed094mr26533826f8f.4.1735483919862;
        Sun, 29 Dec 2024 06:51:59 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm27199663f8f.38.2024.12.29.06.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 06:51:59 -0800 (PST)
Message-ID: <5310962f-c0d8-4ada-bb95-b727a3c88b00@linaro.org>
Date: Sun, 29 Dec 2024 14:51:57 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] usb: typec: ucsi: add Huawei Matebook E Go (sc8280xp)
 ucsi driver
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@linaro.org, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, heikki.krogerus@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, nikita@trvn.ru,
 platform-driver-x86@vger.kernel.org, robh@kernel.org, sre@kernel.org
References: <c17372ed-baf0-40a7-b267-25f1ff849cf7@linaro.org>
 <20241228143830.613658-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241228143830.613658-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/12/2024 14:38, Pengyu Luo wrote:
> On Sat, Dec 28, 2024 at 9:06 PM Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
>> On 27/12/2024 17:13, Pengyu Luo wrote:
>>> The Huawei Matebook E Go (sc8280xp) tablet provides implements UCSI
>>> interface in the onboard EC. Add the glue driver to interface the
>>> platform's UCSI implementation.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>>    drivers/usb/typec/ucsi/Kconfig              |   9 +
>>>    drivers/usb/typec/ucsi/Makefile             |   1 +
>>>    drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 481 ++++++++++++++++++++
>>>    3 files changed, 491 insertions(+)
>>>    create mode 100644 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
>>>
>>> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
>>> index 680e1b87b..0d0f07488 100644
>>> --- a/drivers/usb/typec/ucsi/Kconfig
>>> +++ b/drivers/usb/typec/ucsi/Kconfig
>>> @@ -78,4 +78,13 @@ config UCSI_LENOVO_YOGA_C630
>>>          To compile the driver as a module, choose M here: the module will be
>>>          called ucsi_yoga_c630.
>>>
>>> +config UCSI_HUAWEI_GAOKUN
>>> +     tristate "UCSI Interface Driver for Huawei Matebook E Go (sc8280xp)"
>>> +     depends on EC_HUAWEI_GAOKUN
>>> +     help
>>> +       This driver enables UCSI support on the Huawei Matebook E Go tablet.
>>> +
>>> +       To compile the driver as a module, choose M here: the module will be
>>> +       called ucsi_huawei_gaokun.
>>> +
>>>    endif
>>> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
>>> index aed41d238..0b400122b 100644
>>> --- a/drivers/usb/typec/ucsi/Makefile
>>> +++ b/drivers/usb/typec/ucsi/Makefile
>>> @@ -22,3 +22,4 @@ obj-$(CONFIG_UCSI_CCG)                      += ucsi_ccg.o
>>>    obj-$(CONFIG_UCSI_STM32G0)          += ucsi_stm32g0.o
>>>    obj-$(CONFIG_UCSI_PMIC_GLINK)               += ucsi_glink.o
>>>    obj-$(CONFIG_UCSI_LENOVO_YOGA_C630) += ucsi_yoga_c630.o
>>> +obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)     += ucsi_huawei_gaokun.o
>>> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
>>> new file mode 100644
>>> index 000000000..84ed0407d
>>> --- /dev/null
>>> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
>>> @@ -0,0 +1,481 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * ucsi-huawei-gaokun - A UCSI driver for HUAWEI Matebook E Go (sc8280xp)
>>> + *
>>> + * reference: drivers/usb/typec/ucsi/ucsi_yoga_c630.c
>>> + *            drivers/usb/typec/ucsi/ucsi_glink.c
>>> + *            drivers/soc/qcom/pmic_glink_altmode.c
>>> + *
>>> + * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
>>> + */
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/bitops.h>
>>> +#include <linux/completion.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/module.h>
>>> +#include <linux/notifier.h>
>>> +#include <linux/of.h>
>>> +#include <linux/string.h>
>>> +#include <linux/workqueue_types.h>
>>> +
>>> +#include <linux/usb/pd_vdo.h>
>>> +#include <drm/bridge/aux-bridge.h
>>
>> Is there a reason you don't have strict include alphanumeric ordering here ?
>>
> 
> These two is dp/alt mode related, so listing them out. Above of them are
> general things.

OK. Unless there's an include dependency reason you need to, please just 
sort the headers alphanumerically in order

#include <globals_first>
#include <globals_first_alpha>

#include "locals_next"
#include "locals_next_alpha_also"

>>>
>>> +
>>> +#include "ucsi.h"
>>> +#include <linux/platform_data/huawei-gaokun-ec.h>
>>> +
>>> +
>>> +#define EC_EVENT_UCSI        0x21
>>> +#define EC_EVENT_USB 0x22
>>> +
>>> +#define GAOKUN_CCX_MASK              GENMASK(1, 0)
>>> +#define GAOKUN_MUX_MASK              GENMASK(3, 2)
>>> +
>>> +#define GAOKUN_DPAM_MASK     GENMASK(3, 0)
>>> +#define GAOKUN_HPD_STATE_MASK        BIT(4)
>>> +#define GAOKUN_HPD_IRQ_MASK  BIT(5)
>>> +
>>> +#define CCX_TO_ORI(ccx) (++ccx % 3)
>>
>> Why do you increment the value of the enum ?
>> Seems strange.
>>
> 
> EC's logic, it is just a trick. Qualcomm maps
> 0 1 2 to normal, reverse, none(no device insert)
> typec lib maps 1 2 0 to that.

I'd suggest making the trick much more obvious.

Either with a comment or just mapping 1:1 between EC and Linux' view of 
this data.

The main reason for that is to make it easier to 
read/understand/maintain/debug.



>>> +             port->svid = USB_SID_DISPLAYPORT;
>>> +             if (port->ccx == USBC_CCX_REVERSE)
>>> +                     port->mode -= 6;
>>
>> why minus six ?
>> needs a comment.
>>
> 
> EC's logic. I don't know why, it is a quirk from Qualcomm or Huawei.
> I will mention this.

Instead of hard-coding a mapping between the EC's mode and Linux' UCSI 
enum - just make a define or an inline, ideally something with

switch(port->mode)
case GOAKUN_MODE_0:
	val = LINUX_UCSI_MODE_X;
case GOAKUN_MODE_1:
	val = LINUX_UCSI_MODE_Y;
}

That will make the mapping obvious and also ensure both to yourself and 
to your reviewers that you have accounted for _all_ of the potential 
mappings and if those mappings don't exist then the default: of your 
switch statement should make some noise about it

dev_err(dev, "GOKUN UCSI mode %d unmapped\n"); or something like that.


> 
>>> +             break;
>>> +     default:
>>> +             break;
>>> +     }
>>> +
>>> +     spin_unlock_irqrestore(&port->lock, flags);
>>> +}
>>> +
>>> +static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
>>> +{
>>> +     struct gaokun_ucsi_reg ureg;
>>> +     int ret, idx;
>>> +
>>> +     ret = gaokun_ec_ucsi_get_reg(uec->ec, (u8 *)&ureg);
>>> +     if (ret)
>>> +             return -EIO;
>>> +
>>> +     uec->port_num = ureg.port_num;
>>> +     idx = GET_IDX(ureg.port_updt);
>>> +
>>> +     if (idx >= 0 && idx < ureg.port_num)
>>> +             gaokun_ucsi_port_update(&uec->ports[idx], ureg.port_data);
>>
>> Since you are checking the validity of the index, you should -EINVAL if
>> the index is out of range.
>>
> 
> EC / pmic glink encode every port in a bit
> 0/1/2/4/... => ???/left/right/some port
> 
> I remap it to -1/0/1/2, to access specific port exceptions(-1) are not
> harmful, later in gaokun_ucsi_altmode_notify_ind
> 
> 	if (idx < 0)
> 		gaokun_ec_ucsi_pan_ack(uec->ec, idx);
> 	else
> 		gaokun_ucsi_handle_altmode(&uec->ports[idx]);
> 
> gaokun_ec_ucsi_pan_ack can handle exceptions.
> 

gaokun_ucsi_refresh() can return

-EIO
-1
 >=0

Where -EIO and -1 both trigger gaokun_ec_ucsi_pan_ack() in 
gaokun_ucsi_altmode_notify_ind()

So if the index doesn't matter and < 0 => pan_ack() is OK or -EIO is not 
returning meaningful error.

Either way strongly advise against mixing a negative index as having a 
valid meaning with actual -E error codes...

As a reviewer doing a fist-pass this looks suspicous and implies more 
thought/refinement should be done to the flow.


>>> +
>>> +     ucsi->quirks = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
>>> +
>>> +     ssleep(3); /* EC can't handle UCSI properly in the early stage */
>>
>> Could you not schedule work for + 3 seconds instead of sleeping here -
>> representing the required stall time in some sort of state machine ?
>>
> 
> I see, I will check work schedule interface.
> 
>> 3 seconds is an incredibly long time for a computer to sleep.
>>
> 
> This module will be loaded at about 5th second after power up, if not
> sleep, we will receive something disharmonious, sleeping for 3 seconds is
> a hack.

Yes it is. You could schedule some work to complete three seconds from 
here instead of doing this long sleep here.

In fact you are registering a worker here right ?

In which case its pretty trivial to schedule some work on that worker 
for three seconds hence ..

Please investigate.

---
bod
