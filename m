Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223D472534;
	Tue, 18 Aug 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062097; cv=none; b=hmcXctCR9O8VFGsJp93i7HgwEJgUZxva12ZxTLHcxdA5yMyS1BMOoRSu1PhetP2V+7RRfYc5ommi3m4R7Tg6fdcco8zrf6ue1vamBm+99QF4g0raSDnnkdosTu6xc1QfAjlmhEGOX9a3JIxPheXtMgmIc27TkMMW+MncPkSTV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062097; c=relaxed/simple;
	bh=xZA8BGidxAcUdBrQ30W+EJ5oZHSK8eMA41unOW/m4MI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MrjiSOp6M2Ka054Epg6e9xwKwLc98pnybHxx8EjGpl9i8vjcFDlBohHbTCWqMaWAoI3KFiVcLc8zU2uF+bZXpPZ5pucvPFH5AZK+ZQAUezvYz0n8PHUcfYV1g/TB7SwOmEYJ4EOkZn3HVGONswoidjwCSLdehR+6Xm/KgQKUpxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPepYNjq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPepYNjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062096; x=1818598096;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xZA8BGidxAcUdBrQ30W+EJ5oZHSK8eMA41unOW/m4MI=;
  b=gPepYNjqryzACa5CmgSmX3biF5eBZCZdLwvcVtQlOyoM9JemHFoPBPy4
   GAhY5C38MqO5phS+djmVl2J1jJCe3grANH7oT/6r1vxGPGm43bYZ1to7/
   HGMzujfIRpK4KZnULXPGS4QWL7rIZ5nsOd4Nu4mQGfrwD/9DCaee5N31s
   QgyPshqERdJxx0Ew+5pY0dc274AMxvPpuU4x//T5RLCXEDd0zebmw6yFX
   y1MCVQBEdsuFT5DekvsHc+MUZ5V0ixBT2ZAfZY8OX5Xds0OYWUAgZT3hW
   fzxR6xR10W1N2GpSqR4AsWziQXDTp6bgK/ZUa/h0fVUGB4rBVBouwKPsb
   A==;
X-CSE-ConnectionGUID: OO4qOhr4SJKuxeX8qFpQ3w==
X-CSE-MsgGUID: p2C5YmgGRJWBiXSoRya65w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98708784"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98708784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:07:54 -0700
X-CSE-ConnectionGUID: jRjTYjf8S9istCREdROlgA==
X-CSE-MsgGUID: 89PGh+06S26X1rK8OFfvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="264792097"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:07:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sammiee5311@gmail.com
In-Reply-To: <20260811222134.3912626-1-srinivas.pandruvada@linux.intel.com>
References: <20260811222134.3912626-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 0/2] platform/x86: ISST: SST-PP failure handling
Message-Id: <178706206786.20251.8243742243633437618.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:07:47 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 11 Aug 2026 15:21:32 -0700, Srinivas Pandruvada wrote:

> Some optimizations to fail on SST-PP and add sst_instance check
> for a package.
> 
> This series is dependent on series "platform/x86: ISST: Validate
> inputs."
> 
> Srinivas Pandruvada (2):
>   platform/x86: ISST: Return error during profile addition
>   platform/x86: ISST: Add a NULL check for sst_inst[]
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/2] platform/x86: ISST: Return error during profile addition
      commit: 4ff76db9d76cc13e83d60ea6650ee19ec97d0106
[2/2] platform/x86: ISST: Add a NULL check for sst_inst[]
      commit: 47e50bee2a2cbb70b9a479c22c959a79857d9531

--
 i.

