Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6623EA89;
	Mon, 26 Jan 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437831; cv=none; b=PpwxtzN/cMqLLBV32Da+GqWZmvgV770P2IN3h6FQC7TwiriV1B0E6U77MM6Ep1rhCJN0RRyUDSltWEfwGidX51h/SKEbm3QM5iZgyYTiXmV9gIluzn2z9GcqU8Wr8u5sBnnQ2Y+k6Fp/9mRUN7xNAVX7DrIqGA0qu7QD/56FjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437831; c=relaxed/simple;
	bh=30SP3r3V5UqOlc64/JxOMHpyp/CaqJ/doaABm8W22lY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PPz3S+Lsq6FJ4Io7sQUTfVex2EoUB9tVcONitOLvXHqqvR6sTdoxwDEjkbnbMccXXJaCiFByK7Si4wXtmG5Cqyt1YtsqW7NT0GT/dsgOG+2RB7hBdJyGlwjynwFt0R2HoX8FZPI9DDVb4HD8PhniQ0zNs7iLdBPKLdOT9itas+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEtktAd3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEtktAd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437830; x=1800973830;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=30SP3r3V5UqOlc64/JxOMHpyp/CaqJ/doaABm8W22lY=;
  b=QEtktAd32ObMoc40sNS6JqkmcnfIa0tzqBlhu4tNXIXncQ934H0zZYy5
   GaGhNaWluBhGxOKGYbZfiYqD5bACQ1V7l4z0WwyY8AQHy88OxFyAk3VFG
   f/uAv5uUMAm8Y//ZdnXeCgY40e1QfuXgHp96yE/XTnIOsNyDS6SdMshb9
   HYY8gu0VzVPmJbprDDe3xp9CPTZPT/RWL8JSkYl2tjUqb5SwIVvCNym4F
   xHC1nfiwqQo0f6fDTs8Upg7DXsMlFhmE/XuUFvzXlJ1Y62wl9e0tSNAsY
   b3YznWFjFH/LCfugOEy/htEnByRlJU4Msuw3gVR5eDSf6c+CrySgO0Nz0
   w==;
X-CSE-ConnectionGUID: nejVDYBtQ8yW5XTJfgOjNg==
X-CSE-MsgGUID: RvwCMzpuTDiFxdUTIwk16A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74457876"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="74457876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:30 -0800
X-CSE-ConnectionGUID: sb7kJGt6RReVYG+Ja5Q1Bg==
X-CSE-MsgGUID: kh4drXrETm6t4G6wKMnNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207748628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: nathan@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260123211537.4448-1-W_Armin@gmx.de>
References: <20260123211537.4448-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/wmi: string-kunit: Add missing oversized
 string test case
Message-Id: <176943782325.10029.7973089336343143093.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:30:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 23 Jan 2026 22:15:37 +0100, Armin Wolf wrote:

> When compiling the WMI string kunit tests using llvm, the compiler
> will issue a warning about "oversized_test_utf8_string" being unused.
> This happens because the test case that was supposed to use said
> variable was accidentally omitted when adding the kunit tests.
> 
> Fix this by adding the aforementioned test case.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/wmi: string-kunit: Add missing oversized string test case
      commit: 5d4ae0bffb6eeada6dd16ba52150457ae96c3725

--
 i.

