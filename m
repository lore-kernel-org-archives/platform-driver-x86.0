Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91141298CB7
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678637; cv=none; b=fh1qVQ5KAeoxZAvpUHg6u3nJg3RinBN+7I0Va+ROIzgKpFBtm4lW8QKW5TCFT7zu5cToMaSKmJWy9zyOxRdPBynMtL3wWdhHDJd0LkW0JYn2FZps12ysAnZ0IfAPlMwrKD7BlILHTy/CFZfN5Li5/qDfoX432fQYQsrELA/g6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678637; c=relaxed/simple;
	bh=az11xVI2VI3m+GIkes3ujiFCYiSSBp8WmRmTIXATdhU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcsmg+hol+mO+okEITDBPkuZtJQeVlSUcNwbZfrI1sApQTzTuH415tbGOLQIlLYWL1KExUdHj9qHiHTVCx/4dn6zdhqztFtVK1oVbwQP4/ptkpKsy4LeGFLwr3REOv2hLSIu3Ety4Yt7OceyLMH5cqwlL/G5HFK67yPdhLVkmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYQb3wgY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYQb3wgY"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38307233c98so26006851fa.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 11:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768678634; x=1769283434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RbTl2no563I1t5iVCBq06N85An7LSNG5Mo6eMjPjXY=;
        b=IYQb3wgYV1CXHgrbc+6n8YstQZuMAU6R1VDuWYgXgaKuBF3wBH4m8w/p+7Jt3mQVGi
         AP/BB7XRpsYf8rIuRaF07PGuJxlgwFYbHEGDJxFQksgqTOC9kA+p8X4/UNKh+rEBQlgF
         f5T9uLI2FxWtmOmnH0ajNwQlPKoTj/RXdt7Ngq76gc5/VkZQctmY2OVsfTjwDJY589wW
         I3eYGFO5y/ytDtXSDxT/F6eZUNFClg44ijT/EhXyFA/++NSzjHpWQW74W6c3iwjTvimV
         T86Tuv3w1szYXGlN5LAyOlek9AH9rYGo6Mkmkjyss8js4L1MVKzXAhH9KCJzkPZoqRH1
         /mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678634; x=1769283434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RbTl2no563I1t5iVCBq06N85An7LSNG5Mo6eMjPjXY=;
        b=FPHy98rYMVt5NZC2SUsaLBr4UAS/7zaRch6NOwvRtG/IaB7lXmW7ZuLuBJOscKK4cZ
         eklMmfFN38adXl8TZu1yXXY813WGDpKg6sbxOcPxEL5gwybM2Dyg7fn4dTAHu0RKJ0c5
         rwo8kBO0xUhiJy4lbqeXyI9c8prc157NE3c3D/caLpf5tAlfuVbXsqt22p7YyydHyAZI
         VXuE7clYGGGipzBUq0MNR7/aT7V4OV7sH6/Wh6jNeFgXzHuy+d04vdt6XYP6BySzUyOy
         UCeoARFmjldrzluPRCUai7sWXditHz0KBccTFKGd+dP/amQM8fKhTsqn24hA/Lhqk8DP
         1BbQ==
X-Gm-Message-State: AOJu0YyiiTl7AsoFtNn9oxOHt5V6mxTUxF3LYLPkv/Jc2lA32mLYYTo5
	tgKraAEYZf8hzz0YplZX3tjPWtsys1cTN4MoFmba/ClvB6M4S+HEvqYFJynQ7rH+
X-Gm-Gg: AY/fxX7UNk3rjnMz0bRb2ne/qN/6DMdS74uNmzN5v620/Vgm1x6JAQWWpBK5YsRvBnK
	IRrZQJhYKHsoB+Yo6IsztfpU0rc2LTcM7EP4eWjWvuEB0a9a40Tk3E7G2ik/hEj3jQujVhPRCB4
	6Ix44oKRm5so85862cHqU6FaWz3kl0CEiGFZKj5Sx9rpslSDE1zozuCkiEie0gY6Za7TveomXUe
	/2Qz9JPKq4mARIAVwdWEWDeAa+NPquKiUrOXwUL3+3A+MbUMF1KMsoqAxap8d+8ZzNRmekHfirH
	aqmQWvfqZtELeuwnEGQtqo/ZDJ0Zd+A8K3BDnnJQV4buYXUQJR/SHG1WSZB7E9Oi/HID1NLRk0o
	S/iQbXOU0O62qv9NIloR8ey2yMBZLKeoJKXG3Vq50uv6DDAWL4R3qkKx4c0MERN7ZwvvvyT9T+B
	y3+xQ=
X-Received: by 2002:a05:651c:1987:b0:37c:c370:60a3 with SMTP id 38308e7fff4ca-38383fe230emr21800921fa.0.1768678633394;
        Sat, 17 Jan 2026 11:37:13 -0800 (PST)
Received: from gl-laptop.flowwow.loc ([2a0c:9a40:8950:800::67d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3d92csm17630171fa.5.2026.01.17.11.37.12
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 11:37:13 -0800 (PST)
From: Alexey Zagorodnikov <xglooom@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/1] platform/x86/amd/pmf: Introduce option to disable Smart PC function in PMF
Date: Sun, 18 Jan 2026 00:36:57 +0500
Message-ID: <20260117193709.401879-2-xglooom@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117193709.401879-1-xglooom@gmail.com>
References: <20260117193709.401879-1-xglooom@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

