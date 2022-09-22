Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EBBC6FA8B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 08:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiIVItV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 04:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiIVItU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 04:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C096A6AE99
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663836558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RPdA7w9nalhVXxot1oY+v+I3XEFa4g11czVtLBfespg=;
        b=eg63bRjfeQaIpdDvjOec3lPTlKgR5/EP41lwipSwdunrzp9CEMTdh0jPYNbGt2E/S4OgL/
        nbD4gHBeC8KyYKTU7vCDZ5ALfYJ9MSGL4f1HmY37aQ+0+Ieby86TNAotAm/F0KWRmABK7O
        TaNoLnOG8DCYKuB6tTRw6IZjPPsUbo4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-o80ZFof7PduZQUf_z1tJ4w-1; Thu, 22 Sep 2022 04:49:17 -0400
X-MC-Unique: o80ZFof7PduZQUf_z1tJ4w-1
Received: by mail-ed1-f70.google.com with SMTP id b17-20020a056402351100b00453b19d9bd0so6132607edd.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 01:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RPdA7w9nalhVXxot1oY+v+I3XEFa4g11czVtLBfespg=;
        b=uxd1TbL40lsXqioF2IG3CgDur5nf0o3AsI42KWQrIJUL419ul/vXpX1T3tB9yI33cZ
         ADd7sFW4LJlIDERxWf8+jr1e4snN+y5z7XzfVPz0Y1XgxaJSwh35kRgtzEuynlyyEbUi
         o2jBZfGRKRwiSgtnieDUmfwe5D4tkjE0IJr92N3Nr1PQtxlxrQFduyHou+LoT8yspHKZ
         OC8TDuxLYQo6UD72sI1G9dypVeT0bUq9u8U2tdxm1Rko5OV46ULxYeuKeZHu7BycDS5C
         esvyPZmin6uuMKnbKe7ptSqXfJBQ3MIXb5LxN0iOMZzbSQpe4A2+xPHy2SduIFO1nFu3
         wcOA==
X-Gm-Message-State: ACrzQf0G2e1gtXI/B2tRX49Emp63ofnFWTzYY7mNsMAvq20MPlaxih7I
        7MGQnXw3Q0Dvcpt81SlblU6cX4Y5sW7Nogevk3Jif6V40Q0aa0t8ykjUwbpkIB3n01YZHQbeykE
        PsoW/fxNHNB52O2HGpoONr5A9OYMN51aotw==
X-Received: by 2002:a17:906:9b89:b0:780:62a5:462c with SMTP id dd9-20020a1709069b8900b0078062a5462cmr1854889ejc.119.1663836556724;
        Thu, 22 Sep 2022 01:49:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZILcK7tzV0QZQ0C0dHQCZ3h9+66RMaTT4SI0bpAwupZb5fJ1j7htX6OBeC6hMuTylF6oHzA==
X-Received: by 2002:a17:906:9b89:b0:780:62a5:462c with SMTP id dd9-20020a1709069b8900b0078062a5462cmr1854869ejc.119.1663836556515;
        Thu, 22 Sep 2022 01:49:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u17-20020a50c2d1000000b0044e8d0682b2sm3360949edf.71.2022.09.22.01.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 01:49:16 -0700 (PDT)
Message-ID: <47119a2a-323c-89ca-21c8-5bfcbb796bf5@redhat.com>
Date:   Thu, 22 Sep 2022 10:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/5] platform/x86: int3472: Support multiple clock
 consumers
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, markgross@kernel.org, robert.moore@intel.com
References: <20220921230439.768185-1-djrscally@gmail.com>
 <20220921230439.768185-4-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220921230439.768185-4-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/22/22 01:04, Daniel Scally wrote:
> At present, the tps68470.c only supports a single clock consumer when
> passing platform data to the clock driver. In some devices multiple
> sensors depend on the clock provided by a single TPS68470 and so all
> need to be able to acquire the clock. Support passing multiple
> consumers as platform data.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Note this one already has a review + ack from Stephen Boyd for
merging this through the pdx86 tree (from v1 of the series):

https://lore.kernel.org/platform-driver-x86/20220225004943.AA8EDC340EF@smtp.kernel.org/


Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>


Regards,

Hans





