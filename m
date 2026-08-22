Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911C3793D2
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420446; cv=none; b=Hbp0v7XB3pHKlphiFljdRH6Ml5LLN24lx8KYHshywO2EX14lJCTkvdGiS1wihae9jfvPzVSA4MipGIWKiLBb9S5fJzpwLUm/Q7/zU8o5ou3M5TyrlcgoreQROR0NrbcscW5zL42LNeweuvbFQUkAU2kP2oUKHbQrR7m6QtoJ4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420446; c=relaxed/simple;
	bh=xnGVJa85vmVZe4tsfuxRK3FUAPquVfbmcers119XiuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2prKDRAJY28QgxFKfzdi9+zKQjmHAu9nEGIedCpWiRjoCdhYhelsiJY22pPR82HTVqqIxkohIz1R0vGrpDPKb7qwAELk+VgEToT4GGLty2sp987FTBt3XkHoPECdHupyMbNOYtGmigMlFNWdUnweunJKe/DTwp9fFGQG0MM9MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtcF4NrT; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtcF4NrT"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ed2a06b9eso20977947b3.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787420444; x=1788025244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1V1xVw6nEEDKh3XLZMot3xi5sHQ1SLhr6/bbpeFk3U=;
        b=WtcF4NrTq9z9PwlXr7ZfnSs8RtMPQy3uniDRIDWdze1cVn1NDcOSmHrBipDr0/XtcL
         5M0I4IwR7zVkroZvdlGvhcVngXxRHWSwySEHRoCDN9zfLArumGgXUtGhtLdYuAjEIhTG
         NuFAGI5/gUnnaX4bqFAbdDcJDsnFnqGfvw7pTdX8mBCkLT0GTwY9LqYqqn+ra12Qplrw
         vBTK7i0Sr8yfkPc7NnV8a9h2l90DQhurMapTxHsFsHpOmSKpdxuRCamrhGsVN92CwGZE
         s2rHmQ/17CCt9wI+7WptHHZnWtCKjL1xva612NpZ8kUtUvLvLzsonE6oH2GiEycVcz7h
         57og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787420444; x=1788025244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1V1xVw6nEEDKh3XLZMot3xi5sHQ1SLhr6/bbpeFk3U=;
        b=WtQI8b7+2DzpZq+R6xcJvyU1pfeiSbOWvtFoHGC4cjpi6CJDU2ShPFpSAAjb3t88Hs
         l/gPdQDxTpA9UsscLBMDrFrP6AwrKHSh9Ps/XcKYBHkaTnlEBr+yUlBq0RMHRrYOWTSY
         T7RmDxJlZ9KKa+I+c8V4ZczlL0crO4S6jlvACXY48qgvS2SzcMTscLkoVln5Fn8D/oCF
         Jn4xTeYKIBI/xu1B9umZk4UZrDAX1VMLhBvhz7PH0i7ZxdWubFEHbm8CKsaI/jVPDqkI
         /dl61TSJ7ngd9TjB81Uni3HXLo8w9I/r5QDzlhMU6vGvVd4woqyi+0DxZMFZ/FMNtmDz
         wSXA==
X-Gm-Message-State: AFuF++kZzLwnzKf2Q8bMLUO97uta5u362OLTAjBpFdqra8NuIlyipFmx
	Q+/qnunRXBgIQcd4KwSjlq3SShrLLVBXlBnKnFP+WynkTHaeg4tzM/s=
X-Gm-Gg: AR+sD10NzDiC7t00pwJOwKWt3RiugB6tM09pqc8nqN4Rmac9KESFLf1V7wXWftED27A
	bXB1PyvKFengE7s/7zSyLsxrCT7yZ3ysYUsd4HRsOv81aS0t8xTFpBDZEWcqekmuzlR6TAOTy0a
	f5hSkpsc4JsAjU9R7d8Rc7gVmsvWrgUJYTlc3fCMMaRNxv9yLJXyt7U8cZwqlkyJkJ6Jd5KnFUg
	QXJCknvRSEEGqjvZiPn7/q0QUJQG6VzNea0Mg7GQpiX7wNhBnRxPAyrAZmWXSUDqemZNFxX2oBq
	7RuFP9a5q1msUVDq/su+AMt4yNfHzhr6+i/P1UmwjCYZ+KDUYpTiZhPXxWXyLw2IwQadBGt+U0N
	AfSOdxXeUP8YQFRzMuZVF+pVxXan829aovb7UI3GYN5d8nyglRMJpCR1O1yeETVrfWidSLxt/da
	37ALFzpNwwQjzc1XIR5Y/ORg034ESkFgU1smFypwz/aNSEaLceKJsytg==
X-Received: by 2002:a05:690c:11:b0:84b:3b9c:218b with SMTP id 00721157ae682-84b3b9c2bd4mr32602127b3.35.1787420443970;
        Sat, 22 Aug 2026 10:40:43 -0700 (PDT)
Received: from 3511.tail24ee18.ts.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5c2c861sm12816727b3.12.2026.08.22.10.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 10:40:43 -0700 (PDT)
From: svav2021@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: intel: wmi: Remove redundant callbacks
Date: Sat, 22 Aug 2026 12:40:16 -0500
Message-ID: <20260822174038.619473-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260822174038.619473-1-svav2021@gmail.com>
References: <20260822174038.619473-1-svav2021@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arav Verma <svav2021@gmail.com>

Removed redundant .probe and .remove callbacks from
wmi_driver struct, as they were print-only and unnecessary
---
v3: Resending as v3 due to git send-email formatting error, no code changes have been made.

 drivers/platform/x86/intel/wmi/sbl-fw-update.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
index cfef71f4f3284..7e07cfab227c8 100644
--- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -93,18 +93,6 @@ static struct attribute *firmware_update_attrs[] = {
 };
 ATTRIBUTE_GROUPS(firmware_update);
 
-static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
-					 const void *context)
-{
-	dev_info(&wdev->dev, "Slim Bootloader signaling driver attached\n");
-	return 0;
-}
-
-static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
-{
-	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
-}
-
 static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
 	{ .guid_string = INTEL_WMI_SBL_GUID },
 	{}
@@ -116,8 +104,6 @@ static struct wmi_driver intel_wmi_sbl_fw_update_driver = {
 		.name = "intel-wmi-sbl-fw-update",
 		.dev_groups = firmware_update_groups,
 	},
-	.probe = intel_wmi_sbl_fw_update_probe,
-	.remove = intel_wmi_sbl_fw_update_remove,
 	.id_table = intel_wmi_sbl_id_table,
 	.no_singleton = true,
 };
-- 
2.47.3

