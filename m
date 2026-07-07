Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512443784E;
	Tue,  7 Jul 2026 17:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444140; cv=none; b=hYK8N+oEMjazSz8oyw/2VaA652ixl+ZMgyhzIrtoHxXhonzmOqD+lFQX50hh7LwjClfebKjgrbGyhF+24pHM0qglwxN8gdRXSnDo0siyNyftn9BrDsrWX5YSqsPldy0SP3sexbnm/4pordMwI5upSipXj3BnPoVoXbXICmNuwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444140; c=relaxed/simple;
	bh=qDAADnzt+HZLQLuL8BxuEk62Qqnq0nXqoVCRAiPFzFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=az2ZnW3agI17ghj70ynBnPePlHG5huUa8nm7kbcSoq7tUML8oQfWoLAMuv/GMbffFd739EWmwQrXZoZ5yxrvqNIM+ZOTXcvdUgzE5+CSRiOBqgLBEiVtiyANPi7om3wrrAskgqqCmkF+Vq44WhM7SbNCVXqu+opgakJUH6ZVeIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4M6+kDY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4M6+kDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783444140; x=1814980140;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=qDAADnzt+HZLQLuL8BxuEk62Qqnq0nXqoVCRAiPFzFs=;
  b=Y4M6+kDYd7Vi6jjtVXlCmPx3WTaZHBmpuBCklho9fZmp3uNIJ0a7RsC5
   uj4oIuQqayk9T96TgiRMs/lK6NQS8ADUzgxay7ErvcN1b5rPc4/Aro86Y
   MAqs44kg+hkjPZR5+j8A8InDjlqbuQ97L1eAej12XQR+T34FDxT/hEqwu
   0jEvmNSDGWmz4yq/jQL2tGV4LQhHXXrElEn6dMYa7ck+lQYCA3Sx7WfZl
   qwxB5N16uGKoVWewMYxqsHaqevWtPwHN5Zc8ZtqSHcD6sN6BvgPb3zWuC
   Dm511Tt+V4Fz78zMgmwkReWQspvw7MwUBYGMjjTreQzxhO8kKin+zZMde
   Q==;
X-CSE-ConnectionGUID: XoFBuqoaT0GoCTnSIEEuow==
X-CSE-MsgGUID: /5tOwIPgRGieqWXAR1Yw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84190554"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84190554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:09:00 -0700
X-CSE-ConnectionGUID: eOnKnwg3TcGB2UiiyJEeWA==
X-CSE-MsgGUID: jAjd+LnyRk63plOEdHyWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257933803"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:08:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Avi Fenesh <aviarchi1994@gmail.com>
Cc: "Luke D . Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260621130204.103566-1-aviarchi1994@gmail.com>
References: <20260621130204.103566-1-aviarchi1994@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-armoury: Add power limits for ROG
 Strix SCAR 16 (G635LX)
Message-Id: <178344411255.17784.13104347206735437393.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:08:32 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 21 Jun 2026 16:02:04 +0300, Avi Fenesh wrote:

> Add the AC and DC power limit definitions for the ASUS ROG Strix SCAR 16
> 2025 (G635LX), enabling the nv_tgp, nv_dynamic_boost and ppt_pl*_* tuning
> attributes on this model. Without an entry in the power_limits table the
> attributes are not exposed (has_valid_limit() returns false) and the
> firmware power knobs cannot be controlled.
> 
> The G635LX ships an NVIDIA RTX 5090 Laptop GPU (150 W base TGP + 25 W
> Dynamic Boost = 175 W max, per the ASUS specification) and an Intel Core
> Ultra 9 275HX, matching the ROG Strix SCAR 18 (G835LW). The limits are
> therefore taken from the G835LW sibling entry and the ASUS specification
> rather than dumped from this board's firmware.
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
[1/1] platform/x86: asus-armoury: Add power limits for ROG Strix SCAR 16 (G635LX)
      commit: 861678dec600ab9e792fdabafefbe62ea855c193

--
 i.

