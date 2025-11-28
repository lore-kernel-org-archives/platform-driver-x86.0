Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D798F327213;
	Fri, 28 Nov 2025 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331346; cv=none; b=d4PM6D6c/KYhhjoTem0TSkrcFWBWIGZ0Sts41HxIWT4vzw6Ns7yKXybBWLGrBiXpJRVNKnChKmzebi+/SOt6DAFTMvFspJuuOgMd+TTeT69AuWcOQfRt4dCraxwOONAJXNpjjdo5NNr6P2O6IZBxEq1E2cZeqsIoX16dlp3GPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331346; c=relaxed/simple;
	bh=vQu1UJrj0zzZGlq57zlk0BmQMQtzoU2UOr8Zrem1pdc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=EDNxwMIfddMI6wdcqGne7K009Glhou4NVko5tJ3y9gTxbJ6CgG+TAAuhW5LCjYaXt5K5bgp71rhQxPgTXKT8QzjuHC3eGiW8Zopxe0IVloSwEUZPZxitSFpuYVg51G6om4t15uFcSWdjUC7uiGKh/7Y+ee7un7LXsn7pw62tG4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPknTByK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPknTByK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764331345; x=1795867345;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vQu1UJrj0zzZGlq57zlk0BmQMQtzoU2UOr8Zrem1pdc=;
  b=KPknTByKYCGlL/3zKW1xrp1RvEA04KfNJ5K2CT/aXZez6mHqjA0TzsjD
   2Kt/PX7GUjxf9VRV4BVgWdedCsj0X2TprTVySBpI1tkMgioSsAO7o8pNj
   YwMl0DxQEHhH3/tPmJgfj2IlUvrXnua23RHprllwS2uZYQSLRc0iG5SO6
   b3vC/F5e4ETaPY2vUAn9EM1422eWhrmCTMTGO+nP+S/laV7Duw806BWJo
   el1KwmAxdAsGiQAoLFt6HoqbnlfaTWZkBAIzYYlkiXzuc1uPG7Pc8qSAo
   Jsjsj1rfYtpWhz5KkIzeXFOH2euoT51M2ITWhXdymV3BPcvs36nGR9E2M
   g==;
X-CSE-ConnectionGUID: BNsNpE7WR96AdxvYw/EW/A==
X-CSE-MsgGUID: VhziMjcCRDmB7od0KgoZrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70222790"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="70222790"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 04:02:24 -0800
X-CSE-ConnectionGUID: WazVy7jIR4+pJr0WyyZrPg==
X-CSE-MsgGUID: jZv30saTQy2rNKkIBjKE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197630403"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.229])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 04:02:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] platform/x86: hp-wmi: Order DMI board name arrays
Date: Fri, 28 Nov 2025 14:02:15 +0200
Message-Id: <20251128120215.4450-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The hp-wmi driver has a number of arrays that are getting new entries
and all/most entries have been added to the end of the array. As a
result, the numerical order is mixed up in a few entries.

Reorder the array entries. Split lines for each two leading chars to
make the arrays easier to read.

Add also trailing commas.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---

My plan is to merge the fixes branch (which has all the extra IDs) into
the for-next branch and apply this then into for-next.

 drivers/platform/x86/hp/hp-wmi.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index ad9d9f97960f..f4ea1ea05997 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -63,12 +63,16 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
  * contains "PerformanceControl".
  */
 static const char * const omen_thermal_profile_boards[] = {
-	"84DA", "84DB", "84DC", "8574", "8575", "860A", "87B5", "8572", "8573",
-	"8600", "8601", "8602", "8605", "8606", "8607", "8746", "8747", "8749",
-	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
-	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
-	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
-	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42", "8A15"
+	"84DA", "84DB", "84DC",
+	"8572", "8573", "8574", "8575",
+	"8600", "8601", "8602", "8603", "8604", "8605", "8606", "8607", "860A",
+	"8746", "8747", "8748", "8749", "874A", "8786", "8787", "8788", "878A",
+	"878B", "878C", "87B5",
+	"886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "88F6",
+	"88F7", "88FD", "88FE", "88FF",
+	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
+	"8A15", "8A42",
+	"8BAD",
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
@@ -76,7 +80,8 @@ static const char * const omen_thermal_profile_boards[] = {
  * the get system design information WMI call returns
  */
 static const char * const omen_thermal_profile_force_v0_boards[] = {
-	"8607", "8746", "8747", "8749", "874A", "8748"
+	"8607",
+	"8746", "8747", "8748", "8749", "874A",
 };
 
 /* DMI board names of Omen laptops that have a thermal profile timer which will
@@ -84,12 +89,13 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
  * "balanced" when reaching zero.
  */
 static const char * const omen_timed_thermal_profile_boards[] = {
-	"8BAD", "8A42", "8A15"
+	"8A15", "8A42",
+	"8BAD",
 };
 
 /* DMI Board names of Victus 16-d1xxx laptops */
 static const char * const victus_thermal_profile_boards[] = {
-	"8A25"
+	"8A25",
 };
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */

base-commit: 9b9c0adbc3f8a524d291baccc9d0c04097fb4869
-- 
2.39.5

