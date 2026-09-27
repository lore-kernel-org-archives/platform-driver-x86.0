Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259332FD1B3;
	Sun, 27 Sep 2026 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538229; cv=none; b=m0u3sGg1WLTAzX7ZLE53ih7V8fY7DfzUed+vkkh5ENRu0P0qkYXGdenZMV652NpsXu+A2QKxqlhIrFGrz1ANlHjW7//tMICu3Mq2TbUDDgS/l5a+VBofX71Nf66wXKeQ85wknHBzIyi7RjjB6GlezbNdxS7vUqm81N88cufT3w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538229; c=relaxed/simple;
	bh=Dd8U9uZN1RG1atHceZUg0OvJt2exxnwyliPULgPgN1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPaujHHgQzelfct9XxA6bAPwC6ixmWLlFPAMRGUVTPvqOFy0kA2NElnBGYFxNyGobbHf9BuqOCg+6XrebHaS8kcHTeA5gTQSfiNbPPcyvTLRVT2tN17wQDmuIKkfyq4fM9qc44PiYbsCo8pnpltY+uoI958Vd9PZx4REhR4DMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6Gb5TGA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6Gb5TGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790538227; x=1822074227;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dd8U9uZN1RG1atHceZUg0OvJt2exxnwyliPULgPgN1M=;
  b=m6Gb5TGA4mLU92WH8ghYLDslu1qUnNNwvtPGilOnPOP+O1WDyt0pg7HB
   jbbSe7f6TXt67nYHuCpr7Ymp/vXa+QkkgZmDb41ySboruHwWYpwSmyUKj
   iiuyJF85/08bhRyEn15Y2EeLbdX4tUa6v1mtpVZRGHR7uly7hqqzEGBYS
   Tl3//luB6NcGAtH92+G/SB6k0eSoDMPhWaERi2S9o9Sh5WRYug5BB6+K+
   +nCTy1s67ChYxMuHw7jNMSn0jAqMQTO/njAlF71kIbcpTYJQRS9nt8H7d
   dW9QFI/AnH6nWs5TJpJjorOZ3GoaNGLFxRKhBz9OkuGpDd9hmTVRXnNXU
   Q==;
X-CSE-ConnectionGUID: OQUMlRPIQtWO0yjpMBsXDw==
X-CSE-MsgGUID: bO31FB14SDGMJ0d+RZ0R7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100577258"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="100577258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 12:43:46 -0700
X-CSE-ConnectionGUID: SUgP0R2MQGSV3xqeZrlWlw==
X-CSE-MsgGUID: 9+JTmbowQ+a3Fynioo/cdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="272661564"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 12:43:44 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3E112121B9E;
	Sun, 27 Sep 2026 22:43:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xAumn-000000060HF-11th;
	Sun, 27 Sep 2026 22:43:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/1] platform/x86: int3472: Add missing MSI Prestige 13 IA+ Ukiyoe Edition
Date: Sun, 27 Sep 2026 22:43:45 +0300
Message-ID: <20260927194345.1431026-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the MSI Prestige 13 IA+ Ukiyoe Edition, which has the
same camera configuration as the regular Prestige 13 AI+.

Fixes: 621e4f762ed6 ("platform/x86: int3472: Add more MSI AI evo laptops")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Compile tested only.

 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c53542465fb4..466e949b1d14 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -506,6 +506,14 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Ukiyoe Edition A2VMG"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),
+		},
+		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),

base-commit: c0a6d78dad3af1def80f04df82bfd70456ec406c
-- 
2.47.3

