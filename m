Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEFE4C7532;
	Mon,  5 Oct 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214681; cv=none; b=iRMRCY+zdK82vQZWfEj4UvHp30KXfR3KRgJeOOBf9u5EqYK0NZ2a8itEm7SWZtmmrCxdY2aznmJmU9tTHrvNO0fLAeXeeZDL1xkhUASN3OisrYT+nYX+NEAlglu5fuT3zBNskx7tukws8oZ0ChqwF9x2b6ymCqAbJcQLKQoENOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214681; c=relaxed/simple;
	bh=+WvFhpqRiKvcYO97tZpxymyw7PIIautgwXMRaKbd3n8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uTqWnUEkHwC5h1NGplm1DMu4oc1aUDl8iMuqxrrNBnOkP53WARAIoImVyZ2+Te+H4gjfg6LLX0Gap6qJfrAwZKG0QRwkOmWb+4HMHdzLKTh9mPGMwt3Ez+u3EajqA4kOg843pMzmuzZaI9ed+abT5b51iV9B8YT6EXKl+3K15eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmVXNel7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmVXNel7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791214680; x=1822750680;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+WvFhpqRiKvcYO97tZpxymyw7PIIautgwXMRaKbd3n8=;
  b=mmVXNel71mH+lS38rzRnRn9fWX2Nci+1VfyzO/CX82x6Ej+unLRlKDeF
   xBolDm8v8tmROHRwgo1vYbHAXgjbU5Pv8ud/riBJS7YRPeC2ON7ldkVUS
   o5JmnmMnK8s2vUpmO71BhBuNGt4bpa8abSP/A7np00N8lWOsUrDGTcLme
   9LYGxNr8+ml22hjwlnLfIFOE9jp2eUZG8hNupH1NJ4lgI7PgKim6mTIb1
   sf7aNif+mk+WYIDmBQqJYZ0cwvRwz/IYoBhvoMu0GOK6eDm0Nu2L5cHsa
   yEDm8N1zFRJw54YCzPTmZ6czUhYC2CdHMDJrnSmp4epDnAusds89e2Cfj
   A==;
X-CSE-ConnectionGUID: ILBIbN2zTYOnRSWBss8OHg==
X-CSE-MsgGUID: KfawKPyeQCm7kko2fTy1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101211673"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="101211673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:37:59 -0700
X-CSE-ConnectionGUID: jm9p3RDJSgqRe4im5MZ3bQ==
X-CSE-MsgGUID: I51VUttDSaCK1VtsEcN7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276956585"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:37:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Azael Avalos <coproscefalo@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260731150010.1025556-1-ekffu200098@gmail.com>
References: <20260731150010.1025556-1-ekffu200098@gmail.com>
Subject: Re: [PATCH v2] platform/x86: toshiba_haps: Remove unnecessary ret
 in toshiba_haps_resume()
Message-Id: <179121467272.12659.14329900499904552383.b4-ty@b4>
Date: Mon, 05 Oct 2026 18:37:52 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 01 Aug 2026 00:00:07 +0900, Sang-Heon Jeon wrote:

> The return value of toshiba_haps_protection_level() is ignored because
> ret is immediately overwritten by the toshiba_haps_reset_protection()
> call.
> 
> And ret is only used by the check, which has no effect because both
> branches return the same value. So remove the check and ret, and
> return the value directly.
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
[1/1] platform/x86: toshiba_haps: Remove unnecessary ret in toshiba_haps_resume()
      commit: a3d87f9f5408c137895667475ac730bbae829360

--
 i.

