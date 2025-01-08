Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A21F8EED;
	Wed,  8 Jan 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336172; cv=none; b=Ac3tpHzDHpd0bqxZmND1XAnvhi6T7Z2PltJZ2pP7PHC2K1zvOuidqrbRiSiKEkG6zlGoA4EeoZVBXNnPDygXuVkxRDdoInbpIte4Nraa33ctkgWaOCOM5mVCfYNfgYGMU8a6JKw2MdcKZQjBjWuT/P+By5soRhWoNZuM3zKnbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336172; c=relaxed/simple;
	bh=NGKJFhudUMkux+if82UBlwW8CQAVxCoQSRojiKMoHYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fZIn47DcKrPsoZ5YdOA642yi6pV/EHCVyLDyk93Bso37NyvMOYNPpx72YQrxvzJ8b9+MHqsdlyPwTS8wryc1t0hYOOHjLbvrCdS4bpuSQVDkDJQOZyRNd1+GwRFUYwaNHzM6+otZeeHyxduD482mK8nyKGUKFfneVc9Jps8XxcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/D6Uafj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/D6Uafj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736336169; x=1767872169;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=NGKJFhudUMkux+if82UBlwW8CQAVxCoQSRojiKMoHYE=;
  b=b/D6UafjnjMhk1xiB0eYeZbn2ObAj4IhNXbzIQAN2mfxMVi9SLwYPmDY
   jPXjYkFryV7LU3c4jj31zKhqgDwDNtKBAmZM0S8LFvyvDoSQpAxff8oCa
   194r29Wke/RAvqTtTPIwDjBTkwh3GnbI69tZZRiDjDTRTUIoe4Ml0queP
   oEAKTjcnv+17+OKu+B3dGuhey8QXpEKItx55J7O2jpzdqaOLTNzKWlGdB
   egsWGSkBR34ED0CyCp+KhNVGeKRB/sRokUURwX/29MwC+fv8uD1NMNI/J
   NDQnQpV/nnDw7dT+0+NYryYMRvwIoGgc+NiWgygEUFYcdZhUoEu/pxXdK
   A==;
X-CSE-ConnectionGUID: O0UClLbESRuf3DJwqlE0Cw==
X-CSE-MsgGUID: AJbPSdn3S5SpuVG3rpTfGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47546622"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47546622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:36:08 -0800
X-CSE-ConnectionGUID: CKl3FV0JQwq1GIox5fWvMQ==
X-CSE-MsgGUID: AUGwOw7kRfaONm+r1emCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107682846"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.87])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:36:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jlee@suse.com, ejohnsten@gmail.com, Armin Wolf <W_Armin@gmx.de>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250107175652.3171-1-W_Armin@gmx.de>
References: <20250107175652.3171-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86: acer-wmi: Add support for Acer Predator
 PH16-72
Message-Id: <173633616080.7546.6008871685372535045.b4-ty@linux.intel.com>
Date: Wed, 08 Jan 2025 13:36:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 07 Jan 2025 18:56:52 +0100, Armin Wolf wrote:

> Add the Acer Predator PT16-72 to acer_quirks to provide support
> for the turbo button and predator_v4 interfaces.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: acer-wmi: Add support for Acer Predator PH16-72
      commit: 12016dc8659d041b6237977b9e3ef78ecbdf1495

--
 i.

