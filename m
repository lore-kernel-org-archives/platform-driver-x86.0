Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623632D43C;
	Mon, 24 Aug 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562590; cv=none; b=UW2tBVh3eHpU6EGGp8H6pKUbHAJqosXWxZvErmB5kP2RCP0yEb3ZzXWlEJVv1lKqqaeDlCYFP44EW3VotC5DVShbKfS54JGF46i6dC03/MqL73J0pQXQtRc/rgR/bWo9OfuvQZc4240XoEy2qQBn5bQCpswXEqumAughS4YT2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562590; c=relaxed/simple;
	bh=NvFm2+uZ8iOBrRFS33828myTqFVV2W4BLV+1Ih1ogSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkMWY+Uqy4/L+75QS+JqRdjG4JQ5Awe18wkcCy3pvyDeqvsKx3qWmUTpkdfmxpr7SR7f4Qypg981UQVagLjdCwq1+JWUyqCCJUyJGW6GNZU6FJiif4NWEnsw04TbiAGQtDawKkwSECC3Bqu+QvlLH3X6bJLtF8ICXUfScURzs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aav5NjeY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aav5NjeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787562590; x=1819098590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NvFm2+uZ8iOBrRFS33828myTqFVV2W4BLV+1Ih1ogSo=;
  b=Aav5NjeYlK0DeT1bloG2jU/jWLgCXxoRLGFUDnwVWY6wi8ASQ9phtixg
   V6iJ+3/lKogyZYe5rJvzQ2QgcW4uN6dxvDp9aRxvizORrzzfdDP1+ZbaK
   75bAU+4fVmLB9GjR6zGYm4+X0w8tTp6XZDH2jv7WQrayAsOllzh6e97QU
   ryoBhrzqRKRwP1MKjYzGXd3g+Jd39oITMSGD0C7MaiqLDbx78juOpxl5O
   REz/08Ii53Y4KVh9sgLzV8b+mvRZqPTZ32g1UA9Be0ccmWvxl+kGN2sKh
   Lh8QcS4BlkGgy/pA3cUC3zuLzxefkWi3J6uFgOiG3ik6xwGBmzCTi3ghk
   g==;
X-CSE-ConnectionGUID: ylzUcoFIRcO6zfEJ5xminA==
X-CSE-MsgGUID: k0KhVTxkQPu8O2LNCEk4YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88023972"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88023972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 02:09:49 -0700
X-CSE-ConnectionGUID: CQKaFNxfQd+2VWmankHDSw==
X-CSE-MsgGUID: HRcFtFHqRIyb86hz3jjTVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="291795596"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 02:09:45 -0700
Date: Mon, 24 Aug 2026 12:09:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v7 5/5] media: ov8858: add ACPI device ID INT3477
Message-ID: <aowKVp_Uvh2TcgcD@ashevche-desk.local>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
 <20260819140107.1329091-6-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819140107.1329091-6-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 19, 2026 at 04:01:07PM +0200, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.

...

> +static const struct acpi_device_id ov8858_acpi_ids[] = {
> +	{ "INT3477" },

Use C99 initialisers.

> +	{ /* sentinel */ },

No comma for the terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko


