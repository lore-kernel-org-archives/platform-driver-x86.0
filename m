Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C51C84DD
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Jul 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195269; cv=none; b=WeY/V8SzE6O4A0IyrjpM52aInwPUUL1/1clTYEWbGl9A9Q42n9n2GALo5/uv5HjfhiukBFVCl49R9XQ7/3nUR2y+Ahc1iCcalA4i3eZGVJ9xmGmTlKZ6hwH5qkODd+3fzNIAWzG2k9hFixBzDK9v/Co0YSSvSjuTlxgu4Cyj/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195269; c=relaxed/simple;
	bh=rLQr8SbHolZXQFRRF70KxevTnirnGAslnfUqJE8OC5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g5J+QNrymdFdKI0jbRqUD8+kAn5rdT354FDUDbtLu2Wfe9kE1LLsR+YIn/y7sQXtMkdzT4KeW6VaNfMKQ95v2zw6FXC5SidKMPXt1kSkmwkwzwv5xl5l+hw1x4oI2bI6gL/7o+Do0qc42dkuwX9H/GYZM9fPyNmG+ozErn5YiQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XV764znH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XV764znH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753195268; x=1784731268;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rLQr8SbHolZXQFRRF70KxevTnirnGAslnfUqJE8OC5k=;
  b=XV764znH+5yMPdxLMJmlEaY4G1UVtQzbyekSFBszS5HSDRKvQqKGyRz5
   Ak+Cng7aNYhdDlVhd2Y6PNnGrfzCswOQ8XDdEFk3tnCXQoNsj1LmTm3IO
   e21RI+UxSIS8IjhJF8I96nDIKoGuRkY3KxiHCNogOKH36KJNCAO292D1Z
   MD1oV/YQr7OzWxsexBHdwMuaD+DCGG8rP3MFv6qJCYUnyTCePAblTc7im
   u1xjpJNNti8XpZTL9aaWo6yIupgD7uJwds5C1dPuXoqeDVBDy6zBdzM1+
   O0D53mLHQ0+YBumrTOXAx2pBxOOfdHqw6KMjAYlne46cSTYwHTF6DMy5f
   g==;
X-CSE-ConnectionGUID: X0IwhEzfRDGphFXEREUJHw==
X-CSE-MsgGUID: Lmum7/FDRR2RMVNJR5DZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55403414"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55403414"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:41:08 -0700
X-CSE-ConnectionGUID: VCodK/9aQXykciqbx+oOJA==
X-CSE-MsgGUID: rfP3lmhLQOmHjZJQr9Rlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="158472428"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:41:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, hansg@kernel.org, 
 Mario Limonciello <superm1@kernel.org>
Cc: Adam Berglund <adam.f.berglund@hotmail.com>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250718172307.1928744-1-superm1@kernel.org>
References: <20250718172307.1928744-1-superm1@kernel.org>
Subject: Re: [PATCH] platform/x86/amd: pmc: Add Lenovo Yoga 6 13ALC6 to pmc
 quirk list
Message-Id: <175319525981.17685.6588774793514630477.b4-ty@linux.intel.com>
Date: Tue, 22 Jul 2025 17:40:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 18 Jul 2025 12:23:05 -0500, Mario Limonciello wrote:

> The Lenovo Yoga 6 13ACL6 82ND has a similar BIOS problem as other Lenovo
> laptops from that vintage that causes a rather long resume from suspend.
> 
> Add it to the quirk list that manipulates the scratch register to avoid
> the issue.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: pmc: Add Lenovo Yoga 6 13ALC6 to pmc quirk list
      commit: 4ff3aeb664f7dfe824ba91ffb0b203397a8d431e

--
 i.

