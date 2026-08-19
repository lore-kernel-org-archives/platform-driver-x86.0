Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697223C5550
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 04:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787114603; cv=none; b=FbiKJHU5jCTn68MYUNdqipNTsMdoBiUfwyYaJ10A5vAJb3BWkaCgJ9ydDPLqOv3DNnsAgx/0XE4Wz1+ubBg+f6lmRB+Q0dMh9M0yny17pliPWFaturzVck2GISEYWkl5SISbz8UsAR38lshAwPGYLj9hkMJUn7etKmHRBxpg3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787114603; c=relaxed/simple;
	bh=JEAe9srNmjvzDcrqs+JiMuk9eXJf5qvTWfmseJ4uqek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+8jrHzC2fj3auhG9NB/BWjkjO1gDyK6ovFswLIRuqhZ2WQv2tXMljGC18AFAdm4TId6RQCutc1nTI+nT6LJSAA1ClGk4diMB8giOY8/RFi2haPJFBQyCWqLbMOzGmEjWUI/dMn6s0ttRQjuGDT18wFdwN3ujqN1+wJHBojYjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiJ8q/gW; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiJ8q/gW"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-499f6e0bbabso455628b6e.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 21:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787114601; x=1787719401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73iKTRosqpTcWrIn5i0E/xoORK81oczG4nyd+vnP5CA=;
        b=kiJ8q/gWIogeKD15VG0nDUW3W1JH1AiwACuUBEIcbOXtchUs7E0doztFKsOe4Nj9WE
         dU4t3dvKtE74aZTOmB7yOjjQFPgl1peyjoa6Wd3eZFuJrBWZnkhXVOktQ1RqEYBndOBj
         NPGi1ukfWwnWtHsfdCp+yaB27JoY0vK/PnCIoFg7cIAoYWLwxeG4g1J/1n9ob/WxEXe0
         JIFzHuQEfBmsD1vDRRTL5Ee6S1RUc4fCiM0wA8oarbD3HDrNaR4Ac1oVM2Le8HZ1W7Nu
         zVPWuYh578u43vJebmNHkus2Tao5O+4whdAUNaxg8hR0cLgFOK9qzHBHZZ1jGVLlESrT
         1uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787114601; x=1787719401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73iKTRosqpTcWrIn5i0E/xoORK81oczG4nyd+vnP5CA=;
        b=iXv3rSIKnQSUjUiRAHXjm3EIKlWhcqWCtRrERONW2Kx4C34aPvD+Rhs5uXQl6qB9Ix
         Ti2OyvaOddiINk1cTS91ZCs2QmpDYi4rWXQyUFGlL2YTLQyU9dFxYDG95QsLTwMtsnHG
         1QRGC54seckVJ+/uuyvhULHpZq3IeW22yrl8+CLGdLiuTWyybjN7Q3SW1/mxLCZl6UdD
         5Es3ZOwitBS5bqZc+XUaRbmmjYJrHhDvfnPbylatOVl1zumjVjsDS3zrrTnqz1yDFXdv
         /73ORf7SXPbsYkTsC4N0H+ZK5oh0UbtiSPhufMAu3QqQZr6hqcC8NDoaFxQCLCGiSJwE
         ie1A==
X-Gm-Message-State: AOJu0Yy6TLvpUPnLEaD/tPeRO2JX250/APmeBuzmX2gBJZiGX4Z/f5TA
	SUnrpTJPIkOHCsuBFtxOVtV4Nm3/WCWY33YyEfjFu5Ds9ORiLoVXyfM=
X-Gm-Gg: AR+sD11Juz6/z7hOZ8bm6fD6gke26B5j1d56n05InNkaAQM/orIj6WlFuDE4ybmKTBw
	7CQvbNELk3UjmJ4cKAIZ6C+k7KAej+Ar3KBLAAtL/9VvNnX4ZJSibhgXnW8x7msjuBgE4Z9+CLB
	CnyCqoNx//FbCEG6PDiKilWnCXQeAFlzspP4KrxJg5XSLrWgPHJsDPHeDcVqyQSMDvj8/b2ClQc
	QQltvSeX6l878yvbKyIpTjkSVyK6/c7m3ZcUGgT/ZzL9NPRB5/VpSYl+ecIZnrmKdHXPZKTbnut
	Ul6IP7LrhJOnuLNAcTSkWRRudZr2UKzLG1k5HRt/G00d0THmed5Iz96rdOax/MRM2fgiKah/U81
	l7aOlnRDJnD6/2khhmg+KcKP5TGtG3RiIjd3lenq0OoliWIwL4x+t+P4L1kFBCRWMWRie4E1yIe
	Bn/VCh5FHo7lSgPkh3tRobDG6jnbKzCggAxZ3ebCEmHPkDOooPUFCtRNn27t5hb8tZ
X-Received: by 2002:a05:6808:c1d8:b0:497:d3d6:6a40 with SMTP id 5614622812f47-4b2bc8ea2a3mr1604295b6e.3.1787114601350;
        Tue, 18 Aug 2026 21:43:21 -0700 (PDT)
Received: from 3511.tail24ee18.ts.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2960e32dasm5146932b6e.15.2026.08.18.21.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 21:43:20 -0700 (PDT)
From: svav2021@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH 2/2] platform/x86: intel: wmi: Remove redundant callbacks
Date: Tue, 18 Aug 2026 23:42:51 -0500
Message-ID: <20260819044313.335043-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819044313.335043-1-svav2021@gmail.com>
References: <20260819044313.335043-1-svav2021@gmail.com>
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

