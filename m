Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CF314B93
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707205; cv=none; b=h+JBCSoFz3RRTlD1E5zFXCXbJq44B7FZ4tf2SeodilyonXU7yRb9fW2u8qWRumb3QmeokGjmSiFP8NzfaSxLI6xkObi829Y6n26ambhYtz0EGtF5lZGZQxJf/fUwbjdVdVKy1f1Ml++Hb9IOKoayElXHtfrcUuJnjHHJ4CT+5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707205; c=relaxed/simple;
	bh=dvMvoBhirpjhIn1sTNHK68tMNL7nVjkR9g9W/NCc1BU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gYD5WSbbykYp9ZUCRIK5xwoWbyW3mCZRqYOBE/q2BYhQ6egCbgAluGCQwdCEcy18tl/ehmA29iWeERto3ZmxUMsBH94ya8HXSZ4UbWgWqonORlY4IwfeB4/91fGQ7F2w0pfbxRlVvjjd0fwCVWAOQsjBJCT6w/ikpUZ9FPXUGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWsQnw0Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWsQnw0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767707204; x=1799243204;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=dvMvoBhirpjhIn1sTNHK68tMNL7nVjkR9g9W/NCc1BU=;
  b=GWsQnw0ZsMeFtLvdDp8yq9A9fq8H2/4yRIWF5kcIv/J2/iQNrN3d9tNn
   MKF7NI6nJwO7LoDNEDtIahAYw7+cYWYWIRV/kK4kE2aq72sY3ALSzIUYZ
   eymeCcLG4+ZqMR473rV8AZF4txVyyu5VNGpFpzg93i0MdH9/TFQI/AM81
   dSexSMQvPAa88G44FIrt391jWpT7hrRJ6fw1u4RXrSGz/+ofyYz/A/N49
   WoI9R3tJRQxIywTPGrZ/UWDApS2sMxz4fJ95A1U+66RbU+ugqYakBYo7D
   7m4upgeEl8i/rneu6DsUonegMERoi+eaB7dMU8qKtQBpgkalKHlAlO18S
   Q==;
X-CSE-ConnectionGUID: 3VDFYTy1RYGZcO3VjERdYQ==
X-CSE-MsgGUID: pYEltY3oRY+GCK0zCbaq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91726695"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="91726695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:46:44 -0800
X-CSE-ConnectionGUID: CjXSZA3ETgiuAF52DX7PXA==
X-CSE-MsgGUID: Te1c5lueS3apZxbfSqdAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207127894"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:46:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: srinivas.pandruvada@linux.intel.com, hansg@kernel.org, 
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
References: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
Subject: Re: [PATCH v2 0/2] platform/x86/intel/uncore-freq: String handling
 improvements
Message-Id: <176770719733.2365.12102904901493926413.b4-ty@linux.intel.com>
Date: Tue, 06 Jan 2026 15:46:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 30 Dec 2025 18:15:14 +0530, Kaushlendra Kumar wrote:

> This series replaces unsafe/deprecated string formatting functions in
> the Intel uncore frequency driver with their safer alternatives.
> 
> Patch 1 replaces sprintf() with scnprintf() in device name formatting
> to follow kernel best practices.
> 
> Patch 2 replaces sprintf() with sysfs_emit() in sysfs show functions
> for proper buffer bounds checking.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/intel/uncore-freq: Replace sprintf() with scnprintf()
      commit: 050a0aab15da9e1d14cd41073046d12d29f443c6
[2/2] platform/x86/intel/uncore-freq: Replace sprintf() with sysfs_emit()
      commit: 7b0a51955b0eadacd44350b6f13bf21ba675aed9

--
 i.

