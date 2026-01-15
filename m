Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B83A1E6E
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jan 2026 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487233; cv=none; b=tOvBu09YQqY3SQtUkzwaQfOAiwvS07tXHw5b2bGBXllkGG11VW1yFfrBbrja3EBriCUK1H34wERDaMQCuSmUqAWkoqQ6BCWYhkMpogA7dy48JO8/wa/wx9ZHbagSawBgrYdTUwkQDMpGigNllDEnOcJp1CmDQQxr0XxV9Kjyogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487233; c=relaxed/simple;
	bh=eNzYT78k9OxTK1QtPhNU/Eh8jVuzqv3NF3+4p3bkaOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rEPFE6u1BrLhKKHduNNhN0sH/EpBOEITG/8nQBY5b3dKkcgRoUkaHC4kgGrb/gUQJw8c9g4IXfpOiOdnLq6PzEnbq/C/HACtz3wUQDzlCxtdeKWgUZQzoGgRDXWoggp5MCP36vAst78FKntzsG1oREzrC2nvA8jVsXkpTS7Ec50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fA5Oherh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fA5Oherh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768487232; x=1800023232;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=eNzYT78k9OxTK1QtPhNU/Eh8jVuzqv3NF3+4p3bkaOc=;
  b=fA5OherhP+GQRxabSnXteR7WDvoFruueZMHmcJbtfkPRA/AI+rnymVNX
   rE0MXezGSgF/gaLYk50TljNgKDse8reVBstxSrg86nnxECPnXAjSWEbTv
   2XhN96g0xDD6s8DRHEE6w/lrkXz7vY5Fz/1rB5/t4018V0Ro8vEEy8RnP
   jt4cDyl9tQZQ7XHJZWfVsMVGnFveS+eEul2PgrpMbmPyUlkJnuSZ7WofP
   Y0xpIVyBAcaD35PPErAUXHJqT9PWXWIzD6Gjbysd3F+Hrx65chmWRkiDZ
   oZBtiH9dwnpCd11v5a8kTISKA7mUuVJv3pwSoTT0hSi4pVbTQK1LBTiut
   g==;
X-CSE-ConnectionGUID: JSjc3rsTR3SoQwSUT3cFhQ==
X-CSE-MsgGUID: Ct6DCxuxSW+t2w6uKVN3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80095733"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80095733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:12 -0800
X-CSE-ConnectionGUID: Lo6m0DAKQPCyq+8RAr/LRQ==
X-CSE-MsgGUID: eUtzizFvT8iUJxeN7RgQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205244723"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Oleksandr Shamray <oleksandrs@nvidia.com>
Cc: vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260107142548.916556-1-oleksandrs@nvidia.com>
References: <20260107142548.916556-1-oleksandrs@nvidia.com>
Subject: Re: [PATCH 1/1] platform/mellanox: Fix SN5640/SN5610 LED platform
 data
Message-Id: <176848721690.21830.6432691451888200860.b4-ty@linux.intel.com>
Date: Thu, 15 Jan 2026 16:26:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 07 Jan 2026 16:25:48 +0200, Oleksandr Shamray wrote:

> In SN5640/SN5610 platforms should be used XDR style LED data with
> predefined slot index per led_fan.
> 
> Fixes: 317bbe169c46 ("platform: mellanox: mlx-platform: Add support for new Nvidia system")
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: Fix SN5640/SN5610 LED platform data
      commit: 3113bcf4ccf06c938f0bc0c34cf6efe03278badc

--
 i.

