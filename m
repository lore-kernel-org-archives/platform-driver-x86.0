Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490851EE12;
	Fri, 18 Sep 2026 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756055; cv=none; b=NWVFxLfFQgFuHvhzbGMFiZa1N6FSufC34i5SuBzaRgpDSsMKpLAE5/pR2kOwVa1bHDqPcjCVD0r6r0gKqLe/4diTxHJyNRWtbTmMKVjgQoVYP2hELpBlC4SOEYh2DK1yQe6/WP09gHElanHzgnFsHRoZddxL1ohduPWNaldu/iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756055; c=relaxed/simple;
	bh=8gqRjWyH7bE8lydZgzpRt/XjPaNUVcqgzseq/EV7oqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rn30gsSH1y85KMGPePq5VAnKFf0619xUanKrBgQWBu7kUkvyIq2zAHF4K6wkd2eGgrPWC+Ywg4cWD1JJaywh2puuR5bpwq06YogJyD8njrx6754EHZ5nyTPhy7jEo2Z1bcolyamR1OFNgooEXolJUHLX05dzYzFhLXI5dHrf4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMrk3pW3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMrk3pW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756054; x=1821292054;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8gqRjWyH7bE8lydZgzpRt/XjPaNUVcqgzseq/EV7oqI=;
  b=iMrk3pW3+d6N9+qR3oqzAvRsaHchCT99EV7YzFFQ+xpFO8Zjbg5vShZQ
   iaQL8nIqaDF/vyoKu8dhcoLLBNtv+Lz4T20pqiukqkW6AdHzvjma2a/Z2
   TJn/rfPOhaJTMpSTdlo0VH/haISgWmkGbhDY07BGjhoKqZHKWmMyKK3Ed
   i1C/lXLiADsGO51wjTiOLZpMmkrfUSKCw/pi467aV6F/7Osm4e5bNQe77
   n1j5zGote8PTXg3CgnD6msQsZ1P9M2Q14sIhkD1+nvSJ0ovZo/zrMtQbw
   rh5BdUZx4UiRAUdz6Y6f0j0r0K//LUx4RCYswRaebLjHMes323AV1dZP/
   w==;
X-CSE-ConnectionGUID: LKv/EpPoRQCk8FhF3pBvOQ==
X-CSE-MsgGUID: oBVUeCGIQ0GJdQm7pyEZig==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100881228"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100881228"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:34 -0700
X-CSE-ConnectionGUID: G3K6vj5iQtGECfFhhedtqA==
X-CSE-MsgGUID: QAbNZhgLRl+ZBmPwTWmiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2763454"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Marco Giunta <marco_giunta@outlook.it>
Cc: Ike Panhc <ikepanhc@gmail.com>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <SN6PR19MB2303EBD5288E51BA50D904EFFCB92@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303EBD5288E51BA50D904EFFCB92@SN6PR19MB2303.namprd19.prod.outlook.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Map Smart Connect hotkey
 to KEY_LINK_PHONE
Message-Id: <178975604656.29716.8490939485587895062.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:27:26 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 16 Sep 2026 15:47:51 +0200, Marco Giunta wrote:

> On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
> Pro 7 16AFR10H, the F11 key includes a symbol showing a laptop, a tablet
> and a smartphone. According to the user manual, the key starts the Lenovo
> Smart Connect app, which connects the laptop to phones and tablets.
> 
> These laptops send WMI hotkey event 0x48 (scancode 0x148) when the key
> is pressed, which is currently reported as KEY_UNKNOWN. Map it to
> KEY_LINK_PHONE as the closest match, as thinkpad_acpi does for the
> Microsoft Phone Link and Intel Unison keys, see
> commit 7ba618e893a4 ("platform/x86: thinkpad_acpi: Add support for new
> phone link hotkey") and commit b511bbfe4242 ("platform/x86: thinkpad_acpi:
> handle HKEY 0x1402 event").
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
[1/1] platform/x86: ideapad-laptop: Map Smart Connect hotkey to KEY_LINK_PHONE
      commit: bc39af8c2c43b493ae914245a3092128424ceb62

--
 i.

