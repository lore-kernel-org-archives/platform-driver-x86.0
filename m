Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ACC4AF16C;
	Mon,  5 Oct 2026 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224681; cv=none; b=dcexXST6zVu3I03l+eCSBUl7hT0rGg3tlaaG4FkxOqLTcSpemUha0lx/Eu2Qnlna/Y9uFRfIjeh2q4MkMI22RNMrGYEzW9lLBW9sUckPZJ+hQVej95DLSkuU7jyGVR0Ww5pxd4w/mtxK5NSORO1Vg9SWYjaECoF8xS7T7H4/7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224681; c=relaxed/simple;
	bh=MRcaZcKIBL5k36Kh5fyka96ILIE1R4jB268zetAlKvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UUBs2VOlFhcv/U6Ig4Ykj93hUCwh9+lQ2C+5DID7F35hsFdSa49Y9NA94XvzvBNPXCxbcV/PuL2SogRULW/YCqnfzbPjCfqCv3zpxvljNEEVHUMr9H4cZlF9CKqMfCCoXJJzaky2yBnxArYFpJCIhgnTZ28Wpf9wKaSN1j9HKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9nWY3s5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9nWY3s5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224680; x=1822760680;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MRcaZcKIBL5k36Kh5fyka96ILIE1R4jB268zetAlKvU=;
  b=a9nWY3s5NKcpKPoRovqr7nIbJs+FGa8mHBKReN+nyBoMw3dMcStPcOAE
   yZ47SBKihMdprSaeeK9cy1A2W+yO3CU4y7wZ2vrExp5vbsGaKYtlPKb92
   2jpKYBR1m55HmMmYD+/5kGgAPTb92nuK62ymIPtl6B2i8W6XsKUbUflZ9
   Aj8AZMrHTHFxaMhRkTmy+dBpZk/bN0ANwyryd4IRJXrJMFbMyqjkVhKUL
   nHVlXbVpxbAl9alsmAGEG/rB4/2nnWKi5/l+rVfzNbWP4+w46XHW7gO5c
   FKoDYbepEb13DfnB4ogA7VDPy9x8xhZKb2aTSkN1VDBlyHL7u7r/GBfqH
   w==;
X-CSE-ConnectionGUID: lbT6QtDTTLa3PjPx3L+MIw==
X-CSE-MsgGUID: g6XWF7IcTk2b1EjG6Qvptg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91039142"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91039142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:39 -0700
X-CSE-ConnectionGUID: 5xUp3hrHTZ6GjeHicFslpA==
X-CSE-MsgGUID: mXJIGNmcRHqk75V+4RLjBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280628472"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <blum@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920103518.281843-2-blum@kernel.org>
References: <20260920103518.281843-2-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: think-lmi: Use sysfs_emit() in
 pending_reboot_show()
Message-Id: <179122467144.34664.10549403915909704936.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:24:31 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 20 Sep 2026 12:35:18 +0200, Thorsten Blum wrote:

> Replace sprintf() with sysfs_emit() in pending_reboot_show().
> sysfs_emit() is preferred for formatting sysfs output because it
> provides safer bounds checking.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: think-lmi: Use sysfs_emit() in pending_reboot_show()
      commit: 6cbf338f2e442f2843c208da92f049e7e23b5e5f

--
 i.

