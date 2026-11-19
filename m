Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104229;
	b=xYscKUcnFDg7xelCR7oHOSYssIxl1RtIgvWDPn3OOcPYb3oWQtLYFi35J+RwIhUnxENG
	 AdkQ5wn6Npv8xASvjlNz+KGJ0uDaLyFgmrGmNpBNGqkKppGDMONo4zU6FaxPe0mYsQik0
	 w5gF2p/Z/W4Q8g2gs3YZblGt1mUWmqNHDvdxqN6wDb3LCj5J+EqR2Tis05MWBTPHsl/St
	 kHcvkcMVnPJ6BkphVPLgwv078ZjeHYWgZAdBKXr260o2AzOMkX2V1WBVrPQDMCuGlUMJZ
	 4APYDLTVDQhrC0wcDueGxvRiFmwLUsCo7NTIAxEpfejOK3F76FXV8pDT9JGwR+keEZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104229;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=QOuzj+z8utBFlnRSPVkUVTBzO95U31y2jLr8E8O/k0U=;
	b=KJf06NB2LW7t2/2aoPNXJB7IvcL4TDfGSopDLLxhx0O7gF7RtTTogb2skABXHLddoC8i
	 xlJYI1h7GQWkfIGvfK8SP+p1lM8P20AJ9aOEYqd0RnFLDIf1AfUq2U0YbEp+86SbNv42m
	 GpjliGUZf5Evs/4PQUdvQbaRLESXI2vhLfzTv2y1bxqvegUiZQ1x7fp+/FOMwaM68ZNAL
	 ahZs7YxVowmsdudspX5IuhVRHxnN14b4vh9icFGrkHe6nPxIgcPN99vnDS/iWjayOtJAH
	 OLx6Ghg7wcswEXUNdhyWh3gelxJ+oQtfs02v3QsehDF/HG1H3QEZBtuDZgR65MvT0Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoJAaaoj;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22A606A324;
	Thu, 19 Nov 2026 16:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD22A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoJAaaoj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104230; x=1826640230;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=9Lf/tTYzHClkUeNLDJ4n7y9qmJkc9EAZ96XQu7JCnI0=;
  b=WoJAaaoj2ttQSMtpvP3LBeA4aGXDWOU+ItVx+fIaC9G8MtVVwxdXlFck
   melBeWHfVRcQvmcktgAk8/oZjsdghMog/qqRTMFbbySNtCaFChPCOwxbR
   XQxUL3ATzh8aYznVIYZJoT6ykB96jXCY5Cq+VfleOMMT+qqnJsKGPCHxG
   dVJ37lRNB09biq6jmcjd1sFuEBroQmx40DvEAV+zKuGKxqcQ3KWpnofi0
   23IX/SvEqq9AHN2Dzd3lBaHzjFVa+3bDJyECAr25rFG28cCeqvH6gSBQe
   guhJVUUvSvGv3YMIDAxxkCAoLMMBfX0T08bq7RaRAQEH+nzawc6MHd+pR
   A==;
X-CSE-ConnectionGUID: zkqdc+yARdyafNgO21w5NQ==
X-CSE-MsgGUID: Y1SXgOqBSSWn9SKNTTDP6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3989030"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3989030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:26 -0800
X-CSE-ConnectionGUID: sBX4973jRXCORvaaZLf22Q==
X-CSE-MsgGUID: veSuqoMlRpG1NsbW5QckWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10495892"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Matias Civadda <matias.civadda2342001@gmail.com>
Cc: linux-kernel@vger.kernel.org, qby140326@gmail.com, 
 ilya.gladyshev@linux.dev, hansg@kernel.org, chris@miget.com
In-Reply-To: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
References: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
Subject: Re: [PATCH v4] platform/x86: bitland-mifs-wmi: Fix TM2107 profile
 handling
Message-Id: <179510419645.21358.2342589352287102745.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:03:16 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 22 Oct 2026 12:02:21 -0300, Matias Civadda wrote:

> The TIMI Redmi Book Pro 14 2022 (TM2107) stores the MIFS WMI return
> code at the end of the response and uses different profile values:
> 0 for performance, 1 for balanced and 2 for low power.
> 
> Add a DMI entry using the existing quirks infrastructure to select
> the correct response layout and profile mapping.
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
[1/1] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
      commit: 0853bc44d92baaf34e3e23e3fce69d866276b727

--
 i.

