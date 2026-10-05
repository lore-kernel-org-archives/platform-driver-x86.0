Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858E8363C5A;
	Mon,  5 Oct 2026 18:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226364; cv=none; b=ed3lBnDW1aHDHDTpt/MtdH8LZGUY4n/lR/2iAwOyvN/vjw++jlg7lxl31FbRAzFbr57qxZovtRfCheykQcPivR2cGBzwrHkOrlw/1bIL8kWTg5iWyRZFHt3qunjojW3pRSxHgV8oXjrv5R5l3A6wJXQasbMnT+fHarSdZPQ+KC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226364; c=relaxed/simple;
	bh=099An0M0qThYin7dz5Q9k3PaiTtlygaUyYR6KHc4cus=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=krScUp5XLf1caYw+5rMWO1JyTOphiM+zij9EEH5YPXVMxliOUijrav2oYhn/HXPi93cd/ehA8sxlxm146dlAfNIy4qNMXLyiUa8NrVGqxgm70bn2lVgFLNUB48qYTxtMQDTC5wM9rCn9OFM7/va8MxlKZyTJrMCXTOJ7knZJ+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAOYDwHg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAOYDwHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226363; x=1822762363;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=099An0M0qThYin7dz5Q9k3PaiTtlygaUyYR6KHc4cus=;
  b=cAOYDwHg100dJFFV+XsViRo/F0lqc2/Q+BldOafcAHSJAPzcuDt5xCZN
   0JYwPotP8JwcBA3zeFUhMePjYHoneMzMUKxZnzr9J5s/VpQkKGOyYFylK
   Sfv5CdfAFp2lcxzrKG15+rZDKDWkVRq94CtAbtNEVE68rolzpsWJqqB0k
   37hcTlbhKBKQ5d3G3ptkI6yPqCJ4JuvbUNvDPjN6mUkytBaqIXaShiyli
   ooCrcvSgDbWGZM1mnPbEGd1hw3567zDmwzmTgfXS8tXH4kvXXAUhSmmRT
   JY3wzs2cT67PecMgSSbFy2u2P7h0djUsoBye3HLhZcOgnLA6g0k7DJdlF
   A==;
X-CSE-ConnectionGUID: oJ/VDvG8TyCWtbREGs2qSA==
X-CSE-MsgGUID: unj2ENxuR86sYnb1+HzYlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94780807"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94780807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:43 -0700
X-CSE-ConnectionGUID: IKoar0IrQLCxaCgBEAvveg==
X-CSE-MsgGUID: sXhaZ2VZR8uVDUcOkRMndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276433408"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Suryansh Singh <technosfan14@gmail.com>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260927095701.185772-1-technosfan14@gmail.com>
References: <20260927095701.185772-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Victus 15-fb3xxx support
Message-Id: <179122635184.41716.6412028737105424302.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:52:31 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 27 Sep 2026 15:27:00 +0530, Suryansh Singh wrote:

> The HP Victus 15-fb3xxx (board ID: 8DD0) uses the existing
> OMEN v1 WMI interface (despite being a Victus model) but does not use
> the standard EC thermal profile parameters.
> 
> Add the DMI board name to hp_wmi_feature_boards[] and map it to
> omen_v1_no_ec_board_params.
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
[1/1] platform/x86: hp-wmi: Add Victus 15-fb3xxx support
      commit: 9bb66c0d4d8e1a2cfe30c1a22031afeeb617b470

--
 i.

