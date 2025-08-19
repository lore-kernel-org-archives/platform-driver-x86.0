Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E33322DCD
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600932; cv=none; b=qNTrtLE04pfD5ny9Wh2WJSkmejISjbsJ4dy92XUEit/5d6+KQ5R7/tgjAOmEAfCz7TkmxtQJNF6De1t1aLYvFdSKU/kC9xVVW66BtmFvaqYlkMunIRTMLe/iv4VhcqbJ9xKHO+4xhdO/pita+4WjkmEY456Ib8qdXDpO82HrbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600932; c=relaxed/simple;
	bh=CpnoWg7M55vBbYr/Onr95j/W2aeWx58Ydep/XB/ZmWw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VNnQ6lnddhGe63wkuENlzA5KCB0MzCvVeYEjeXppebR70otld/K+Z8LQ3qVx+asYnGpLbpGolM68tVoq69r0EdAuvwHM8GjE0UhTOkjfPkk3YBJjhpb6g8ljEis/wCDjd50wpb9WwyBCZjVCHT6jfcG3sk2O+KWmZ/J/7PEBze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeSt7GbK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeSt7GbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755600931; x=1787136931;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CpnoWg7M55vBbYr/Onr95j/W2aeWx58Ydep/XB/ZmWw=;
  b=HeSt7GbKFu+4U0c/ZVN9accyRnROe2x+H+EDIrIykNkGNE9IFFrtT4Sf
   fJoOgpgJdWN780heY62FYsv9z0UM7CdP5oHh0byfCZBPGDgjTTRXpb0p6
   6RI2p89WL+21Wjcv7/osooXnfHvq11RdqLt0qu+WYWWG9ol8JiJrCWCtD
   pvye56Yr9DipZnCBDLTxOL6lLOZQCkCb4QtFaa3eyzUOOiWaN7wKVVhGT
   FOsIUO4LZN62C57RtZ0hphZqw5KNffc3jU9uFqzA2hEtCWiC9ucNDsf2G
   zvhk3rvKL8p2U/9m6WK+X5lAlP1C0Zr4hWO8xMqkDAt0rBeVmWgzOXxN4
   Q==;
X-CSE-ConnectionGUID: +w/X4WDcQj+aNKYv+sFWww==
X-CSE-MsgGUID: teH3X06mTLe5byytgF/rmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75412298"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75412298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 03:55:30 -0700
X-CSE-ConnectionGUID: mRhecAc6QRWWkn6HhXBtOg==
X-CSE-MsgGUID: QepnzkPvRZqEYHzbkNdzYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="198835558"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 03:55:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250725215259.402796-1-hansg@kernel.org>
References: <20250725215259.402796-1-hansg@kernel.org>
Subject: Re: [PATCH v2 0/3] platform/x86: int3472: Increase ov08x40
 handshake GPIO delay to 45 ms
Message-Id: <175560092404.2561.4527825695859809783.b4-ty@linux.intel.com>
Date: Tue, 19 Aug 2025 13:55:24 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 25 Jul 2025 23:52:56 +0200, Hans de Goede wrote:

> Here is v2 of the patch-series to fix ov08x40 based cameras not working
> on several HP laptop models.
> 
> Changes in v2:
> - Convert int3472_gpio_map to use C99 initializers
> - s/enable_time/enable_time_us/
> - Move enable_time above con_id for better struct packing
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: int3472: Convert int3472_gpio_map to use C99 initializers
      commit: b33b696f86f6d17c9083d69a13d7f32380d818d3
[2/3] platform/x86: int3472: Rework regulator enable-time handling
      commit: f11f8948a826afba66355302ba7e4b3e36333038
[3/3] platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms
      commit: 30359c239ba8394c8e774151d26914db18dc4976

--
 i.

