Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208170;
	b=Xj8dbh6cmwh1VhMVDhBWKQs0e4oyJM3S5SZH9vv5Dh3q+kENNHWoK2MP2LI0XkGrCV+r
	 cfMhishktuA2Zxo64hT4HzPwPYOBELTlp3wY1HOf2mPx7sx1Df9n53uhJUdToDU0YY5oD
	 z9XZkmApxmLdRrog/H4JueWXKFK1yOmwW1EQLBzPJmOasdVmkWAw2Ea/Y4sf+ncxRfrcE
	 p0M81Jj4Dm2+qrpgLuRD0jJ1f8XuKXtwe145jS+XHUUzfLDPGLSLWtqW9m1qsmTAzQ9R4
	 fvhu2SdZP3PyU0nLcUNKUkamDWr5r6Z+ZLxsBV04K504gICND7khCLQ8UXdw2u5xYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208170;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dX3MnVsEoRQY7MTMEerrBydFvE7qWK6YdREd5Ee23RM=;
	b=5BBULwS5kmhnVDXQKL/+iNH0fNawCAWjFO+SZ0VvYKhhZaPGBjHTzldHmNw/HFYMTQSi
	 vzJ//EHVHFd4+hsb0mFlRDtgOCgrmSdFgkt5+Sou+n/KwAnO5i7f579H8BgGirrw/8HMn
	 /pmdZUnJnI76s3FkhkKoQOo0wkYzPzYRaJdLD3pwejGbSG/53u+sgcAuLhDJJvmYHgnje
	 N7CE8vN88QBoThZD5oCLMUgXNyyw0lGVY7RFjAXJKad30vmuMVA0jobyWfYpgwomEvSuw
	 5+UuPfjlkEVaKWm07+n1vdy0zVhijzQcv0i85x3yzxdzf3+QtFSOe/hPYfL0fS7HKTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n6RHPC7v;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A2606A695
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7A2606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n6RHPC7v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208169; x=1826744169;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TyJ53LuPqkQPnbRdszEy2APb37wg4scl1rSpniqjTrM=;
  b=n6RHPC7vHpYINvWzUYYSpIkItJRdi66y7F4ZE1iI3ZGQEARgnU3GX3IR
   7IvxeOPpyzd7ccVBPrpn2DF/GNx0FOhqcY4K+dhJkKuL6cG3UlYWLYwuQ
   79mmXqsZAdFU8vvOND0nVeWrMv9719kkW5bLnoxJ8n6Jh7pSrfXIxQBjJ
   ig6i/JPTgMpJv4B8QSQ+3RKpifUsT6dTZvfLPsXLO5xtyb5xbvU1YcUS6
   0Tp2SEpM1DsrUAKfuSu9cX3nV+hDbBmG5/UjjiAOHgDceI2TTqPlWGXz0
   FZIcI2N8w7kTX48g37CGai7i0qir2G8ooaTWhJGARp31fjm0twuXfZV4p
   g==;
X-CSE-ConnectionGUID: a3JkwagBT7Wy8X7GDPAXUg==
X-CSE-MsgGUID: pMZdnhdkQs6tTEqHnQXHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136385"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136385"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: 7W09RHCpSX+CTdJK+AHdkg==
X-CSE-MsgGUID: txXXHRpvQUakxrNilCMnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908714"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com
Subject: [PATCH v21 09/19] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Fri, 20 Nov 2026 12:55:49 -0800
Message-ID: <20261120205540.1220643-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

Rename generic defines to be BMG specific.
Define several magic numbers.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index c0e06b2aeca6..ebe56c85bc05 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -90,10 +90,15 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_IDX_TELEM_PUNIT		0x00
+#define BMG_IDX_TELEM_OOBMSM		0x01
+#define BMG_IDX_CRASHLOG_PUNIT		0x02
+#define BMG_IDX_CRASHLOG_OOBMSM		0x04
+
+#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
+#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
+#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
+#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
 
 enum record_id {
 	PUNIT,
@@ -122,29 +127,29 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = BMG_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

