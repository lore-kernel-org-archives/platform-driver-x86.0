Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D00366051;
	Mon, 19 Oct 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405635; cv=none; b=uzxo+QPbox/c7xEtN92p+Lhbisy63jJV+MwMOFFuKLtddeLCsLunKgX+XZLR2rgPZwaw96yzPYSPXZdgBS9pLtA5dP9o+L/Qt/7iHcjfTKuvxAt7XKZ7Fn83I8bNsby198H1+Jl+4DWT1UqjNqUlXKryLty4qnH3QN67v5LkI9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405635; c=relaxed/simple;
	bh=cR/xomwmk5T/1jM1P29yIVxS3/yP6t2DY/0clwv4ck0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt2c/ZXTrjHTow2K4RPt7DGW6GynQb7xwiE+ynHZAVzq1ahz2qrFCBHSm/OdW+zY8i3Q5yCwksrBpr1bSyVB3Axbc5mjUK11OhUCK5t09YsqipkoKWNEcznZvtFJ6o7RgpT2GKPyGNB0Z672thzara7dAbKIoU3exJwlV2oK7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BQTaAApg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BQTaAApg"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4B21593;
	Mon, 19 Oct 2026 12:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792405506;
	bh=cR/xomwmk5T/1jM1P29yIVxS3/yP6t2DY/0clwv4ck0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BQTaAApgl3WLI787CTFKZflc0h2mco2yWFul+hNWgQRkhyI2Bwbh7jv/TOFj5wuix
	 ZWC8CuYE0u5cSc7LBaW1KWUw7f/pdypWc/r4/YRgzP2Cii0KEhZYNjjxkrHX9n7M4X
	 7f/lDJ9XnWapQ0MLAw7FRFApW7utVn0RGMZpb3r0=
Message-ID: <039c518a-8c9c-4090-abbc-1546038bb6f5@ideasonboard.com>
Date: Mon, 19 Oct 2026 11:27:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: ov05c10: Support full range of power rails
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antti Laakso <antti.laakso@linux.intel.com>
Cc: Alexander Patrakov <patrakov@gmail.com>,
 Leif Skunberg <diamondback@cohunt.app>, Sahan Nissanka
 <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
 <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Hans, thanks for the series (and the legwork in untangling everything last week)

On 16/10/2026 15:17, Hans de Goede wrote:
> Add support for the full standard set of power rails for Omnivision
> sensors: "dovdd", "avdd" and "dvdd", using the regulator_bulk_* APIs to
> manage to regulators.
> 
> Previously the driver only supported avdd, but depending on the design
> some of the other power rails may need to be controlled by the sensor
> driver too.
> 
> This is a prep patch for some INT3472 GPIO -> regulator mapping changes,
> which require sensor drivers to support all 3 rails to avoid regressions.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/i2c/ov05c10.c | 32 +++++++++++++++++++++++---------
>   1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
> index 8fe4dc0d9405..f94752dc626f 100644
> --- a/drivers/media/i2c/ov05c10.c
> +++ b/drivers/media/i2c/ov05c10.c
> @@ -7,6 +7,7 @@
>   #include <linux/i2c.h>
>   #include <linux/module.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/regmap.h>
>   #include <media/v4l2-cci.h>
>   #include <media/v4l2-ctrls.h>
> @@ -279,6 +280,12 @@ static const struct ov05c10_mode supported_modes[] = {
>   	},
>   };
>   
> +static const char * const ov05c10_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};

I don't have the datasheet to verify the supplies but it certainly matches the norm and the 
remainder of the patch looks good, so:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> +
>   struct ov05c10 {
>   	struct v4l2_subdev sd;
>   	struct media_pad pad;
> @@ -291,8 +298,8 @@ struct ov05c10 {
>   	struct regmap *regmap;
>   	unsigned long link_freq_bitmap;
>   
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov05c10_supply_names)];
>   	struct clk *img_clk;
> -	struct regulator *avdd;
>   	struct gpio_desc *reset;
>   	bool identified;
>   };
> @@ -753,16 +760,20 @@ static int ov05c10_get_pm_resources(struct device *dev)
>   {
>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>   	struct ov05c10 *ov05c10 = to_ov05c10(sd);
> +	int ret;
>   
>   	ov05c10->img_clk = devm_v4l2_sensor_clk_get(dev, NULL);
>   	if (IS_ERR(ov05c10->img_clk))
>   		return dev_err_probe(dev, PTR_ERR(ov05c10->img_clk),
>   				     "failed to get imaging clock\n");
>   
> -	ov05c10->avdd = devm_regulator_get(dev, "avdd");
> -	if (IS_ERR(ov05c10->avdd))
> -		return dev_err_probe(dev, PTR_ERR(ov05c10->avdd),
> -				     "failed to get avdd regulator\n");
> +	for (unsigned int i = 0; i < ARRAY_SIZE(ov05c10_supply_names); i++)
> +		ov05c10->supplies[i].supply = ov05c10_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov05c10_supply_names),
> +				      ov05c10->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
>   
>   	ov05c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(ov05c10->reset))
> @@ -778,7 +789,8 @@ static int ov05c10_power_off(struct device *dev)
>   	struct ov05c10 *ov05c10 = to_ov05c10(sd);
>   
>   	gpiod_set_value_cansleep(ov05c10->reset, 1);
> -	regulator_disable(ov05c10->avdd);
> +	regulator_bulk_disable(ARRAY_SIZE(ov05c10_supply_names),
> +			       ov05c10->supplies);
>   	clk_disable_unprepare(ov05c10->img_clk);
>   
>   	return 0;
> @@ -796,9 +808,10 @@ static int ov05c10_power_on(struct device *dev)
>   		return ret;
>   	}
>   
> -	ret = regulator_enable(ov05c10->avdd);
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov05c10_supply_names),
> +				    ov05c10->supplies);
>   	if (ret < 0) {
> -		dev_err(dev, "failed to enable avdd: %d", ret);
> +		dev_err(dev, "failed to enable regulators: %d", ret);
>   		goto err_clk_disable_unprepare;
>   	}
>   
> @@ -821,7 +834,8 @@ static int ov05c10_power_on(struct device *dev)
>   
>   err_power_off:
>   	gpiod_set_value_cansleep(ov05c10->reset, 1);
> -	regulator_disable(ov05c10->avdd);
> +	regulator_bulk_disable(ARRAY_SIZE(ov05c10_supply_names),
> +			       ov05c10->supplies);
>   
>   err_clk_disable_unprepare:
>   	clk_disable_unprepare(ov05c10->img_clk);

