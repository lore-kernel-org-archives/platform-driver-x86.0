Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E086422912E;
	Wed, 11 Dec 2024 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925715; cv=none; b=njl5NP8GCY7p0nQw2ksGkoo0ulK4VnwV8rKvP8b5Cu5PFGrMxEUEGiiLjOA3GDURwfmUesKMve7gNrfGmZkeSNrRV+8Pc0CgY67j56KINfNJkIbAl9gqRjzb5kovUhiNQCshws02QuQBmWZYL7NL67iLObFK6w0CGbEuXuxQDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925715; c=relaxed/simple;
	bh=LDn/7r/mLU5fcXVAhj6QkjDMB2W3mEVTwsjHWPl0HTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qgAx/PeuwfWMAojqZkq7g7FPG6G71Zq3k2N1khAeKR15xwps8opEZI8Y8An1eDYid+JUj0F+JVeW86reJGDINQSit7f1bqwiHChL3G/5X5+vaZkExN55PjnsB326oQfk9PP7k/eUxLHpzthqK/wZW9aWnlkGSTPR/7HT3jb9tOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WflMxK7z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WflMxK7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733925714; x=1765461714;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LDn/7r/mLU5fcXVAhj6QkjDMB2W3mEVTwsjHWPl0HTk=;
  b=WflMxK7z3YooZPQonMFTQpMkUJlgJGi7SCh48WWOvKZlgD+BroVb2m/Q
   GdOFv7mfcmkSVOXrM1PCP36gxUBl0mpBHgL5moaBLuaBRZpwWx0I0FtUS
   95q8jqNP6g6orSgZCayVW4SfgtSvMFrv3/uHpV/q1SeZgNPdNmKSUeYu7
   oXYNuqDBI8S6GTAItaEWatiWIjVSZaW3mzbweYwbp3raTaYL2rJnoYGUA
   Ly2EG3QG5HVh7p+3yM1flkqjiO3++F0W69eByzmaW3hrz3Peo6x4cr/u0
   Pd1k1uha8VhE/QZPUH3e/Wj2JS81yCqKB4i/ByoN/yEbcO2U8/STB/GSD
   Q==;
X-CSE-ConnectionGUID: H1T9A+q3ThKJKuGUrFLc4A==
X-CSE-MsgGUID: U2nAN0n2Q4G9RREMTxqWDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44776262"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="44776262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 06:01:53 -0800
X-CSE-ConnectionGUID: k4N8XtnhT0y8jqot04a5hw==
X-CSE-MsgGUID: clxElLF4RQy7YiLWhEVquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99910767"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 06:01:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Jithu Joseph <jithu.joseph@intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 tony.luck@intel.com, ashok.raj.linux@gmail.com
In-Reply-To: <20241210203152.1136463-1-jithu.joseph@intel.com>
References: <20241210203152.1136463-1-jithu.joseph@intel.com>
Subject: Re: [PATCH] platform/x86/intel/ifs: Add Clearwater Forest to CPU
 support list
Message-Id: <173392570199.1862.9950435189579563941.b4-ty@linux.intel.com>
Date: Wed, 11 Dec 2024 16:01:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Dec 2024 12:31:52 -0800, Jithu Joseph wrote:

> Add Clearwater Forest (INTEL_ATOM_DARKMONT_X) to the x86 match table of
> Intel In Field Scan (IFS) driver, enabling IFS functionality on this
> processor.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/ifs: Add Clearwater Forest to CPU support list
      commit: 6c0a473fc5f89dabbed0af605a09370b533aa856

--
 i.

