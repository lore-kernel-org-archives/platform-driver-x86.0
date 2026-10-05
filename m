Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243A037F72F
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187407; cv=none; b=TMtuUiX0wvF0zYz2h7wA2BSVIjFKcMF4XcUWsqvkHPAjgdburseddYfy/UMjATf0CcbiHZI6EKh6tINKzcPyoo4G21Rfw21QL0V3r58TZZ1vZITSYCjMW3Z6wQExyn6Cj8y/+8YP/eLxtHEAysY7gCEumFUlNyJbLdDlcgJrBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187407; c=relaxed/simple;
	bh=cDK7eaO9TIqc7eENuFf4Hja36hKlXoeZzxw2D5zgDH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNzc3k/zqkluUQb0AHL3EVGMDp41xYGDxylkio15aHl9BQ48wjBryUMX006xZj/m+AKLznfYpQOpr6g5Le3QhogzPaou4zbXeRjXAIhb4V2UmPaKm93CsqnuUq2QoNpfQMOYDqPJhF7hOcSLzZ6yNxuekgAgGmjgWRgS4YDbF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcNUl4KX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcNUl4KX"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1126430f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791187404; x=1791792204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zf8a4U/eZRmPAL9EPlXZ+IeLso4MWrV1ScfZ6D1RB+E=;
        b=QcNUl4KXWUMWOPlX2JdPbW7vrjg8HEt6moTmN+Abn/lb28UhxO7wWMx4vSPCSmLuYz
         MflAQCZ/LM8U/92fL/eUqfMMH5+riskkvsbWrXXupvUTiQ+UrCf51jHLZIaxDmCeku6Y
         /mFT0GC7CakRRASWuEtYe+PcYE2w/rnECInNg/QajKVWyjKsPVCw2JzeyjztyzDGhdhH
         tGeXeSWoOkVw/P6gVeqym6g2brjQsGOp7xc/hw+jdPogwzw++VQcNreNPxVrZalEHtSC
         MBKQNOf/b0AEEjVvDFdkDRktXkyCMG/dzCgHs9SNFOOfWJTa1akQdjG/Id5wgJn8eS3B
         ZMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187404; x=1791792204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zf8a4U/eZRmPAL9EPlXZ+IeLso4MWrV1ScfZ6D1RB+E=;
        b=YDWcP9LgaAFVBDy1iQ05DuVrGR/sL8R3IyhZQ43DwQN0F5DT8H6d4g2v2nzem4NOap
         9LgVpS7q2rbLzbF1aJDEoL1/P2gXCaWQh1rM39YlleAA96gmOTm/EAhHRktx+VkS8CJG
         FJGpxf0ZkZJ9O70Uk7js1PbahpyW51A9qAONFM/FKf8NQRP8q7e8Bw0RQJtkOtyjW/l/
         3b3MT2TlBV87+QGZ0ynNceApU6r4y5o6Wbq0HYbnP7KzcPFmdRCaTFKzKvUvTNQOk6Kf
         C64pUTCr8PMzTgnXOkpiwAGY6bgLA375bpuzJMLEea4i0B2xBdE5oSUKm6AI4v3zTaPl
         TH5A==
X-Forwarded-Encrypted: i=1; AKwUvBwknERQuYa5Z85KTpnO6YbvNB2hTgknaLOAupzjPEIJcSqMxNk/iLrYcPjI3SUf2kjF04YKChO9sRA5ybJnPSmY89tQ@vger.kernel.org
X-Gm-Message-State: AFq9FYI0OBzKhbOCpWY33zOEGR7zkBUSyr0OV6kMfZts3uEap/fn6X2l
	5KxoqtmrsnwRH/EDb1kBYAhFdwZrm3LZxxryTsQIKTlpPbJTgYtYc5x39io6zdEgNIM=
