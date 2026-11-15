Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794707391;
	b=jCduFP1XHwPuyqrPKu0M8LrefpNyptW70SrxxJb/2tx4HU4pOa3ZNC+0IhhUZPtkMLJh
	 ueNsnl/ODzcSOy3fUN4idJJQ3DMYpm7ycLCDYnvW++GOXf59U8tMl+QCcmlmCoupC262G
	 h8f3nagiXrSwiocJ33THxp2EbtfgeY+IQfmfGnwc1ZjwIalY4qGk5ICrifpykAA5KFHDv
	 NVAeJ0o8+xTyrNg+80fxle05c9OU8OcfKFfW/i5A/izMeD36Sq8bmemzzad8yK+NQnZCd
	 i3t5hNjMwDOG+sYIOdfb2T9TTNdzQ2BvM7uu5Jw/pN9M3YbP9/dSovRRxtdatfL7FlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707391;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jhNb0X45CrkNKVTWDr+yaRXlbmEqLurbO2vVZY6LLN0=;
	b=viZGAFTn1+wfaSb/4w4NzETdZyWG9Ac37kgKoCQPhjTt8uw6UQiGHpVFFnO/sFGu8tUD
	 ypdUFOV9PUDqPx79T5NoP+OaO5m6pS5PQxtwyAW61O2gK+zgrlaMxRmZsGCS9Tv6SDuyU
	 FZ7pAo8LF1TRy5xd1JXaI78zQlYxal/G2IwmxPVkqRscPJeOLGoQOBjtsRHIdmvbO5Opy
	 b2t58Yw+qhDMusw4Lw3ugFBfonhAXJv6wXuJbKS9kdHusxDx78gC/1kUKZTG7o9dZcIOu
	 QSf+vxS923UU9xBmqoKFG06pwSVuTn/fu4Rv7O0h2v7FOOUCOBp1JMbQTbNQgYrsynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BLn8hBQE;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697D3606A327;
	Sun, 15 Nov 2026 01:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697D3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BLn8hBQE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794707391; x=1826243391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I+GdudF0n5+0qiM7oG9+g+7sDqMd6fEbIIuKETNJqGw=;
  b=BLn8hBQEkHeCIkZo7GwPBiaM+RwL8F4ovi/wPey3AqVRZW9x7ZHV+o3T
   scySuJk+8Dw3b8kfwK8Z2Tr4qtMEXPG+USO4MJW4Pxox54LJhyK6ZJUj/
   OwHAHt+kJk9utLp6gew5RQpbzU47lNr2IZJdatwkeHt7wcVfh3fACvg/l
   ACV0C0Y9ek5QUffkE7oXXkjsiojg5+KGE51ggFcblzEqviaov0IUSzVk8
   XGQV0dybsrQRZ/X6zOMzaOutDT+H+cIuD5w0W89FHXM35mw4P5Ib7DIGh
   4xwa3VGw4eVgTy8pwyzr0+h4G+zSjiVtX6VD1h5rc5y1PsYuqxqWgBidt
   A==;
X-CSE-ConnectionGUID: nXSlb83yQVSTrIQf5M2hMA==
X-CSE-MsgGUID: tKHG61LrQTeVm3xobbY0Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3476603"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3476603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 17:49:50 -0800
X-CSE-ConnectionGUID: 0ktAI87KQzKMAZAOEiqz2Q==
X-CSE-MsgGUID: HWkioqvOSSiege9YowhIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9492166"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 17:49:50 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/2] platform/x86/intel-uncore-freq: Fix error handling
Date: Sat, 14 Nov 2026 17:49:46 -0800
Message-ID: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the driver code with AI models, identified a few corner
cases during the device probe and removal paths where error handling and
resource cleanup were insufficient or improperly ordered.

Srinivas Pandruvada (2):
  platform/x86/intel-uncore-freq: Don't remove entries which are not
    added
  platform/x86/intel-uncore-freq: Fix deadlock when removing attributes

 .../uncore-frequency/uncore-frequency-common.c | 18 +++++++++++++++---
 .../uncore-frequency/uncore-frequency-tpmi.c   |  3 ++-
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.55.0

