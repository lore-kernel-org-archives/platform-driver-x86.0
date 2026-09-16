Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577B84EE85E;
	Wed, 16 Sep 2026 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555236; cv=none; b=ZYS9AKoH3i7klE8vGCJjTm4I7qNaFC2tClWJDIcHQmJumj1cqHx0T9iXwT6GB5oXh7BA/4lijIqUIVKDxfiHnccPPfRceWz/Z8Mu0qiwrGyn7+PndbhGGZx2AY5p1XqwK5Aph6zbs5g2JHYr/RNa9aMsJQLv+PdzrxRMhVWhgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555236; c=relaxed/simple;
	bh=cyBgzkiDkuEa1lPgP4i0Xh1sLAaQLCUN2TiL7hwEUEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kv9UfCTCuWq9qu/bfnGHQxpAPoskcy8Bv1zH0A+KPMq+dqdWRgMm3uulgUX2L39rN43bT8ygbdFSuWjJMtmpVkoUClHW08VsxHGIuBFz0eHcp6lzHw+IgxQDyEWHRn5Vfj6pSVcKThDMSRpUoM1Rrbme/btp47vkeOBt3nupDyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4iD+4o+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4iD+4o+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789555221; x=1821091221;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=cyBgzkiDkuEa1lPgP4i0Xh1sLAaQLCUN2TiL7hwEUEU=;
  b=f4iD+4o+xMsLtN60TRAukz0DaluMKQVoRjTi/PrY95MtCtMTKnKpJL+H
   roohsyVLscZXG61Darx6dEeOwdkFBd30+8l1yqNQzmM7g4zmto+/HJVmZ
   S99TBtHjCXQgu4/k69FCvbIRwFc10+Z9izRPxtCnti0cVB9fGeFzQYcTZ
   wIzlXRF/Y5fAWo2qPEOBzgr9gZC0maQoEUjwXLxgZdWkMPe6MNJ5K1iDI
   LT9uVLnI0BAAvf+nuSDoM2MH5GKNU0Uslsrh22u+iFsNfuxG6R0lLIgHg
   esNvDwYCEg3oaTK6Ppz2BlG4dyrSbUeGJZmo5cIXaFR7PxOItijV6wCPf
   Q==;
X-CSE-ConnectionGUID: sg2F96/qRLOT05FQrxGt+w==
X-CSE-MsgGUID: WGvd0gDLQxiS2nqOaPpFrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93800314"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93800314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:40:13 -0700
X-CSE-ConnectionGUID: N49HqL73SguYA9G2ydMjEA==
X-CSE-MsgGUID: PyT8FfHNRXivrAI7PQLxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311586309"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:40:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260916054942.2054730-1-rdunlap@infradead.org>
References: <20260916054942.2054730-1-rdunlap@infradead.org>
Subject: Re: [PATCH] docs: TPMI: use literal block for commands
Message-Id: <178955520546.1900.16871379298287316660.b4-ty@b4>
Date: Wed, 16 Sep 2026 13:40:05 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 15 Sep 2026 22:49:41 -0700, Randy Dunlap wrote:

> Use a literal block for 'echo' commands to separate them from
> the surrounding text. Otherwise the lines run together, without any
> clear break before or after the commands.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] docs: TPMI: use literal block for commands
      commit: db1d44f20e3858c85fa8bf55ced0e833ecf26034

--
 i.

