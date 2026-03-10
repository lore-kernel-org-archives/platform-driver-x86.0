Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A540DFCF
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149554; cv=none; b=Th7HJELB30V/NDArKbtDGsUh/NHWmgcHdeoXPXWyjXHZlQ+YWlFpl0jEca1Ybd9kYYUpsbGplGPEOwT47BJ16YxODPm8EmG8H74ni13z0+fIPXppsxhMk3oR48QQWqfeOZlZe4OCakvdjTeJ1rx/47U4Zp7t/hWF6Yd2a4d0Kt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149554; c=relaxed/simple;
	bh=cd1CqG8SphS5TtuoNj9lyLAQ6Zpjm3fsXjlr5r1vZqg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6+VyamlN7ahM//H9zyG5Nkgec0qQbx5vYqtyr44+N+ZKeE6vnxWaoJjd+2IUSFQ+sFNs4WtYMMATtcOOVCO4+5KEUQtfEdpHuMTnYiaT/YguxspMGfXo8iSLh8mQKBgOT2HVNup0nIOECAIopJgyP2rL78DoGpNCF9MZRl1+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhkXpVjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhkXpVjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81115C19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773149554;
	bh=cd1CqG8SphS5TtuoNj9lyLAQ6Zpjm3fsXjlr5r1vZqg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=PhkXpVjjgKLIP0dGAzp90OdIiumLQJHVzNt418oNMapTR4LdNPHnhU09ECEwywbbn
	 F1tXhnwwwmnXUNQ6bwKdd+gAE67BGXvtPWlvh6RlGdTWO6CB9okYSmgMw4Qg2lbJEB
	 aispKYQLYpqCGUtpH+8CaVnQVM7zFFTFQ8v3KOaJLkIrwdee1pWyXZubLGUSMqNeQV
	 WCc7uFq7mQp1LuDplUj2G4PPcI3DXoy8IjhGF7tT7CsSOcphtCZEVjHtaaoKyYgYNF
	 yX6G+dMGvyIKyHwwwEPmrWNwVj1XjopPhC9DYP1tZh01ohVY7dDfRv4a6SEpO2ZWyT
	 heNQQtUm3kybw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a46657a9fso30328741fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 06:32:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPnjJk89ik5YCAR01gJ7vdMwxR6mnRqoM8YGROmAusADLTsI+PPZPzxxJgVv4Ib+lHNSizTmYwzLGznl+cXBgSAowY@vger.kernel.org
X-Gm-Message-State: AOJu0YzjFuzwsQDaprORYY6RaEYLnT0ioJT5afB9rlxQvh/bLE6i8mVs
	lM0dKCgtoZXc3skOS7LbRq44ofUQ3em2kOj/JxrzgQt8C+Z9AJQM7s4J6zcgG3/d7IQH8OR93yN
	95edTk5FNq5o7Rd1qXbqJqwVxRyzQoSn8RtBitRtdow==
X-Received: by 2002:a05:6512:138e:b0:5a1:3d65:81b9 with SMTP id
 2adb3069b0e04-5a13d65824amr5823246e87.36.1773149553164; Tue, 10 Mar 2026
 06:32:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 06:32:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 06:32:31 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260310124427.693625-4-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310124427.693625-1-antti.laakso@linux.intel.com> <20260310124427.693625-4-antti.laakso@linux.intel.com>
Date: Tue, 10 Mar 2026 06:32:31 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me73BrokqUnPmWa59_rCnAM-cu+2Kpu8qxc7pbN6kN5+Q@mail.gmail.com>
X-Gm-Features: AaiRm50J59ZskMyVrRnMKlbxEJEzpw1QrqP0hIZaEYmu23W1XYHuby3geXy15OQ
Message-ID: <CAMRc=Me73BrokqUnPmWa59_rCnAM-cu+2Kpu8qxc7pbN6kN5+Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] platform: int3472: Add gpio platform data
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, dan.scally@ideasonboard.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org, 
	hao.yao@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com, 
	miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 13:44:25 +0100, Antti Laakso
<antti.laakso@linux.intel.com> said:
> The tps68470 supports i2c daisy chain, which need to be configured by
> gpio-tps68470 driver. Add daisy chain information to platform data.
>
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 2 ++
>  drivers/platform/x86/intel/int3472/tps68470.h | 1 +
>  include/linux/platform_data/tps68470.h        | 4 ++++
>  3 files changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0d2a..b02bc675cabe 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -197,6 +197,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-gpio";
> +		cells[2].platform_data = (void *)board_data->tps68470_gpio_pdata;
> +		cells[2].pdata_size = sizeof(*board_data->tps68470_gpio_pdata);
>
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..c1c4290eb6d5 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct tps68470_gpio_platform_data *tps68470_gpio_pdata;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };
> diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> index e605a2cab07f..7330dab7a711 100644
> --- a/include/linux/platform_data/tps68470.h
> +++ b/include/linux/platform_data/tps68470.h
> @@ -27,6 +27,10 @@ struct tps68470_regulator_platform_data {
>  	const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
>  };
>
> +struct tps68470_gpio_platform_data {
> +	const bool daisy_chain_enable;
> +};
> +
>  struct tps68470_clk_consumer {
>  	const char *consumer_dev_name;
>  	const char *consumer_con_id;
> --
> 2.53.0
>
>

I know this is the pattern used in this driver but why not start converting
it gradually to more modern APIs?

You could do:

static const struct property_entry tps68470_gpio_props[] = {
	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
	{ }
};

static const struct software_node tps68470_gpio_swnode = {
	.properties = tps68470_gpio_props,
};

static int skl_int3472_tps68470_probe(struct i2c_client *client)
{
	...
	cells[2].swnode = &tps68470_gpio_swnode;
	...
}

And avoid both modifying the public header as well as using ugly platform
data. In the GPIO driver you'd just need:

	if (device_property_present(&pdev->dev, "daisy-chain-enable"))

Bartosz
