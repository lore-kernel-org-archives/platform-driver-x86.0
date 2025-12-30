Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF87221DAC
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082280; cv=none; b=uy+jzPOOWHfgVxYimEn++/OiK0qZPJmV+PXtIQNVhMVX8h5MrX6oY9RnPQQBXQXsb3WVti0Gy8ZDBc6OcC/Tz/bysJkDQhgye61fW54hS/61GgKHy92eExcIbEZGpwMPo/yhkOO6Q6yFtw8gNKkceiL8k4uouMIN1plHMoHJiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082280; c=relaxed/simple;
	bh=x2SMQbl8yYwJDhXabwVv6fpNz7Q3DtMATKZT2xEA/1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lm5p/0aKF3ZsHLQFl3vIFRcUdMorX6RZcdmMwDZxuPgxGA69FVGmB8o5hd8CFF30l3rnW978NIcE/EqgDTL9P54FX4Ynlafa3VwRh5ijVqFm2Ds46fXEe3SXL/UAjMMTMHE54R5Lpev/ZBbcYbRPAyBu64BpCLOt9C4Mx+IL2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZLu8wPc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZLu8wPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767082279; x=1798618279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x2SMQbl8yYwJDhXabwVv6fpNz7Q3DtMATKZT2xEA/1k=;
  b=LZLu8wPcLS+36wW/0Mz3PcUvvIty1GfODbMapHVT/plN875dqXaNTDi+
   XIvcrKizS3y5JQYhgwDlvGosjJ0BoRLJC5kOT9eqChYeXthgaN3aTJn9d
   US/IzWkBdGJLoT5nl3T8JkJCMq8xHHWtrhHUHp/pkzRFGGoIVdoWVNKaE
   6dQSfUsWuJqL1hH77HzqoQ0z4tCtrhJzOGITo4DdlQTym0dpnwz3iPn9T
   4/4HiGhDZPDd2QC+G735NukF0nBTRx0CEhLUorbTXnPR/TqajY8MzFWRJ
   KGFfBnxI1550kKF2UddWIHuY/TOQ0q4ZTdh9w3A+Qf8DB7k8VAjbPHAgu
   w==;
X-CSE-ConnectionGUID: vjx2h0NpTV+d0mSezWT2WQ==
X-CSE-MsgGUID: hvIQ9hy6SJ6KXCMqNib/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80044204"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="80044204"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:11:18 -0800
X-CSE-ConnectionGUID: ePtneUvoRfCdl5q8uvhzew==
X-CSE-MsgGUID: ZbdDsV2kRAqmudiJNwosoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206050884"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2025 00:11:16 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH 1/2] platform/x86/intel/uncore-freq: Replace sprintf() with snprintf()
Date: Tue, 30 Dec 2025 13:35:44 +0530
Message-Id: <20251230080545.224954-2-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230080545.224954-1-kaushlendra.kumar@intel.com>
References: <20251230080545.224954-1-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unbounded sprintf() calls with snprintf() to prevent potential
buffer overflows when formatting device names. While the current format
strings cannot overflow the buffer, using snprintf() follows kernel
best practices for string formatting.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 65897fae17df..c129dd450360 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -269,9 +269,10 @@ int uncore_freq_add_entry(struct uncore_data *data, int cpu)
 			goto uncore_unlock;
 
 		data->instance_id = ret;
-		sprintf(data->name, "uncore%02d", ret);
+		snprintf(data->name, sizeof(data->name), "uncore%02d", ret);
 	} else {
-		sprintf(data->name, "package_%02d_die_%02d", data->package_id, data->die_id);
+		snprintf(data->name, sizeof(data->name), "package_%02d_die_%02d",
+			 data->package_id, data->die_id);
 	}
 
 	uncore_read(data, &data->initial_min_freq_khz, UNCORE_INDEX_MIN_FREQ);
-- 
2.34.1

