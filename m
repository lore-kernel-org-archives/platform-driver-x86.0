Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E7143C74
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Mar 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711882298; cv=none; b=P1IICCvx9ca2lF3ATz4e6Hf+mqOvjhM+08RtH+NstJYLmcI3dROExZAUW34YmhLxKMbAmFb1AKgrXZ9uY+pDHbtRkMETWEJozQZpvrrBEKCF7i0miS1kUKECwdQ/Eb0R/5guiwM+XxOg2zS9K1lZKGcwOmgZG2MWvjMGb9f5+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711882298; c=relaxed/simple;
	bh=pcdIiEhM2l/zdXKf8Ui9dBMz5cNT2DJKO3WWCjp2iwA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:In-Reply-To:
	 Content-Type; b=Qu2DcTW31vtK1Q210Tg1F3B2BonOUShWI+Hihwfakk5I57g/xHpT8s9luzVrg85WGu5FxdwtuBoXxGDLmCGA2HuQ5AOF6DGfhTwO3GNPGEy4zQcrdGevgc3x/Lvgj+E4ubcq8iUMm/lJt6WoQuWYcHi2h1r/LTA41x/91d/hrNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in; spf=none smtp.mailfrom=cpp.in; dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b=aBNd2L+h; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cpp.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b="aBNd2L+h"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so2491637a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Mar 2024 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20230601.gappssmtp.com; s=20230601; t=1711882294; x=1712487094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiyEjUctzgw3d5cbSMfpqrqZz263bg9AlN7/QV97RU8=;
        b=aBNd2L+hxc81bM21Uuez4jAwYVhyEEzN3xKS7QvFuFW4PI2WG/FxYGyOYqHxNsMKCB
         jQ9UtS+1P4SsPfvuk/t4r1ic1ZBG1pmMlez99z1keJ2q974Zz7OJqCcbzrdg05MZ0KGW
         z23AgaOwVKeiEV/Xyilcfmt37fWzoKdl6Cq+v7qmjd7E1M9ox4Y3qUuRfonKeA9or6wS
         7mIn1z03Jn+JD+tiOHWrYk+w1aYwTF0dsS/GeCIOt0xCytsbpqEJ+X9oizkuf81r/N03
         gxNF0zpGtRCFhs3uLpThM3vcDAaDgFINvtshtiVGerG279tm5nyA1/Q1Vo8ZF2TGWMCD
         UvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711882294; x=1712487094;
        h=content-transfer-encoding:in-reply-to:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiyEjUctzgw3d5cbSMfpqrqZz263bg9AlN7/QV97RU8=;
        b=TXBh2iuUDvhJuIAkmMo6uofyQG8Y5oGhf7LPNw3w9CKZAHTGLq6wKKk/pFGCG56zeK
         AT/+R3t1L2TNiBQNDpmEYkX5/247hPD2skkaGHmuaiZG2Bs6BvXPxT+sGimTe27XOasE
         ockwNo6JN3EcXqQ1cHPCgEoFcTVmramok1etlQSgVwRF4VnG1PcSyhsMXa8N9Ch4yn7h
         LZ3rnOIZ4BQU3BSOOLNeyCiU8buKqxDsrMoB/kFG+SuatFW9r8xkorznZSBfQb8aULRh
         fkOcAFSajd6P22BzPwGK6vXaRGlh8K+RcwEIK/2hNOgg4HUsAZQxSK3j/O/CO0H+bXRH
         ntXw==
X-Forwarded-Encrypted: i=1; AJvYcCW1MA7WTOSnvCoOedYxH3AuxQhkYq0HVegTBcdb7RUPYNs6uqs0+JV7CS0vqMp+6cjJbvqQObGi9pFG359TfOiHEpr2iQYkot5ovZY76Gzlq06voA==
X-Gm-Message-State: AOJu0YyuojB8APE85s7IGrQ/aL77Ub31Gp7mxJ8jaJwV+xPVtxd+sKPz
	/8hTJrsUqkq+yj1hivDKL9IESzBkow005mgtJNdPkdIDkT/6S2hEot4y42/zQg==
X-Google-Smtp-Source: AGHT+IGbCXPjBovSTHKR9172xf/YfQYGs9t0Y+nud/nfFHTvv80yMaWcmcBoZV1xkyeTwbzmrc7sPQ==
X-Received: by 2002:a17:903:228e:b0:1e0:b687:c5d1 with SMTP id b14-20020a170903228e00b001e0b687c5d1mr8767015plh.64.1711882294570;
        Sun, 31 Mar 2024 03:51:34 -0700 (PDT)
