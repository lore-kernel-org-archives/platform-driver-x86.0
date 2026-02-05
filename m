Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2C2FF677
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Feb 2026 23:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333420; cv=none; b=G8WCHe1KbL7Mvai7Ni10JVOzDnCFh5CUO+MtECkf5ejK9dVqauRUSIL+Xo4m1ageVPQpWmFYUXX1ewCnox17cd5vzNTtlxv5s3nmDQzZnhZyIc5rnSpHfuVuxByGRSMeGNcC+ySIpO5WgVaa802nQ8s29wZ57Zm7TZ6dWN29R3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333420; c=relaxed/simple;
	bh=J9TIj5Ts2K3gT0L/mZVEAbU7gHVGJ8wVjo/l8Fie2FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJ9iRdPUwYtxyuH4YR9e/ozEqkLRU46FNQ2RUV6SJ4WV4pTvm6f2i6UGACNnbjbwot6csHwKcENtKZVvna0aJAEUBdcu19JehfGh0ETWCnGhd2UVAZ5rfY4s8VmdX+XMT+KQFdPOZ3JxAzACFCLzu3Ko3qsIcYz2UKth6/8c75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEcc+lR8; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEcc+lR8"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c7146b0854so158535985a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Feb 2026 15:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770333419; x=1770938219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG0eGMLsEeSmn8iXh1upEUQW6mo19hJYW/XeOKWAncI=;
        b=nEcc+lR8wQUaMVIbmSrVRsKa7fnzQ18sVPku93tHTz2H7Sy7KgH7onlBaTs2B3MTrt
         W2oRa26SAtWNiNHq18OqNEiVOfia8csrNwYlIbEQb/mHgCgLrWhiQKNkFDtG4Cns2oVU
         jLkHrPBxlcDkIU1LjAC8qUZMycHrfojOsYFEZ+aLv6e1zjr2JFT25QSHCWIJCrDxr5JO
         rBdTzEsteWRuVcmAlEVLqf5ZYnmWirw08ohFzvgncJnLvxFS1GPV3rFVI1n9fjivczmI
         idNkehVEm8sYIATgigPYwzEFeTnqq7o+BpzfujYOB3pIIyKR2dacMVfAI6cS+WAUmAqy
         2DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770333419; x=1770938219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KG0eGMLsEeSmn8iXh1upEUQW6mo19hJYW/XeOKWAncI=;
        b=VtUPCYyG3+IfPEoXh1669olGBMHJRu/w3nT7V6lRdrGqnTd6XlyEJADeWzgHOSihuV
         ZOol5nVn6x55Q2vWWKf2gRGAi031rVvofuM14+cnvILBvNdf2xwS3/EO5aCSwBdOzCu4
         7CVAMOD1F9AFsWYE9oz+eSTll96qDD+9/3SaVsNkVNCEpWVMsOd8mqJlx11JKFKLsoIh
         fNhm3SuTxV9wQmwbXpi06Bvxwd1OypG9lphT0hIOzsEEBkcxwPubYGnkkae1Jaxyvd0D
         yknAgOF4FLEOnLPClh1JuRBeuhkfXtbU9BRqB034l/HjpIWvivQackV1yOquxXcS01Yv
         CJag==
X-Gm-Message-State: AOJu0YwfBGEiuSTyxFHYeFYTbpt4FuppVRRCt11z6dUYKORKbH/vFwCe
	qAsSOC1bc7tKfRKPa7B99RVjPzxsJHZqlqACDqe8zjgyzaB/GXn6796+
X-Gm-Gg: AZuq6aLJ9UB06Brz8aonPiS3cAwUA+F5priyOj0BdrDVlJumOOQU7WQINYEyvzJxK10
	6FJX4DjorjVjX6T+oRPIE8qZRKiOgdugDezpRWMVPhfEYnsrh7W1k8bsEuVQlRgxbY9kyb9GRFW
	N0Brh+YzXNlIoQ1yYJia9yO3rln0PsQXXHuAghPrtIJikhu0XC77T2zFzzW9ivXxuI0Whn8IQ/5
	4Y6xLeOAuVggW9erJMHHX6UYGTUXFRpnIsQ4dBTJWTv1IcpweNyO0lGX1rNOmjxfIxXdC3V+aYV
	bgIKx322BxnCv3RNZ3B4eFv/8gBsgqZYTBeHZKrznvqqjMSvPSn6GtunjLB3gax6xJGJu/WCfSr
	JJW72uN9VUEJ2RaC1ZlkWBAeJMLybfy183/ey7Kng5URt4JHH0o54JAnV9eYT2WEAmq8dl1Njux
	dTbw2ARdbRe7/bI72YUOlqGXonp9N4gJCr1lDUie1v6KVZ4UVTFRksYFO5qtooK/4So2EuVMLl8
	X2rHA/37OZS/CYVrDmVHXA=
X-Received: by 2002:a05:620a:46a1:b0:8c9:ea1c:f21a with SMTP id af79cd13be357-8caef40967cmr98573585a.9.1770333419238;
        Thu, 05 Feb 2026 15:16:59 -0800 (PST)
Received: from davidm-laptop.home (hlfxns018gw-134-41-57-104.dhcp-dynamic.fibreop.ns.bellaliant.net. [134.41.57.104])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c055458sm5594386d6.38.2026.02.05.15.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 15:16:58 -0800 (PST)
From: David McFarland <corngood@gmail.com>
To: David McFarland <corngood@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Alex Hung <alexhung@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v3] platform/x86/intel: disable wakeup_mode during hibernation
Date: Thu,  5 Feb 2026 19:16:24 -0400
Message-ID: <20260205231629.1336348-1-corngood@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <93b91d70-061b-4db0-a82b-2da5cab67fbd@linux.intel.com>
References: 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a freeze handler which clears wakeup_mode. This fixes aborted hibernation on
Dell Precision 3880.

  Wakeup event detected during hibernation, rolling back

This system sends power button events during hibernation, even when triggered by
software.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218634
Fixes: 0c4cae1bc00d ("PM: hibernate: Avoid missing wakeup events during hibernation")
Signed-off-by: David McFarland <corngood@gmail.com>
---
 drivers/platform/x86/intel/hid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

v1 -> v2: fixed bugzilla link
v2 -> v3: changes suggested by Ilpo

Thanks Ilpo for the suggestions.

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index f25a427cccda..6ed85d48ee93 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -406,6 +406,14 @@ static int intel_hid_pl_suspend_handler(struct device *device)
 	return 0;
 }
 
+static int intel_hid_pl_freeze_handler(struct device *device)
+{
+	struct intel_hid_priv *priv = dev_get_drvdata(device);
+
+	priv->wakeup_mode = false;
+	return intel_hid_pl_suspend_handler(device);
+}
+
 static int intel_hid_pl_resume_handler(struct device *device)
 {
 	intel_hid_pm_complete(device);
@@ -420,7 +428,7 @@ static int intel_hid_pl_resume_handler(struct device *device)
 static const struct dev_pm_ops intel_hid_pl_pm_ops = {
 	.prepare = intel_hid_pm_prepare,
 	.complete = intel_hid_pm_complete,
-	.freeze  = intel_hid_pl_suspend_handler,
+	.freeze  = intel_hid_pl_freeze_handler,
 	.thaw  = intel_hid_pl_resume_handler,
 	.restore  = intel_hid_pl_resume_handler,
 	.suspend  = intel_hid_pl_suspend_handler,
-- 
2.52.0

