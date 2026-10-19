Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D813376BC2;
	Mon, 19 Oct 2026 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392421; cv=none; b=RaEekZccyS7iNZxDL/h41F37PyrvN7x2zNyR/P5Ljex6VhghcmPTMbIccnT2yTOEhRpxY5JE0XdfkrOsKMwcZptN184K83UpsUMUgLwav7sCaXjPlQNzILDVDulSjs6YU4Xu5sVwSKzwxj0LZUHnZ3Zcf4GOhlaIFlRAhRtm1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392421; c=relaxed/simple;
	bh=GYZKTzCNnJWZF6cm/qQpcwljcDuB+QqoqxjdR6IUgM4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SA8Yw/PwJxpNBWdL1VIpbJ8IU1tqMhfObBcAWW00S+9q+/eSYTDyvaVS4lD1X7RXhhb513t8VqvIdZ3KqS3jgDoRcEzVcDwNQ6sPZKcpZAvp+Ewlu3f6z5FHLlWg1C2iX0Zd6qQUAktxS5fLlN1/bJFr1xEsQlfWzRkfiiLDqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbX7CmdF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbX7CmdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792392418; x=1823928418;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GYZKTzCNnJWZF6cm/qQpcwljcDuB+QqoqxjdR6IUgM4=;
  b=DbX7CmdFpbfgyWFG1XSSyzX2/5s6cdYEXJZ4prvnOzZixaxQXIPandrs
   J+YNWQfMo7HyPU8G3BW1jL9Mdb2W2TCZ6zc4UANooJBs1Vonm5YxopFf/
   xvZ9y4Gb5qOB7CyO36nP6+q7Mu9XW7dU+k5Y5dtmz45+DVDCX+784qSQr
   l1qwhmBRtyVExO1KnNDdl7ZMeJQKpbydgoThPoP2DnGC/LJVjKwvP0uX5
   XTqgwU3Vllz5P6PfAA6noT34AzIvHW+E05uNN287qEwpInIxLBhd8sP+Q
   Pn6jEGxmU1OKonjjF8ESAlvMTHFA4sqy35jblYobs1xUK7RzHq5bLbY/7
   A==;
X-CSE-ConnectionGUID: gS+oOltvSTqwUC3GOi6dFA==
X-CSE-MsgGUID: Nh11WHJQReGeCoG4TT7uCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1068324"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1068324"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:46:57 -0700
X-CSE-ConnectionGUID: UN2dCsL7TjWXhH1mpVlvAw==
X-CSE-MsgGUID: VW5bpikGQQeT4FWUA3lKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2458370"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:46:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 09:46:45 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Charles <hanker007@gmail.com>, 
    Navon John Lukose <navonjohnlukose@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 07/12] platform/x86: lenovo-wmi-capdata: Adopt new
 WMI API
In-Reply-To: <20261018-lwmi-wmi-new-api-v4-7-aafef7956c4a@rong.moe>
Message-ID: <e67534db-c29c-4f89-9b7d-cf9ff5704674@linux.intel.com>
References: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe> <20261018-lwmi-wmi-new-api-v4-7-aafef7956c4a@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Oct 2026, Rong Zhang wrote:

