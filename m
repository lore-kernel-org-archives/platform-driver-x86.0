Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3B17A2E8
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098884; cv=none; b=WOuEYmJTgNRgIgOEEgEozXg0o9PTV7dBdn82lk2ETYT47/e5Fm/VLUihACpVOQY7eZd3eURsyJi8fXkJrzPUm0omnJwTg/FspYMKFoIYm/aie7CGtr0YnQY4588/cmAjn9LNnV05V6IhxhQhUV64/zhKIKYeAseW/FXlT8bzbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098884; c=relaxed/simple;
	bh=WXdSOyDeb7QG6ZG+hMnygxcrEaY8YKN92KsJw0oh4+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tl5E7ZFmncfo5DFqBJ1EcLo5idKkQeg7+S1as8SiuOpI6eKzrOR3qQFvfI8Lq55wPy5qx3Yp0OOxjcmO8giNw7LcljyJIM3XwpVbSQdFM0sraVZtK5w9DCqee7YxNBqQRPAQArTEq6s6IPtXn/YuwJvl/bWoCG+lR2QYZ7VGNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYlXdhGf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYlXdhGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767098882; x=1798634882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WXdSOyDeb7QG6ZG+hMnygxcrEaY8YKN92KsJw0oh4+A=;
  b=QYlXdhGfrZfNZROp3eUZLbUKnKf/ECwEBQTaKy/pPjzkknD459iQeSKK
   K/M/IL+LEl3qqRjXEKrJzjgB4gas3LgKZvpyRzWpVWihCgdxZ2hs0xHq8
   MMQLDffmJrLHYSdfr8gdi69ClwjCDS/uysQ8CAqD/urJNS043L22xIZhC
   zNeIA84weCSImt4Fo11GZE1DALD4jpHAAuFCI5wtAac1AdITv5mI02oBH
   OODF2Gaip3lVSc2dKgl703M4/vZ8zN8ISnxwntwgVF0cCT1SagGvcqAJc
   OYXgf3aaVQLx6hEfzk0tVZYZFFqUgq6J44D7dUm2r66eXH0n0P1AkSHhM
   Q==;
X-CSE-ConnectionGUID: lSdmzcTWRAaHbhgrdKlLvA==
X-CSE-MsgGUID: lrJ99/sqScirV4IhQK9XTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79319824"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79319824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:48:02 -0800
X-CSE-ConnectionGUID: AxRHF0d0RYSeUO32b1GpYA==
X-CSE-MsgGUID: y4vjf/koQnWNKSRQPVXdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206266973"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2025 04:48:00 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH v2 1/2] platform/x86/intel/uncore-freq: Replace sprintf() with scnprintf()
Date: Tue, 30 Dec 2025 18:15:15 +0530
Message-Id: <20251230124516.229125-2-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
References: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unbounded sprintf() calls with scnprintf() to prevent potential
buffer overflows when formatting device names. While the current format
strings cannot overflow the buffer, using scnprintf() follows kernel
best practices for string formatting.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 65897fae17df..e9495ac5ecd0 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -269,9 +269,10 @@ int uncore_freq_add_entry(struct uncore_data *data, int cpu)
 			goto uncore_unlock;
 
 		data->instance_id = ret;
-		sprintf(data->name, "uncore%02d", ret);
+		scnprintf(data->name, sizeof(data->name), "uncore%02d", ret);
 	} else {
-		sprintf(data->name, "package_%02d_die_%02d", data->package_id, data->die_id);
+		scnprintf(data->name, sizeof(data->name), "package_%02d_die_%02d",
+			  data->package_id, data->die_id);
 	}
 
 	uncore_read(data, &data->initial_min_freq_khz, UNCORE_INDEX_MIN_FREQ);
-- 
2.34.1

