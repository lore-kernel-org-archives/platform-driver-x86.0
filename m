Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523C443D4FF;
	Wed,  1 Jul 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905446; cv=none; b=B3+g1ATDbPvRelMn9Y/vUSsky+m5RrJE8681hgMpZTKv/7Ds7jzUNkItU3ho4d30bMgqa7EOOftzSLbTh9KV62NxUd2lXXncJFRmdcRzyU0uRI0NT3ivpq5qoNsGe8dYtF+4Ss20h+w0yCsYyDMcgJQ5iMsY9FhuXpnk2PHe7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905446; c=relaxed/simple;
	bh=WxnkuDMoV/tGe+fl5Yfq2zcdikQSXQPji84Esn4jGa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dD+kv9MAsxnZ4HEA3feu1b8xOA2PwjDlbz7mPzoz4JnqdwiRlQiIaC468ia1q03GAzbJmovkwF+nBLvUwAgmq1FEIiPpSlDuLRCwNHJuy2Ey16SSTuZ4U2iuBmL6u0WoJvp1HUW07DR8Vj+XHhNSkL4hL5OnX39PBVxnqA8r/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEGiq1g8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEGiq1g8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905445; x=1814441445;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WxnkuDMoV/tGe+fl5Yfq2zcdikQSXQPji84Esn4jGa4=;
  b=GEGiq1g8GYLouv/08122T74+OTzzT7ECnalNu+HF0j+liuQmOgXutkae
   PMtvVTMljkuQoDEjOYM7oa8oaMtABmAx4wHTYLpJhG/cVIrAm3GwXY/AR
   BCjvyTJEk/NUQF+GSSaWOY0mRTmvR0X1dKG9zVpukdd5sZNmEd9n5AxUU
   8jEGzwhrP+K4ColNZI0zzZN6gfO40F/bhw6fYti6QRniiMPkVYQMlyNrl
   8ArAmvLHygBoEeVnp3AbmpnOI+42nyCebhTW4TCmqld+TDI3rJZ7vWTpk
   4qUMn2C4Fqupar0yrP3CWyIdCUNogoMyn4z9mMUlFqpjZdhh+uAz15iBC
   Q==;
X-CSE-ConnectionGUID: UoB6kj/2T6uLpfRhUWNE8Q==
X-CSE-MsgGUID: cKuPt/BjQTy9E7rAhYgTGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83509520"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83509520"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:45 -0700
X-CSE-ConnectionGUID: aZm0BZciTx27TSs73giyyw==
X-CSE-MsgGUID: 02BqY9kIQVy8LLcKlNe92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="275761289"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260612173451.467629-1-W_Armin@gmx.de>
References: <20260612173451.467629-1-W_Armin@gmx.de>
Subject: Re: [PATCH 0/4] platform/x86: Fix various issues inside Dell WMI
 drivers
Message-Id: <178290542683.22449.17910473378270100225.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:30:26 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 12 Jun 2026 19:34:47 +0200, Armin Wolf wrote:

> During the review of a previous patch series, Sashiko found multiple
> preexisting issues in multiple Dell WMI drivers. The first three
> patches aim to fix those issues, while the last patch is based on
> a suggestion of Ilpo himself.
> 
> All patches where tested on a Dell Inspiron 3505 and appear to work
> just fine.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/4] platform/x86: dell-privacy: Fix race condition
      commit: a3ec96c8b7bc3a643779ddd7daa8a6f482e4917c
[2/4] platform/x86: dell-wmi-base: Fix resource leak on module load failure
      commit: f58553cda9aa84e1598a640870b137350cc24027
[3/4] platform/x86: dell-wmi-base: Fix handling of ultra performance key
      commit: cfe467c730f658e080ffc57bef36f0260333c5aa
[4/4] platform/x86: dell-ddv: Use no_free_ptr() to simplify error handling
      commit: 74850eb0012b94c77366b0476e4f3b1db349a4d2

--
 i.

