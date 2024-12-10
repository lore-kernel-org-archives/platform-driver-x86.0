Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2193A1AA1D4
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733839410; cv=none; b=QOKR2o1N44gmtDkhoAdN9gcoL4+JTRHMu+d/IvYfgK4/gKijkDKVs4d2GRmVOjJ07ZpvWzl1OX55/CZd/+fpUqdyCyGBaQ+X9HCNv5hIw5lAUSmxPg9i5fQmCi5YPQhV1zTfrOUpYRkauBLFiw10TmxC3cw3GacBTuODeO0aMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733839410; c=relaxed/simple;
	bh=CDitxbvR1YRR9SIYhoQ+Qqsoezwcu4FSGYraevIFMo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bCuMYmaD9hasNPAjPbiCC9hRe+qspLrIoLpeV6d3UtsCLox58EWLELyQzMf8OAmddveb3qKQ+ltO+MjBzZmYGdFJZiNLFF6ScjBZEdJNnBrAlT27u7+Uf/+S/y1O7+fWg6FjARraqxmcl8ykaLzF+XTuIuhGomUiWmrM8pg1heA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPfzLNjO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPfzLNjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733839409; x=1765375409;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CDitxbvR1YRR9SIYhoQ+Qqsoezwcu4FSGYraevIFMo8=;
  b=mPfzLNjOoheogj7VO23mT3G0fd8YBP1hfPtLbPc8fSi00rGMCTbCob7H
   z+4HDzxvXZDuR694DRFgxSjGxJJ9TseQ54ce/lv7O6kHkXsERg4L5VTIe
   elJ6XNHmlgvBlqfMfL0trjbPRi7mDFpzZRE/3y5OVujQVZM74pj1FgsAw
   3OkSRqODRXA+NdnS9r4Gcv+CFCuki6w+3LFKZeXRmqiSgAlqF9gGknzXW
   cOzi3Sr0ErMGug33uMwTD5RTquCt1swRTa3Ehw8A3/zGghEO+VDLKd4co
   9K1EDxSMWYM86DWoBfiM7kj756MbOzMKNU/mKh5PjQfjxt1lwkbKHKBVr
   g==;
X-CSE-ConnectionGUID: sgm7eDOESw+oDBysKGiZeQ==
X-CSE-MsgGUID: bNn2EBzHQASAKguwZEmj5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33912658"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33912658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:29 -0800
X-CSE-ConnectionGUID: 4GEKMKutStuvzdxOkR0ivw==
X-CSE-MsgGUID: 0w8wJWJ8TjyWh+C7Lo6OTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100226209"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241204143807.32966-1-hdegoede@redhat.com>
References: <20241204143807.32966-1-hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel: int0002_vgpio: Make the irqchip
 immutable
Message-Id: <173383940371.11345.15690246951683755342.b4-ty@linux.intel.com>
Date: Tue, 10 Dec 2024 16:03:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 04 Dec 2024 15:38:07 +0100, Hans de Goede wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips:
> 
> gpio gpiochip4: (INT0002 Virtual GPIO): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the int0002_vgpio driver immutable.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel: int0002_vgpio: Make the irqchip immutable
      commit: f3479920605644e273768d316aa49119ec629acc

--
 i.

