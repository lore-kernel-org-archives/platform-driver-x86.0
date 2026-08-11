Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF273FF1A5;
	Tue, 11 Aug 2026 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486527; cv=none; b=QVn/tSLT8w2AfHbc7f1DJdXtoEGh1AE0s7cUNV2wKYxuhg1pzobYbcLKOyWkdNqgv5KZXYGUHkyUYX6i9hbzNcEypx+I+7ZDHoqjUBKgOCN+RUKbepHGzWQAwtedMK+Lu+TV7JApNd0H/3F+rPCqhPK5ftvIfILPr9LMGyPWjco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486527; c=relaxed/simple;
	bh=Ao/cMRXUR2ta02+HcgbQzgE786UJKeDMWO5n5Pf8tiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8fBmKmQPS7mGufDn25611YDrL994s+zS4rvjM6NVz9GeWEyWK/UBJIdWkBsVaisZdbavY1vGD9Lmsve0yiU69mo01IleDtQ6a+rVBSqwUBHpTws/09+q9YTv0mQ7oocvMeY50CZWWYqPgUpZSgS5ng89sNwgMPZV5IIgUnCsf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/vfdYbl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/vfdYbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786486525; x=1818022525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ao/cMRXUR2ta02+HcgbQzgE786UJKeDMWO5n5Pf8tiY=;
  b=g/vfdYblDI7j5fy2rD6lLb9nCJl+Y2F8mt8VRkEMCVRJ+xlS/IDd05NV
   LwSHNdESoSr4U0fOJMBF2iGWVYJN5Aj+svRHw7sBkgTLQ4/zwTPXDYXx1
   Nuqg8DTw9Ib0JX5izg009cVMLvmnTDMlpqwBWoqJ8T9SbxwykBOYkc280
   NeXdERH455lavx4MEj+fc8D+nE3dQ8yQO00O6SadWw8YT4tf0KiIEpi2B
   soUGGYOQ9Msa3tdSZt6QQeUzOy9jdrK8S/e2keOFzRi9pF8XnCu/yFz05
   8tLmo4qC5lTUNfJVvYNs4KmdunvsUzAw1Ra3WVRB7KFSfIj2flCAywlAX
   w==;
X-CSE-ConnectionGUID: SEvZhmhnT/W5dgbsC42oPg==
X-CSE-MsgGUID: 4vHBesrwStaM8PpzVjy9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97374764"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="97374764"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 15:15:24 -0700
X-CSE-ConnectionGUID: Pmw6KIneTA2hnw7wlfO3Fw==
X-CSE-MsgGUID: UcMVg3sYReuvvH5mlj9qjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="262138179"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2026 15:15:25 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sammiee5311@gmail.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/6] platform/x86: ISST: Validate inputs
Date: Tue, 11 Aug 2026 15:15:08 -0700
Message-ID: <20260811221514.3905817-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add all remaining parameter validation in addition to:
[PATCH 0/2] platform/x86: ISST: Two ioctl input validation fixes
from HyeongJun An.

These patches are dependent on this series.

Similar validation is already done in intel-speed-select tool.

Srinivas Pandruvada (6):
  platform/x86: ISST: Validate logical CPU id and clos id
  platform/x86: ISST: Validate max level for set feature
  platform/x86: ISST: Validate parameter for core power state
  platform/x86: ISST: Validate parameter for frequency and priority
  platform/x86: ISST: Use PP level enable mask
  platform/x86: ISST: Just allow 2 bits for SST feature enable

 .../intel/speed_select_if/isst_tpmi_core.c    | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

-- 
2.53.0

