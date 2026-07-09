Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EE2D3A7C;
	Thu,  9 Jul 2026 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604392; cv=none; b=X9L775r94jMbJOJebjQ2E9mK6oO/rYnioi1WdlWhZbGis1iDnbSziNllE81hHPF40EpYpOZ+UFuBxyI1yI+AweqHPReKsF8qcbsdRHmtvG6JT+4MiCO4RNeDPwEVOiYbCvONHxd4eRywFn8p+traPoakTxVFtcTVydh7I0TVkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604392; c=relaxed/simple;
	bh=ZpzeCxWIzp/V6akkGsygKIezUfp16btzJPB8pvBddAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K3tfU28M+3APh/kM9SUgyUqbNHM4rCzeCAIizq1nu7oqCHZPz/xRIiSsQPDGGRmJayh6u4M5TPdszJnKLmCTpl6yXLs/tXVynZ96MeNbLxjk9rl2B+IZ+55aDk5CTnAnqsX93WaNdpFNc3++TWkqW0KVzd7ffEV3oesblJDW3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtgBw73Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtgBw73Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604391; x=1815140391;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ZpzeCxWIzp/V6akkGsygKIezUfp16btzJPB8pvBddAk=;
  b=GtgBw73YGnggh3zufTH5826a1QB2P1Y5pOJHSWUnPUIXu19oiX+vM2bM
   nBeLNOoHBZpl3/VoGRLH8L67C3YcHBKq4VPOsFYIsiX8/ckVRVvDt83cT
   KIq12gw8ps1LYSM0GMuaL3OsJKFS+a2s0kXCncFn66hazIP6MwYeOh/bi
   /pS659kJz6Kx3ePylih9YOM08Wzh9PhubqcxVr6KgxsmjkR0hVJkIxyc+
   2pgzn97gqaQ7zqp2q+OF1JFjY5sKl+yDcuR9vMzuCb1EBs5TK5Ds7SZ/f
   daj5WAUSnaWKY8UIPawtsFrnfZV3HQ7gq94NgsP1cI9l9Q+IKs+UiCtdg
   g==;
X-CSE-ConnectionGUID: DBRLyWmaSRGdSA/ufSnxaw==
X-CSE-MsgGUID: uNCRpzJ7RkCJUv0VsyQUHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84163909"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84163909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:51 -0700
X-CSE-ConnectionGUID: rrqUsHMqQtyzo3fSYzLxAw==
X-CSE-MsgGUID: 4G5bLmotRuO9VtkDRwTScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248221661"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: corentin.chary@gmail.com, denis.benato@linux.dev, hansg@kernel.org, 
 linux-kernel@vger.kernel.org, luke@ljones.dev, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260707213741.6515-1-scardracs@disroot.org>
References: <20260707213741.6515-1-scardracs@disroot.org>
Subject: Re: [PATCH v4 0/2] platform/x86: asus-armoury: fix init errors and
 modernize resource management
Message-Id: <178360438275.12613.6796947686719643747.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:39:42 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 07 Jul 2026 23:36:10 +0200, Marco Scardovi wrote:

> This patch series addresses a Use-After-Free vulnerability and a memory
> leak during driver initialization in the asus-armoury driver, and
> modernizes its memory management.
> 
> Patch 1 fixes the UAF and memory leak by propagating the error code
> from init_rog_tunables(), deferring the global pointer updates, and
> adding a rollback path.
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
[1/2] platform/x86: asus-armoury: fix Use-After-Free and memory leak in driver init
      commit: 5948b235891fb699b9cb8bd7475b1f17ec3e1b96
[2/2] platform/x86: asus-armoury: use cleanup.h to manage tunables
      commit: 55a3149ce66a0ada5ecaff17961c1a3ca3e95498

--
 i.

