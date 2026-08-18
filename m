Received: from est0.einsof.dev (est0.einsof.dev [212.56.34.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52745FFAC;
	Tue, 18 Aug 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.56.34.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787075966; cv=none; b=sFOi3uYjLz8MnPp6PQuFcc15Qa9stkHjvGwhK3g71BdzIaQHXCPUU1FG5I69jskwxjYxS9ReeHONndNWqXtATIt8SJJz41I4V6g3fMcfclUXDaR0qgxYIiDgiXnSFiuwolKCeV/Rb25suj9EUKGphMqGG3cY3lUlxy/GfRtrCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787075966; c=relaxed/simple;
	bh=XfoFWTtsnh0ySWCGWl/2MoS3N7dXGa/++gXzGFUePEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pevphsX6jjPWqcexIfTycjm/ST/JEjIvQF5l9MiJqPOcc6toCIUqADP82j4ApChcqm+h2GjsubDXY+6KyXeQ74pQq/+7tD5/56BCvqWH0NtxuwcZWJS624GHYDb5LKi/Sy65DfLddGLK1gsqM32GLTVNkQhq3REY4V9ZYKr3iQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=godjango.dev; spf=pass smtp.mailfrom=godjango.dev; dkim=pass (2048-bit key) header.d=godjango.dev header.i=@godjango.dev header.b=O44VcG3m; arc=none smtp.client-ip=212.56.34.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=godjango.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=godjango.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=godjango.dev header.i=@godjango.dev header.b="O44VcG3m"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76AEDCC9A70;
	Tue, 18 Aug 2026 13:59:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=godjango.dev;
	s=dkim; t=1787075962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XYGNXOfE5EcMcUb3wYdLLmDJqxifJUZiEGh/qbJSCHw=;
	b=O44VcG3m5yFFy/vRiUVUiERrIy2YKECCagCu16Avu5ZmP0HQ3mrzXz+DDiShVjwes+wl1A
	vYU4icVw58/NBY5eNX4yGYwZB0Oqln8PfZdM2RWdv5Gpe/WLAX9kfJyBogwrbB76dlrgTK
	3JH+hTkjS0ACvjbElyI/zOBZGbLCtca6HpZrUFB6yis+OdLvm5XF2qvPJ1qdYD6hz/e762
	6eFTZ0TqbjbVPk7lFv6TB4m5eFG3SsufvSRPuO6srZcIxARZ7jVOi36V18KeeKVF7OERUx
	VGtZUYq9+V9qaSO8X1jTXmYkh4x5hA/23TzD8n09NFE6JAn7Ne4fxpNTINFjYg==
From: Luis Miguel Arias <luismiguel@godjango.dev>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Miguel Arias <luismiguel@godjango.dev>
Subject: [PATCH] platform/x86: asus-wmi: restore battery charge limit support
Date: Tue, 18 Aug 2026 13:58:14 -0400
Message-ID: <20260818175814.65757-1-luismiguel@godjango.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On ASUS systems where the charge threshold is supported through
ASUS_WMI_DEVID_RSOC, initializing charge_end_threshold to -1 causes
the sysfs attribute to return -ENODATA. This makes TLP consider
charge threshold support unavailable.

Initialize the cached threshold to 100 instead, allowing userspace
to set the desired threshold normally.

Tested on ASUS with TLP 1.8.0:

Before this change:
* charge_end_threshold = -1
* TLP reported no charge threshold support

After this change:
* TLP reports "charge threshold" as supported
* natacpi (asus_wmi) is active
* charge_control_end_threshold can be set to 80%

Signed-off-by: Luis Miguel Arias <luismiguel@godjango.dev>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412..87363b198 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1586,7 +1586,7 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
 	 * platforms retains it, therefore signal the threshold as unknown
 	 * until user explicitly sets it to a new value.
 	 */
-	charge_end_threshold = -1;
+	charge_end_threshold = 100;
 
 	return 0;
 }
-- 
2.47.3

