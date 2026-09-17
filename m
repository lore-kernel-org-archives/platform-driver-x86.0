Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51A23393E;
	Thu, 17 Sep 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657452; cv=none; b=F6JVUN7faOF1BfcMKEUOzxv3VKq7TESIp7W3oYDPmctaUBqs+JAIzsJR01U1kWP+2CD3lyLgLpardVamcrj65v0JfcWd3MExTvLPPsJwiixsXfxU3FxTKQn+qtSXlUb5QObQZxaSS76K5r7FSv6d3wYmpliv0AVM9rgDDxVAI38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657452; c=relaxed/simple;
	bh=HyHgcbLfPHOa/yey9B6d+0L5ZvvCeaQqnk9X9rm5tws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YrraNxXdudI8ND5yBm7SrDgF0OXsTmjNzaalVDozC4XSzccUgVT9SAwEYArcR8q3966brTtusX9Bc+JH5Z3UYckfPcG58I3X/0fk9psbgrh88/JKbe7JijId859Afrrbiu0e0kglicPN36cuX3cuhTUfCutSCigdXg98UGeolIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJLXcy4M; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJLXcy4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657441; x=1821193441;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=HyHgcbLfPHOa/yey9B6d+0L5ZvvCeaQqnk9X9rm5tws=;
  b=jJLXcy4Mg8gmSJ6GjijzrSUl4q5PFfHgFZmAoHpcoZ8GUM0ABE+UMMDR
   Iqyt03uU2+8vYTL0n5Vdh4IPCnF34QwbgTepET6amcOzLUxpKRTNWvJ/+
   0zMgnKJTq9OdPQHPaut1CCZe8oj/yP4KCmrMXtEjsuqz14mFT6av59vlM
   mSzGtphvQQ2NfoOb9SmPWDIezcjCDz3h3msa6u5TQeRY7jBYjvEMTAyRy
   /94XOmI9Pj1vxH1sJ56gN2GcmhLKFQ9Uj3skNuJaudOMD+maRhY1ovvBO
   cG0o4N3eG/PkGL+PjxXD2mDRaRWbNbHzclxheKRcURsBYCXowOfqVpa9o
   g==;
X-CSE-ConnectionGUID: NSN8fe93RqaNi3tSr6s5Eg==
X-CSE-MsgGUID: jJeMRRWRQSWMM0p1aQDRCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107594070"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107594070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:03:48 -0700
X-CSE-ConnectionGUID: W0CKoFcuQxO9FWEqB296XA==
X-CSE-MsgGUID: Er3Po/fgTZSdDWBNK48zKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297344329"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:03:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260815092138.91072-3-thorsten.blum@linux.dev>
References: <20260815092138.91072-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH] platform/x86/intel/vsec: Use bool for run_once
Message-Id: <178965742178.22350.14812056740758633173.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:03:41 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 15 Aug 2026 11:21:39 +0200, Thorsten Blum wrote:

> Use bool for run_once in intel_vsec_pci_init().

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/intel/vsec: Use bool for run_once
      commit: 1ce2e8ee4ca47c0d4b788fbc791cdf82fcc98ef5

--
 i.

