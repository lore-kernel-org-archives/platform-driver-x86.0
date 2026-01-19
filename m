Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C82DB7AF
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854125; cv=none; b=lL+u05OhlaHSAvIm1XZRzEw6lFDjdot9yo3CuKAgQ8tvzbH+bVxJIOp4TQ/azSWbgHhbxWt2utHe3qkHyE4ktzxJrzW8rI9/vZECbPSk7zE/kjXKzT+eG0wbJoA+TuqUopftdjzKZYNHtMHliYo4tdfVKsaDesh80tubLNFu0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854125; c=relaxed/simple;
	bh=1+ATMbfh4i8Fx2ZKhiRLK3SENQT3d/ijvIS3iYHK0Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IKUdGmJ533xFCu4I/fE+Wx8TPYFktTW6v8Pj4cNBiy396nHGjx56owTp0NHRCJNxmJDDVQLSE5m77lsYeBD3WL/yGWGttbk6j0eXjg/vrbMQ8KStiJOcRoRcsusmBSLbsdvI+x+x+hXfs9JXodR4pInJ3gQnPWbL79xHNeex7kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UW7BJIpO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UW7BJIpO"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b67388c9cso5777338e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 12:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768854121; x=1769458921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDBK20VPaxSq0MCDY5hKGxl3s141opvsvW0EECGHPsU=;
        b=UW7BJIpOtAnbhWX13KI00KEbpom/nopRS4YUB6a2iX8+m2u7yD8QWewIQAk5B0W328
         q0B/SkkgjHe8+QZqK0U0he7hPDun8yjDVOa7oBjb5aTrZaIBSox+0qPvDcEw5ghE400T
         ZvtIC9WQJRuWJDuwt8MNZUXi5exAy8UP2yzMCMM24fICiciXrnkcbUeVNGywdO3jB9rF
         W3cbiOKtluF4/r36+tF/3xEJ2YbxDDcCxYg0QGhLoOx2Mbd0PiBWVnec/aZaw9wxS8j8
         qHcf/GOI+iJWWXV5lTgyItlLUDNPZaExwTntY7k5Dsqp6DgkbHMS+P6WeiMDZU6o50VU
         HLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768854121; x=1769458921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDBK20VPaxSq0MCDY5hKGxl3s141opvsvW0EECGHPsU=;
        b=X28i7ATCrIBvfCuU2IdrkOpt2BCa2cH6NdAbN2Ihwe7/uxIHR2xwfdsadKLS3kw/9n
         ikGqSe/r0N7i9oNgAhW5AT8rhhPQq9S0xw7hxu/KSYVNvbMPLVc7fJU1iRAiGZaw7xh2
         kjnFzKYU8kG+mKLrnbNpOceyC64Dt3NQcjOZngYGQVfeo63RS8OG0oa9kglsvq5P/X/S
         Nqmsdfcyy1TzVXkz4PZQNmaymVEnLTtjAehouRI1pwyQsfMtYePluoUEcUNEZRr1wLzE
         MOPoNbSqfiPV5otZBa6rebmZmGhxWnE1+25+31FhnOsJm/SS1XdIGk/kg/Pu0XFCEIK+
         7p0A==
X-Gm-Message-State: AOJu0Yx5z9vFc/xkrNOJy9OuZnOtbNP2tUKrGcYtrgg1mgZLeFiMGpEk
	jLvYuIjKT9X1MdXZJnMMu67CMC/ru6cENgG3UDVRavbB26vd3o+4/2gd10tPn3If
X-Gm-Gg: AY/fxX7BiDymCHrlc+qe6njU+jqnRmFgn0Z1EDO2WGbh2Oe14r0smQ6Ud3NQLNNKazC
	048J+BZ0aHhdDiB4B2mwX2ghGitiy0qZTy7/m0U7Kq0kZQSMnUPKx3HGhxe4EHGBCchhzxslkC0
	iAX1NyMC2W44SP2HyoH0cH9BCMd/RrkY+5fACxIhuCGBXHwAV1dLci2lX5yyK276JQqsdIqVFlT
	FB29bOsgjjMbHz0eIFhDpsx81DEYMDW7WTj3WlGA+qD00qToXv2vD6Pxn8dvTdDOG6hopBHfDzv
	7nQLE8DXOcY+4hEzjwAE+Ezb66kPamc/fS3/knCfb5wdiePCsNtRL8DvBwBAN/tTZGa7Qh23tf1
	wDfTzhXjNLwQG5CHDkoqJ8WHVcB+JHxd7usFEfZPoxjg8GjzDmzz5TQg8mKfm3w9qC6wUj0XP+k
	x9DVI=
X-Received: by 2002:a05:6512:132a:b0:59b:7c26:13b0 with SMTP id 2adb3069b0e04-59baeed4bdamr3652321e87.18.1768854121161;
        Mon, 19 Jan 2026 12:22:01 -0800 (PST)
Received: from gl-laptop.flowwow.loc ([2a0c:9a40:8950:800::67d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf9d442dsm3678659e87.94.2026.01.19.12.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:22:00 -0800 (PST)
From: Alexey Zagorodnikov <xglooom@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Alexey Zagorodnikov <xglooom@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] platform/x86/amd/pmf: Added a module parameter to disable the Smart PC function
Date: Tue, 20 Jan 2026 01:20:34 +0500
Message-ID: <20260119202100.785129-1-xglooom@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Addresses a low power limits issue on HP ZBook Ultra G1a
https://gitlab.freedesktop.org/drm/amd/-/issues/4868

If vendor firmware capped APU power limits with 3rd-party AC adapters,
the user can disable the Smart PC function via the module parameter

Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8fc293c9c5380..00a4fc899c727 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -53,6 +53,11 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+/* Force to disable Smart PC Solution */
+static bool disable_smart_pc;
+module_param(disable_smart_pc, bool, 0444);
+MODULE_PARM_DESC(disable_smart_pc, "Disable Smart PC Solution");
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -362,11 +367,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
-	amd_pmf_init_smart_pc(dev);
-	if (dev->smart_pc_enabled) {
-		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
-		/* If Smart PC is enabled, no need to check for other features */
-		return;
+	if (disable_smart_pc) {
+		dev->smart_pc_enabled = false;
+	} else {
+		amd_pmf_init_smart_pc(dev);
+		if (dev->smart_pc_enabled) {
+			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
+			/* If Smart PC is enabled, no need to check for other features */
+			return;
+		}
 	}
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
-- 
2.52.0

