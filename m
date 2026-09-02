Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D041684A
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340721; cv=none; b=T2nEJ7uVYrxNCpeD8ATAIPy6ayTnCSxF+K/uTYGGh1WQPkQgXnqawV8fw2KUxgtSJ0r1lDS63fbkeUiolAEQajXHzWPvD1JzCcWwLmyWVfWMBcWB5SyMAceIvlnMI9mPsni+6v3wJjefioEWObMt3qtawj+n5WimDTtw+DVFIEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340721; c=relaxed/simple;
	bh=KU3Z5C0Ode6jN8ixHUZkLcwrmODUP5WeSYIYl8AIXjY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bKCPbRScbaYiV1iJs6rNNwqlNZ08pqwTxLQgqaK5WgUJEO9k9AcgAUoys4jztq4ueNsVY788/HOzwdtQLGEECpJw2MUqK7hjab8mlP/IAlesRtn2u/UTeoJA1SYuQ6PBD0XwBmHhTthxYv/t19OtzYUzpdrtsXYvG0Wjcw72Kj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/o9Aano; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/o9Aano"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788340719; x=1819876719;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KU3Z5C0Ode6jN8ixHUZkLcwrmODUP5WeSYIYl8AIXjY=;
  b=Y/o9AanoMEBGdW6MqxJ2o4ktFjfOzcNInBd5ojhK6MsYwPl938IDdxAZ
   VZ1HIoEiaJxRaZ/qhVbngG5n9IH2T8KX1SEFrCocJ5EhsbQd0BoHgpi4u
   cJrNJ7XH5nehey46WtV7eOMChTr+bYrC38MC8JMLe1Avb3kkgkWe452Zu
   VOk3qM1D1zh7zVLm2S8TKnlSH/HKeoSmm60SB3Wb/mR3KvwXCTlzWavTc
   d16kaB/VV1SAOAbSQ+8H8QsKjwr6pdsqoBYZtrD+qAVdoh6rHGq7LAGJz
   qGbfZI2Xd/KEO0iV6SVhyamCk+GvO+Tn5VX4XBw68G5zNLGFj/gCtNm7X
   A==;
X-CSE-ConnectionGUID: E2UREzRWTCuz5yQWL8cK2w==
X-CSE-MsgGUID: wBD/5e+xT0SrT+4k4/xEOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="114336124"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="114336124"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:18:39 -0700
X-CSE-ConnectionGUID: pe/L61IzR6+Wv7EcnYsfzQ==
X-CSE-MsgGUID: 4vei3AiFTEWpdHE/71cwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="271325400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:18:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Sep 2026 12:18:29 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4 06/18] platform/x86/intel/pmt: Do not remap when using
 callbacks
In-Reply-To: <20260901192736.626777-26-michael.j.ruhl@intel.com>
Message-ID: <30d90d16-a261-e5cc-8b49-c21884d6f8cb@linux.intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com> <20260901192736.626777-26-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Sep 2026, Michael J. Ruhl wrote:

> A callback indicates that the parent driver is responsible
> for accessing the data area.  Creating a PMT memory remap
> is redundant.
> 
> If a read_telem callback has been provided, do not create a
> remap.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index af7c951b569a..350129121ff1 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -373,7 +373,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  				  struct device *parent)
>  {
>  	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
> -	struct resource res = {0};
>  	struct device *dev;
>  	int ret;
>  
> @@ -403,14 +402,18 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	if (!entry->size)
>  		return 0;
>  
> -	res.start = entry->base_addr;
> -	res.end = res.start + entry->size - 1;
> -	res.flags = IORESOURCE_MEM;
> +	if (!is_cb_read_telem(entry->cb)) {
> +		struct resource res = {0};

I see you're copying this from the existing one, but this is wrong on 
multiple counts:

- For general initialization to default values, = {} should be used
  (the extra zero is snakeoil).
- HOWEVER, with struct resource, that won't produce a valid resource!

In this case, DEFINE_RES_MEM() should be used as you've everything 
available to setup it right away.

> -	entry->base = devm_ioremap_resource(dev, &res);
> -	if (IS_ERR(entry->base)) {
> -		ret = PTR_ERR(entry->base);
> -		goto fail_ioremap;
> +		res.start = entry->base_addr;
> +		res.end = res.start + entry->size - 1;

For the record, there would also be resource_set_range() but since you're 
going to use DEFINE_RES_MEM(), that isn't necessary here.

> +		res.flags = IORESOURCE_MEM;
> +
> +		entry->base = devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(entry->base)) {
> +			ret = PTR_ERR(entry->base);
> +			goto fail_ioremap;
> +		}
>  	}
>  
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
> 

-- 
 i.

