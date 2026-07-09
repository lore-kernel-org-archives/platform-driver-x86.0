Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0374964F;
	Thu,  9 Jul 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604384; cv=none; b=aD22uX+0xAAVElBDILKpJRR/dKIBEgZXmU4goUMN642CSA/jDST07cdkNv2raCQllaW5KWYdIfyAvjfJDJ9o2XSsNwyPXVpldKijq5RFNbar93DR5zo5eGTTPhw1JzHxgC058vTRrwjFJCsixuRiW3mDi2Fp5xgnhXeCiyhZQ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604384; c=relaxed/simple;
	bh=Ie6+246oANTSVOCpzRFxd+KNicVzAeYa5Wwf35RK8HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lA1xqw81loSfqzlFkXuTvC1aNKncqWdA/jGOe/98VrPY/Kk2N2ZZEiR1k8yJDFLEKjCZQemmTAmPzrpLmnzB6nJaURrxsWFF2vp8feRmAfk5ABnagDGRB9HKs9DFGGM1uUW2dmGrYdTP2Ph8MiZAKj2XQebidW3Gy84e+IIb11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP+1mGpE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP+1mGpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604383; x=1815140383;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ie6+246oANTSVOCpzRFxd+KNicVzAeYa5Wwf35RK8HM=;
  b=ZP+1mGpEbjaHz4duq3UrMkwaM49tEag+AkIWlNr8dMEnE87qffg8pVZ1
   lCNtANwnjDRQTV1L7ucaIsO6pFdlVKIhY19AhtWlUENKnnKCtyu4Y0TkF
   gm2km04rqpQv8Yv2PiEYeY/2jjmLDshb1b4hm7leO1MY8B2RPntqD8OAs
   CTVKM0AQ/YRYmYk/0uf6SONCBTBptLUdOYMACyqlZQQKpmHMZjAptZTxU
   BBwhN9qcNKnGwBpNTtaEyptK26OmF/eUmKKONzkeMXrDXz1pb6s8z5fsV
   JjYadJOiCvAnrWlYtv2WBtVEHj40lei1uB1Ipd5PNVbXXrrZycl8NanUA
   Q==;
X-CSE-ConnectionGUID: It2vZ/T6SROFgmeWjm1CUQ==
X-CSE-MsgGUID: iwjd1OXyTw6r5mlvabBu6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84337357"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84337357"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:43 -0700
X-CSE-ConnectionGUID: iNdGfCdNQc2seQyhDUWfvw==
X-CSE-MsgGUID: uV0iaFhATSWuxxOhbNADvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252846502"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: matan@svgalib.org, Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260708195553.7762-1-W_Armin@gmx.de>
References: <20260708195553.7762-1-W_Armin@gmx.de>
Subject: Re: [PATCH v2 0/5] platform/x86: lg-laptop: Improve support for
 modern devices
Message-Id: <178360437486.12613.3155322157651200422.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:39:34 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 08 Jul 2026 21:55:48 +0200, Armin Wolf wrote:

> Modern LG devices like the LG Gram 16T90SP currently do not work
> with the lg-laptop driver due to a number of changes inside the
> underlying ACPI interface:
> 
> - events are now exclusively delivered as native ACPI events, the
>   legacy WMI interface does not work anymore.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/5] platform/x86: lg-laptop: Fix LED resource handling
      commit: e0040859a38a3ce628f5f218b2e73f54cc8fdca2
[2/5] platform/x86: lg-laptop: Add support for native ACPI events
      commit: c81785937331dff30a565758603407504922a470
[3/5] platform/x86: lg-laptop: Add support for additional events
      commit: 999e29db35d1d4d667740cf18209354ca9839356
[4/5] platform/x86: lg-laptop: Improve WMAB control method support
      commit: 1890f755498787c84017ca4df859276ffd9a1101
[5/5] platform/x86: lg-laptop: Fix keyboard backlight support on LG Gram 16T90SP
      commit: fa35dfaa0b9c581ec4dbee19bc8a6f9164205c3a

--
 i.

