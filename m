Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF2410D3B;
	Mon,  2 Mar 2026 17:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473943; cv=none; b=dH/CgctdyGMUsv98UJ7wg482Z17pYmNFaD5FGbKgCgr4L2Be7uRpLbITmqPrfG3+HM2llJLDc8gjEndiAY/9RRZi6e89rfgHOSb4q+VTwN0d61rK2UFpobOItGz039i/e5LRtZ0OPM0h5dTM2ZVSsFFsULL8tfCHIubHGN6K4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473943; c=relaxed/simple;
	bh=ocP+C9HfpPwTXV481DvZ35sXEaKaSA1rbLYL2fkLDFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgOcsJDvJmfCAq6fG4k68L+H16LO+vVyl5vYt1Ick3pForGa6KdUqcu/3+FR9Perpf/XaS1hrqO1fMfqXIvz/FnCqeIHG9IXgNhrOIchoZAWevkdjTC44uHi5+4zBNU+fbS1GZfbMXpKkuQYMdd6FjYOFF0lBvUBbne17trnnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2nVBh+c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2nVBh+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772473941; x=1804009941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ocP+C9HfpPwTXV481DvZ35sXEaKaSA1rbLYL2fkLDFc=;
  b=d2nVBh+cEkdGnfbVwOGnXADDZKEiW3HND/E7cbPisqeQuF5QSgZHMDZ1
   rUJNQOBeVPbBA+ByUuGaBhu0YrB5ywONDEuPnvuR62A8wf8rjPpySY74Z
   GBfHQn5r5Ht7LTukKZobUzaC894YgjbgErU1nBvWxWiH9yBAK10byPyBd
   kUdeW80VrduQYjthoxyg3pqfrn75wrQqTIBkKUG5J4kljMdJO5zSH0Ww3
   mYvsqv+dEiYEMdBHp1Ltme0G4Gjd2nV/Pqgm9kl8sZpQRtEpUF9p94OA9
   f1i249gzXIch3WWaQi9SvB4w4Nxg2rU2R0JeLB6/laLndsczJK8wt3r/9
   A==;
X-CSE-ConnectionGUID: kmFK4bVbR+urSwrrXRjzgw==
X-CSE-MsgGUID: PNruRpGVTIuulABUl3OJTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77356708"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="77356708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 09:52:21 -0800
X-CSE-ConnectionGUID: nNRUGTjeQk6S+fA4p8+jrQ==
X-CSE-MsgGUID: B8mwo8rcSJGcPKXG1axUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="248238372"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 09:52:17 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: sakari.ailus@iki.fi,
	sakari.ailus@intel.com,
	sakari.ailus@linux.intel.com,
	arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com,
	dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehdi.djait@intel.com
Subject: [PATCH v3 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Mon,  2 Mar 2026 23:16:42 +0530
Message-ID: <20260302174644.1258718-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130092431.2335363-2-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

Changes in v3:
	- Fixed check patch errors as updated by sakari
	- Enabled VCM regulator for ov13b10 sensor to enable autofocus to work

Suggested by Sakari:
	- Add include header file in alphabetical order 
	- Remove extra space
        - Asked to check vcm instance

Changes in v2:
	- Added power supply names array for the three required regulators
	- Implement regulator handling with devm_regulator_bulk_get()
	- Add regulator_bulk_enable() and regulator_bulk_disable() for sensor power on/off sequence

Suggested by Hans:
        - Add multiple regulators you should use the bulk regulator API
        - Use use "reset" instead of "s_resetn" for parse gpio name.
        - Add diffent regulator power supplies  in single array


Arun T (2):
  platform/x86: int3472: Add TPS68470 board data for Intel nvl
  media: i2c: ov13b10: support tps68470 regulator and gpio

 drivers/media/i2c/ov13b10.c                   |  48 +++---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 2 files changed, 177 insertions(+), 21 deletions(-)

-- 
2.43.0

