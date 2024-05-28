Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A814373A
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716940575; cv=none; b=Tlr1W/JSYiqe7o6jTKUOvm4Y37mAKwIiHhFI4A7uIk6vwY+G8YA4+aTD5pvWTo5P7u3GtxGw6T24blARbXsJWSrxeDLAzQ1yqp3Hg1fVHtFhNjeL8A/gdhElL67FNO7KWKmNcYXrVN1e2F2LBbUhfJM2t8Kd2i0Q9HSTLQp+bLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716940575; c=relaxed/simple;
	bh=UFnUo5et2nu4ZTLwron8KcsxSOqZm4uccIMJ4BvQ3XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvnndGdOZ11YrcZP+F5ZKA6zacj7bitRNbynNL3/JeiuSkK6B3lu0L7QArEO8W/grVtw7M7/8Cjd24ZJ2GflsGT4SQTlMOe648MSWXTVKqf8q2k1CJF9PeC+w/6PDbLNUg9a27f9FkgMOzdE+EXLQOOfeE7q0uMOM/Bs84yM2JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKbW0B7x; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKbW0B7x"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-529661f2552so1838261e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 16:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716940571; x=1717545371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4MYPVYNdfA6ot8nLghsVUlr6HtvllgPwAgd9kwmapI=;
        b=xKbW0B7xa5y17J4mBWrTWCGlZhTKY4tR2rihFm72ghs+tsf2wWEg5VqM624kh4kgw3
         06T2Jyzn4iahn/7r8zM3wzZ0B8iirM/sPfjSekaXANmChmFRTQvYF2myfM0jsoDyDSrS
         lGADs0ZZMSLyJDwUrANS2LVrKxFQ34WgPyAC1b8xDqUpboFdLoBjWNSg+RwCY//hc1XI
         7Z6Wx4/YkRiXccK6gpJq7TYHHOvbI7nNyvGdgImON6Y2ruSo/dfd3py4j4P+y3Je6AM7
         E6DdVnMnJQ+9oIjNrfwoHQm/1cseV+fL4w7lgTppBDWgZNDB+0KHOEf/ldpbQ4HQSr7B
         Donw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716940571; x=1717545371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4MYPVYNdfA6ot8nLghsVUlr6HtvllgPwAgd9kwmapI=;
        b=fA2N1aKWMKXgaynFDI/ut39FFO1FEvzqGnb435Q6rYtmrP8SkOvZkXXHW4K4DjDXjr
         QvdWZHDjd/bxcn1UkYAei2To55ZcX9Xwt2ieY7xJwYmYzJsCsxL838TNrw6SLKx/Kw9/
         KSjOMqOB8iPlOu8SVlABGRrjt3JawfT9YMaI46VW5zBKrtTQpxjBo9n8OqOUdv1frULK
         fE1qj86X7S0GY9wNWBCWJO0KJctHGtmUaI6/2AL8EiL/FEF89CpoafuZdiAzJLtE/ask
         RsKGNYfozwQAhKVnzJnojVczbpPoDdXW3USXtOA9Ct8Lh3da0tOqMNhRuTPVbQuFuJ9B
         6Xjg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ978zu2o0GgBjutHsJXj1FdjBgTAA+CgJohNsZO+w0xy1seSuceHvWQnfbqw7YGVahlVJf2Zzm+fyyEj4gPy2sAY264DJhr6ByJ7wA2fJ5UO+Rg==
X-Gm-Message-State: AOJu0Yw/FF323lvHD7QZKnlct+G0hcZ1p6Y5JpnsM/TWq9vTGIA6oMbf
	AkxHpXWgA8YuyvkHUbgSehYbzSpbM50/8VTPlmNqkwUUOio7bySrJ6Y6SS8Ja8Q=
X-Google-Smtp-Source: AGHT+IGTsD1dM3WwZD2UJs8zbC72VrfPx0lRpZvezsImS9eOLf7B6kz3Z1AJOBQKD9VVsfodx+D6aA==
X-Received: by 2002:ac2:494e:0:b0:524:3177:8e45 with SMTP id 2adb3069b0e04-52966f8f6bcmr8360832e87.68.1716940571039;
        Tue, 28 May 2024 16:56:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a7fb982esm815183e87.265.2024.05.28.16.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 16:56:10 -0700 (PDT)
Date: Wed, 29 May 2024 02:56:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v4 2/6] platform: arm64: add Lenovo Yoga C630 WOS EC
 driver
Message-ID: <3gbjbuav5l2td5xrfj46krhgdew42medhfrnkd47iahdv4fm3x@qv6jadf6tkol>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-2-4fa8dfaae7b6@linaro.org>
 <2b76f27e-f223-4ff9-880e-9e232ce9ddc6@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b76f27e-f223-4ff9-880e-9e232ce9ddc6@linaro.org>

On Wed, May 29, 2024 at 12:51:04AM +0100, Bryan O'Donoghue wrote:
> On 28/05/2024 21:44, Dmitry Baryshkov wrote:
> > Lenovo Yoga C630 WOS is a laptop using Snapdragon 850 SoC. Like many
> > laptops it uses embedded controller (EC) to perform various platform
> 
> an embedded controller
> 
> > operations, including, but not limited, to Type-C port control or power
> > supply handlng.
> > 
> > Add the driver for the EC, that creates devices for UCSI and power
> > supply devices.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/platform/arm64/Kconfig                 |  14 ++
> >   drivers/platform/arm64/Makefile                |   1 +
> >   drivers/platform/arm64/lenovo-yoga-c630.c      | 279 +++++++++++++++++++++++++
> >   include/linux/platform_data/lenovo-yoga-c630.h |  42 ++++
> >   4 files changed, 336 insertions(+)
> > 
> > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> > index 8fdca0f8e909..8c103b3150d1 100644
> > --- a/drivers/platform/arm64/Kconfig
> > +++ b/drivers/platform/arm64/Kconfig
> > @@ -32,4 +32,18 @@ config EC_ACER_ASPIRE1
> >   	  laptop where this information is not properly exposed via the
> >   	  standard ACPI devices.
> > +config EC_LENOVO_YOGA_C630
> > +	tristate "Lenovo Yoga C630 Embedded Controller driver"
> > +	depends on I2C
> > +	help
> > +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> > +	  Lenovo Yoga C630, which provides battery and power adapter
> > +	  information.
> > +
> > +	  This driver provides battery and AC status support for the mentioned
> > +	  laptop where this information is not properly exposed via the
> > +	  standard ACPI devices.
> > +
> > +	  Say M or Y here to include this support.
> > +
> >   endif # ARM64_PLATFORM_DEVICES
> > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> > index 4fcc9855579b..b2ae9114fdd8 100644
> > --- a/drivers/platform/arm64/Makefile
> > +++ b/drivers/platform/arm64/Makefile
> > @@ -6,3 +6,4 @@
> >   #
> >   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> > +obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> > diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
> > new file mode 100644
> > index 000000000000..3d1d5acde807
> > --- /dev/null
> > +++ b/drivers/platform/arm64/lenovo-yoga-c630.c
> > @@ -0,0 +1,279 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022-2024, Linaro Ltd
> > + * Authors:
> > + *    Bjorn Andersson
> > + *    Dmitry Baryshkov
> > + */
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_data/lenovo-yoga-c630.h>
> > +
> > +#define LENOVO_EC_RESPONSE_REG		0x01
> > +#define LENOVO_EC_REQUEST_REG		0x02
> > +
> > +#define LENOVO_EC_UCSI_WRITE		0x20
> > +#define LENOVO_EC_UCSI_READ		0x21
> > +
> > +#define LENOVO_EC_READ_REG		0xb0
> > +#define LENOVO_EC_REQUEST_NEXT_EVENT	0x84
> > +
> > +struct yoga_c630_ec {
> > +	struct i2c_client *client;
> > +	struct mutex lock;
> > +	struct blocking_notifier_head notifier_list;
> > +};
> > +
> > +static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len,
> > +				u8 *resp, size_t resp_len)
> > +{
> > +	int ret;
> > +
> > +	WARN_ON(!mutex_is_locked(&ec->lock));
> > +
> > +	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_REQUEST_REG,
> > +					     req_len, req);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return i2c_smbus_read_i2c_block_data(ec->client, LENOVO_EC_RESPONSE_REG,
> > +					     resp_len, resp);
> > +}
> > +
> > +int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
> > +{
> > +	u8 req[2] = { LENOVO_EC_READ_REG, };
> > +	int ret;
> > +	u8 val;
> > +
> > +	mutex_lock(&ec->lock);
> > +	req[1] = addr;
> > +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &val, 1);
> > +	mutex_unlock(&ec->lock);
> > +
> > +	return ret < 0 ? ret : val;
> > +}
> > +EXPORT_SYMBOL_GPL(yoga_c630_ec_read8);
> > +
> > +int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
> > +{
> > +	u8 req[2] = { LENOVO_EC_READ_REG, };
> > +	int ret;
> > +	u8 msb;
> > +	u8 lsb;
> > +
> > +	mutex_lock(&ec->lock);
> > +
> > +	req[1] = addr;
> > +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &lsb, 1);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	req[1] = addr + 1;
> > +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &msb, 1);
> > +
> > +out:
> > +	mutex_unlock(&ec->lock);
> > +
> > +	return ret < 0 ? ret : msb << 8 | lsb;
> > +}
> > +EXPORT_SYMBOL_GPL(yoga_c630_ec_read16);
> > +
> > +u16 yoga_c630_ec_ucsi_get_version(struct yoga_c630_ec *ec)
> > +{
> > +	u8 req[3] = { 0xb3, 0xf2, 0x20};
> 
> You have a define above for the read_reg and write_reg commands, could you
> not define 0xb3 as LENOVO_EC_GET_VERSION ?
> 
> All of the other commands here seem to have a named define.

Because unlike other registers it is not clear what other use cases does
0xb3 support

> 
> > +	int ret;
> > +	u8 msb;
> > +	u8 lsb;
> > +
> > +	mutex_lock(&ec->lock);
> > +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &lsb, 1);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	req[2]++;
> 
> why not set reg[2] = 0x21;

