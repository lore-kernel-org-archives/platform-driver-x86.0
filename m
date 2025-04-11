Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7229CB37
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365804; cv=none; b=mEa+yoWKoTaEgMpvUW5byFtpK09d3zYp1dhfKUlYmmeu5P4Vkic3eMf34nMeExsrUf3+/6aY5dtpreWPylTsK3MHGAkroVqRmBF3pb5CXIG1t8oTxrjr/vyWoUb+IcY3LbZZ04GnCSCwIR/fmWN1nxZjupRPuBaOtcGT8ilrt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365804; c=relaxed/simple;
	bh=wZnHyDWUdG32g97CtPjFeCFPSg2x7G5f6IxRXEZYUcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gpwaDbArzgUfWoFeygKCwkIK5YD/k/hrCrB/j87I683MajTWOxHiHRfkSSjsEHOZickaYvUt5ICY2oBcVzxapaInmiqrXxzhEpfkhRkPt6teMsXWhDzOW03MRO6s9I7fzBgtRwgUoqHCtByckFDxQA8UWlQ5wlaepugJo610G9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJYmdiCs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJYmdiCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744365804; x=1775901804;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=wZnHyDWUdG32g97CtPjFeCFPSg2x7G5f6IxRXEZYUcw=;
  b=hJYmdiCsph7q0JT+RALND+kVU9Z4Gj62pJvu1krLKpCFrhfFaEv+7TSV
   +CbAthCQt2QaPuW8cLvUPCe7NE/RCwthj1USILzfxMQ4gcX+gBY/vrc1b
   WSfB+TVxANLn4LmfYPxAGDT5rbZ5Kri8e9U55YqPQdogXsbhhP+kEd8wc
   FkOpPlCR31hj4jeSM0ngGBAInwjtK0zYyGy69D3zCKv8H6MldUBuzox32
   PWrSDuu8YSD8jKRkfSsygSn9SjYdfx9X4ZSgKPcNHFRqCrU9paz6d8fqA
   OO53MroTIXWoBHpLIELZb0RZle1mMYtsfhv1GK75u/NoMBmVmgfP95lbO
   Q==;
X-CSE-ConnectionGUID: Mjeeipn2RTmdGVOT1qTxVg==
X-CSE-MsgGUID: qhF4yi8BQSW7eZJlVjoXBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="68399688"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="68399688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 03:03:24 -0700
X-CSE-ConnectionGUID: LAG2erzJTraRQ8xEoNw6vA==
X-CSE-MsgGUID: ZwE8mZwkQl2ysvSwPRAL3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134136136"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 03:03:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250407092017.273124-1-hdegoede@redhat.com>
References: <20250407092017.273124-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add "9v" to
 Vexia EDU ATLA 10 tablet symbols
Message-Id: <174436579709.2374.14752996580752243935.b4-ty@linux.intel.com>
Date: Fri, 11 Apr 2025 13:03:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 07 Apr 2025 11:20:15 +0200, Hans de Goede wrote:

> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
> significantly different mainboards. The only outward difference is that
> the charging barrel on one is marked 5V and the other is marked 9V.
> 
> Both need to be handled by the x86-android-tablets code. Add 9v to
> the symbols for the existing support for the 9V Vexia EDU ATLA 10 tablet
> symbols to prepare for adding support for the 5V version.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: x86-android-tablets: Add "9v" to Vexia EDU ATLA 10 tablet symbols
      commit: 3343b086c7035222c24956780ea4423655cad6d2
[2/2] platform/x86: x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V data
      commit: 59df54c67be3e587e4217bddd793350fbe8f5feb

--
 i.

