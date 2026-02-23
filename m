Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76147312829;
	Mon, 23 Feb 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864503; cv=none; b=NCMBnl7D3ddqasq5Yj+2KSO3XzLN1xo0juDW8FrpWtjNCpN5RI4FBvu6U7WnpEBO94W65ihj7VJ5gpOl/msJRJ6s+NZELP0noYbUuhiBiLpMTE/0UIVA/nQqs/nXzn9vlKCqd8Oksu4+cA5UnmHcNN48ogniXzQR/FDP914AuM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864503; c=relaxed/simple;
	bh=+QXIBfgzHIWmpSF1ZiqZ0tQdtXVDPAv9XGqmo7q04co=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TuIUJaVaHHvM+WV7FZYACwTFgSYo95kjDtVpVsjXLfZXQRUcYhTwHDY2cd0FWHisp6s7NXZ5le2r84kTovDhNI4nvVfb0JCHgmx00cfXYq+p/jiw5AR94Fomofd1sHTcA9rOd2nScVdCmMR2bMxKrbiPNji6OKtzpz6Iyns6apw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6BuDQLv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6BuDQLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864501; x=1803400501;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+QXIBfgzHIWmpSF1ZiqZ0tQdtXVDPAv9XGqmo7q04co=;
  b=e6BuDQLvl9EANG0fsTZleGw6qyNxkS1EkmPav9MMGuAB40DFwRlKfPt+
   upPCOsjKoyrES+2wA2dAsyac7yUZHPjx7XppDNSSHzpvDPgUXjG58q77s
   Riy4gQ77Tn2eLTJq+GeF0YWkYSAWYChdfeAJcNfbuBD22nHOd/CMFriqa
   DG205BTqcdbpoO0zkO8wKd3nrQ1U5S1MxfEkFKzV3icaQ5/V97p4pmh7a
   73DtgcjxBoJYsKJGUsJGoKat8SXRSb87ZU2jMNGQz50MjPra5eqkYUa5H
   Ab9cGHQW+7jDxRWZ+k+74L+MzJpWJ9aFCl0u2U1pkA1Xtpd5q2zjOXWxo
   g==;
X-CSE-ConnectionGUID: ISgyEEGgR/OYBw9t2zXvmw==
X-CSE-MsgGUID: 14FqAkvZSqKwENHKCygj5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84315851"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="84315851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:35:01 -0800
X-CSE-ConnectionGUID: SSPJYTD+T+WPOl+UDoQ3/w==
X-CSE-MsgGUID: 6NGc23CiSoyJuzkrtncAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220163290"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Anton Plotnikov <plotnikovanton@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260203164832.40514-1-plotnikovanton@gmail.com>
References: <20260203164832.40514-1-plotnikovanton@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add Omen 14-fb1xxx (board 8E41)
 support
Message-Id: <177186449286.17917.4214250076194289272.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 03 Feb 2026 18:48:32 +0200, Anton Plotnikov wrote:

> Reverse engineering of the HP Omen Windows utility shows that for performance
> mode it uses the same codes listed in hp_thermal_profile_omen_v1. Therefore it
> seems sufficient to add the board model name to omen_thermal_profile_boards.
> 
> Tested on Omen 14-fb1xxx: CPU power in performance profile reaches the Windows
> limit (65W), instead of 45W in automatic BIOS mode. Max fan speed was reached
> as well.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: add Omen 14-fb1xxx (board 8E41) support
      commit: 729ffcffa73069cb066fd54a2bc7b09e5f782d48

--
 i.

