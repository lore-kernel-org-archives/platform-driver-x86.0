Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E1D3A6F05
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057324; cv=none; b=sG5jMN5iEYQRbBUn5XfOqEQ/KXfJJe1JFfrgD15D/ARp/8fYMXae4PlLgNQ0hoHt/+1NzIIFHxOr/H3mTCwa1g25V/Syfw5zxoMYLEb6A8mCDnELaDI+4MFDJih+ymM7j68Ufqbfl1O92v6b2pXvPrY+nY+Ibjri0qEQQbbaFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057324; c=relaxed/simple;
	bh=tPGbrgCaMZ0DyZ19LOBd8Mpe50NT1GWQeSsYHmyqIe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4hFv5Yvnc549g1sdMjWn5I5jQcw1tQm/rwxT8g0fn2omnypqcmtlySdeYkayCfe+qas11KDnlOa+C544CNg/c9TxYOnBRc2MfATSL8pgDzNk/NGN2ahlDMShkyT0O0wopFkSkgCv3fD8WBl9d+CyH8N0R87i9DozK2CzJpCoic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIi9yxSV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIi9yxSV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439af7d77f0so7373050f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773057321; x=1773662121; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mQ7Kz8UXz7g8x61N7gNTXLc2y01BI63pf2wBEUFNVk=;
        b=OIi9yxSVWB1oNrx68Vcv25QKLF2qawBQF330ptE88+AMDpFBL0fNuGY1PqSK7zLqob
         qSweFmwEmfNAFqWq+Uy1c3qoX9p1aolgyHC1eWlEuBQF+6n+Ij9iMoveP+kX95Szlz3N
         KkFr0e77vUyt3NQHWpC4B+BczFKJwaduH2ayHsXG5rZEq8efEteBlURPi1VsmZr1R1yo
         i5iAwOaRE1zYmkxJfILhD5rVXRmm1sln3iausPiTQyjFZ1nnwF/BVlRGHfGv9zEaLYgJ
         FHAyiVqqk9AE/iMLXQjocnCqFKhk/7uATn1kwRR0DTb0tTyLqB/okQBdNTM031/rYuyQ
         7xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057321; x=1773662121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mQ7Kz8UXz7g8x61N7gNTXLc2y01BI63pf2wBEUFNVk=;
        b=gVpYJWPVIUhie6n/YdGux+3ooR2SefpGAV0dHxPa4xNCYRavshcHow4qEHEU9sr8jP
         VDS31U/eI9IeLgzA16Q/BliIabjalYlTvFANuP305c/IFwxfmje4NmuOTUY/y8n7y5A+
         N8zJwKerLLdPWOe6HvhC/8h0FsO+RtmVzU5ZHqBlNL6LT7Z9iy/5JqnSJNSFDW1LoCq9
         ZfJOm8Kn2zfnbIaOnNRLjmVHOxuuwwKGrTpp+7GWPdcy38wnY6tmuVUzWZbqX11Pf4D9
         T5zYal5idnvHFkfyMXn5GiDS098vvrbtU6BxT8sxonobT2OZcNs16chVowDk3+cijZZ8
         hqHw==
X-Forwarded-Encrypted: i=1; AJvYcCWS5WDVo/lLFTrY9u+mjh/hHYvOiKzqAYlqVKTZTr7WSeoBEPED+ABxZz1Uya/vhA+daJdSLCzy/4nogZMltDw1BCmV@vger.kernel.org
X-Gm-Message-State: AOJu0YweMzqApW9TavgZw9gRKIpvSwQx7At0HK3uepegzqi5c8S9BqI3
	4Dr3t7RyQEbuPtkXXDCVU6ThUhnFAHv2UmMkgnli7oXx5mRhgb5NzrjCEwOevUaVwzY=
X-Gm-Gg: ATEYQzxw96eA/ajl5YS/cTq386ba/4wSrJrRSWMnMCfH6q/WbE0bPqT6JvH1Szi/BNo
	RfO7/N+nb1bf0qFB+le84aP3N0NUTzESnPVbYdSSqfl4ZGLuZjNBClh1teJq90WWVfcwnmWRewD
	fLAztPTTBeSe6foP4/5RfvCPgftfYvjQUEeKkZjKE+HOqLNY8siQPtIKnO1/PwH8wPrLsJi1fp4
	yS9GrlurtlBFp688Us3Ml5y2FeeDAopKQosivso8ym32b1Y46Wjkp83AlA/TI82ME8BXxi9BO1f
	WqpDC2A1B8s82PEpnxUlhnL/py+zWOz2VjolHiVx9lus2Di1UhiH4DDVeqWjuK7wJxNjYh2I/rG
	n6fvvtqL2Wyzy6oIKSNtloqxuzJ/uPrOL68qGWbnfmz5Tad2P+W3uJYvaSkleDdzU74tiqzN9Ri
	zHDLKtrDSGqXonutj3A+MvuU7AFJrUGsq5e6s=
X-Received: by 2002:a05:6000:2010:b0:439:d6ea:7cff with SMTP id ffacd0b85a97d-439da354a83mr21218582f8f.4.1773057321360;
        Mon, 09 Mar 2026 04:55:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm26979725f8f.11.2026.03.09.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:55:20 -0700 (PDT)
