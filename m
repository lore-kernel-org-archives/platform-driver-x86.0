Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF63264C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816757; cv=none; b=JMTdKZjp1SQ6zt/t/RdSUc9kgns/JqnNT2xEVX0e5X0yo0EmNWGAC5SCcknRGNVX4r4LduS6jWbx3Kw9o/naIU9t9cPLqIDsDy6d/HJX9NrRDnD68+/c8n8/IxjZle3a/U12IixASm/p+MKbO6nJK3XlABl/JXNwzFNYCS1QJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816757; c=relaxed/simple;
	bh=QGgHadTttsHGiLr7yIlBSgRbC5FgFEV0Ic9vjGb2vWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fUcRL995PZO+SSVyioBSPLlGmTWzT9UAOKgdgz6wAIZDA+JXV/1Cdb9lJJ4BfxA8n84SkCRU+JOrm1MjGk5bYfcYoiBJS5vK+0TNFnQR7bcj7exArwHUaXb5kTCgnP9PjNOMXKpo2lVQdXtlMSzG64iZdZdb00ExlkfI1gUOlWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMM6FdN/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMM6FdN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779816756; x=1811352756;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=QGgHadTttsHGiLr7yIlBSgRbC5FgFEV0Ic9vjGb2vWU=;
  b=cMM6FdN/U9U8/R2ZuOTJkuswYxJKUnhjtcLatBOVvX2doRwDd9iDVgIw
   is95oz99tiKL6S7klJ2DWgITzpa56MEVfi6ITcAM37P+19xL4/ebMhXwz
   t2mXMZerE7kzcxynUJp9t1Z0vGWcRJplgXAAt5Ib4MNO7ZTMGni4eTs7R
   A5ntbvcq0jv8rmFHbPCb0CEryPTqav/7LgFE6Ij8KQujzEKBm+GS+JhNh
   tiMbkA6wmoxXXGfxYikv1pSAQSYcS9hyAj0gvjRhsFnFDt3i1ji+cyech
   +y/eTaqhqggiO0EOtPuzQHBn/VuBHxjBLZXsyJLN27WB9Qdizj4jSBSvc
   A==;
X-CSE-ConnectionGUID: gqrvfGLmQ8ir9N+iA2W+iw==
X-CSE-MsgGUID: bdM+BoIPTQOgvsO6+G73TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91330753"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91330753"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:32:35 -0700
X-CSE-ConnectionGUID: iaM27qK0RvuuTle4JeIgtw==
X-CSE-MsgGUID: yi5V+u2HQbiUByJPeOgwlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="265597060"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:32:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Alexander Egorov <begeebe@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ps1x <ps1x@users.noreply.github.com>
In-Reply-To: <20260406102531.896524-1-begeebe@gmail.com>
References: <20260329215348.56185-1-begeebe@gmail.com>
 <20260406102531.896524-1-begeebe@gmail.com>
Subject: Re: [PATCH v3] Remove outdated upstream contact note
Message-Id: <177981674787.9008.8711694802076628683.b4-ty@linux.intel.com>
Date: Tue, 26 May 2026 20:32:27 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 06 Apr 2026 13:25:21 +0300, Alexander Egorov wrote:

> 



Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] Remove outdated upstream contact note
      (no commit info)
[1/1] platform/x86: oxpec: add support for OneXPlayer Super X
      commit: 51be655c307a3e6c8bce16f01c51393eea2d23c2

--
 i.

