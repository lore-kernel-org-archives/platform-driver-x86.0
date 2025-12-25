Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0603A1E7A
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766673017; cv=none; b=DRpP5j8QtzpQ7WBR02Sk6pPKW2AcDtZGhUfIS4AvyJL+22bc+W2XU5rmoXg38B3zEkecVh+rhtPFDBjZQjmbSY/EAilAn4U1208+5m2zO49C1A3FwLPEOqHG+I6Sh005mi+gfWBkqZ2RS1vKaBznzqcMZV/aEogaDv4PfUGpU6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766673017; c=relaxed/simple;
	bh=XCQHYdq3spbZE86t6SluvclGO9w1CrqV32bMnR1uFeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdPpFB3w6L8n5pyh6Ucd1iEoOyklVhgcMFinoQRWy9Hz5CHaPXvhFsTFVMNLba2rUHUqxfPAQrglQdVbWaWyp+reVVo2NM8W2zHRNCtydR5sQH8xf/AW+H3fReo3IpmjE4eLk3Jc7nHX93iPKG2MUsM+xcurZ8s5uq7L+BZjMvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vt9b02sm; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vt9b02sm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766673012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3m20kD7PwGCTH43gt8FUGu7YcWOl9a9RmHjQnwvr5Pg=;
	b=Vt9b02smnBCOZQK2tPLDiR4SzvqJxEdVx260PLhnzC2uDbcsGJYSZNedlFb4fwlLUoHnNM
	TwoTY3ubUkZSKo2tE6gZ3JYaGkxdodbX+WqHsJLDnsMswyT+DCuHSx99juCoM60W/Gl5Cc
	q/uLpT8zjXe37RwpMOl00Ej2XueEN6Y=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 1/3] platform/x86: asus-wmi: explicitly mark more code with CONFIG_ASUS_WMI_DEPRECATED_ATTRS
Date: Thu, 25 Dec 2025 15:30:05 +0100
Message-ID: <20251225143007.2684239-2-denis.benato@linux.dev>
In-Reply-To: <20251225143007.2684239-1-denis.benato@linux.dev>
References: <20251225143007.2684239-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Be more explicit in code that will be excluded when compiling
with CONFIG_ASUS_WMI_DEPRECATED_ATTRS disabled.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 4aec7ec69250..a49447eff4f4 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -302,7 +302,11 @@ struct asus_wmi {
 	u32 nv_temp_target;
 
 	u32 kbd_rgb_dev;
+
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 	bool kbd_rgb_state_available;
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
+
 	bool oobe_state_available;
 
 	u8 throttle_thermal_policy_mode;
@@ -1060,6 +1064,7 @@ static const struct attribute_group kbd_rgb_mode_group = {
 };
 
 /* TUF Laptop Keyboard RGB State **********************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1106,6 +1111,8 @@ static const struct attribute_group kbd_rgb_state_group = {
 	.attrs = kbd_rgb_state_attrs,
 };
 
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
+
 static const struct attribute_group *kbd_rgb_mode_groups[] = {
 	NULL,
 	NULL,
@@ -1861,8 +1868,11 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 
 	if (asus->kbd_rgb_dev)
 		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
+
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 	if (asus->kbd_rgb_state_available)
 		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_state_group;
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 	asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
 	if (!asus->led_workqueue)
-- 
2.52.0

