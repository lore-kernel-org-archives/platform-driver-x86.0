Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85D262FC0
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766490802; cv=none; b=GP83t31FaY0pmeizKV+BkjDfMx+yEhJW21+oaPfKK9eHv/uMnq93mCtvRtC7zdJecu1A2KE0rrwlW4WYyqUQ33M+A5KY2k31nqXWlJdzx8rDjyH+Y9+3h80239CPY79M2DiBccGfzpgnWfLUM5W8qW7OffyMOty7tJVUvr1R10s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766490802; c=relaxed/simple;
	bh=ifET7bfrHGHL/hNC5/H7LP7sQWwYKpi7cbrAsb0tcR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PQyeRHfs960NitUX0DtJ+/q9jN1Hw+Ufl+Y7ELDxXRGT+0sjjk1In4dSbSfNO0lDVfFKvPMlEzRfHTOtINFFL9UCUuoAseVjppcA0uvLvEOftlNLxYdQ3UejpRgU8aiTwRtYAYIWVyEz6DJiKFBr050u+VX3BiwpOULYJ0zv5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRutLOE8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRutLOE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766490801; x=1798026801;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ifET7bfrHGHL/hNC5/H7LP7sQWwYKpi7cbrAsb0tcR4=;
  b=dRutLOE8gO5m+MLMyEnKZfufmt1fNohoA/WYVDB8pkR2yBhb7xpQAnhA
   /aFC8bYPg3YwXnruBQLXU32HGeifM3wHxh6ZzLPTpz7gr5Lulgo1NrEAg
   pK482i959lBd1Ju3qvfOcrrVRG3HSvq9BVCWcRYa92bsvnGy1s27HYsGg
   OJmSXPAtrkL6MNNDujHV2rFdO1U/V9TLm67w/hIIRsvQ+zjawKKClfqCx
   InvECUfWJawGvJkBk1KIpf3oeENN3GeiQlOMhtZ4kRgSv+lxnm8/Sjrqq
   YWJ+u8bvKFAEjA9gxgckgBVnuN5a9n0wt5DSm+XnOc9Ut/z9elCu6C0sf
   w==;
X-CSE-ConnectionGUID: EKy34btWTEi2BuY5SRCT5A==
X-CSE-MsgGUID: JPUOyTzARXOvTFwY8aRtHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72199432"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="72199432"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:53:21 -0800
X-CSE-ConnectionGUID: +guQg528QVeB/6gHaf8Kxw==
X-CSE-MsgGUID: OX76zP1gThyCYSk9P7CYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199678066"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:53:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com, Mario Limonciello <superm1@kernel.org>, 
 Yijun Shen <Yijun.Shen@Dell.com>
In-Reply-To: <20251202042219.245173-1-Shyam-sundar.S-k@amd.com>
References: <20251202042219.245173-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v5] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
Message-Id: <176649079336.7342.3566977913209513394.b4-ty@linux.intel.com>
Date: Tue, 23 Dec 2025 13:53:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 02 Dec 2025 09:52:19 +0530, Shyam Sundar S K wrote:

> Custom BIOS input values can be updated by multiple sources, such as power
> mode changes and sensor events, each triggering a custom BIOS input event.
> When these events occur in rapid succession, new data may overwrite
> previous values before they are processed, resulting in lost updates.
> 
> To address this, introduce a fixed-size, power-of-two ring buffer to
> capture every custom BIOS input event, storing both the pending request
> and its associated input values. Access to the ring buffer is synchronized
> using a mutex.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
      commit: 2a2c085de1f3f54a6222fbef5b45f1d3c40e98e3

--
 i.

