Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01862155757;
	Mon, 26 Jan 2026 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439426; cv=none; b=o9eRmC491P3g+FEMzYDaJGNgDh4wYzjb2KZy9LSB/A5ZPq6vxLhHVQF08jLg1GI7tgb+lGDTana0ba1mDEkenrzPTdvI/IUuyNCv/fC4bAfgFbrLBjY0XH7Fcpun4T2Ee2yw9W+m5t2N1DFq+wT7vzcFN3Mkroih426hQ7WTbos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439426; c=relaxed/simple;
	bh=1DW4MHZA/R670yXobGmTfLhfuZe7Y2lPBeO3TUWxyYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T9Y+phVKeI7QIqrOgIMyYa5e4G97Cj93LO74VBp8/ZZDbI3X9Zo4EJaBSuSm65gJIWHUBLgfYD1RH46iE6U0dWdd03W2lKNt4lzPB5N51hcPFwn9VfarGobdJqJFbj053qYx+f1zvrTNrRQDps0FFTgY/SKL4PNiCbJ32Wh5GXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIkGZ/cv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIkGZ/cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769439425; x=1800975425;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=1DW4MHZA/R670yXobGmTfLhfuZe7Y2lPBeO3TUWxyYI=;
  b=XIkGZ/cvepD+NN7+FyKuRRdrdyZ6k+ZvWUQc9W6M/ML/Jx1dsHJDUs1+
   GxoNcfCYY4nq5dLFlw5REz/gg2I62BYHmscCA+PFkAr8DKCBi/F7LuoJX
   urhO2LLLZvQOaSk2ye3naLmrX3nJIuQTJN+M4dr5Y7xTY3dFkZ4yDf0Vc
   kvqZtvcAamf9QDya7avdsiIZzfa78LXrJDiy2ygjPaivQYEK6+APeON8T
   vksHr972CB2Gbug4IzORqCx33W5EBoQcjk6PsfFv9mbU4Vtv4S4FhF2OH
   PMr+GovmFdrcipTsNl2dhHTg15Dluwaar9NH9PfnwqzMPsZhOaAyTL7Py
   Q==;
X-CSE-ConnectionGUID: DEc/1jLRSJaHQtEafP2MRw==
X-CSE-MsgGUID: 6qHxhq+JQzeIjt+NWdsQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70584635"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70584635"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:57:04 -0800
X-CSE-ConnectionGUID: OFG/43+gQ2egnuE/zCv8FQ==
X-CSE-MsgGUID: QkO/UBiUQBqxRLozNFKlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212166327"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:57:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: david.e.box@linux.intel.com, hansg@kernel.org, 
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Cc: platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251224032053.3915900-1-kaushlendra.kumar@intel.com>
References: <20251224032053.3915900-1-kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] platform/x86: intel_telemetry: Fix swapped arrays in
 PSS output
Message-Id: <176943941795.16098.16351611399994603049.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:56:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 24 Dec 2025 08:50:53 +0530, Kaushlendra Kumar wrote:

> The LTR blocking statistics and wakeup event counters are incorrectly
> cross-referenced during debugfs output rendering. The code populates
> pss_ltr_blkd[] with LTR blocking data and pss_s0ix_wakeup[] with wakeup
> data, but the display loops reference the wrong arrays.
> 
> This causes the "LTR Blocking Status" section to print wakeup events
> and the "Wakes Status" section to print LTR blockers, misleading power
> management analysis and S0ix residency debugging.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel_telemetry: Fix swapped arrays in PSS output
      commit: 25e9e322d2ab5c03602eff4fbf4f7c40019d8de2

--
 i.

