Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7999521883;
	Fri, 18 Sep 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755926; cv=none; b=g8C1UHPM14VrqtGV0PTxXibVz27wTFNdo2go7CAfTv8dv3tG/P8e5o0G/GW+4kIVZhlD62m8cROwzg6wOSbZ/UCgNe1tCTJoqHhE6fImiznzKvt3sCDOc/I9kiEeM+vliKLSxJjZ6PywFQx48FT0HPjiVWoLivr2qgNW3rj1Wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755926; c=relaxed/simple;
	bh=l4hSiUi8jHALFpXc67ezM9jFDblMPhdTmUPU1GBOE0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zxf6Wf4bDQGbjg6jLE8DBE0NF7O4wuOPSjMY9dSmQgCnlWh7qfVKbeq1fZMTpMoBH+MLbGXKfvzjq5AaiFFa23tfO0iSFpOZPxk4i2DT9eP/a8ObWDZSumIzKATctoLtEahH5I7FK7GbC1Tp3b5gz789GyGQ9MY7P6f5iLPqru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bp45R4PO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bp45R4PO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755925; x=1821291925;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=l4hSiUi8jHALFpXc67ezM9jFDblMPhdTmUPU1GBOE0s=;
  b=bp45R4POACoVws9F9xNV4ySyA8AxAIBRJYdrDb9Y/9CwNy5y2qAZmJkC
   Ah0mbRUBcNYoe/7ll3SQAzp3PoeHuD/nkdjWH0uCVFKU71oS2GgLkiUjK
   A724kUAFFNyOBDFTL76tY3B7l9WkskuP3m9B0++9IER9blrvD1NCkea7s
   5vnAEgjeN2quiaRDL6lEN7gZ7Vsph6jY4zSDay/4xaQ56osi/2CYqHArM
   2Lit7PIWk/gRtc+UN9otW/+5wEI6Ep9EJuV4ydYjRAuLAOVJ6FEODv6Zg
   p4GnDrgqFR+n+Z4TELX/kis1yIxn3sm+80oK0PPGJZtE8hl4nRbjMdMEq
   A==;
X-CSE-ConnectionGUID: I3TtCmeVQx66LarHZtVFvA==
X-CSE-MsgGUID: YGpHB70PTbyrgPTKYe4wfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100880856"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100880856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:24 -0700
X-CSE-ConnectionGUID: CnXIJuPOTEm8aCjMneG0sQ==
X-CSE-MsgGUID: xg3KJtNCQu2yMzGtpBzs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270815770"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260827152226.35186-1-technosfan14@gmail.com>
References: <20260827152226.35186-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D40 thermal
 profile support
Message-Id: <178975591845.29716.15867567545009342761.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:18 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 27 Aug 2026 20:52:26 +0530, Suryansh Singh wrote:

> The HP OMEN Slim 16t-an000 (board ID: 8D40) uses the existing
> OMEN v1 WMI interface but does not use the standard EC thermal
> profile parameters.
> 
> Furthermore, it is the closest sibling of board 8D41 and 8D42,
> which are already included in the table with
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
[1/1] platform/x86: hp-wmi: Add OMEN board 8D40 thermal profile support
      commit: 162053ad8885a351140b2128e67fb5a53ab1c2d5

--
 i.

