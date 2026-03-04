Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F91E86E
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630776; cv=none; b=KeOxmkgmLqIXk+f3riRSptwVnqlkoBUo5T349X45zTwn+WFKT8X6vSH3b/l+UsIoGHKDq3qRwigfQFt5vHXorjMxcjAtzLFQhNdRNv860SVHcsFh8urUygOkIWN7pyhH84Npqk9uaKVDaRaAoTE7CuCy7pVPr0u1y+ItH/0qDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630776; c=relaxed/simple;
	bh=KRgUIWvMKXMRJXjwh0B2hspVphR4IyYGptKpfpFScpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCxxGzoPUNqPXMaPXDAgrtnbE8R3dZoinwaPVWcbqa4dJAMiGbUgJDzyrnaKVKO8yaxDQvyPaelUryf2HEu/6g/VNsTcdLLCCCzZochlgShE/X/kz0mJvuQ8NpT7T/H+L9XBPpLvEyVXoLD1R7pI40cHxHE4kmDQNvCaqSvltKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YM55pbv2; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YM55pbv2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772630772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z6VJ7O+N0TPeJk9kA0Jz/dG7vHPRZYLPMLfYr19uMFk=;
	b=YM55pbv22GLVzqYjCzwEzFE79R83AHSomPi2HyPjol+RMcZcDzKTOFClGF/lB6YUltEtGm
	TCtxH16rWfRnPndD08s/H07D1V22zis3hZUK3tVPZdHCkfc0y3CCiKCbodvvb6Isc47BTY
	MFSHmsqtxJnoT4brWsTBF9mIMbUnaPE=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH] platform/x86: asus-wmi: do not enforce a battery charge threshold
Date: Wed,  4 Mar 2026 14:26:08 +0100
Message-ID: <20260304132608.33815-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Users are complaining for the battery limit being reset at 100% during
the boot process while the general consensus appears to not apply
unsolecited hardware changes, therefore stop resetting the battery
charge limit at boot and return -ENODATA on charge_end_threshold to
signal for an unknown limit.

Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6ba49bd375df..dc330a8ee2f2 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
 						 struct device_attribute *attr,
 						 char *buf)
 {
-	return sysfs_emit(buf, "%d\n", charge_end_threshold);
+	if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
+		return sysfs_emit(buf, "%d\n", charge_end_threshold);
+
+	return -ENODATA;
 }
 
 static DEVICE_ATTR_RW(charge_control_end_threshold);
@@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
 		return -ENODEV;
 
 	/* The charge threshold is only reset when the system is power cycled,
-	 * and we can't get the current threshold so let set it to 100% when
-	 * a battery is added.
+	 * and we can't read the current threshold, however the majority of
+	 * platforms retains it, therefore signal the threshold as unknown
+	 * until user explicitly sets it to a new value.
 	 */
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
-	charge_end_threshold = 100;
+	charge_end_threshold = -1;
 
 	return 0;
 }
-- 
2.53.0

