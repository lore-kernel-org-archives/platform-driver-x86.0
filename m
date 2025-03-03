Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229B20F09F
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Mar 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006012; cv=none; b=BEE8dlcISdzTmIHh0gEsuDqEizcP8BiGfwQhK1/cgSRpLBp9ODXZBjlUsdgn33+raPLKNnQJ91g9xqMzrU7BmrR2P+lMgVSEORC/3jPVKUuLMiJg8Ny0d3jfFdEdr3ap6aYIpfU36A9iD97hCwRQrO//mC8ho7FrVLqMMOBL7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006012; c=relaxed/simple;
	bh=gLWsHJ/XKXKskZmtx8Z5TJRSfP2noi3+zBWfZt4znJU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l33hhmZ0OXyPvWkmCj9kiyasyMrnnCwtjTHVZqyT1hkTjeDH3lZ0yjAA60Iy29IlW1eQbfWPrfCzlfFHSipQxej1X9mcvSmYbit/jAFFdK2k2Y+VP41/F2UFQgi8uDKtDPV8GMCaErJpKIJeVRGwV0Q2WGRW0u17mlvbzVTxDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/18W1TV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/18W1TV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741006011; x=1772542011;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=gLWsHJ/XKXKskZmtx8Z5TJRSfP2noi3+zBWfZt4znJU=;
  b=a/18W1TVVn4D0K7G2E00HwD723nm+6m0FeBRSqZNce8KJ5GdsZWg9plj
   ncFFP2SYWHgJXQfJ3XpgbnAIZ5ThSg6c48hmXdNTc06jZoHIzqO1GKYAV
   GaXBI4H9EA02zQQMba1Nm3DP9jEJZiGdfeZwG7jWTMGHWojF62SlIC/6G
   a/ex5cpkOKLssykV9RT/GnvmyyYNRD9dqaOGqCUjwECE2OimetT1KhlXU
   3EC6UTGnf0Kiah6+OfwYwTDArmkqY990OT86/B0amobczhOVe1gqDxFqx
   RDuebHUWU3q/JsL+TWEp/DzyC357AdSX7J1L2zAJcV2mXfEDvho590bvg
   Q==;
X-CSE-ConnectionGUID: g77ztFszTV+TiB7TWjdN/g==
X-CSE-MsgGUID: C1/U3KpTSnSQyfiLefCcrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52855662"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52855662"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:46:51 -0800
X-CSE-ConnectionGUID: M/Hg4jz+Sd+oHprXpN/3GA==
X-CSE-MsgGUID: zxVayU+LSU2Jdebwk8KKOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="148809724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:46:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
In-Reply-To: <20250220154016.3620917-1-dmitry@d-systems.ee>
References: <20250220154016.3620917-1-dmitry@d-systems.ee>
Subject: Re: [PATCH] platform/x86: intel-hid: fix volume buttons on
 Microsoft Surface Go 4 tablet
Message-Id: <174100600496.2518.16202570013241114236.b4-ty@linux.intel.com>
Date: Mon, 03 Mar 2025 14:46:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 20 Feb 2025 17:39:31 +0200, Dmitry Panchenko | d-Systems wrote:

> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events.
> Add Surface Go 4 DMI match to button_array_table to fix this.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
      commit: 2738d06fb4f01145b24c542fb06de538ffc56430

--
 i.

