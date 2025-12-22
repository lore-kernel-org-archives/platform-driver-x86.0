Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B248F2FC00D;
	Mon, 22 Dec 2025 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414573; cv=none; b=b84ExToZdC4j34H/O2lfTQpJJPa9snSs/FGtLBryvlkFODDRNYtWoC5wUka5/kDKU/07gXdpKq+7W0lFvDPmvbF0G+cHmY0oDdS6qC5gLKpadl2qwtNy52E7EO+qVP7z2R8fzWllDPxi8PsfmqxSz8tkKgotqHEk3aj0JS53ms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414573; c=relaxed/simple;
	bh=aeOb5B+vTrXnw8QEQMDQS7RYsMaRW+o6fldZekP5a/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kePoS/jZ1CDFcs6bPS8ZMmg79CNLPMHlH49hi4DiaWN9v8OxPbz8lwqs7kpHmvwC2P8I5A7Ctebck8iwDysZRFkhqxnf7GjfdzhEUlMKU1tspW0TIQmyTadsBxW8hhU1efmSGgd5JeZ8dpYTUmRfHrvZcRYRo9O6V7qE6Y+mxgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7315ENP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7315ENP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414572; x=1797950572;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=aeOb5B+vTrXnw8QEQMDQS7RYsMaRW+o6fldZekP5a/E=;
  b=K7315ENPwMLJ2KdSDquWz4LAMX3f89HtI1JYeomBBtumVq6iGAmvPB/K
   +JMrEAsRHPErFBl3YKqSgnwajiQoH7AYCvQbnwgkwHPDGARLwdUzZqjuz
   IPgp/+Xzh4chJ5M1++OTH3G2AguBAe64oViLUye8ZPQ2WFxuO3+7D8SCe
   KS+bSaCVmQ4XvOOsu2Jb1AxAIbhfgAGLv2+K/54ox/eD2bmNw+9Z718Md
   DNIjb/QCCnAE9mj5YJA0XQWLX6FPiFq63mEfSqOeGHsZs75y4hm94RMNZ
   YKEqrmoxHBH7GIftSmuoIbZW2q7omYrccV+1SwsCPsIkwrhJxu7ZF+XoT
   Q==;
X-CSE-ConnectionGUID: 2c8/WVXeRcqsVFHYm6xnLA==
X-CSE-MsgGUID: GEtx7+zNSDOCE+S52DMaQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79384686"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79384686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:42:50 -0800
X-CSE-ConnectionGUID: A4trN/ToS/GqRcCcKZdPsg==
X-CSE-MsgGUID: dQWOsfEqQO6vswxQYv/aTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198683472"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:42:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>, 
 David Thompson <davthompson@nvidia.com>, 
 Shravan Kumar Ramani <shravankr@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <065cbae0717dcc1169681c4dbb1a6e050b8574b3.1766059953.git.shravankr@nvidia.com>
References: <065cbae0717dcc1169681c4dbb1a6e050b8574b3.1766059953.git.shravankr@nvidia.com>
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Remove trailing
 whitespaces from event names
Message-Id: <176641456171.16407.14591962495000870123.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:42:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 18 Dec 2025 12:18:13 +0000, Shravan Kumar Ramani wrote:

> Some event names have trailing whitespaces at the end which causes programming
> of counters using the name for these specific events to fail and hence need to
> be removed.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: mlxbf-pmc: Remove trailing whitespaces from event names
      commit: f13bce715d1600698310a4a7832f6a52499d5395

--
 i.