Date: Mon, 9 Mar 2026 12:55:09 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <aa61HZOuz42C_R7X@linaro.org>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
 <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 12:47:33PM +0100, Konrad Dybcio wrote:
> On 3/9/26 11:04 AM, Sibi Sankar wrote:
> > On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
> >> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
> >>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> >>> reference boards. It handles fan control, temperature sensors, access
> >>> to EC state changes and supports reporting suspend entry/exit to the
> >>> EC.
> >>>
> >>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>> ---
> >>>   MAINTAINERS                            |   7 +
> >>>   drivers/platform/arm64/Kconfig         |  12 +
> >>>   drivers/platform/arm64/Makefile        |   1 +
> >>>   drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
> >>>   4 files changed, 482 insertions(+)
> >>>   create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
> >>>
> >>> [...]
> >>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> >>> new file mode 100644
> >>> index 000000000000..83aa869fad8f
> >>> --- /dev/null
> >>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> >>> @@ -0,0 +1,462 @@
> >>> [...]
> >>> +/*
> >>> + * Fan Debug control command:
> >>> + *
> >>> + * Command Payload:
> >>> + * ------------------------------------------------------------------------------
> >>> + * | Offset    | Name        | Description                    |
> >>> + * ------------------------------------------------------------------------------
> >>> + * | 0x00    | Command    | Fan control command                |
> >>> + * ------------------------------------------------------------------------------
> >>> + * | 0x01    | Fan ID    | 0x1 : Fan 1                    |
> >>> + * |        |        | 0x2 : Fan 2                    |
> >>> + * ------------------------------------------------------------------------------
> >>> + * | 0x02    | Byte count = 4| Size of data to set fan speed            |
> >>> + * ------------------------------------------------------------------------------
> >>> + * | 0x03    | Mode        | Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )    |
> >>> + * |        |        | Bit 1: Fan On/Off (0 - Off, 1 - ON)        |
> >>> + * |        |        | Bit 2: Debug Type (0 - RPM, 1 - PWM)        |
> >>> + * ------------------------------------------------------------------------------
> >>> + * | 0x04 (LSB)    | Speed in RPM    | RPM value, if mode selected is RPM        |
> >>> + * | 0x05    |        |                        |
> >>> + * ------------------------------------------------------------------------------
> >>> + * | 0x06    | Speed in PWM    | PWM value, if mode selected is PWM (0 - 255)    |
> >>> + * ______________________________________________________________________________
> >>> + *
> >>> + */
> >>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> >>> +{
> >>> +    struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
> >>> +    struct device *dev = ec_cdev->parent_dev;
> >>> +    struct i2c_client *client = to_i2c_client(dev);
> >>> +
> >>> +    u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> >>> +              EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
> >>> +              0, 0, state };
> >>> +    int ret;
> >>> +
> >>> +    ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
> >>> +                         sizeof(request), request);
> >> I think it's nice to provide users a way to override the fan speed, but
> >> is this really the main interface of the EC that we want to use for
> >> influencing the fan speed?
> >>
> >> As the name of the command suggests, this is a debug command that
> >> essentially overrides the internal fan control algorithm of the EC. If
> >> you use this to turn the fan off and then Linux hangs, I would expect
> >> that the fan stays off until the device will eventually overheat.
> >>
> >> I think it would be more reliable if:
> >>
> >>   (1) The default mode of operation does not make use of the "debug mode"
> >>       command and instead sends the internal SoC temperatures to the EC
> >>       to help optimize the fan control. (This is what Windows does on
> >>       Hamoa, not sure if this is still needed on Glymur?)
> > 
> > That's true, Glymur already has a way to access average SoC
> > temperature and even on Hamoa it can still be functional without
> > SoC temperature i.e. with thermistors it has access to.
> > 
> > The aim of the series is to expose fans as a cooling device so
> > that linux has a way of fan control independent to the algorithm
> > running on the EC.
> 
> I suppose the main question here is "what happens if i set the fan to zero
> and put the laptop in my backpack"
> 
> The driver for M-series Macs for example, 785205fd8139 ("hwmon: Add Apple
> Silicon SMC hwmon driver") hides that behind a cmdline param, since they
> have no certainty. I would *assume* that if the CPU hits thermal junction
> temperatures, our boards will reset, but we should be able to get a definitive
> answer here.
> 

The CPUs should automatically throttle when reaching high temperatures
and Linux should also do this for the GPU. So the chance of reaching a
overtemperature state should be low as long as Linux correctly
functions. The biggest risk would be probably if Linux hangs, the
watchdog doesn't trigger and the machine is stuck in some state.

As for the hardware shutdown temperature, see commit 03f2b8eed73
("arm64: dts: qcom: x1e80100: Apply consistent critical thermal
shutdown"):

 "The firmware configures the TSENS controller with a maximum
  temperature of 120°C. When reaching that temperature, the hardware
  automatically triggers a reset of the entire platform."

The question is if you really want your device to hit 120°C. :-)

Thanks,
Stephan
