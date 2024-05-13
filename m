Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191B148FE7
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594525; cv=none; b=YnFb6zb/1LEjn/njxD3HD7TBUw57yQd8BLm3NTuE1jD/ba1niO3MyaAGWfPLIoY+k8+igPxhU6q/gmiCH4G21t5b6K9WtQJXllE9zq8x6lEI0Nh2CxWbnC6waIwLuI6cvCrAxxFu5xqOVpCHofuuacTI+V/ZoGie8djpd8Myfko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594525; c=relaxed/simple;
	bh=S++c2Z1ZmBaRX10JXuxUJKOfQUClDr/WhCXsw2Aemkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=as3gC60iq1BGxsg/d2fHKSFeyTKML1o2beWAqT34aTWjQoTdMprQiAtn4mCFRDysdyGzw1bnPgb1YL21YiD2VJf2do6w4LvM0F/S2Qp6Nuz0bfwdzcVt05rTDeG6y8jhyGaho7SpJEMg4708DRtjbhBAZ2qR7CeoFTy+OA8IsPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ho53xGuj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ho53xGuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715594521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsml0zbl3qWxi8KY7pMw7hs8ugUM0NcxVfTSpd7e4GU=;
	b=ho53xGuj7mcoRNg0HFAedaX2duTs5VK86jgoQ2lZCjLoom/73Kcwckrqk2noefzoquTJCd
	YaikPDy0dOQ20onkbaFnN/EJ/pVpcTeSQeNuHF7/gDFIwlikEiSknPBis3Sdv5+AUGvQbz
	ifkHvREcJCdxYK6DNz+0tCdzANJ17Hc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-6UfvDRjVP0mPSYXa2HK2VQ-1; Mon, 13 May 2024 06:01:58 -0400
X-MC-Unique: 6UfvDRjVP0mPSYXa2HK2VQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a599b55056bso253304466b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 03:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715594517; x=1716199317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsml0zbl3qWxi8KY7pMw7hs8ugUM0NcxVfTSpd7e4GU=;
        b=LlHOUdLu4UvrRj0MmesZhEF33M1qskucD/dFQlJozq5wwwk+SZ5Q0MLtWkGgjKbXCP
         9FK1XB/VlPHBZI+6EcrzCArwTxITZ3bs4f/mtUhumqbcSKWSj0G7njwCXsH2e6CA8loW
         bAFsL5nKOOjXLCHuQQJmD/d+BXuBa/7Hw2Mqo2Wl6fQtcMc826YUl9mpDUQqAs9XZs39
         LFF9V/9OAq0NoD2PEDP3/F0QGcmgC0gKl8QWEAH/xjub96CamczrKSVPzjuw2HIkbJcp
         97khdDkjML8mBKlHe0oOK6HWhCx9T9z8inMnI5DrusnmvrXSgzmZy1MhL8aj1MhfPzQG
         FRsg==
X-Forwarded-Encrypted: i=1; AJvYcCXB80zFvbufEZzQQCIoooCah8WOpv23IGGvV2XNZMTxlr4gEo2jwzP3ZUKYhd851GCs92gvi6lG0d9ODr84L6mhelDGWCzRTjyhS/1pVSb2t2SJ4Q==
X-Gm-Message-State: AOJu0YwZheTDzv2oa3R+75RHDvJL6Pk8cMYp6x70SXtTU+tVFNyaZlcv
	f36hPxgRm1oI8bsgWUxtnSZkOn1jD+HIraE363PY+pzdyCng/H5CAXRcHZdBbzr20K//xF0vJtf
	8Fcmzx6f/KMWvvaygHx0B9Nks2oz3KHFS+gRYkYthdAb4W4ydNCW/FLaml2O0IakjpHp7SiI=
X-Received: by 2002:a17:907:7757:b0:a59:c9ce:3389 with SMTP id a640c23a62f3a-a5a2d673aa6mr534254266b.67.1715594517030;
        Mon, 13 May 2024 03:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkFco/pKYQWwYYYkcOoZuOI4GGZC81GSZqPXK9JQ7vxNQd+tArhDH+I3dBkfMq7E3UHRt20g==
X-Received: by 2002:a17:907:7757:b0:a59:c9ce:3389 with SMTP id a640c23a62f3a-a5a2d673aa6mr534252566b.67.1715594516655;
        Mon, 13 May 2024 03:01:56 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d7csm583167766b.140.2024.05.13.03.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 03:01:56 -0700 (PDT)
Message-ID: <796db4c0-e81f-4067-9deb-bef8b36979c9@redhat.com>
Date: Mon, 13 May 2024 12:01:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240512162353.46693-1-hdegoede@redhat.com>
 <20240512162353.46693-2-hdegoede@redhat.com>
 <CAHp75VeMT+Pcvf-T9-iVqchSx1tppaeORWMmFhP66ZMg-ybmPw@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeMT+Pcvf-T9-iVqchSx1tppaeORWMmFhP66ZMg-ybmPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/12/24 9:35 PM, Andy Shevchenko wrote:
> On Sun, May 12, 2024 at 7:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
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
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> How is this being used?

#include "../serdev_helpers.h"

uses this.

> 
> ...
> 
>> +#include <linux/acpi.h>
> 
> + array_size.h
> 
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
> 
> + device.h // devm_kzalloc(), dev_err() et al.
> 
> + err.h
> 
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/serdev.h>
> 
> + string.h
> + types.h
> 
>> +#include <linux/wait.h>

Ack, all includes added, thanks.

<snip>


>> +static int dell_uart_update_status(struct backlight_device *bd)
>> +{
>> +       struct dell_uart_backlight *dell_bl = bl_get_data(bd);
>> +       int ret;
>> +
>> +       ret = dell_uart_set_brightness(dell_bl, bd->props.brightness);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (bd->props.power != dell_uart_get_bl_power(dell_bl))
>> +               ret = dell_uart_set_bl_power(dell_bl, bd->props.power);
> 
>     return ...;
> 
>> +       return ret;
> 
>   return 0;
> 
> ?

Ack, fixed for v2.

Regards,

Hans

