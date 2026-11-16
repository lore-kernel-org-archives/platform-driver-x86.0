Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827938;
	b=ptySJy5U3hB+zLSBWlSWrewSEK+en3eDR8dxxQXgkQxzMadxFCrW0ua6Z2aa02CZm9YW
	 pzUjeeFWZvwBCerXJ3IhNWJn03EI0YAvq7PQl4L5uAzUm31f2MDHB14WqhtY359gF60Ls
	 z04THH/he0sqkrxkJ+6p970+Z/N8YZUrT5Ti1cAzo+v1WxKjHfjINQElfKJgc/ZzRd/Nq
	 r29pc/ULSPz0wblClqCheYRQh3kDFAAl9ZB4/R1ivSU7glC5Y5+/7YNvMeBlrq0WPVYwq
	 nqd19FCwGYa4gZ2AxE6Ba6u0vB+DxMRv9YrFBoYG/zUMyO8J76hUt1TJJBpoSpwKFGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827938;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=P/CRFemaXndNEM33d16ggcxdjl+Ibzhkj3L2X3afg1U=;
	b=ni7wMJEL+seOr2W9lOPbnOjFGxTKmLz2E4vj/UqcPA28tfoqrLQbwZewDL47Hyunr0Oj
	 mofS96CLc93xdGpaGUaAgvR5xcqWTrJ7n9VNQ6Gf+ogOhFLLPaojZIcCEz3sjH1sR1GUT
	 RbY+UU0wtcbpqRWaTaSTpgrhJU+EYfvsGzIlyEb8WNYvOSNphRx98no+0c5P74M74fl2c
	 dM5ozs/bSWYmF/mtuK9tfDzGAKKZNzM7XTxmZoT3kz9WW4Qn2IAhGMactJWAd3qySZzKQ
	 JPC5CeKlQobgVODUt22U6PRMTxpw9wbetLm7PCocBm72HNOBuYb+1SQlOrxVR6IiT5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HipKgwAh;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98A6070712;
	Mon, 16 Nov 2026 11:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D98A6070712
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HipKgwAh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827938; x=1826363938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6EJ1ZqmTmH8fJTuJbmT+hxkwuFML9xxmKKLG6umMngU=;
  b=HipKgwAhn/SUBuPLId7ZzF/wd6Ee25b1CitHVeTKL/2ymBGIn0CTkutg
   6r8+SR44nkZfeLqLhaGsDoFsVTBZwMiUmP2/JnSRfd4/OiZZ/8QqWeAqD
   1zv146N5xqXs9YuXNb2I/TFDQpEYLhFTmJJ8F30X1EW4HcRJC6hB26sc4
   voyyyMWFqEjOWd9x7g19V2cz6VECD3rH6FBbzW7pNcsyhiEU1ITJpk9zT
   L3sG+0wFbNkGJDej2BXPCBQaqKce57XqooTmc2EZboEKAJ8PIQE6XUpiX
   tnXlQ7srCdIwuQN+qIb+0FK9I40/NVugKxSq6lXI3TVPOytG4M/C8J+e8
   g==;
X-CSE-ConnectionGUID: QyzCiYCuQrS3kIn4fiYWUQ==
X-CSE-MsgGUID: hKY7pJpiT5uXgBFnv8MooA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3463711"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3463711"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:18:57 -0800
X-CSE-ConnectionGUID: Jf2Zmy6uRC2W/wveXiTOAA==
X-CSE-MsgGUID: rdsZ+U5ARAWRONBulXfw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9657294"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:18:55 -0800
Date: Mon, 16 Nov 2026 13:18:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] platform/x86: dell: dcdbas: Suppress bind attributes
 of the platform driver
Message-ID: <avrmnVSm2xk3dAT4@ashevche-desk.local>
References: <cover.1794633178.git.rosenp@gmail.com>
 <fa93ff8c72aa9f8a12d032dfc8422d77782f2c6d.1794633178.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa93ff8c72aa9f8a12d032dfc8422d77782f2c6d.1794633178.git.rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 10:17:55PM -0800, Rosen Penev wrote:
> The dcdbas platform device is created by the module itself and stays
> in use for as long as the module is loaded: dell-smbios-smm allocates
> its SMI buffers against it through dcdbas_smi_alloc() whether or not
> the driver is bound.
> 
> Binding the driver again after an unbind also leaks state:
> dcdbas_check_wsmt() runs a second time and memremap()s the firmware
> SMI buffer again, overwriting bios_buffer and leaking the previous
> mapping.
> 
> Unbinding or rebinding the device by hand is not useful, so hide the
> bind and unbind files.

Sounds like Fixes tag is needed.

-- 
With Best Regards,
Andy Shevchenko