Received: from [192.168.3.23] (mx-ll-180.183.76-49.dynamic.3bb.co.th. [180.183.76.49])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b001e0a7e617d9sm6642277plg.82.2024.03.31.03.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Mar 2024 03:51:34 -0700 (PDT)
Message-ID: <bde342c6-be23-4afa-978f-9503e3c11223@cpp.in>
Date: Sun, 31 Mar 2024 13:51:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anthony I Gilea <i@cpp.in>
Subject: Re: [PATCH] platform/x86: int3472: Add handshake GPIO function
To: hdegoede@redhat.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 bingbu.cao@intel.com, dan.scally@ideasonboard.com, djrscally@gmail.com,
 hao.yao@intel.com, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, sakari.ailus@intel.com
Content-Language: en-US
In-Reply-To: <186830d2-dd18-7948-b2c5-bcda934ad3e8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hello,

I'm trying to get camera on HP Spectre x360 14-eu0xxx (2024) laptop to work.
I was able to make main sensor driver (ov08x40) to play nice with IPU6,
INT3472 and libcamera-SoftISP and the resulting image quality is absolutely
usable and even surprisingly good.

This laptop also uses this "MIPI aggregator".


> Hi,
> 
> On 10/7/23 04:12, Hao Yao wrote:
> > Handshake pin is used for Lattice MIPI aggregator to enable the
> > camera sensor. After pulled up, recommend to wail ~250ms to get
> > everything ready.
> 
> If this is a pin on the "Lattice MIPI aggregator" and
> not on the sensor itself then this really should be
> modeled as such and should not be registered as a GPIO
> consumed by the sensor since the actual sensor does not
> have a handshake pin at all.
> 
> Also we really don't want to need to patch all involved
> sensor drivers to toggle a handshake pin, especially since
> the sensor itself does not physically have this pin.
> 
> Can you explain a bit more:
> 
> 1. What the "Lattice MIPI aggregator" is.
> 2. What its functions are, does this control reset + pwdn
>    GPIOs for the sensor? Voltages to the sensor? Clk
>    to the sensor ?

It acts like MIPI switch as no MIPI data gets from the sensor to IPU6 if
handshake signal is not asserted. Eventually IPU6 times out with "start stream
of firmware failed" message. Any further attempts to start streaming lead to
a panic.

I2C communication is not affected by the handshake signal but it looks like
reset signal is also going through this "MIPI aggregator" as it takes about
150ms for the sensor to reliably start responding via I2C after the reset
is deasserted. It should be about few ms if the reset signal was connected to
the sensor directly.

> 3. How the aggregator is connected to both the main
>    CPU/SoC as well as how it is connected to the sensor ?
>    Some example diagram would be really helpful here.
> 
> Then with this info in hand we can try to come up
> with a way how to model this.
> 
> Assuming this controls the entire power-up sequence
> for the sensor then I think it could be modelled
> as a GPIO regulator. This also allows making the
> regulator core take care of the necessary delay
> between setting the GPIO and trying to talk to
> the sensor.

Are there any updates on how this signal should be implemented? For now I'm
just applying this patch and asserting it from the sensor driver.

Regards


> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> > Signed-off-by: Hao Yao <hao.yao@intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel/int3472/common.h   | 1 +
> >  drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> > index 655ae3ec0593..3ad4c72afb45 100644
> > --- a/drivers/platform/x86/intel/int3472/common.h
> > +++ b/drivers/platform/x86/intel/int3472/common.h
> > @@ -23,6 +23,7 @@
> >  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
> >  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> >  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> > +#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
> >  
> >  #define INT3472_PDEV_MAX_NAME_LEN				23
> >  #define INT3472_MAX_SENSOR_GPIOS				3
> > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > index b644ce65c990..4753161b4080 100644
> > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > @@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
> >  		*func = "power-enable";
> >  		*polarity = GPIO_ACTIVE_HIGH;
> >  		break;
> > +	case INT3472_GPIO_TYPE_HANDSHAKE:
> > +		*func = "handshake";
> > +		*polarity = GPIO_ACTIVE_HIGH;
> > +		break;
> >  	default:
> >  		*func = "unknown";
> >  		*polarity = GPIO_ACTIVE_HIGH;
> > @@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  	switch (type) {
> >  	case INT3472_GPIO_TYPE_RESET:
> >  	case INT3472_GPIO_TYPE_POWERDOWN:
> > +	case INT3472_GPIO_TYPE_HANDSHAKE:
> >  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
> >  		if (ret)
> >  			err_msg = "Failed to map GPIO pin to sensor\n";
> 
