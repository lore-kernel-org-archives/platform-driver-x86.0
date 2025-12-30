Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA15621254B
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091743; cv=none; b=Sa+W57prXAkNY0Mirx9l48SNAvE6fqmnO60A4GG746wP5tYktsGQha4bhY97ZVzcl6PqaCHr1i0jHAKWBt63yiz0lMQSzKHcYiTE/KnFDsWQDtZE2euLjlZa2hrUSHuGFIOkIHPXmZnxRrQpYrhWwbxM0ylufrj0nRpfOZASYvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091743; c=relaxed/simple;
	bh=+8DMae0YP8fdt2IFMD2juSfTWcBuvRIJBNYQWBTXxCE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sRVkYtNOR1q4bv0rJHzIZrpe40pvULiydlUGBw7BFZQQTy0lHSGYXlUZQxq8HXuo4cZ4v8Q9vymclXu3SZ8nnke1dPsGYQp7ePJPBxHzSRteSMgcu0y8+yA7nfvsi15LRYkC6PraTr7xqb5s1QelZScLm6xunUeS9+6iEUY3GMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esOjFzON; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esOjFzON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091742; x=1798627742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+8DMae0YP8fdt2IFMD2juSfTWcBuvRIJBNYQWBTXxCE=;
  b=esOjFzONTSBzYck3267l3cDOilzEMeCjdg698mo6+ohcGFIaZBkfN85W
   vEcKB7mUVUFw/gNwPgsRcekdTfoSabAcK3zhHvIWeIg7Xo0hnrRyREzLX
   UTmmrC/YbihovgMo6P3+5HOJYR2bKbSA3lUbasXvskuUOWLWJQseIPyGh
   JtouRFotgxgX1XOA2d75sO/3KMT5IS5HLtBv4zFX0mLIlVJb1uphGojx9
   Rq7SoO+UH4QXXqM7xdtbEzACkoMmIsLHV2zrOIddF7chvoaZMFtJ55xnV
   KshLZwiVs4VHT7Yn4Aes+VFJWS9dkutklVHVfqiF+SB/ij0qNqS9Wg2xe
   Q==;
X-CSE-ConnectionGUID: rFsOs+u+TOWdjG5OAuYmHw==
X-CSE-MsgGUID: XsdM+geUT42fN6uEnS0PiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79802284"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79802284"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:49:01 -0800
X-CSE-ConnectionGUID: 2ZYJQ8lSRpq36l91bcypLw==
X-CSE-MsgGUID: 2ZbkD/LiT4uqdbe0W9Gx0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="232264996"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:48:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Dec 2025 12:48:56 +0200 (EET)
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
cc: srinivas.pandruvada@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86/intel/uncore-freq: Replace sprintf()
 with snprintf()
In-Reply-To: <20251230080545.224954-2-kaushlendra.kumar@intel.com>
Message-ID: <f0c3235b-815d-c3f6-feb2-fa38ea2dc456@linux.intel.com>
References: <20251230080545.224954-1-kaushlendra.kumar@intel.com> <20251230080545.224954-2-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Dec 2025, Kaushlendra Kumar wrote:

> Replace unbounded sprintf() calls with snprintf() to prevent potential
> buffer overflows when formatting device names. While the current format
> strings cannot overflow the buffer, using snprintf() follows kernel
> best practices for string formatting.
> 
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
> ---
>  .../x86/intel/uncore-frequency/uncore-frequency-common.c     | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index 65897fae17df..c129dd450360 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -269,9 +269,10 @@ int uncore_freq_add_entry(struct uncore_data *data, int cpu)
>  			goto uncore_unlock;
>  
>  		data->instance_id = ret;
> -		sprintf(data->name, "uncore%02d", ret);
> +		snprintf(data->name, sizeof(data->name), "uncore%02d", ret);
>  	} else {
> -		sprintf(data->name, "package_%02d_die_%02d", data->package_id, data->die_id);
> +		snprintf(data->name, sizeof(data->name), "package_%02d_die_%02d",
> +			 data->package_id, data->die_id);
>  	}
>  
>  	uncore_read(data, &data->initial_min_freq_khz, UNCORE_INDEX_MIN_FREQ);

Hi,

Thanks for the patch. Please use scnprintf() instead. You don't use the 
return value so the distinction doesn't make a difference but it would be 
useful to eventually only have one of them remaining, which should be 
scnprintf() that gives a more sane return value than snprintf().

-- 
 i.

