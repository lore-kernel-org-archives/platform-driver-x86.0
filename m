Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1D2FD7D3;
	Tue, 31 Mar 2026 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983262; cv=none; b=ZKaYmds8f33t7IkSl1MeZcBn14OiMqhZS0o669za1OkdEwwIkS8YJgxhBCgiOnnd7dcxX8tomyVMpjGpCwRkCwM4hwAlO7j30VQLDCNKoTkwqdIYtgOoi/jnZR5vmTuLK2lomW0uvbvM9yReDSXnWEwjotd/ouJyFhWNOwF2Dk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983262; c=relaxed/simple;
	bh=PutzRDR0a/c/qDUYo4mkknZe4+j/+op8tsZhJooZVF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMWsR9oxCPNDa4qZf3xerBYpnSVftWNv0UY9M6yTroW8AJq/glJolmgP4p6AY1xjsZty5H+aZ+/PxZlkdWelCrTDK7Hq3eykICB0K2HEGl3FZA2/CatKVtU6QzsvIe2MPvuvb+TzcLLSdyrtzCGo16kityUq67ifWRFsxvcD3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCdgJpbF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCdgJpbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774983261; x=1806519261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PutzRDR0a/c/qDUYo4mkknZe4+j/+op8tsZhJooZVF8=;
  b=cCdgJpbFBCOH3a2O1Dq2R61XLUbv/14ZC2S/43Z5Kd5UafkgOiqvk7gt
   CABV94B7uhF34nfc1Tv5HoNNrMzQsz1YWK9pVSIX/dtewPUp4XKZuD3+Y
   KnQ66zxmh45r96KoFmVexKhr147AuDSwKzCjJh2TkQrOX0oou3zrfd4zq
   EP74HEnJVVuySpnAwWjN8E35hDGJ4TCJxClCd1NVbvSSNwe4MDdPqRAL9
   31/OCeSrvVHp1MIlG/jLl+WZCU41kv6Y+KqYbDmG8KHnSgV+aqLUnv3Y1
   U9K/i0tuZZinUYYfloweObYzLGXbIjf8lV78CU+rtiweHenyHT632u/eq
   w==;
X-CSE-ConnectionGUID: zhyARu0wTwK+V7h1aIKqng==
X-CSE-MsgGUID: RsuTnELNRbybwXntNLVQsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75901746"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75901746"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:54:20 -0700
X-CSE-ConnectionGUID: 7S8Ue4bySDuQcRyoxveNTw==
X-CSE-MsgGUID: yPPmcnvKTOOQoPhCZ1Tyzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="249661949"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:54:18 -0700
Date: Tue, 31 Mar 2026 21:54:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
Message-ID: <acwYWAEdD4lDqaOZ@ashevche-desk.local>
References: <20260331134443.1573053-1-mnencia@kcore.it>
 <20260331134443.1573053-5-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331134443.1573053-5-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 03:44:43PM +0200, Marco Nenciarini wrote:
> Add support for GPIO type 0x02, which controls an IR flood LED used
> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> 
> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> may not work" and IR sensors paired with a flood LED cannot function.
> 
> The flood LED is registered through the LED subsystem like the existing
> privacy LED. Unlike the privacy LED, it does not have a lookup entry
> since there is no consumer driver expecting it via led_get().
> 
> To support multiple LEDs per INT3472 device, convert the single led
> struct member to an array with a counter.

I think this is what we want, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


