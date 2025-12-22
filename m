Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F32FC00D;
	Mon, 22 Dec 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414585; cv=none; b=HbjrTIRNzXf3OFf/bakXin4eauHX/Dmu3Jf51Us2pZaKjPYTZz/CpgI5UU3295+lbxELRe7OVfhCnW5xWzcWdENTj0rzlFQqwb8jadcEHC3Pu3Whf+MmcbrA+AUZ9B9VKa8pSPOtYttt7+u+93Cy/tl1gCp0oSS6sSDQSxiiThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414585; c=relaxed/simple;
	bh=sfOErusPAJVmXivGUelskXRG3lYI3hU4QIXNVaWuGjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S3TmRp24sjN0Q3/42L61PA+vOEM6lmsL2aZJKUTWiKDplCqm7sW41QBgDtX/prnOR7o04DpJ5FO5WBVjnh3mno7fLETMAh8LiI756KCHh8LTGbasU73v6EkPy30i3vZJybDZ5dExiQdl/M0HG6NRWajE4DgS2w0rk9PNvc3t8mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCsnuTRD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCsnuTRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414584; x=1797950584;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=sfOErusPAJVmXivGUelskXRG3lYI3hU4QIXNVaWuGjI=;
  b=fCsnuTRDaD+oPhMgmbQbFNbpNGhQJaCCYC2M0kQUFzswrZm4vhowfLpK
   O0nR8S5+Vptd22137NWZaLNwhKolGKz12z4elhEVY+PvnplNQ5w+fIe2R
   F4UV2XoTHijwff3EJeQFo7qFlNWrfPa4BemJ8wILkcabbZrWYDKOgMva3
   YcwAFpusmC7x8/wfTjF65EeIa+Qlqg9gD6yNSCyZz6m7Kh6EWkmhqC5rM
   ZOqw2gMN6T0IjmdfJ8vvyHKdruUN+enH8UQp4k4qG+W/CaOjghyPERxLr
   P7t84IPBs76+ELkJbQR09ZkBgP+mhEarzkydx0DpNIfl+LsH5MmIqISsG
   g==;
X-CSE-ConnectionGUID: +dL4obRMTpWSnrVCipjp1A==
X-CSE-MsgGUID: Pd9qzvTpTnG+zg6TjH2hFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68206141"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68206141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:04 -0800
X-CSE-ConnectionGUID: RDiTrqX6TKyP0oqOP/ZQPQ==
X-CSE-MsgGUID: o7Kd8kaTR5yvwZbsOkiEmQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251127202959.399040-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20251127202959.399040-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] platform/x86: think-lmi: Add WMI certificate
 thumbprint support for ThinkCenter
Message-Id: <176641457768.16407.8374455710763385218.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:42:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 27 Nov 2025 15:29:48 -0500, Mark Pearson wrote:

> The ThinkCenter team are adding WMI certificate thumbprint support.
> 
> Updating the driver to enable it. They are using the same GUID as
> Thinkpad/ThinkStation.
> Tested on M75q Gen 5.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: think-lmi: Add WMI certificate thumbprint support for ThinkCenter
      commit: 05126063605f26f9228c69b1ff232ac6e78f72ab

--
 i.

