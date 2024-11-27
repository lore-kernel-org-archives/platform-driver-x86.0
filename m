Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983281F7574
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732708049; cv=none; b=Je0iQ2w/pGgvE0Chq6mhUtJXeV3IVAHm+MnCscDc7qJ+ZytuTGn67+KAjNE5LDuHq3FT9VIgOVaf+92BTsDq7jRbPazdwAi8eCBFTm4J2wK1eeunFNpCa9EkAVGjDF2WLfAztT21U1bVAqYyCAmWNYptv14hFHyPrwnIR5+debI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732708049; c=relaxed/simple;
	bh=aQEhimt7ypJyoRRqiD19PZsrAK0pcrs34bQFI8OGpC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1VM4UbqXkF7K/nRn0lNth/ETwvxxZX3AVdap7fi2CcAZW1gWLM7agsuIx8SX+OndBEThmUKsp+iLf/+R3+J2lEl5Uf9ygWHCeDzo16WdI7Ua/mU+9uaGRmKCncwZJLXgU7QuUili4nfEHrkHet9xWp+uxJHb4V4x/Md+qYcuxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+TGkLZo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+TGkLZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732708048; x=1764244048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aQEhimt7ypJyoRRqiD19PZsrAK0pcrs34bQFI8OGpC4=;
  b=W+TGkLZoWhnQtma3f7Zr/dOFFEoBe2b29spZ9SrRdyxT3NmsGsRyqOFV
   C7cfXIg3FOsQ59HNQVKX9shpvC+rAnjruQlvIHgg0qE6BmhzHrD7fKdB3
   C+sG92I/k8tvhk5R8AQTTQsd3J5Avv3DzH+4U4T9OgYhkprjXjhsV1XLi
   A+HIaR2cUwWSO+WbUImXbI/BoBBWwcqgiIzjFrBKQA0+kf+4N0DppRTpX
   Zdyxu/5D1NducSl4888iEclAzcMbQC/DSFKbIv6pw68TB4PbggPz5OXGM
   aslTbEf/xnqgrEplSn+1PDXHIU+Y0dtqj9JoAgB/xBTJONTR/JJ96Q+H5
   Q==;
X-CSE-ConnectionGUID: VPB5EDIPSbmWX4n83DImyA==
X-CSE-MsgGUID: mQXIivUiR3GaQj8JlPkxYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43567196"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43567196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 03:47:26 -0800
X-CSE-ConnectionGUID: EV5ZNja2TjaGZHwB+ovmNw==
X-CSE-MsgGUID: L3b1aNh0Qb+I/GZlPoLTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92751458"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 03:47:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tGGVt-00000001bfZ-1lHk;
	Wed, 27 Nov 2024 13:47:21 +0200
Date: Wed, 27 Nov 2024 13:47:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com
Subject: Re: [PATCH v3 2/4] p2sb: Introduce the global flag
 p2sb_hidden_by_bios
Message-ID: <Z0cGyelAEIVuhExV@smile.fi.intel.com>
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
 <20241127060055.357498-3-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127060055.357498-3-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 27, 2024 at 03:00:53PM +0900, Shin'ichiro Kawasaki wrote:
> To prepare for the following fix, introduce the global flag
> p2sb_hidden_by_bios. Check if the BIOS hides the P2SB device and store
> the result in the flag. This allows to refer to the check result across
> functions.

Thinking about this I'm not sure we have no leftovers that are doing
the hide-unhide dance on their own, behind p2sb_bar()'s back. But
the idea is that all drivers that need this functionality in the kernel
have to work through p2sb_bar() entry point. If any problem is found
in the future with that, those will need to be fixed separately.

-- 
With Best Regards,
Andy Shevchenko