> ---
> Changes since v2:
> 
> 	- None
> 
>  drivers/clk/clk-tps68470.c                    | 13 ++--
>  drivers/platform/x86/intel/int3472/tps68470.c | 59 ++++++++++++++++---
>  include/linux/platform_data/tps68470.h        |  7 ++-
>  3 files changed, 67 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/clk-tps68470.c b/drivers/clk/clk-tps68470.c
> index e5fbefd6ac2d..38f44b5b9b1b 100644
> --- a/drivers/clk/clk-tps68470.c
> +++ b/drivers/clk/clk-tps68470.c
> @@ -200,7 +200,9 @@ static int tps68470_clk_probe(struct platform_device *pdev)
>  		.flags = CLK_SET_RATE_GATE,
>  	};
>  	struct tps68470_clkdata *tps68470_clkdata;
> +	struct tps68470_clk_consumer *consumer;
>  	int ret;
> +	int i;
>  
>  	tps68470_clkdata = devm_kzalloc(&pdev->dev, sizeof(*tps68470_clkdata),
>  					GFP_KERNEL);
> @@ -223,10 +225,13 @@ static int tps68470_clk_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	if (pdata) {
> -		ret = devm_clk_hw_register_clkdev(&pdev->dev,
> -						  &tps68470_clkdata->clkout_hw,
> -						  pdata->consumer_con_id,
> -						  pdata->consumer_dev_name);
> +		for (i = 0; i < pdata->n_consumers; i++) {
> +			consumer = &pdata->consumers[i];
> +			ret = devm_clk_hw_register_clkdev(&pdev->dev,
> +							  &tps68470_clkdata->clkout_hw,
> +							  consumer->consumer_con_id,
> +							  consumer->consumer_dev_name);
> +		}
>  	}
>  
>  	return ret;
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 22f61b47f9e5..8a684030933d 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Author: Dan Scally <djrscally@gmail.com> */
>  
> +#include <linux/acpi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/core.h>
> @@ -95,20 +96,64 @@ static int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
>  	return DESIGNED_FOR_WINDOWS;
>  }
>  
> +/*
> + * Return the size of the flexible array member, because we'll need that later
> + * on to pass .pdata_size to cells.
> + */
> +static int
> +skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data **clk_pdata)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	struct acpi_device *consumer;
> +	unsigned int n_consumers = 0;
> +	const char *sensor_name;
> +	unsigned int i = 0;
> +
> +	for_each_acpi_consumer_dev(adev, consumer)
> +		n_consumers++;
> +
> +	if (!n_consumers) {
> +		dev_err(dev, "INT3472 seems to have no dependents\n");
> +		return -ENODEV;
> +	}
> +
> +	*clk_pdata = devm_kzalloc(dev, struct_size(*clk_pdata, consumers, n_consumers),
> +				  GFP_KERNEL);
> +	if (!*clk_pdata)
> +		return -ENOMEM;
> +
> +	(*clk_pdata)->n_consumers = n_consumers;
> +	i = 0;
> +
> +	for_each_acpi_consumer_dev(adev, consumer) {
> +		sensor_name = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
> +					     acpi_dev_name(consumer));
> +		if (!sensor_name)
> +			return -ENOMEM;
> +
> +		(*clk_pdata)->consumers[i].consumer_dev_name = sensor_name;
> +		i++;
> +	}
> +
> +	acpi_dev_put(consumer);
> +
> +	return n_consumers;
> +}
> +
>  static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  	const struct int3472_tps68470_board_data *board_data;
> -	struct tps68470_clk_platform_data clk_pdata = {};
> +	struct tps68470_clk_platform_data *clk_pdata;
>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
> +	int n_consumers;
>  	int device_type;
>  	int ret;
>  
> -	ret = skl_int3472_get_sensor_adev_and_name(&client->dev, NULL,
> -						   &clk_pdata.consumer_dev_name);
> -	if (ret)
> -		return ret;
> +	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> +	if (n_consumers < 0)
> +		return n_consumers;
>  
>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> @@ -142,8 +187,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		 * the clk + regulators must be ready when this happens.
>  		 */
>  		cells[0].name = "tps68470-clk";
> -		cells[0].platform_data = &clk_pdata;
> -		cells[0].pdata_size = sizeof(clk_pdata);
> +		cells[0].platform_data = clk_pdata;
> +		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
>  		cells[1].name = "tps68470-regulator";
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> index 126d082c3f2e..e605a2cab07f 100644
> --- a/include/linux/platform_data/tps68470.h
> +++ b/include/linux/platform_data/tps68470.h
> @@ -27,9 +27,14 @@ struct tps68470_regulator_platform_data {
>  	const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
>  };
>  
> -struct tps68470_clk_platform_data {
> +struct tps68470_clk_consumer {
>  	const char *consumer_dev_name;
>  	const char *consumer_con_id;
>  };
>  
> +struct tps68470_clk_platform_data {
> +	unsigned int n_consumers;
> +	struct tps68470_clk_consumer consumers[];
> +};
> +
>  #endif