ack

> 
> also is req[2] some kind of address ?

Unfortunately no idea. This is totally based on the AML code in DSDT. I
have no documentation on the EC or its programming interface.

> 
> > +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &msb, 1);
> > +
> > +out:
> > +	mutex_unlock(&ec->lock);
> > +
> > +	return ret < 0 ? ret : msb << 8 | lsb;
> > +}
> > +EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_get_version);
> > +
> > +int yoga_c630_ec_ucsi_write(struct yoga_c630_ec *ec,
> > +			    const u8 req[YOGA_C630_UCSI_WRITE_SIZE])
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&ec->lock);
> > +	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_UCSI_WRITE,
> > +					     YOGA_C630_UCSI_WRITE_SIZE, req);
> > +	mutex_unlock(&ec->lock);
> > +
> > +	return ret < 0 ? ret : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_write);
> > +
> > +int yoga_c630_ec_ucsi_read(struct yoga_c630_ec *ec,
> > +			   u8 resp[YOGA_C630_UCSI_READ_SIZE])
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&ec->lock);
> > +	ret = i2c_smbus_read_i2c_block_data(ec->client, LENOVO_EC_UCSI_READ,
> > +					    YOGA_C630_UCSI_READ_SIZE, resp);
> > +	mutex_unlock(&ec->lock);
> > +
> > +	return ret < 0 ? ret : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_read);
> > +
> > +static irqreturn_t yoga_c630_ec_intr(int irq, void *data)
> > +{
> > +	u8 req[] = { LENOVO_EC_REQUEST_NEXT_EVENT };
> > +	struct yoga_c630_ec *ec = data;
> > +	u8 event;
> > +	int ret;
> > +
> > +	mutex_lock(&ec->lock);
> > +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &event, 1);
> > +	mutex_unlock(&ec->lock);
> > +	if (ret < 0)
> > +		return IRQ_HANDLED;
> > +
> > +	pr_info("NOTIFY %x\n", event);
> 
> why not dev_info() ?

Argh, debugging code. I should drop it.

-- 
With best wishes
Dmitry
