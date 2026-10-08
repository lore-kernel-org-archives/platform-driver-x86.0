Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C23B0AF3;
	Thu,  8 Oct 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481110; cv=none; b=nV9e2MWFRoKQnH5hxcPbdrq+po6mHW5oWBsEmJw23VJphOLgv5h5B7T8J/48qcFLi1obSPa9Sx6Ynn/0SjMIuSTNPPTmcIE/Qmr++VwJw9AH8bEGoH2Ne2jYOt6Fft7LPQuh/cPMHZ8YCvYtNlxgggjfWMGdO1zTvbpgj1JbpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481110; c=relaxed/simple;
	bh=iYdtJDr2Sf6ihcrwuTpipaHuJynaC5bwvtQsh5THI5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FOjtTIqVtIUXENEaJfdxJhevEjSP582veY7x2zHrxm971OJO5xcWDt9KpiPjiXLt//iubG3oGYemwxPWfMozcYDhHxNb/7MBYTW7NJLWS+S1EGlQmlWDodRHDmtdzG/qWF2MH6td3IVfqx9LDiNupYhB+Qa0oW11vrm/a88DMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODZ+pE4K; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODZ+pE4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481109; x=1823017109;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=iYdtJDr2Sf6ihcrwuTpipaHuJynaC5bwvtQsh5THI5c=;
  b=ODZ+pE4Kp+qNe85V4OU+hjNOOvWKhK1Qp+TwubPMw7lY6vR4qhaqmXGb
   7Y9t0qVysMkSxYBIkBvu90QI1I55CaaDLXVNL2zLh1FiA2DiZbWbNJTrt
   sF9k9W7wYj9uYE6L59AE5eEIN6pAmzw4mPXCUW0RUWqCks6bKf09/6qTH
   6xqOe8RDLm5aAF/cBZuBJWWiHCQ8+AHWGDSnwddODyUbreJX7MRAfK0a5
   7RHU8X6U7QXTA/OnRRzmk9E3fLDyMWYXIStLKFBZa9SutsvSUTl83MHy/
   WKSKrV21LoIgpTvGsn80Wa3Y9Spl5R4h6ctEsZl6uQopDJRZU4Wdljxg3
   w==;
X-CSE-ConnectionGUID: C0LWrYdXTPWIMf7qDhcDcg==
X-CSE-MsgGUID: N9+3zaaYQuiN2PtxFM1DbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="279909"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="279909"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:29 -0700
X-CSE-ConnectionGUID: RLZ3cDlzRLqjvLlOv7Bytw==
X-CSE-MsgGUID: toVSHJF1TY2rvbUFIL9zKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1919364"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Mohamed Jouini <amad3v@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>, 
 Christoffer Sandberg <cs@tuxedo.de>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008135624.3520849-1-amad3v@gmail.com>
References: <20261008135624.3520849-1-amad3v@gmail.com>
Subject: Re: [PATCH v3 0/2] platform/x86: uniwill-laptop: Support the
 PCSpecialist Recoil 16 AMD
Message-Id: <179148109756.29028.6683547170564854080.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:38:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 08 Oct 2026 14:56:22 +0100, Mohamed Jouini wrote:

> The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
> (board X6FR57TY), which the driver does not match today because of the
> different DMI vendor and board name.
> 
> Patch 1 adds it with the existing Stellaris 16 Gen7 AMD feature set.
> Patch 2 maps the "Sc" key (WMI event 0xD0) to KEY_ROTATE_DISPLAY.
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
[1/2] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
      commit: 99ee4a2405fafe9636cb1c834cc3753ef5705041
[2/2] platform/x86: uniwill-laptop: Map the screen rotation key
      commit: 37dcbefbcf314ab032ee6bb7f7363c1de5e886a7

--
 i.

