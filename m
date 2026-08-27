Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151718DB1F;
	Thu, 27 Aug 2026 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815037; cv=none; b=lXQYIQ+CgjlnNLyFQQWQYK+0gfDDmSXd5sarItc19ONvQTyTstKimSe0OxdlsKcWFFJ2XT80rihv1tB7iMSiA9V1flATRwE08s485dRi6lXOW9yfcxM55DcvbmvHEmANeotpQ4XnknjTB+di37mhlbb0zh99kjaUH3mI24QF90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815037; c=relaxed/simple;
	bh=4mL58H0BactL6+6rju5eauQ6Tsf9wkjJNDLv8Um6rQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBWNx8NVSn79v+w7TjzQNLysXo9rDH+L63e8JvsYTU2lHqUAMscBC/cHudxXstr7HHTz/bRQ1pYWSqQkmqGWEuYyoHdyrRMSOtBJnIWZUtP6oae0h9yLc5FQMAc4Vu7VBhCMEvXY7rMfi12lyUZXGINKdbcYFMpMbsuE54095X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGxndGNp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGxndGNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787815035; x=1819351035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4mL58H0BactL6+6rju5eauQ6Tsf9wkjJNDLv8Um6rQc=;
  b=UGxndGNp5eIL/DMBdX6Q3ZCCKivd4Gq8ShRTtScRDv1krBHVSSzezzPU
   ikvY2IeNxBsmF38lf5Y7emVnSiM1M3Xz/PLklLEppBsVOuZzYj834pMsP
   BlNpq9nyvSAxkd5oaYw2J5T9nIEnmHu4RxazHtxV6fMubzlKYFLHhnjqS
   bt4asOA9ZRkvWx3DHH7Fcy3XXVwRpJbyhcu/068xHKV4Uf5bDNg9ArLDQ
   uUoFoGoXEUk+zW19TECBFKE1WJhpz3avGhvtlCOFPHBRUys2gsJx4exy4
   GHWyL46ED4PElzC7MmWoHo04WPixrMZ3zsvv2qM+bYMPA7CheNZBtHyCL
   g==;
X-CSE-ConnectionGUID: pDP0nUpKT2KH+P1gdb+nkg==
X-CSE-MsgGUID: MdYyEzC2QXOG9RNaNQj22g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="90817901"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="90817901"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:17:15 -0700
X-CSE-ConnectionGUID: JgIJOuWaTDuGZi9hx0Yb6Q==
X-CSE-MsgGUID: OKT/18R7QIy6gcmxyV2o1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="291307855"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:17:11 -0700
Date: Thu, 27 Aug 2026 10:17:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v8 2/6] platform/x86: int3472: tps68470: use unsigned int
 for GPIO lookup loop counters
Message-ID: <ao_kdelN_HbrkF3D@ashevche-desk.local>
References: <20260826112452.13539-1-tchatard@gmail.com>
 <20260826112452.13539-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112452.13539-3-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 01:24:47PM +0200, Thierry Chatard wrote:
> The GPIO lookup table loops in the probe and remove paths iterate up to
> board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
> the loop counters to match and avoid a signed/unsigned comparison.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

See one nit-pick below.

...

> static int skl_int3472_tps68470_probe(struct i2c_client *client)

>  	int n_consumers;
>  	int device_type;
>  	int ret;
> -	int i;
> +	unsigned int i;

Please, preserve reversed xmas tree order

	int n_consumers;
	int device_type;
	unsigned int i;
	int ret;

-- 
With Best Regards,
Andy Shevchenko


