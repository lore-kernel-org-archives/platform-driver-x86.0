Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE636AB4A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357333; cv=none; b=OtVnpl2sElCGg9r3flwD/M1Yc9/OC91m9I/VGJfFIeEzuaZmUkn04jTXQZaF0A2RnR0ElstzfJ5wVL34iLAX3Y3SZqfloOuXGEM+7Ty6oMvviNUu+Se6ZbaatdI4Q/onvOX7oTIxbfs+2IQEVi74iZ1wDtyttVma9RLgzIC59vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357333; c=relaxed/simple;
	bh=ITvd4CTnOKcKppoed8c/s9EMBJgGyfaLZudI1TaMds0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2vQe4PQQnwjtpXbKeDZ1jgxki/9ad3gWgX43/wBSBvjwNKJ/8hswUxNFZy1hPIv4/Aui/Lk5oMYa2XBycqZ4ecwCC4OAPoHlGJrGaX1gZ8gQvZt9o97DMdD2prgc8Vkc1cw2C3nuphxtCv4L3X6lhPPdI/dnLMFoNGBBAfiBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfnrefNN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfnrefNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774357332; x=1805893332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ITvd4CTnOKcKppoed8c/s9EMBJgGyfaLZudI1TaMds0=;
  b=WfnrefNNzGZbiCcIpPb05LsRVPpsNW3WX4um0jG8a3Ct60/2GEtevp+S
   Dr2YBwAzAlGdD1i+Vy8Nu5MYLWXT7sgSwH3Rm1X68OUwjFRlF0Kp1S2tM
   qI5V5hAR7vXkI3lUpSCi6x1HAJB3FHSSWTu8eFYK3cM3rORq78aW0SVeH
   bUsKjrNrBeir5J+hSKMchOvDbZ7a/CDDrun2yj3jzuGG3sVRhuoR5iQTE
   Nz2WWpb3qRL1wJi7Ht7zbxpdHalVS7YK3HLYQImgaSEvjswUD3bV1QOSz
   rKSvehNsXOm+OWhswGvxxRxo9rH0tnrOr2o3nk8OJAo9PzoV8g7o+twrr
   A==;
X-CSE-ConnectionGUID: UHkzqXiaQ+6cof9lin+IUg==
X-CSE-MsgGUID: fwPaaWK1QBiFm4aKhKOtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75439373"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75439373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:02:12 -0700
X-CSE-ConnectionGUID: V0ilWwd6S7i3f9WpGdtGeA==
X-CSE-MsgGUID: sBg1ZV3aR0GKAgsxiL1PJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224350227"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:02:10 -0700
Date: Tue, 24 Mar 2026 15:02:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com, hdegoede@redhat.com, andy@kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x02 (strobe)
 as IR  flood LED
Message-ID: <acKLTxwaQQs1vwhK@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260323213535.1410678-1-mnencia@kcore.it>
 <acKJ5W12MFgZWPew@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKJ5W12MFgZWPew@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 02:56:05PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 10:35:35PM +0100, Marco Nenciarini wrote:

Note, you use some outdated email addresses. Also I can point to my script [1]
that uses tools to (almost, as it's based on heuristics) properly form the To
and Cc list.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


