Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5730BB9E;
	Thu, 15 Jan 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466104; cv=none; b=dqklwJP5Eq0qbbbxzwiIwwUnwmSonTi/HN/CwmJ6IEUiWyM38KRMy3UPNufDZtN4GP68/kUYvXiMe/GeJNeEi5KqXTf+EAmFsVjaJ7q04VJpMbVVkkQ7Udmqe/zriV+QVP71L3cnrwCs2ff/dUObp7GmVp3ygczb4nyEsaJVYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466104; c=relaxed/simple;
	bh=Y95zzIMiPLc9Yw5WLKhSJ3INoWPgjkkwJjawVxx5x/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuVxsvRpjWkeZE68f/GGhM/H5r/HdJP3n3ko9v2tDbqGc049htc/oGTbnVAsqH01If6QYTmynDoB87h20iIZkBkMxo3r5wx4u7WV1YGqkVM+HTirOpoNfX93F2y60FhAIyOmpRaJehLPOhxdVK1fbuiWW1lPmcepng3eL3yjnOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISkoo89I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISkoo89I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768466103; x=1800002103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y95zzIMiPLc9Yw5WLKhSJ3INoWPgjkkwJjawVxx5x/A=;
  b=ISkoo89I7jf9OKnBz3pRmLDDOq0POYcvo01XctUQDBMyMOWEwGaJdNL2
   RnYaxoJKpoBX1ls066jyRxuFsAwGMMDLVTe06k3uYWZNRAgoMiwrlQTmB
   9iLf0Xs8SOGXXre+U+8hfLDY/kmEeWj2vUZuHu+gdj+s1gJBWP7Ka9j7Z
   ANXM/WMenU2o7FGkl0gHFjbWanntz3QTPkb2e25h/22M5lBIVh4K1rU+B
   xqauYMySL/sKQg3VJUdFg6vrFznpFRtHyh5ngCpaqGYN+YxCHwFRfTbPF
   k9Zwv+DwK3zKVpEp3kqKeR4qCQgUNV/njnSbQlI2n13Ts0hJ2tmHw3mHP
   w==;
X-CSE-ConnectionGUID: JAw7Z14kQIquPScwXAZcKw==
X-CSE-MsgGUID: uif1XOUUROysSwUB65DCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80489977"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80489977"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:35:02 -0800
X-CSE-ConnectionGUID: BveYYDTXTeyG3+UfBMNT7g==
X-CSE-MsgGUID: 5TbYGUM9SSy7mBEJiQ9YJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="242450907"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:35:00 -0800
Date: Thu, 15 Jan 2026 10:34:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ciju Rajan K <crajank@nvidia.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, tglx@linutronix.de,
	christophe.jaillet@wanadoo.fr, vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH platform-next v4 2/2] platform/mellanox: mlxreg-hotplug:
 Enabling interrupt storm detection
Message-ID: <aWimsaqu5gCV5uZV@smile.fi.intel.com>
References: <20260115074909.245852-1-crajank@nvidia.com>
 <20260115074909.245852-3-crajank@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115074909.245852-3-crajank@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 09:49:09AM +0200, Ciju Rajan K wrote:
> This patch enables the interrupt storm detection feature and
> also adds the per device counter for tracking the faulty
> devices. It also masks the faulty devices from generating
> any further interrupts.
> 
> Add field for interrupt storm handling.
> Extend structure mlxreg_core_data with the following field:
>  'wmark_cntr'   - interrupt storm counter.
> 
> Extend structure mlxreg_core_item with the following field:
>  'storming_bits' - interrupt storming bits mask.

...

> +static void mlxreg_hotplug_storm_handler(unsigned int irq, unsigned int freq, void *dev_id)
> +{
> +	struct mlxreg_hotplug_priv_data *priv = dev_id;
> +	struct mlxreg_core_hotplug_platform_data *pdata;
> +	struct mlxreg_core_item *item;
> +	struct mlxreg_core_data *data;
> +	unsigned long asserted;
> +	u32 bit;
> +
> +	dev_warn(priv->dev,
> +		 "Interrupt storm detected on IRQ %u (%u interrupts/sec)",
> +		 irq, freq);

Below you put long line, here it seems wrapped by 80, why so inconsistent?
Please, choose one style and use it everywhere (inside the same file).

> +	pdata = dev_get_platdata(&priv->pdev->dev);
> +	item = pdata->items;
> +	asserted = item->cache;
> +
> +	for_each_set_bit(bit, &asserted, 8) {
> +		int pos;
> +
> +		pos = mlxreg_hotplug_item_label_index_get(item->mask, bit);
> +		if (pos < 0)

> +			goto out;

Used only once. Just drop the label and move the related code under the branch.

> +		data = item->data + pos;
> +		/* Check per device interrupt counter */
> +		if (data->wmark_cntr >= MLXREG_HOTPLUG_INTR_FREQ_HZ - 1) {
> +			dev_err(priv->dev,
> +				"Storming bit %d (label: %s) - interrupt masked permanently. Replace broken HW.",
> +				bit, data->label);
> +			/* Mark bit as storming. */
> +			item->storming_bits |= BIT(bit);
> +		}
> +		data->wmark_cntr = 0;
> +	}
> +	return;
> + out:
> +	dev_err(priv->dev, "Failed to complete interrupt storm handler\n");
> +}

...

> +	/* Register with generic interrupt storm detection */
> +	if (!irq_register_storm_detection(priv->irq, MLXREG_HOTPLUG_INTR_FREQ_HZ,
> +					  mlxreg_hotplug_storm_handler, priv)) {
> +		dev_warn(&pdev->dev, "Failed to register generic interrupt storm detection\n");
> +	} else {
> +		dev_info(&pdev->dev, "Registered generic storm detection for IRQ %d\n", priv->irq);
> +	}

Invert the conditional, it will be slightly easier to parse.

...

>  struct mlxreg_core_data {
>  	char label[MLXREG_CORE_LABEL_MAX_SIZE];

>  	u8 regnum;
>  	u8 slot;
>  	u8 secured;
> +	unsigned int wmark_cntr;
>  };

Have you run `pahole`? No issues / room to improve this layout?

...

>  struct mlxreg_core_item {
>  	struct mlxreg_core_data *data;

>  	u8 ind;
>  	u8 inversed;
>  	u8 health;
> +	u32 storming_bits;
>  };

Ditto.

-- 
With Best Regards,
Andy Shevchenko


