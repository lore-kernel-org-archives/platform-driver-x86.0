Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9B3B19D0;
	Thu,  8 Oct 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481076; cv=none; b=Iut3m4S5UzMJYgpnq0HqqUcQQWOrZs7+G3EzsA561E4izKna2Vwq1F2vtzTptWwAO5mUmboErBJPeD0/cJHlvoKjT0cKd+bAJZ6PcTvxIKjIuB6nGB4OGTf38b/hKyCYR0/WYDYg1PYzSCpS/AOa1l4vUyPiVUkiYYyVgyb/uDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481076; c=relaxed/simple;
	bh=hByzbiUXSDORQizpl0+kUQeyFLg38kpCmSigJrkWJOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NoIH00diChTZuQ3XqY/o/EHbPeffZxZcXuDBaqfuFaJg/aXKY0RK98ZOUCEuBI71l+JXjXpuyv6ADXiY81y96sIC3U4d1DNL3UuJmX2+SjAaRhjsCuswgtOYMXf2J6kwPtl6GkfvjITWbmYjQILmt8D/eSWimt/JbGM3E8xBRb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLDW6371; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLDW6371"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481075; x=1823017075;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hByzbiUXSDORQizpl0+kUQeyFLg38kpCmSigJrkWJOA=;
  b=jLDW6371L1XrbdAfR6SlOiU9euc99VbQGIG8wVdUzkvMknKjntWOsT4z
   iyqY7q+fE2ZzEWwNoiqwfmRj9CuaXmlJUOWvI+014B32EUwo0oHvFKpcO
   4LcDRAum+YQhtXJgKhTy3+ABtW7DY895x/X03X/m4LdlTsGaHoZFV2/ij
   aes0y6RxlarkFpQBhHi6UvNVLyBVCM03/jWxrOazZqpmPRCUeLRJ+j5Eb
   EBf9kxPzr4XscwWHeOHl/T7fAgp7hNw/twr6P0rNVN5g0grTRJGU2M5Br
   V7hkYVJkzgTcNAJSLxcVZM3iSas+1/xw2n7sh7Kp9XBnDsFzf+FShfw4H
   w==;
X-CSE-ConnectionGUID: obikliYYRkClJN2tAeBH4g==
X-CSE-MsgGUID: p5KPHrEMRaeHRX1pqvK+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="383394"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="383394"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:37:55 -0700
X-CSE-ConnectionGUID: 10CaVWuxR+iMQOsTnnWSYQ==
X-CSE-MsgGUID: kGp2nfAOSxmKBFaC0DcJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="217647"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:37:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
 Artem Maksimov <okuroshioffc@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
In-Reply-To: <20260925194454.6850-1-okuroshioffc@gmail.com>
References: <20260925194454.6850-1-okuroshioffc@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Support allocation bios vars
Message-Id: <179148106347.29028.7283558607553258562.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:37:43 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 25 Sep 2026 22:44:54 +0300, Artem Maksimov wrote:

> On HP systems with a large number of BIOS
> attribute instances, the kzalloc_objs()
> allocation in hp_alloc_ordered_list_data() and
> hp_alloc_string_data() can fail when physical
> memory is fragmented, leaving the driver
> unable to register those attributes.
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
[1/1] platform/x86: hp-bioscfg: Support allocation bios vars
      commit: 2c74c36352b37e98545b497eade58f069e9859a7

--
 i.

