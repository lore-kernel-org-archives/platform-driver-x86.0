Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA33CFF6A;
	Thu, 20 Aug 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259106; cv=none; b=fuJbcomCL8c/BAPDBNWQG+OSDHJo+5D83LOUV8PSSYHqHKEuAkxmz7/0hYHIC6MSkD7J4bqx5I+hDUM+diHBCF+8chqkOYH7c8/a/XsahqtxqaYgmoJYXvI9HqqKktg+leeB7suqGhP84pRp51gYYEa1hu47byRiMOOnocwjPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259106; c=relaxed/simple;
	bh=P8DRp5gv9sUMh8QenDUb/36MEsE74vaM9yyX8gJzA3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv4PkfttIe+R5YJomVz0vFK1BeQTwEfCRk4R5g0p8mJH2d7znFdAQndRhceSy2U77NdV62VMuG5NjpU+s04vb8TBIXRZJ+nCp+CDc+U+ebsYbejOzfJiPnIMjZ7vKMPT1XmAN5y7bT5s26WHENZZlOddL9srfJNZ9/bRY5/jg0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtDMb7Z2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtDMb7Z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787259105; x=1818795105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P8DRp5gv9sUMh8QenDUb/36MEsE74vaM9yyX8gJzA3o=;
  b=BtDMb7Z2rdIrPRJ3lfVPcrqgeDxRQsKsHjzrpmu/kG2bSKCio0P8zppF
   ACrUoQon0Xg9xz+FvfrGUhGn4oyv0Zk4QEkWGOeCIckPb7CfYUHasceck
   V13PGMl5iROQF7vSAp96FXIGTabakQneVCPIJZ5KunfAsoFvDoI/CwzK7
   YAZImfZj5CdZ1gcKFT22+s987xoU/XyjcO4Urqp8k4RnOLtt5bRfTdbKn
   ObKJLJH2tGfIphWNVW+rDMwW+sBajRMCML3Y3c9Tw5+jUKOtfywTM4LSp
   /D63f9Y4OiX9jMZCuFGoOkTYOeBR9LbqR0PgiRTor0qso/7Qn7gXB/ypc
   w==;
X-CSE-ConnectionGUID: bkVUuz9qROmYdJMX1sI0JQ==
X-CSE-MsgGUID: fQ36bPqdQ/S2MBWxdbiayw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87868006"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87868006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:51:42 -0700
X-CSE-ConnectionGUID: H2hPWnURS4uCKKJy+gnSzA==
X-CSE-MsgGUID: KxOp7lZ9T2OxMGvuAm4hfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="264844351"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.149])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:51:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 347AC121197;
	Thu, 20 Aug 2026 23:51:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wx9jo-0000000CDC6-1H1L;
	Thu, 20 Aug 2026 23:51:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: int3472: Address Coccinelle warning on an error print
Date: Thu, 20 Aug 2026 23:51:47 +0300
Message-ID: <20260820205148.2910639-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820205148.2910639-1-sakari.ailus@linux.intel.com>
References: <20260820205148.2910639-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following Coccinelle warning:

./tps68470.c:164:58-65: WARNING: Consider using %pe to print PTR_ERR()

by using %pe specifier for printing an error code.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a77ed32abe55..dc777dbac61f 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -161,7 +161,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
+		dev_err(&client->dev, "Failed to create regmap: %pe\n", regmap);
 		return PTR_ERR(regmap);
 	}
 
-- 
2.47.3

