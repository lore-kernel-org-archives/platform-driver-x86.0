Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA751CF67;
	Fri, 18 Sep 2026 18:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755980; cv=none; b=AytM7hQMMgFLgXLNvucwKkAPzIVhHaqb2atNs/PSg8X0ljluIq14898k9T5MSCfPIZTvUNjleZA57hM1SvTys8XyyNipIGxe7oVXxDyMjZHs963TVL4BRCevl8ujm2dBtYKGiwfvVuICheQKxLeyQbK/wg8EMp5nWk/85jkc4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755980; c=relaxed/simple;
	bh=a3chZNLc+vUVV7U+DL0CAY+jbAfL05Upd9aILul+U5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KA2SE6XCOzGRIofcZxMrCGOMBBxX3vKUKhl+x70svzt3WVlU2YeRhq0k3/2ziuIcNljNjRRxuZMIns82mcQno5aC6OchtxWHy1HqOHJmm2iFhyZHEJYMyXaa+E15JSQnGBAJiFYwNb470wHbC7UgtFGGwf+ufz9MNql5oSsLFzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k78ydsoB; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k78ydsoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755979; x=1821291979;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=a3chZNLc+vUVV7U+DL0CAY+jbAfL05Upd9aILul+U5U=;
  b=k78ydsoB4UMpnSEycmdjG06xqc/y1t+nCZ86+60a9uqwWBtP+uQA2azi
   enjKt/XngFgnN6LTEk4q71zHdRmkeebkUXjaDOnQZJRS75g3CGA5xtIOr
   J6Inh7c8KEupfn1MYUj2A2EfR+PNguaHWTSrhRLyMHn9hLUyPfjhbzm8K
   0fweILzBpXXfbOoyGGaL1/LL1yBjNbfQAV79WxsPvZl9ETYGfb0HmT5y+
   TK5o1RX8WmzrkrmEUJmiXT/CvC61X5x8BklM8Jme9Fd4weJlDhEwIQWa6
   +Q5YOOlERN21vXBepDpjLXQuRmubxetBB6vGjNitDPxNZt+pwZtC+Cdaq
   A==;
X-CSE-ConnectionGUID: ehnT7viFQrSuIVIqMI57CA==
X-CSE-MsgGUID: 0878BxNzR5eFgGherPr98w==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="791893"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="791893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:06 -0700
X-CSE-ConnectionGUID: 7aR8U4SxT06Jmn9zvqRR4w==
X-CSE-MsgGUID: ol2VmuvtSq+wVqAuGSI9bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="299625758"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Jack Wu <jackbb_wu@compal.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260904-dw5826e-acpi-reset-add-revision-v1-1-1be7153c3453@compal.com>
References: <20260904-dw5826e-acpi-reset-add-revision-v1-1-1be7153c3453@compal.com>
Subject: Re: [PATCH] platform/x86: dell-dw5826e: Extend _DSM support to
 revision 0
Message-Id: <178975595777.29716.16206674976397439111.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:57 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 04 Sep 2026 14:46:48 +0800, Jack Wu wrote:

> The driver evaluates the PALC0001 _DSM with revision 1 only. Extend it
> to also support firmware implementing revision 0, as found on Slate PTL
> CS 14, Yukon PTL CSLW 14 and Yukon PTL 360 14.
> 
> The supported revision is detected once during probe. Revision 1 is
> checked first so that existing systems keep their current behaviour, and
> the accepted revision is then used for evaluating the reset _DSM.
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
[1/1] platform/x86: dell-dw5826e: Extend _DSM support to revision 0
      commit: de1e19d4dff7553d78a07ea3fba9bf04d6609fba

--
 i.

