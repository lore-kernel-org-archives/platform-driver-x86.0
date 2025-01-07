Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE001F37DB;
	Tue,  7 Jan 2025 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265605; cv=none; b=arkVY6TYyHvBuG3nl4SjHG1j0f+qkP0jHMyAfVIj4P+kCTkg3TaJbTsRFroG5eoFLFRrPyzBs/XfE5+F/stPZtAewIi8Yt8zEH/cIKj8Xf05jyUMxPlyK99Bwm4QFGY+arBD3e8JrKGoL/DHl2TuI/Mdw6yVGJ9GFc3SyGOOtv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265605; c=relaxed/simple;
	bh=CcqFWTwVVH2zuS29om7isAyn/3zETZ/WRQdAwbI745s=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vGEWXce9+liVvYKqgn6FBs4vKriMulGHIeiQEMw7sxE6AfCBQI+YZ+ZC3OByUz0nRBOSi0YaF5ZJ3QCiPoa4HG2bM30Dy9qP+e+PEt3jHgRTC322Q/6QCMPgfZsQrRLxRWBtTz66g9dLxOtHDzIfh59weZgS2ULODwIXPJVs1GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl7hUCu8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl7hUCu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736265605; x=1767801605;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=CcqFWTwVVH2zuS29om7isAyn/3zETZ/WRQdAwbI745s=;
  b=Zl7hUCu8JFsyPg1K5eHq4OH1MacHck+iIaaFVhNI791J45nt8QT/nfBa
   XQ3fXzGR6E4ifKJ35pjSBiHE/ePd6fKUalpNs6PyLv1G027M8wXOCDbwl
   HXTt3dvBQ/YgRime89vfjxrT8EhVd40P3J3jMAynAu2TS1Uysc1D6HdU4
   8RUf/UmfXHYwVYhqNmnOp5nWkptZCqsb6MaVgtmCPcs5xOaucCZczEUwc
   JKTfJw5K4J66yvfLQeg6Sb84pfAO1yQXUR1GcAHTIAPMB6SlGKcWhnwRF
   K1PDP8db+2oIHGoEOyvhwUIz0KMmffBV2NZI2L6aX+RBI0+ufijY5ArEr
   w==;
X-CSE-ConnectionGUID: t9V7SDvvRSeYvRj8AlZkUQ==
X-CSE-MsgGUID: /tE51TunR8ikXS2PwZZXOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40224344"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="40224344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 08:00:04 -0800
X-CSE-ConnectionGUID: t5WSsxA5QnKfcEtJIYGq+Q==
X-CSE-MsgGUID: bEJmciVpSJuh4ubExNuUzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106825397"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 08:00:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: irenic.rajneesh@gmail.com, david.e.box@intel.com, hdegoede@redhat.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xi.pardee@linux.intel.com, "David E. Box" <david.e.box@linux.intel.com>
In-Reply-To: <20250106174653.1497128-1-david.e.box@linux.intel.com>
References: <20250106174653.1497128-1-david.e.box@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/pmc: Fix ioremap of bad address
Message-Id: <173626559524.4330.18207834156877167581.b4-ty@linux.intel.com>
Date: Tue, 07 Jan 2025 17:59:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 06 Jan 2025 09:46:52 -0800, David E. Box wrote:

> In pmc_core_ssram_get_pmc(), the physical addresses for hidden SSRAM
> devices are retrieved from the MMIO region of the primary SSRAM device. If
> additional devices are not present, the address returned is zero.
> Currently, the code does not check for this condition, resulting in ioremap
> incorrectly attempting to map address 0. Add a check for a zero address and
> return 0 if no additional devices are found, as it is not an error for the
> device to be absent.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/pmc: Fix ioremap of bad address
      commit: 1d7461d0c8330689117286169106af6531a747ed

--
 i.

