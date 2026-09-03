Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3714A99DC;
	Thu,  3 Sep 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442909; cv=none; b=HNJLQ1WGmsqbZhK7u73kBB9NTWi38jCpcDBRCZEuDTUY/7FWTY9vBFO7aM6LpIJZbVKjWFgPPTaSjjYPYbtYzPSjW4QyXu5ozEBl+QcljeUw9mRF81NSg91oRqsSRkkKbxTaGLae8C9rZKoTaXs8UwziuEzsNVnmq55FIjqPY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442909; c=relaxed/simple;
	bh=OlDlBU8H6Yr40egOlPOoZqoQpqfWfvNnjvU6Bx3JZrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBVKqlNGWX17dAu8WD+nBUBLT8WcCX/Sdl+wmYDtfp+k4JMJ4xCg1NAj1AKxo3JcvSA9Dd+U7ttophiU1zfKSe8Q+IgPXoRyEQYsjKMbfxJeqlqcqPMGn2OUYshIhZWqtgB+ORUvQ8S+EsLw7AWde9hXlG7zfXMtqTE/btivuL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqHeLJdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqHeLJdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A781F000E9;
	Thu,  3 Sep 2026 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442892;
	bh=EVbRQyeXxqDgCKuWHkI0ecDEbiaP5D0ljFlaLjBe0RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DqHeLJdiMo9GzZodhWltEv8yDRF+m9zNQgC5U/lkUY3vj/fqX/NRMxA87Ly8BF8wc
	 NjQvtIUJMlfEh2e5yKugk6iV+mVAHw/inhH1gNjpTiXNuPwv3+hl4O1QrgC5G/nYGp
	 X3IWtfnQFNZsYuPRIA1+XG7qR5uNCB25/er6ojIEyFBKL09MNgIO94npa9oUbKBvRC
	 KBIoPxE7OEXce7UiHb4ZNDZi5jNzv4Sueo2efaoDNbEdRDPQIeDSuI2Mu92Y9UQSK5
	 gF8/6Z8MJuTbO8JIkak24X7/vFEu7hjcZRAnrNgDiKtAcULjqqt0Vx5S6KZ8NtMTHh
	 /yBk5SuJ3naag==
Date: Thu, 3 Sep 2026 15:41:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Marshall <pm@petermarshall.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 5/7] media: i2c: st-vd55g: Add generic driver and VD55G0
 support
Message-ID: <20260903-gainful-mellow-mantis-f436cf@quoll>
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <20260902204549.657228-6-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902204549.657228-6-pm@petermarshall.ca>

On Wed, Sep 02, 2026 at 04:45:44PM -0400, Peter Marshall wrote:
> +static int vd55g_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct vd55g *sensor;
> +	int ret;
> +
> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +	sensor->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vd55g_subdev_ops);
> +
> +	ret = vd55g_parse_dt(sensor);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse Device Tree\n");

Isn't vd55g_parse_dt() printing errors already? How many times same error
should be printed?

> +
> +	/* Get (and check) resources : power regs, ext clock, reset gpio */
> +	ret = vd55g_get_regulators(sensor);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(sensor->xclk))
> +		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
> +				     "Failed to get xclk\n");
> +
> +	sensor->xclk_freq = clk_get_rate(sensor->xclk);
> +
> +	sensor->reset_gpio =
> +		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sensor->regmap),
> +				     "Failed to init regmap\n");
> +
> +	/* Detect if sensor is present and if its revision is supported */
> +	ret = vd55g_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable pm_runtime and power off the sensor */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 4000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	ret = vd55g_subdev_init(sensor);
> +	if (ret) {
> +		dev_err(dev, "V4l2 init failed: %d\n", ret);
> +		goto err_power_off;
> +	}
> +
> +	ret = v4l2_async_register_subdev(&sensor->sd);
> +	if (ret) {
> +		dev_err(dev, "async subdev register failed %d\n", ret);
> +		goto err_subdev;
> +	}
> +
> +	return 0;
> +
> +err_subdev:
> +	vd55g_subdev_cleanup(sensor);
> +err_power_off:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	vd55g_power_off(dev);
> +
> +	return ret;
> +}
> +
> +static void vd55g_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct vd55g *sensor = to_vd55g(sd);
> +
> +	vd55g_subdev_cleanup(sensor);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		vd55g_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +	pm_runtime_dont_use_autosuspend(&client->dev);
> +}
> +
> +static const struct acpi_device_id vd55g_acpi_match[] = {
> +	{ "SMO55F0", (kernel_ulong_t)&vd55g0_chip_info },

Use named initializers, like in the OF table.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, vd55g_acpi_match);
> +
> +static const struct of_device_id vd55g_dt_ids[] = {
> +	{ .compatible = "st,vd55g0", .data = &vd55g0_chip_info },
> +	{ .compatible = "st,vd55g1", .data = &vd55g1_chip_info },
> +	{ .compatible = "st,vd65g4", .data = &vd65g4_chip_info },
> +	{ /* sentinel */ }

Best regards,
Krzysztof

