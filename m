Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B721FCCE5;
	Mon, 27 Jan 2025 04:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950670; cv=none; b=FgflvICo4TPzJWBUY0zeQxCbPNh/dBAyOrIJOf/rDwV4eO0x4rwVEla6bmvS3ElnROj+QExu6LdhAZDp8LhSnzbfDTeaXRbMZa21wcw/5YfFisest15/HamXlq9Sf0nN/LqNTH7vylgoeNRG29bB9jLgrhCKV6ZT0Rzy+8r9nqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950670; c=relaxed/simple;
	bh=aQLG0wkuHp3eXocBdS2uPmlIqn4PWip5uetlPv/aKCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5xID2YcWanTx+IRexcFq5EPRGZ5/4GRmG2ksM0jC6aVzK58enfxC98h30Dbnnn1iphrWxSVad7wgRHrCjq0yBuDPmJ1G0S7/YLZ85NYzr+sYhwZZy7qW2+shEZtGZgQO13GKuzMp0prkQNMQYuolFZYWSzAjjTEIKUkglLKwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnxnIM3i; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnxnIM3i"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5160f80e652so859848e0c.2;
        Sun, 26 Jan 2025 20:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950667; x=1738555467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYft7D9TYZIhx2HBZ6gkGmN/HUtqHozJ2B8OWTqBby0=;
        b=BnxnIM3iHdLquqD8L6Jsd+yJkD1O7gKc3ws2pdPwVxnTRzoF9lwRxLuLLi8GMOwrie
         SUfMCu5RkDfsRou+82yMxClhh+wEwxOfOOA4oEv/yCPlYko5xFhnzgrPDIdZ5N6HiUOx
         ackLUx3u/Cc84rtPxZr59KClzceg0ZgV5hq2DfomXIj/fUEBrYdq8dGjBGvprZX41sim
         BuCxXddUgz8kzOG31UKWnJxXdaPKZzzAGI63fUYuBIWgNnOWwAcXvDu1ajk1xUbuik5b
         ZZO0ZD3a+W8cx6Epq7Z7L9wPpo9ru3+Zk9H9YL1SfHpUCqiSyygyGc7F0/xA4tKMVy5/
         1Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950667; x=1738555467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYft7D9TYZIhx2HBZ6gkGmN/HUtqHozJ2B8OWTqBby0=;
        b=fFTHpQmfhWq/jqRW2QOKUjR34Oe37fAWyYGAZsdZEzoyzBY73GRD5+zonooiRLeGrO
         3BF+e1JL7D+7Gp8Daox7eB0qtbr6Li1xJnST/SIVMKHiJ2jYd8lU4HEWDn4TOvMPUYzs
         uo363xNjH24FzCs4Ptf1XGCBBS3JnoWbQqeByFrHJrg/g0DFe6bz1N75uHzDquZleSv5
         rqisNsRNsQD5Sk/TpGkL3DuZ2cfbJNRetQoBXsqPbaXq4x+Hh8J8fAuSqm3VsLHyBXME
         SMzKFjOyJrrx9Qd+fXjSbqt9YN3wjkL+FuZNjX5TDBHsto/LIb7t1B3KwV4EsGMq6los
         0Nnw==
X-Forwarded-Encrypted: i=1; AJvYcCX3obYVkEO4otC0h/Dn24s7K1GPZwKUUsGPncD5TxeXe4hH3fblb92aZY9bRp6DKF1u0hUBv/ymAtchoxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKb6bB+3XmaZBYYZPLyJIwvDsINmUW00Oe7QXZvpbSTq9EVrJS
	vBu5hP0fXTdmrE5FY78E2+ojW7jJw5v0PrmoW445h5MV0rhwrLSaKcUcyQ==
X-Gm-Gg: ASbGncuZEhW0t3tIr7KkDz9TgZdHE3e9PVRthcKJ98jk/Fb0+i02xzvQe2j4ShQBxdL
	7KFI9a5OL5S5eEYa1mzMQgTUhATgtU5TRKiKdWGltsZw0FbFUk67t6vKSt1pfQaUw6DZazXP5Ny
	ozBL2C3zYPECpNbNSDnhOPkwwvWP/KNutIfqXHfJ42aAvhy/7JL73DTOAtu5H+CTxg0a8tShX0l
	/tbAhMW7HjE+MfljV7zamdMe9dRX4gs82UL2pUwdTASuMOOAZI6MhxkuJucPu4kXTjVq1/l+Zzh
	Ond5NRF5YKsO
X-Google-Smtp-Source: AGHT+IHBo3E78cJiRAMGrH3Zq+XSg1NtmB/aA8OxB3PRkXzfxzDGk6WvGiQ85CFMQLAQlgzINsvtxA==
X-Received: by 2002:a05:6102:c52:b0:4af:c519:4e86 with SMTP id ada2fe7eead31-4b690b988b7mr30890647137.1.1737950667485;
        Sun, 26 Jan 2025 20:04:27 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:27 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 05/14] platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Sun, 26 Jan 2025 23:03:57 -0500
Message-ID: <20250127040406.17112-6-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
use alienware_wmi_command() instead of alienware_wmax_command() which
uses deprecated WMI methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 80 +++++++++++++----------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index a5f590da139e..cfdd9c1cfebf 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -711,53 +711,57 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
 static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
 		else if (out_data == 1)
 			return sysfs_emit(buf, "unconnected [connected] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
 static ssize_t source_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_STATUS, &out_data);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
 
-	if (ACPI_SUCCESS(status)) {
+	if (!ret) {
 		if (out_data == 1)
 			return sysfs_emit(buf, "[input] gpu unknown\n");
 		else if (out_data == 2)
 			return sysfs_emit(buf, "input [gpu] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
+
+	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
 	return sysfs_emit(buf, "input gpu [unknown]\n");
 }
 
 static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args args;
-	acpi_status status;
+	int ret;
 
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
@@ -767,12 +771,12 @@ static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 		args.arg = 3;
 	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_HDMI_SOURCE, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
+				    sizeof(args), NULL);
+
+	if (ret < 0)
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
-		       status);
 	return count;
 }
 
@@ -805,22 +809,24 @@ static const struct attribute_group hdmi_attribute_group = {
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
 		else if (out_data == 1)
 			return sysfs_emit(buf, "unconnected [connected] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
@@ -850,15 +856,17 @@ static const struct attribute_group amplifier_attribute_group = {
 static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
 		else if (out_data == 1)
@@ -866,15 +874,17 @@ static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 		else if (out_data == 2)
 			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
 	}
-	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
 	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
 }
 
 static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args args;
-	acpi_status status;
+	int ret;
 
 	if (strcmp(buf, "disabled\n") == 0)
 		args.arg = 0;
@@ -884,12 +894,12 @@ static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr
 		args.arg = 2;
 	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				    &args, sizeof(args), NULL);
+
+	if (!ret)
+		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
-			status);
 	return count;
 }
 
-- 
2.48.1

