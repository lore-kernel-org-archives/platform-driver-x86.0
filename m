Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C744DA9B8;
	Thu, 24 Sep 2026 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284496; cv=none; b=t63TMwYtnyQdp7Gl2lGBIag2a5zTDsGFVgozNVXuqD6wi3erlrM2w3WrypUe1uocfj0YpDxGMPzO8j2nN/4f/NeKFcSeifWWXGzylBcjKxnQcbyKUkCculZUAfykihXSc+bajIAvGr91vnp6WUjBWZdcXDPEjo5aFpkgT8IH+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284496; c=relaxed/simple;
	bh=OQ1k2JismAzgrITlZrjf7ZD870mZBF7p4tsaahRZKVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVewIfmksmlBrRLk537+NAcE7td6+3iSeY35TWz3Nbn2wBHeVgs4pKN9rFJgV8txZEbSq308n04NVW4k/l6gP5NKJKgwbCc6AuBpsa82syv9T7Cf7wOaLjEnak9IzZq0URoAS6LslIHJD2gYCoCopmb9OA3i9qOitr0Xfqb7Wig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDLrrvCJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDLrrvCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790284494; x=1821820494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OQ1k2JismAzgrITlZrjf7ZD870mZBF7p4tsaahRZKVc=;
  b=lDLrrvCJNBq9i929bG2tfPlDjq2WfXtHOHUwZ+L47kTtr8uGfDRLVx4C
   qyhy74LXTCLN1w9O1amvolHi4r/WhV4UngmpPkIeffN/laiaqajHpBLcJ
   /I9RRULaxjaT6DvnzVm88VKYr9S/hobO1LFVvoCz1rABQMO82IlcORRaP
   MjXbn+VWEFcVKQ/F5IINQmJTdbYR9nMgXIbeF8i581WEvZPlPN3yGSeMD
   XqOyPLd8KgW5dLJ2p/CyXE7A/YuyvGeroAL2HByW3D04xjZ/9etGslTK2
   8f513dWa+uyv/PiU7KqxRyqwqlyd7C5tk3xFL9RKikB+Ec9ldIF1yj5MD
   Q==;
X-CSE-ConnectionGUID: ik90x0j6Sku0PkX0tf4WEQ==
X-CSE-MsgGUID: o/hdSKZ/SNO0ODdZ8GVWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90937717"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90937717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:14:53 -0700
X-CSE-ConnectionGUID: RYF6pdFZRcSWSm+cku189A==
X-CSE-MsgGUID: wOj9SOXkQriZq/hQXyZjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278863141"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:14:51 -0700
Date: Fri, 25 Sep 2026 00:14:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/19] platform/x86/intel/tpmi: Build the TPMI control
 words in one expression
Message-ID: <arWSySm7yOsexURr@ashevche-desk.local>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-16-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924182342.212709-16-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 24, 2026 at 11:23:37AM -0700, Kuppuswamy Sathyanarayanan wrote:
> Both mailbox words in tpmi_read_feature_status() are assembled as an
> assignment followed by an or-assign of a second field, even though
> neither value is used in between. Build each of them in a single
> expression, so that a word and the fields it is made of read as one
> thing.
> 
> The two comments on the command word described one value between them, so
> fold them together as well.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


