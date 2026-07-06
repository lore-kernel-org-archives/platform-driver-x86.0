Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F82BEC27
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350137; cv=none; b=cWgqN+Y7d5WwmtNxBwsU+ta5vxvaAO7iRUdua+1gkAsgcZrXX4Ewuk8qSXw8/K7N1k7cU6kOkPrRiG0ImWuM6CGQCTrwMZ3+j6mNIWzBjY9vEtAgDXW5Y0dn/o7dF+LE3klqXXDbCEILxK5wz39l4EUcOfH7ZcgQtBDLU/m+C7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350137; c=relaxed/simple;
	bh=hjRA5lKgoWCCK8CmTMOHhmMLsrSgJqD0HC9h6xKkGXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qe1EFYLrDUsECF++K8mx4kNqczXeuGe2SfuB83QfNkdQpRhpOGKk//fGPW5R0MG7POcMIOgfrTjK3s8nXUXPkhJlc4gaeDHY0Ez9qt1mgAM41M5YKi7KZ3afTt1/YMnfgt1j+IgBDxEXbPFNsVynes8TbQuf5XZYMpY9dlniHpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFIoih5t; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFIoih5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783350136; x=1814886136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hjRA5lKgoWCCK8CmTMOHhmMLsrSgJqD0HC9h6xKkGXI=;
  b=LFIoih5tXT7sfdAwY769+Ffp+a41tKLdAmFuOmxOi/UAvgGgp4McnvHx
   AGjACGm2DjpTkMGigx/Q7eG1goa/CutUInnls0CLURyzTCYxIG5olG7cI
   rzHTe5bTcwWSLgNjKxMlxgDGuAUBJF+WJhJjxS4Dy4QrB+C/YUkT+5y1F
   FJbpY40ZC5KHfvY45bP644Yd4UNRa74RgcchBryY68+o8BsQT6XG08uoP
   wRn95OKeGbJCHfjO3Jffpuf5Qf+AbIbnGzEThSdLa0z2aMNYoZvmdUFyM
   dQbcTI5TcvLJzLreb0cL4pxdAfyOTiazh8EbsLBziAls1RNfyKjEGXCs+
   A==;
X-CSE-ConnectionGUID: onbdrFv6Qo6f3OLSQ3ygDA==
X-CSE-MsgGUID: UbzdsWWhR+2ue/K9Z9uwFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83855414"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83855414"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 08:02:15 -0700
X-CSE-ConnectionGUID: xsyG1KoNSouEiSHzAJCG3w==
X-CSE-MsgGUID: PkHimtG4SWyWA3dBiO5I7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="254382509"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 08:02:14 -0700
Date: Mon, 6 Jul 2026 18:02:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	PDx86 ML <platform-driver-x86@vger.kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: Imminent rebase of pdx86 trees to v7.2-rc2
Message-ID: <akvDc_LAMy25o6xo@ashevche-desk.local>
References: <8084b592-cb10-2ae4-603a-615f053ca01d@linux.intel.com>
 <akuE9tvj29Y6crEk@monoceros>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akuE9tvj29Y6crEk@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 12:37:36PM +0200, Uwe Kleine-König wrote:
> Hello Ilpo,
> 
> On Mon, Jul 06, 2026 at 11:48:18AM +0300, Ilpo Järvinen wrote:
> > Because of the recent mid-rc-cycle merge of the rework for 
> > mod_devicetable.h in d2c9a99135da ("Merge tag 'device-id-rework' of 
> > git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux"), I'll be 
> > (re)basing our pdx86 tree on top of v7.2-rc2.
> 
> Probably to late now, but I guess merging v7.2-rc2 into your tree to
> handle (potential?) merge conflicts would have been the solution that
> doesn't involve a rebase.

Rebases are cleaner in this situation. Basically what Linux has done should
have been done just before issuing -rc1.

-- 
With Best Regards,
Andy Shevchenko


