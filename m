Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B983F0AA0
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812334; cv=none; b=c7xnCkH+EBXNpAkaiO1wV88M5JKeJun+2OhpT2uGkLuqLPdHNBHpOOBta+cf/dm8dxepFQfDUklP+bphe5I9Bhiio6MFq/bwUlywHT85QgPiCcxvwEaeyv/bc/DMIMHd+sFs6dXWghd0M2XVYMmHbQsZibYW0ooF1HqwxIAeAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812334; c=relaxed/simple;
	bh=zOrIFFEGsZzAAJ2Vd2UyAityrjBTuPpf+1ezOhERrwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3xMQj61OcVyUQUkC9DEPcRetpYXZRLe58PS6ZvbiaV8DM3LLK6kT5GaI2ybgmUKkNUMo3t0MbbOhhLnJHdHy8oKueuJqN7eq6rnGOf6eOArDqlfMbxUd2DdvhWBXlLa7cDY5+eUdZS0/01vKQESgilfg29gQtVAAq8cnW8BpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zue37oPi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zue37oPi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a706146559so1099396a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812332; x=1792417132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgISHN/0heQRsL4/w4LwMrsYPGJ0YsG2R5zhIxIusvg=;
        b=Zue37oPi5/FalqpG9EnCxfKsJ9JW1RXagaQ8eqqd1KHu+BzDvg+WIbBRhC8HHUzOd5
         pIyx7YVd8eQ8q7T2YOnK/gXIMU57ZBuJDUy2b4qqKWq/M6QntS+GJIqdhKf3UGkhAl5W
         swo18KumRlaBrsLn4CfEbmsolZmVB72mVJ9fDA7Bg7ozgJ1ZT9YMSUFRftOOFFRXEEAE
         5kvyR19rgj5y3s+2aA7YnEDc2+HhzsX4e9/iZkGWerZna1ScBJHJmrtIP853AyvYbg4H
         HOF6sYqmQRt0d7/i+MlFyjkxTo5cd0mINxxdMztaRBmdJxEdhVw/qCNv8LhSv+JxFTfP
         JW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812332; x=1792417132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgISHN/0heQRsL4/w4LwMrsYPGJ0YsG2R5zhIxIusvg=;
        b=mPww6U1coAJmRNpWmxNYneRIavEey2Spy3+xaeigCBZFQEMd/gcslLOOSlCB20Jw1E
         pWYZDQZRV5dllaUv/JuChNGS1BbXikmG+S0o4Fh14CDEtdIcqUfsrQoq8p917SC01UYJ
         yktUl07ivWnIFO+ldGugVHyqg73+sBEo8pWTTH6yiT302+nZQTmVdCSUWXQ0n1ceZcMt
         awAo+nUcrzWFcAUtlCcTbOjVUbChQrC8aoUpbahUpY7CtU65G6dbqW6Crc/nIAVQlhU+
         +aIe7KAQJxfJozW/+RRQ0sw7mYi6P14Ad3BBHhM36fLUgSPeUpPq1YcIv9NPKJCLPV2J
         JbwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxboeTdCtfd3RpIP9HWMVgv2wxJuzq0KVM8QyoO+5jxlkNvJlvJYd2GMq0W7ZlKsNToJ6M4D0JRpbjL5MZ2LxpRZdCg@vger.kernel.org
X-Gm-Message-State: AFq9FYK1lZZbSbDSayBv/BUMohrtj2dx2l5RWBiYVvmgUW0ruCOxX25t
	xJWhLyKuXlU3OJnUbhtknZ7rQSj8d5Am41HK+Ym//PvUZEM6Hy3UWFimZzwOqufZ
X-Gm-Gg: AYBFou3Dekjh0s4JUMREYS0Wxh0aVrxvLdgrFgPSXay8KKO0hNhUGkFHpthA4S4X6l1
	xvFrj59KeVnPASDZzrtKVcvM0bznAhVx8FSS1I0EeOVASGixz5f7iovcbJJyl6iLbI1AHpok+uQ
	cDgvQdu9h2Y+CXBjDOMtZa910s1SR6eyUOfbztstV8KmJr3RNkpYGW1jaqDUqESPBfB6jLmD2oM
	JDF3TdOnDL1Bsgw/pbu36znT5giRgb0/2BZn87WN0ScF8d6cmWPk9fdZ4eZ+4B+v+1nJs8ZTuWY
	NJYwdJvJh4V8kfqDb6NWy9oQAbrgdOsOshi8ksoCpwdaGpva0OMBHPLE67PuW/BidNn/avnqDdU
	2lx+dAroAJLv9WFMwM2VSwx18RKtNWhbl5PPWy65fqdjOMWykrhy6Abb+cnCf2KilrFe88YbG3q
	5LB6R6obiGGYz9FbH4b/eD36jPQ8QorPoHoS/nL9S6xHlRcwDjw+g7XGa7tUBPh6y9V04973U=
X-Received: by 2002:a17:90b:3b90:b0:3ac:17c:6e72 with SMTP id 98e67ed59e1d1-3ac017c6fc4mr2088657a91.11.1791812332329;
        Mon, 12 Oct 2026 06:38:52 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:51 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v12 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Mon, 12 Oct 2026 21:36:48 +0800
Message-ID: <20261012133648.132363-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index fac1cdbbd778..44b16b7b4034 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.55.0

