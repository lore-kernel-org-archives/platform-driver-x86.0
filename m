Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829413;
	b=qHTcswqJO5uSmjvQ+dQTTLeAw3Tsfg3/lo/UlawL9u1gaF4HY/WO3kLI5hrCDCt/GrAt
	 3zOEtLto5dsLBF0eKCVjX/jBuGlS5vpWq7FFitReE9FSfIEDoWEh1vs3/Sb7vVfVzzRhT
	 quoKY0um10YKO0KIChxeiw7oRJIIMSeiprjwBM1zCXYDA4f+KqHVKiATuUY47K4zM6aex
	 odliQ/3O/Fydtp3FQm58i1XrTIpEYx2rhlAUB9A654JV2OpZZeg+ouPE9e3fAlUf//udi
	 JSZkmisLNCQSKETxMAke+fNDans/FHocstf9BCVc2pplzD2KTXUGRDP1dIeJguNJQ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829413;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=2Wj+yn8QlQUflfZuSQzQHgoH1oSaK3NVTLidTi2Td/o=;
	b=i1Y/58CwyUoKhXRmMOHBqFkrwJg9yIdvCD9eqr1f5GhtIPEFrTxC9GYx87ma/Ydb4nK+
	 Nq5HsPkE61t9EU2k2+umg3SKu8vfYHrWm+iYaovav9NksHhq2kWY4e2846tJxGLkBl9sb
	 AO9ijK1VMx9DRDDnLQwsVVd6uzFik/XVjSgSYugrwtOBjiZ/eRYxViGEEvRV9G1DxV8lm
	 0lrAa4OknEMK042KP+IMKXaQhTA6YdbSb/MhJ+hbyX87nE8/n4h3LYY2x42mJWP7Me8NB
	 jEf8S61tDm57CzEVrUSCtxLN2P+B2l/1GH3YJkv/yQAUcfCG0tAiepd8sXyf1hyznTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="KgYj/ayv";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FF606A32F;
	Mon, 16 Nov 2026 11:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476FF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgYj/ayv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794829413; x=1826365413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lBUzR8jSNFcECeOX/ponr8buD5Qli9Oi1aoxol1EQ0M=;
  b=KgYj/ayvKgAuooITZwGTWq337Mu4/IGSihjOheb1WCfpdljYHehJl7vU
   enBNh/On34zC1uAY3eCYSmz0LpA8cHO6lIrv3w9I1uLYn/wWDhrS8DY46
   Rl9Lwdw1Ia0R9K0e1uZDpoL8RBJqT8LUa98UyyC/kS6gYRw/jxXgGM5wf
   jK6SXjPMbt0PhJxy1zHXBZxPNC3UMF/TedO6rLnfD1JjEeezwm79R814G
   gHlYJ8dwGr+YGhnH0ROdsg71f8M1HafMcmHo7O32rxUzwtioF8X+9DAs/
   AZI+BHljI1TsSV0PJQMmGQBxEHcxkLFWHwXPK6T86g385eA749hdF1DRm
   g==;
X-CSE-ConnectionGUID: 3DWmaOhRSMOukomHyspUGA==
X-CSE-MsgGUID: rKAsUs8UT3+SQzXnkQqpdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3591793"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3591793"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:43:32 -0800
X-CSE-ConnectionGUID: NoyjPf8gS86H7Pja39udXA==
X-CSE-MsgGUID: B5k3/gSbQOOmvdemGtUKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="11421176"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:43:30 -0800
Date: Mon, 16 Nov 2026 13:43:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: dell: dcdbas: Validate the WSMT buffer
 description
Message-ID: <avrsX3FsTveIu8fJ@ashevche-desk.local>
References: <cover.1794633178.git.rosenp@gmail.com>
 <e2f8ce920d1fe503bf8b506f3cea2a0b72187261.1794633178.git.rosenp@gmail.com>
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
In-Reply-To: <e2f8ce920d1fe503bf8b506f3cea2a0b72187261.1794633178.git.rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 10:17:57PM -0800, Rosen Penev wrote:
> dcdbas_check_wsmt() takes the address and size of the firmware SMI
> buffer from an SMBIOS OEM string or from an EPS table in the BIOS area,
> and sets
> 
> 	smi_buf.size = remap_size - 8;
> 	max_smi_data_buf_size = smi_buf.size;
> 
> without checking that remap_size is larger than the 8 byte semaphore.
> An OEM string such as "30[addr;0]" or an EPS table with
> num_of_4k_pages == 0 makes the size wrap to almost 2^64, and smi_data
> reads and writes can then access memory well past the mapping.
> 
> check_eps_table() also accepts a table with length 0, since the
> checksum of zero bytes is zero, and then trusts the rest of it.
> 
> Reject buffers of 8 bytes or less, and EPS tables shorter than
> struct smm_eps_table.

Are they real or just based on the code reading?

> Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
> Fixes: 47a94c551a74 ("platform/x86: dcdbas: Check SMBIOS for protected buffer address")

If they are only based on the code reading, I would drop these fixes tags and
make commit message to sound that it's hardening of the existing code.

...

> +	/* The first 8 bytes are a semaphore, so there must be room after them */
> +	if (remap_size <= 8) {

Why '=' is here? We probably should rely on memremap() to complain on 0 length.

> +		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer size %llu is too small\n",
> +			 remap_size);
> +		return -EINVAL;
> +	}


-- 
With Best Regards,
Andy Shevchenko