X-Gm-Gg: AYBFou0KkMYScuZABZFktxLSNjNOZB0SuD3NM1Cdn3qzGmqCX6URU9TuOK0TcIkCYjY
	4wM7E324sax1Vq96p7O6zh8HuSWqwYeqJy7pLHPhd8yBzwcXXFgpkGGoDzuwJBGC8wesmKyb2yB
	bXMxEEnpWKVv67H4+uOHrnvuUI5TV33h22CRiUeitDtdBwm+rSW8NXgZic6vvv6LP/QHpqc3bnt
	DwvaoMdYxv0EE5vunkYqGp5t342rk02d0rDW4SgPTuozZ3+DiGBezstSUnkI+62+lo34n/x43a/
	yuGnStEkYiXAlC/D0gkYpXEBbtuBKI3nLjYA6mwDlsINSUHGWMRd5+/ltlJi3892qqcY4CtLKUh
	8DeJCKA/oul4zFlT6duZYG97iA3EEmivytsdXEOzpingHn/Yn2wMOMyJrG+MoNR7asiQU+/xO7W
	PX1grU4YoFViJxXVT2C7cmLsdh8mPBd1RVbeTzy52z1jNNNw9uLPvbf+pqYHpP1bOFKvM6geJVm
	kpa+WaQHVI=
X-Received: by 2002:a5d:5f51:0:b0:48b:f92:1f67 with SMTP id ffacd0b85a97d-48c47fd0cf8mr11000087f8f.21.1791187402499;
        Mon, 05 Oct 2026 01:03:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm1821127f8f.35.2026.10.05.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:03:22 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:03:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
Message-ID: <asNZw4mFy_xOmCVD@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
 <20261002154231.31376-3-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-3-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:43:07PM +0000, Alex Robinson wrote:
> Add support for the ThinkPad X13s embedded controller to expose keyboard
> backlight control and firmware-driven brightness changes when booting
> with Device Tree. Its backlight, event and power-management interfaces
> differ from the T14s EC and require separate handling.
> 
> Preserve brightness across lid and system-sleep transitions using the
> sequences described by the X13s ACPI firmware. Keep temporary suspend
> blanking from overwriting the EC's saved lid-restore brightness.
> 
> Report firmware-driven brightness changes such as Fn+Space, but do not
> report lid-open restoration as a new brightness change, avoiding a
> spurious keyboard-backlight on-screen display.
> 
> Leave EC wakeup disabled by default because the shared interrupt can
> wake the system on lid closure and no selective event mask is known.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> 

I'm mostly just curious, is the input/hotkey functionality in the T14s
EC driver not relevant for the X13s or did you omit it because you don't
need it and/or to keep the initial driver more simple? It seems to be
present in the X13s ACPI similar to the T14s.

> [...]
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1ae4c8e67159ebe04ec7aa6521b0ac9ad07a97c
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> @@ -0,0 +1,408 @@
> [...]
> +static int x13s_power_gpio(struct x13s_ec *ec, int value)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	ret = gpiod_set_value_cansleep(ec->power_state, value);
> +	if (ret) {
> +		dev_err(&ec->client->dev, "Failed to set power-state GPIO to %d: %d\n",
> +			value, ret);
> +	}
> +	return ret;
> +}
> +
> +static void x13s_exit_low_power(struct x13s_ec *ec)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	x13s_power_gpio(ec, 1);
> +	/* DSDT: GPIO176 high, Sleep(10), then register 0x80 <- 0xaa. */
> +	fsleep(10000);
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_EXIT);
> +	if (ret)
> +		dev_err(&ec->client->dev, "Failed to exit low power: %d\n", ret);

AFAICT the ACPI implementation has a retry loop here with 3 retries,
similar to t14s_ec_write_sequence() in the T14s EC driver
(\_SB.I2C9.ECWS). Did you omit that on purpose?

> +}
> +
> +static int x13s_suspend(struct device *dev)
> +{
> +	struct x13s_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* The IRQ handler takes lock, so disable it before taking the mutex. */
> +	disable_irq(ec->client->irq);
> +
> +	/* Capture hardware brightness after completing queued LED updates. */
> +	flush_work(&ec->led.set_brightness_work);
> +	ret = led_update_brightness(&ec->led);
> +	if (ret)
> +		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
> +
> +	mutex_lock(&ec->lock);
> +	ec->preserve_saved_brightness = true;
> +	mutex_unlock(&ec->lock);
> +
> +	/* This flushes brightness work, which also takes lock. */
> +	led_classdev_suspend(&ec->led);
> +
> +	guard(mutex)(&ec->lock);
> +	/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENTER);

Same here.

Thanks,
Stephan
