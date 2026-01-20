Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE242E002
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918724; cv=none; b=i9lNy4Uj1Xpa7O8yC+xCRRD+Xp+RCZohPKcamwZ9CYcuUjvqT1Dzs1g1D8fAZIO5wQEVgnz3ZY+8PakENKvTa9gemWLFiDD8z2eRSxXwvxuMCSqyRO9UHMu5SS4SHl0ZWMVyJd0/10mKib9GzVFz0zQrH2QKBldsAyh7iN4jD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918724; c=relaxed/simple;
	bh=JfypU5NoSVLxTmCc6m3bhRZsIW0owE++/8JRrOiHfKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKNRsdBLxAxNesb3HoX+qOgoxDwzV0LVje/vuoCLuGGbgd1w2XN480xfkFlzRTdKkGnwPglgypOs7na5hWGObvw12WEQUPlUn5P1UHVn7kSb5g+SZiHfLqrS0ukPVm233VslQIG91rN58XAsRVWe27Ky06S5MotPBjisIO91554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFqZykvh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFqZykvh"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5029fb0b977so38305641cf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 06:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768918721; x=1769523521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1is6XRlm0ZQ0xwWLUS14cuBkkKeXRGoTHcBmEUlITU=;
        b=hFqZykvhjCZStUnT34LruKenZrDbSEwOId1NYhni4Z5VvUkcddAUW5OEVlj0xqoloC
         B5mPCCU1M4dzTMipA0fhIFcQtmNyWjStUyOMNpIMFkGxz0Cqr7KuWI7w/JbDvqnFriXY
         OBmIu7JS+6bh17sSITDlEIKUnr/e/N98syX2AULg3cmsQ0bg9zondbTC5JDZcf+qOUjw
         GS7ohGFqN22ZW7kvQyx0o1U0n1MODAX+nPDuUCNl5VhBmBbVZmW363uDWfh2BgRW0YIg
         Pk6hUVsPef0EyqsoA6eU4u1++9RJQEG+D3AkeUwSkdSin5bTYv3Cdx6u5hTjk2k0EOZi
         70Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768918722; x=1769523522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1is6XRlm0ZQ0xwWLUS14cuBkkKeXRGoTHcBmEUlITU=;
        b=UhsxeDAfcIW4/pXu6TXqTuNXQ8eu636yicpPeI/5hgRnqg/7wr1XtSgmL1aQVnzUfb
         wzpgKOH8kzzemIk6oi74URW7ZcOynHNJTRfXvkX7P2xb6eAtzSWDr8bTSaagK56cW+rt
         O4weGQXhN7Y6pTeGW9uUprvdcMIdaMJpdNVmLwapcWsCl0CSYhK+gLvXwwEAPdaQXUpR
         rh9nUvpB8bcnFOeJ4vvkPlQuzSlQJ2B/MyPhcPO3H/rCyBAPq/CsxpE8Tx1vajRQ7yCT
         T0qQU+lVK2hUgdA/IJytnel8AdSxLU3x+4OFbk5TSKQPcXd6PjCO8Z3ZqwXH1dKNYRAB
         FnWQ==
X-Gm-Message-State: AOJu0YzM/ynoaEUJsP65KQG/6UqPEVEQlV/O1FwC/j1zj1QNU4sXqngU
	dowh3wU19ty6KfZExOUFjMwex7wVM6HD4vLq2IKn1misF4Nn7bTRR09gYklI40zp
X-Gm-Gg: AY/fxX4pXvdhmtBEh5Yzc1Bbtwd+sc3byMgF1NN23UtGGAUqvErGwmQZCTQeX78CDs9
	vNUub4cmblO86qh8jgklQkuvGjCbs7kbxVFoB95jq/1hvatKqYkrhOsY4Rhnldk9OZa1lZHcqiO
	tlVWOU2bZ4zVMDIhOr3Wk968hfdLMYHXN0FB68wm3HDv8PoJwlZZxWDArNj4HcBL6dKNNtD6jm9
	ou4NLdd23pSg7/3HZb6Q69b6WDydiBQe3r9ARXWeiUA8WFvmi0e0aQzdWlzKsR/SFk66P+9H0D+
	LWDTjgV3kRqS0DHLFTGrAZbuMhY+2hV4PVhvaPz4LGo7ZEILmnjmmlKLPyqI8WC0Hga6r9JTsRZ
	QxxbbNUv/8qhGjSlKu2EBP9QYZtwc8n2x0WVZSmOtvj7MLzL8KnBdQwXeXMGCACDHjat7bydZKq
	qjo1rjVOOjZbj5KzBue8PulcphSi4RgubH7GQDvQhJLtFmN6kCqDKRJAoIJLN/nxvqIOpuOBa9f
	/9WOFgQoQ1iT4gHVz4=
X-Received: by 2002:a05:622a:208:b0:4e8:b446:c023 with SMTP id d75a77b69052e-502a17581f8mr177998841cf.49.1768918721388;
        Tue, 20 Jan 2026 06:18:41 -0800 (PST)
Received: from office-nix.home (hlfxns018gw-134-41-57-104.dhcp-dynamic.fibreop.ns.bellaliant.net. [134.41.57.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d77d30sm93461581cf.6.2026.01.20.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:18:40 -0800 (PST)
From: David McFarland <corngood@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: David McFarland <corngood@gmail.com>
Subject: [PATCH] platform/x86/intel: disable wakeup_mode during hibernation
Date: Tue, 20 Jan 2026 10:17:26 -0400
Message-ID: <20260120141758.3496-1-corngood@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this change I get the problem described in the linked bug:

> Wakeup event detected during hibernation, rolling back

The docs for the 'freeze' event say:

> Analogous to @suspend(), but it should not enable the device to signal wakeup
> events or change its power state.

I've been running with this change for several months on my Dell
Precision 3680.  I haven't tested on any other systems.

Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=27328
---
 drivers/platform/x86/intel/hid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 560cc063198e..3a9561665b9b 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -419,6 +419,14 @@ static int intel_hid_pl_suspend_handler(struct device *device)
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
@@ -433,7 +441,7 @@ static int intel_hid_pl_resume_handler(struct device *device)
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

