Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E2390205
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121611; cv=none; b=sNaeFX8Bgk5cpYX4TG5cweTXXqOlrDCcIBdl2ykeScuQAM8qweE8YeuehNpgfSm5lXbJjIfLGzJRT5IMlhe7DPYcpqmJg2gUM4T44nsh/UByaw39GEKtSeqJzK6/MniM/Thknkp/ASNyBMQYAGHFk/HnfaQ0J2eSvzIZtUULnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121611; c=relaxed/simple;
	bh=GxIvcCVhCt308n4YpGYSb0pyx5gI+weTYg8N63j1whI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUhKgCsv/uggc7gRWgWXwiFsmJDtRZb5s0YD4Z7kGayrZGDWjrASXR11xzqqyyyIz9VdTG/+lsm7QH+ueVqnRlEKZTrw/tz6VzsQ8AtzWgMhFbvV+XQZUBz+FxFYrziJCWYFgTbSFJz/tidmtpLqLoPtOkowK83xxhXac7PLJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnTRsuTk; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnTRsuTk"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo6558837b3.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 17:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790121609; x=1790726409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4php9BjbPBDqSY8Hi74vfy/uoxpmggiZhREEs3JVmig=;
        b=jnTRsuTkkMtOS7qH+ZgCioK3dBGgfTOgreDuHlZgmXhrHISj2aZ1Clx7awoWwa6BLf
         7vrKOdoUrlgwrPxSVkwqjL3wKkzar/X+t1CZe0YDYSQke+pS5tMkgsdgPL7jFF1+zWqa
         piiUGPeCCTZ38M71BxVdRUhmbP8MyzkBjSOsFUpCBwXNmxMrMBX6ZxOSIcywGBw6eJmd
         LcNZTn8PSx1EubLpdyNZtc33gcDbdmxGHpf7ByRbvt6pNUWpjlWoLeFScjO/XpqcpCZ+
         2XTLTP23mWV/b7koje+ank6+uqwP749aq2v8QXgbcmgpJsnzl7+xI6NWkRXjYajqK6kz
         Okew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121609; x=1790726409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4php9BjbPBDqSY8Hi74vfy/uoxpmggiZhREEs3JVmig=;
        b=uXaVYhegF2gYmXqY/WSBxsZC7UTJETaaoQsitnKuAUFsp8Ue35sqFdMfGvGGIXRoum
         ZNjNTAmz+GaJtJ+IwX0OEX2jadpNuM4j2pvIt0fpGqpuaj2ls2gYI8WxC6Xe46nmKzsR
         h8U7ueHoiQXlbm27EeKEVoGUdhgKSYzlaiK1bp8E7PeNvugdrMML0hn8bRGSkkINbhWW
         2oaTi8b2AWjIs0eEOTGAT3LZnunmiNpxBggKqI94ECgnMwfghzFp/kl+JqKwctIQg12y
         nMy/A6k8JFHRMfb93hle75P8lJ/5+iFicgqLasrBitu94JziGhGbg8UJ6h5tmdbY150t
         dT0w==
X-Gm-Message-State: AFuF++nePGMVzdjAT/Jw0MJOeEIU/CFN0pRZ2yhuVbwRNM5ald/d1+x8
	vof8ALeLNeMpp2wK88Bf0GdXwpkwlENEq+Y8kzZGmQE2eYDtRVgZgN3LckX5
X-Gm-Gg: AYBFou2jvUkfWXUPbHtyP9ZF/jqIynRLTlX+FLDBmHT1UBsTQB1zm6xXlxGBE2PapqY
	d8R6XfBCQJ0iLLNZZZvHc/0sv70Qia2C1Cd0QkF0hk1afLCSHD3qhTnpOzXqV6iGtB7qSn5x/YD
	oCS7x35GsZyqRXE9dnRaUxQmpjHplPtiaX2C+9yXsZxxLdFMVn28R9bGi6svxuIXPCoHeSlJX49
	cHYqM/pnXBnThzsvGbU5BuLM5xZQ7EJSTlzHjuyetgT9RmGfSIs6sujvyPpCi141tPKF0p0fsiz
	Gxe8R3aj4OXhgS8R/5hYt3fkW08tpRfXBCqlqdikdHNlv6CnV3uxO0Jxi3IUfvTL0Q5dV7JRpPy
	vNPInkdndtZwdZw8wX0yoVY1uZ7aGCVFFqSQs8EQ0N0ICKhZZCSAAci1ZeSl6Vj9fiOIc4ldNd6
	e5DNx4Djd9ftex+pyZ+KXnU+Aysh5g+8vxR51a97TsT2DvxnDxlhDUFjDg
X-Received: by 2002:a05:690c:60c6:b0:89b:ce1a:c0c with SMTP id 00721157ae682-8a45b5904e9mr5603717b3.49.1790121609304;
        Tue, 22 Sep 2026 17:00:09 -0700 (PDT)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4662b8293sm3850407b3.29.2026.09.22.17.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:00:09 -0700 (PDT)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH v4 2/2] platform/x86: intel: wmi: Remove redundant callbacks
Date: Tue, 22 Sep 2026 18:59:54 -0500
Message-ID: <20260923000002.1799245-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923000002.1799245-1-svav2021@gmail.com>
References: <20260923000002.1799245-1-svav2021@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed redundant .probe and .remove callbacks from
wmi_driver struct, as they were print-only and unnecessary

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
v4: Added missing Signed-off-by tag.
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

