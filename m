Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4627453;
	Tue, 24 Mar 2026 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373470; cv=none; b=pniJlXcHm3YUGWUG3E2sBW/Z/k/eLR57eqAGMVl1W391U2rMM8VyVtMacxbKPn23J3FpRZMUJDfg+9PoYpsmA1rBhuDEDivFJOEjK6vpmDZvmMUuT6XoiGTVgb/AcTGHQjsfKfFJ+HI2RYQExVAbkpuZmXUz6ZbZvUGVmY/ZzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373470; c=relaxed/simple;
	bh=8mOuTuo6vIZupQb/91fibCJ8HkU3SOaSRnuuBXRMTAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uOStMt+Oo4y7k0lyXcoVMal+E3OMHCl1aY94e9bp4snPRMf3Xoc3pmBu3tBtLS9WoBE2syepThBh6/Jp7SQo4LAnfSS/d4fToU2RTLKaUuv6JLlRdVuRzKihNFphjiFd/xPmq2kFgereWsi7svJ6b5GTmDujh+ya0f1mbNOtEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+lhPnQh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+lhPnQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774373469; x=1805909469;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8mOuTuo6vIZupQb/91fibCJ8HkU3SOaSRnuuBXRMTAA=;
  b=Z+lhPnQhCulURcKH7Fe+wMLDDeMovYCk1MCu72nGi7Mng8CUPf/emhdK
   wmAvC270NXXVMPaFY6vW+BghgaUUhC6Dn/7SSTBmMx3b8bfDZHNMOFfjQ
   GC7asW6H9wxIRXKsNVLjBwNp2CA48nsxu9v5zY7+2NfI3suSkfdJzH99R
   Y/8BBD+CVEdfjiDgOgw8ZrJ0lwzCiz2bdHw0qH1mKfywyILpl2eX58rrz
   LHPwW/MiD+nk7wJwG+y8+XkTVclq+/ftHe/MP1w3AYH6RYX73nbvDp1xQ
   Ptj7nMGA9AES04u4Rzc2cz1KO3ALq8e53fokVtU/vX+jQc13mH/G9wIzj
   A==;
X-CSE-ConnectionGUID: naj5m7wvStWS/1xEGrxpYw==
X-CSE-MsgGUID: oS2+uF/pRPGbcp/7o18eMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100848076"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100848076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:31:07 -0700
X-CSE-ConnectionGUID: pxD5tZ5sRIGMbnR9CNmpwA==
X-CSE-MsgGUID: 6SromckNTnK+aXHF8w++8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219996948"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:31:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 Denis Benato <benato.denis96@gmail.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>
In-Reply-To: <20260304132608.33815-1-denis.benato@linux.dev>
References: <20260304132608.33815-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-wmi: do not enforce a battery
 charge threshold
Message-Id: <177437346005.18408.16065385347677111324.b4-ty@linux.intel.com>
Date: Tue, 24 Mar 2026 19:31:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 04 Mar 2026 14:26:08 +0100, Denis Benato wrote:

> Users are complaining for the battery limit being reset at 100% during
> the boot process while the general consensus appears to not apply
> unsolecited hardware changes, therefore stop resetting the battery
> charge limit at boot and return -ENODATA on charge_end_threshold to
> signal for an unknown limit.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: do not enforce a battery charge threshold
      commit: 186bf9031666602d61b40832181b6b6fdc3ba4dc

--
 i.

