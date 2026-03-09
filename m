Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A48374176
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047015; cv=none; b=UqsU3CW3Vw0UptB/lfs8QkQ5OqXVrn2dOxgYhDQWMsXMf3guLEGEUJrZpR35mf7VSx5cvko/BeCMUW/93y+nN+2Dzf/iszc5VOxAlZta8QhH7y9njULdk3385hnDWG2iTyGRwYj4f7I5ju/YGraQnIAG1MXqCnI+Fh/An69VFnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047015; c=relaxed/simple;
	bh=qGEB3XD7gojHBWJ9RE8VBAzc/uVj0p2b7U2dsgQKD9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJSEUbel7/fo6yXLXlx0E1rQZmcdjc/yXxi3ToqsIBJ6mvriJJ7dkD8w6hPZTcEVuimPTPOnDMESh8OoCI2imF3Hv3mkfrYaGBLpC9SXkeiFnyIyGXWBSVFK9bZIPrFAFpeRf81SwLzBb9xqT2GmVxbRQkEFikEMBTbsGZQ9/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LuMzkjiE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuMzkjiE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so7967827f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773047012; x=1773651812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+w3bS1I8COac0TzNO6kOqZWAWD9GoIWZqJcCyuzMZC4=;
        b=LuMzkjiEOmVWJO8cwjYZNfIY0YmyGwVVFLU04pqrJt5UJTdG7CqS9rbxNMDHG7jub8
         YxRPM6O804SvFCFGxywERjTVWPQP9LSTJODMPlWDMUK1QrwKIPt1YGal0XZ3t545KSXU
         kC4TB5X6Fmq/7sO8GJ5XpVoWfrTLOP32A8hIAxWS8vC4qPNHfOdlbxtAnAKn3iJ/58S2
         rvehWGP86jeAVmM5JqbnkLKVVLti0fRUOB5Ya2EbB2CFVbcqc3qoxtui8SXGfVzvs/YB
         jfGQ5Eu9tui0OiEdTGuYfEW0wJAKfzQOZWHBnQgAV/I6GYYCWNfQbDKDn+kXYv3Q78Xm
         7ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047012; x=1773651812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w3bS1I8COac0TzNO6kOqZWAWD9GoIWZqJcCyuzMZC4=;
        b=HPTs1YB6h9naRYLaDpixmY0JheBkILd1acRdZVL9PRbr3cUuCnTOU7ThB2EvKPmy7Z
         OG00rEnAefPZeQzm09OVmFUDVvgdZiZyjQEy7z6RSAl8ALBXJf2TZQCrlH8+ehGSbZD0
         R7F2TT9mjU/8zWdqbPkUp/71IQYWI90LsYACpFTtOp4W/E9vLj6SObJKSvLQtAbDvjCC
         3L4uqOk92223YyxTsHR7T3GpMm11BuQOIRH/uyI0Rg0YawpouGn48Uof8YsfYcbjvH3o
         NybhBjd3+tMHYm5wScottB3ciphCY1m7qGFE/9K6+v3qOtXZe2lZIxXA329V8b2DNtrZ
         EqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYhav/mDiLnrb85jbPpKMEJ+OS/bMqoIPRwBkFFCJj/nZzYB68v3pz9c1qS0XkYDbKKZQvp9fRL01zj2LY/VakWlO4@vger.kernel.org
X-Gm-Message-State: AOJu0YyreMfvdEInxhbkR8vF4eSPZji5QSAEnr02kLX6VgtrwnG/5NnU
	kd/o/IXGv6QdEJckhhSGhw5sg42HjeBj9Zoz284xXRc1Rvo0f+wqmH9vL7vsEY9ByjE=
X-Gm-Gg: ATEYQzzbLdx/lb599pJPT668nAnO7q/qyiR2pDrvjQLEpiI1bo9/6SsnnF+XKezqF8q
	m9TfGs6BDhoUEPp31XbSIj7IiAKi6lrZ9yxbgyxfvYE1+pizvTg2NXk9LLzSBvXJx732lBpk4eD
	bBIANCUl30gj01oV9CjU2oItb4QT8WU/WG+OMHQu4rf14NfNwz9apfPdXt4alJKGro49Rprg+uh
	FCri7lmBmSRZ4a7sWtdy0WnVkkTe14ttLIXa4m7JWn3/8DWpyJ9ucBKlBeSwAphDhqBILDUZExw
	fG2tnRCKSHWKjqe274HkFsP2Jjc1cSMKxq1rrp0N2zrhK3JLQnYzqwmottRcLRVor3LdLS3kT7l
	89d9TFyTuurYi7hz+J5aekkAAfbuWKLugzMhJipZnDzSbE2M7QAaUPGsvB/DoL4+hyR2fqrihZ7
	zF9aNV6VB+JP98uGdctiI3BWPkhQF3
X-Received: by 2002:a05:6000:230f:b0:439:b7a2:60ff with SMTP id ffacd0b85a97d-439da8820f6mr18217513f8f.32.1773047012102;
        Mon, 09 Mar 2026 02:03:32 -0700 (PDT)
Received: from linaro.org ([77.64.146.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm26267747f8f.24.2026.03.09.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:03:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:03:21 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, bryan.odonoghue@linaro.org,
	ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <aa6M2QSXW72xqYiB@linaro.org>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |   7 +
>  drivers/platform/arm64/Kconfig         |  12 +
>  drivers/platform/arm64/Makefile        |   1 +
>  drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>  4 files changed, 482 insertions(+)
>  create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
> 
> [...]
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> new file mode 100644
> index 000000000000..83aa869fad8f
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -0,0 +1,462 @@
> [...]
> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
> +{
> +	int ret;
> +
> +	mutex_lock(&ec->lock);
> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
> +	mutex_unlock(&ec->lock);

This mutex looks redundant to me for the current implementation. You
don't have any read-modify-write sequences and I think the I2C core
already has internal locking for the bus itself.

> [...]
> +/*
> + * Fan Debug control command:
> + *
> + * Command Payload:
> + * ------------------------------------------------------------------------------
> + * | Offset	| Name		| Description					|
> + * ------------------------------------------------------------------------------
> + * | 0x00	| Command	| Fan control command				|
> + * ------------------------------------------------------------------------------
> + * | 0x01	| Fan ID	| 0x1 : Fan 1					|
> + * |		|		| 0x2 : Fan 2					|
> + * ------------------------------------------------------------------------------
> + * | 0x02	| Byte count = 4| Size of data to set fan speed			|
> + * ------------------------------------------------------------------------------
> + * | 0x03	| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
> + * |		|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
> + * |		|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
> + * ------------------------------------------------------------------------------
> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
> + * | 0x05	|		|						|
> + * ------------------------------------------------------------------------------
> + * | 0x06	| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
> + * ______________________________________________________________________________
> + *
> + */
> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
> +	struct device *dev = ec_cdev->parent_dev;
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
> +			  0, 0, state };
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
> +					     sizeof(request), request);

I think it's nice to provide users a way to override the fan speed, but
is this really the main interface of the EC that we want to use for
influencing the fan speed?

As the name of the command suggests, this is a debug command that
essentially overrides the internal fan control algorithm of the EC. If
you use this to turn the fan off and then Linux hangs, I would expect
that the fan stays off until the device will eventually overheat.

I think it would be more reliable if:

 (1) The default mode of operation does not make use of the "debug mode"
     command and instead sends the internal SoC temperatures to the EC
     to help optimize the fan control. (This is what Windows does on
     Hamoa, not sure if this is still needed on Glymur?)

 (2) If we provide a way to enable the fan control debug mode, there
     should be also a way to disable it again at runtime (with
     EC_FAN_DEBUG_MODE_OFF).

Thanks,
Stephan
