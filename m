Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C51A2C0B
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841575; cv=none; b=rUGfZWoz5+6cz7joBXi2GAvebDdE8zeW6K6OPOOXUD1jXMwgFrkhaOTOn39k6clri0wtjr2r1+n2gWjplkUsBFPRjguOCffGj2k6yMtN//v13eCvf2LafgK0HQ4eMrcA4HAY1aX/GbfPl7pWyD7I/aVTR8/Hoa7FFNoM95PWJ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841575; c=relaxed/simple;
	bh=OeduE77jQI50SOAaUr9H08mVA6IoCTXXGa8mYQFCles=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DLomXnFmtgbib+TOrry6axdUqTzMBPUjZUgE0d8ZJgNol/jf2YYortIEKoETLje5scf+BN6AJ5fBzK86Irpy5NCK4J7WYCgvgjvJ80KH1yr0X+9vvbFvq7doOYW6XD1HbbKSYGbXlZAEEqLupRP0hZpIyePzxGx4RpRkxgGeXYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd7EHxg7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd7EHxg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733841574; x=1765377574;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=OeduE77jQI50SOAaUr9H08mVA6IoCTXXGa8mYQFCles=;
  b=Jd7EHxg7qh0orklUQ+Ah9i7UiaLkWvdkoI0QSKTkR5KM4L57RCVqqPdA
   EXhomIE9OjSTaClDsTj6dGAZU07LvXwfx8F6dr3Td4ONvYLWvX7LSE2yX
   w20UrEYSoiEKxzKhHu8ghMA10b++Oq4tAEbELHAvi+zBvd5+2+0ECjc5z
   rwiDYPkjS72d0LrAe6qUlqJrsKyFnMy3bUbNDxX6+OsUtCJKna1cm1hdX
   Rp+LKqTafxpRjeRUZn7DLiun3ntliN6mjj00N3z0of+ba3Z3qDk80lKG2
   Wx2PlGCHS4f2dU+Stt3cUWaj3vtd7WIIn6lXJtHUc/U10eyxNPCXOe5Fx
   Q==;
X-CSE-ConnectionGUID: 9yrb+4LgSXmhB+zRGhLIrA==
X-CSE-MsgGUID: JxqTEhI9Qb2lynNoH1YkTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33917582"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33917582"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:39:30 -0800
X-CSE-ConnectionGUID: YG4HfYL4RFGjuSBMBluakQ==
X-CSE-MsgGUID: i7VYXpmiSPO/BpIjVrIayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95262594"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:39:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Hans de Goede <hdegoede@redhat.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: danielwa@cisco.com
In-Reply-To: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
References: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH v4 0/4] p2sb: Fix unexpected P2SB device disappearance
Message-Id: <173384156307.12053.11574407054785838716.b4-ty@linux.intel.com>
Date: Tue, 10 Dec 2024 16:39:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 28 Nov 2024 09:28:32 +0900, Shin'ichiro Kawasaki wrote:

> When the BIOS does not hide the P2SB device, it is expected to be visible from
> userspace. However, the P2SB device disappears since the commit 5913320eb0b3
> ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe") [1]. This
> series addresses the problem. The first three patches are preliminary
> refactoring for the fix. The last patch resolves the issue by caching the P2SB
> device resources only if the BIOS hides the P2SB device.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] p2sb: Factor out p2sb_read_from_cache()
      commit: 9244524d60ddea55f4df54c51200e8fef2032447
[2/4] p2sb: Introduce the global flag p2sb_hidden_by_bios
      commit: ae3e6ebc5ab046d434c05c58a3e3f7e94441fec2
[3/4] p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
      commit: 0286070c74ee48391fc07f7f617460479472d221
[4/4] p2sb: Do not scan and remove the P2SB device when it is unhidden
      commit: 360c400d0f568636c1b98d1d5f9f49aa3d420c70

--
 i.

