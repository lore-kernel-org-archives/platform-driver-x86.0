Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4F1DF257;
	Mon, 20 Jan 2025 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737376133; cv=none; b=iVGQ/pDZRdeGtSG8+sNBV889cTL1cQ0MfutnXzmqOa1Jr/Jjh6WdIsXoqyG2cPxqlQK+7M3o6WugOQtIzsgPtgithbyFdd/PrPQxLWPyDYg1zyVeLV13zZUC1bUR6e+vd90p3uy1xXuLZ3w7vYZ3PaqNni1Hk+6Lq0Ir7j2YJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737376133; c=relaxed/simple;
	bh=5JDk/mhVCZJ91Lzsb6oeMofXPDoBNb8RHsLP25PMmuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OBlAXb4gxrdK9VHUhNAxwTf4MtG09VQe8F2Yps+3BS2Sas2ud+O8k6GN+4PCUp0YQpNl2u3uoe4KICotYdx4dm8hLp+p64fiJCYOvORtmvrE6hgWax77E85RXewqkz+xKZvWVZz3KuDr4KWtPMgig6pgWj+qMuSEqlgrtsXkMjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3NvUpKR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3NvUpKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737376132; x=1768912132;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5JDk/mhVCZJ91Lzsb6oeMofXPDoBNb8RHsLP25PMmuw=;
  b=X3NvUpKRPfQQfFty94Ae1s7bXBCdgAmL4o8PCI9ZXfnLU0TqeOuFR3zm
   +NvTi5yjcia+E1iSI68zdrVtmXHSL6gawtdDnLNZDWIoZ9SIfMjTIGsmF
   j/RRsGYIWCRk28PB3D4qz59P6Qj1OVabj7PSpGlJu1VDOlvROwBCRD9sO
   W8xN8cGEFC7sS2OOHPulxdhX7BnRITkEjTE22jS7WAOhNYBQ0YWp7Dhwj
   jjKQZ6ynTwBVgw6PrKumeGq+e+ZME16DHoVwR1GrGvv8ieLeU9I6T59UG
   pt73Bu2WmKYlYBFJZ8YXhXhb7KZ6iRs2eElj5+iYie7Yv11lAjrI7gYfL
   g==;
X-CSE-ConnectionGUID: IPfC9pNeQEOreRnngFOFDw==
X-CSE-MsgGUID: ueq/yPBjQDyp93agFpPFlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37918784"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37918784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:28:51 -0800
X-CSE-ConnectionGUID: qMgfJ8E6TIyQIwOAWCj5uw==
X-CSE-MsgGUID: 4Bnb7uh7S8aR1rfA5ra08A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="107109544"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:28:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: farhan.anwar8@gmail.com, rayanmargham4@gmail.com, jlee@suse.com, 
 Armin Wolf <W_Armin@gmx.de>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hridesh699@gmail.com
In-Reply-To: <20250119201723.11102-1-W_Armin@gmx.de>
References: <20250119201723.11102-1-W_Armin@gmx.de>
Subject: Re: [PATCH 0/2] platform/x86: acer-wmi: Last minute fixes
Message-Id: <173737612302.3608.16369298648828569934.b4-ty@linux.intel.com>
Date: Mon, 20 Jan 2025 14:28:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 19 Jan 2025 21:17:21 +0100, Armin Wolf wrote:

> This patch series contains some last minute fixes to the acer-wmi
> driver.
> 
> The first patch was already part of a previous patch series but got
> rejected due to the fact that the acer-wmi driver was using the AC
> status at the time to cycle platform profiles. Since this is not the
> case anymore the patch is now being resubmitted.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: acer-wmi: Ignore AC events
      commit: f6bfa25c6665f8721421ea94fe506cc22f1d4b43
[2/2] platform/x86: acer-wmi: Fix initialization of last_non_turbo_profile
      commit: 3ef4ea516c2f8a2f1ff8ca59b156fb2e4472c2a4

--
 i.

