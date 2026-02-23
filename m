Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB33313E14;
	Mon, 23 Feb 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864446; cv=none; b=PgtFA1xkqT5jmjqepRRlcfqsWg+RSxDhb6E3fgPQFrJFc/4aT9owY76bWZthPbGxWSCjBTLgJSaEbGt9OWCX/STdCTXJo56gTYkKtZSCXF9ZqiDnh5bj2CNzfBuW0VTnzzyAH4J6h3Z0cfQX8E3gBt1d2fxPgxJ/YG7UiVhdGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864446; c=relaxed/simple;
	bh=yNkUDa5Y+mj6YlsuLGVYaDc16sfDaP9cd0jr/jrv8Tw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fcnIW1HgTEq9z3NyOMm1iqjQgs8VqJt1yMe6e/MAEJbXrhrf/5W+ern+ii/JxjOxP8Z/L3UaUuMJtTigUiiu9zqKFGOawZDPN196QeEnidANTbMi7uO0Beu5wZEfxH4r10np9nPsxg1/deM5kzBwucF6hZSvBL4zc5cMIziVBRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJNuDSvU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJNuDSvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864445; x=1803400445;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=yNkUDa5Y+mj6YlsuLGVYaDc16sfDaP9cd0jr/jrv8Tw=;
  b=TJNuDSvUPJX6CgTUES7TbVFJtnF/KOfdmHLgRJsnE2osHSRZA1omGNj9
   uLYa+7jE0zwUTu/NEFsp7crGSwvJ55lUWkq2VAd9KEQ94WZZS0UMG0fqT
   xJxkaOPWpypwRW0TapEpJeJPNRqZhUylHAwd5TLngSYb/jPCXQFVdVaJm
   P30THzL6dcOBD/kJU3UUVZYUUXVzOvv5/uwla8b+iXiDdc6zaPf5BmDl4
   RkuS6lyGHEZbESJLq9OZjlUQprjTNPu07pxqANFAKAcYYhJ4+05J7dkkw
   GxO+oFGPwWR4gbyljr3hDIjhpcD5tNN43qP01WtfszvrtCMUTvSZ7a6e7
   w==;
X-CSE-ConnectionGUID: WH4zIlonR06oXNqvP1FIxA==
X-CSE-MsgGUID: TRBVEMPgRr6ycMyzCkTc2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75473121"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75473121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:05 -0800
X-CSE-ConnectionGUID: DYCUNCI1REGByQuSHTkFMQ==
X-CSE-MsgGUID: LPsDkZreSxuHe7S6YjkeRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246205389"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Teh <jonathan.teh@outlook.com>
In-Reply-To: <MI0P293MB01967B206E1CA6F337EBFB12926CA@MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM>
References: <MI0P293MB01967B206E1CA6F337EBFB12926CA@MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix errors reading
 battery thresholds
Message-Id: <177186443522.17917.3656614442482119977.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:33:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 16 Feb 2026 01:01:29 +0000, Jonathan Teh wrote:

> Check whether the battery supports the relevant charge threshold before
> reading the value to silence these errors:
> 
> thinkpad_acpi: acpi_evalf(BCTG, dd, ...) failed: AE_NOT_FOUND
> ACPI: \_SB_.PCI0.LPC_.EC__.HKEY: BCTG: evaluate failed
> thinkpad_acpi: acpi_evalf(BCSG, dd, ...) failed: AE_NOT_FOUND
> ACPI: \_SB_.PCI0.LPC_.EC__.HKEY: BCSG: evaluate failed
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
      commit: 53e977b1d50c46f2c4ec3865cd13a822f58ad3cd

--
 i.