> The new WMI API supports multiple ACPI types by converting them into a
> unified buffer that satisfies alignment and size requirements.
> 
> Adopt it to make our life easier.
> 
> Note that the new WMI API only accepts a few ACPI types to conform to
> the behavior of the Windows WMI-ACPI driver. By adopting the new API, we
> intentionally rejects improper ACPI types instead of silently ignoring
> them.
> 
> Meanwhile, considering that `struct_size(block, data, count * 3)' may
> overflow when calculating `count * 3', ignore Fan Test Data with count >
> U8_MAX instead of capping `count'.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v4:
> - Fix typo (thanks Mark Pearson)
> 
> Changes in v3:
> - Leave struct cd_fan_block's __packed attribute as is (thanks Armin
>   Wolf)
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 70 ++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 3c09bb9e3d46..abf5ffda7163 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -626,17 +626,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  	}
>  
>  	for (idx = 0; idx < priv->list->count; idx++, p += size) {
> -		union acpi_object *ret_obj __free(kfree) = NULL;
> +		struct wmi_buffer wbuf;
> +		int ret;
>  
> -		ret_obj = wmidev_block_query(priv->wdev, idx);
> -		if (!ret_obj)
> -			return -ENODEV;
> -
> -		if (ret_obj->type != ACPI_TYPE_BUFFER ||
> -		    ret_obj->buffer.length < size)
> +		ret = wmidev_query_block(priv->wdev, idx, &wbuf, size);
> +		if (ret == -ENODATA) /* The block is too short, probably stubbed. */
>  			continue;
> +		if (ret)
> +			return ret;
> +
> +		/* Capdata 01 is an extension to capdata 00. */
> +		struct capdata00 *capdata __free(kfree) = wbuf.data;
>  
> -		memcpy(p, ret_obj->buffer.pointer, size);
> +		memcpy(p, capdata, size);
>  	}
>  
>  	return 0;
> @@ -678,43 +680,34 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>   */
>  static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>  {
> +	struct wmi_buffer wbuf;
>  	struct cd_list *list;
> -	size_t size;
> +	int ret, idx;
>  	u32 count;
> -	int idx;
>  
> -	/* Emit unaligned access to u8 buffer with __packed. */
>  	struct cd_fan_block {
>  		u32 nr;
>  		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> -	} __packed * block;
> +	} __packed;

Could this just be moved outside of the function?

> -	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
> -	if (!ret_obj)
> -		return -ENODEV;
> +	ret = wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan_block));
> +	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
> +		return 0;
> +	if (ret)
> +		return ret;
>  
> -	if (ret_obj->type == ACPI_TYPE_BUFFER) {
> -		block = (struct cd_fan_block *)ret_obj->buffer.pointer;
> -		size = ret_obj->buffer.length;
> +	struct cd_fan_block *block __free(kfree) = wbuf.data;
>  
> -		count = size >= sizeof(*block) ? block->nr : 0;
> -		if (size < struct_size(block, data, count * 3)) {
> -			dev_warn(&priv->wdev->dev,
> -				 "incomplete fan test data block: %zu < %zu, ignoring\n",
> -				 size, struct_size(block, data, count * 3));
> -			count = 0;
> -		} else if (count > U8_MAX) {
> -			dev_warn(&priv->wdev->dev,
> -				 "too many fans reported: %u > %u, truncating\n",
> -				 count, U8_MAX);
> -			count = U8_MAX;
> -		}
> -	} else {
> -		/*
> -		 * This is usually caused by a dummy ACPI method. Do not return an error
> -		 * as failing to probe this device will result in sub-master device being
> -		 * unbound. This behavior aligns with lwmi_cd_cache().
> -		 */
> +	count = block->nr;
> +
> +	if (count > U8_MAX) {
> +		dev_warn(&priv->wdev->dev,
> +			 "too many fans reported: %u > %u, ignoring\n", count, U8_MAX);
> +		count = 0;
> +	} else if (wbuf.length < struct_size(block, data, count * 3)) {
> +		dev_warn(&priv->wdev->dev,
> +			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n",
> +			 wbuf.length, struct_size(block, data, count * 3), count);
>  		count = 0;
>  	}
>  
> @@ -729,11 +722,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>  	priv->list = list;
>  
>  	for (idx = 0; idx < count; idx++) {
> -		/* Do not calculate array index using count, as it may be truncated. */
>  		list->cd_fan[idx] = (struct capdata_fan) {
>  			.id      = block->data[idx],
> -			.max_rpm = block->data[idx + block->nr],
> -			.min_rpm = block->data[idx + (2 * block->nr)],
> +			.max_rpm = block->data[idx + count],
> +			.min_rpm = block->data[idx + (2 * count)],
>  		};
>  	}
>  
> 
> 

-- 
 i.

