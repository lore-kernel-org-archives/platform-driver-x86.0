Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763573C1994;
	Fri,  3 Jul 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083524; cv=none; b=a3pasIio5WU9SR48HK7NruiUTejeDyj3xZCudAwUZotvQtPaW5OL3e801kujKrbzAYJ94tnX70wyNB0pWLeEAfxuYS4+4DOqDXPZqvcHrwpFI1ZoHg3c0C1KSZiMwCfz8b+tqiCrTHliOyTs4nYcteAI9iPiJYWsujGsfhQuqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083524; c=relaxed/simple;
	bh=DtEyGXKlFNP5BWMxJvTMcrJFtCXJTu/ND80FvswJwDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SYR4L7kzRL9dlw5uxEtwUITlwMWqX5r6lGuSPbYQYCpc0junqwCjHZCyhZIbbsNMKZoI1PkhwJ1D9cswn39yrySy6E0daN1agBJb3fm0XP6bk4AtIkzb/TYuJqtTBRafFF1R0f6wJsBteHBitxTG7Qle8uEkUXhQ5XiFH26Gg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2MLRJSO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2MLRJSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783083524; x=1814619524;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=DtEyGXKlFNP5BWMxJvTMcrJFtCXJTu/ND80FvswJwDA=;
  b=G2MLRJSO9KXRpoOplFoBnIgPzZOg882Ph/fv9lyO4kd5pXCJvIO8w/B2
   LjFyLJ1YLWaUwENO0alTcpQWtSWJmnvuBRvC6Mk2Y3IjS1a6mSpWx4vPl
   6bII3LVpgdIxp01GdFytudWMkrhOWUkrNTp72anhV90E5rVolleILmxcV
   MX9IfvgO4wnb3px3gcWwayzSuKKUMgwrDPkgF9MHA0sF588aCa8ZadBrg
   fRqIy4R0AkgvZSr0d4Iz65fU+Wn/nsIBNguRNDA1UKmBVwXq0rhdKRQ2X
   V3p9JXEn6uRDd9MJXe2Td9Gb95BPMnQykpjIx2c4VISCdqNvvXEGa/ufK
   A==;
X-CSE-ConnectionGUID: +/Rn2XRcRZywSGAvCds5kg==
X-CSE-MsgGUID: o5WN8CDFTo6cjmFUSwcSiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83701833"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83701833"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:58:44 -0700
X-CSE-ConnectionGUID: OhxHznAvQF23MnBnvU+TSw==
X-CSE-MsgGUID: +Li3Nsk9SJ6FT48oCmtybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283197828"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:58:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260629155634.1807598-1-muralidhara.mk@amd.com>
References: <20260629155634.1807598-1-muralidhara.mk@amd.com>
Subject: Re: [PATCH v2 0/4] platform/x86/amd/hsmp: ACPI input hardening and
 data-plane readiness gating
Message-Id: <178308351675.10297.1477222544091828879.b4-ty@b4>
Date: Fri, 03 Jul 2026 15:58:36 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 29 Jun 2026 21:26:30 +0530, Muralidhara M K wrote:

> This series hardens the AMD HSMP ACPI driver against malformed firmware
> and fixes a data-plane readiness race on multi-socket systems.  It is
> split out and reworked from the larger HSMP concurrency series.
> 
> Patches 1-2 validate ACPI input before it is used:
> 
>   - hsmp_get_uid() passed the device UID straight to kstrtou16(uid + 2)
>     without checking it; a NULL or too-short UID could dereference NULL
>     or read past the end of the string.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/4] platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
      commit: f820f61f079ad50869cee6541bbb6423f88536b7
[2/4] platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
      commit: 1cacf5e8693dd1053d9044b6e6e4986bbbd355a1
[3/4] platform/x86/amd/hsmp: Pass struct device explicitly to ACPI mailbox parsers
      commit: 0c963c5b4d68922f6fa2c120fde7a4fecc0ab46d
[4/4] platform/x86/amd/hsmp: Gate the data plane on a fully initialized socket
      commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7

--
 i.

