Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23419A28D;
	Sun, 29 Dec 2024 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501611; cv=none; b=E317kFXVHvqYdfIKkQp2bv/N7lM3c0QBLceKKPCBKhihbAhIhqh0W0aD8IasXa9b/FQYPfRLt+ualB4zhJJTMBRz9ZkVyXhdmGihA/pLJJytLp6m7r1+PdgwAeX1Xkfyr8Ya1x1KTfmRm9T/vEERDh0IZz1Rk3f5zFfwLzjkNt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501611; c=relaxed/simple;
	bh=JfXklGaFFo7wbHLPpDz4QYgR3xVQWtszMHXl9hi0lgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQcUKKp29WmjeDieytjFo4cLSMeRqCK3pMBP8LHo1rlfDRJz5c0dNBSXfazKUhjQDLsHE2NKxUYbcNZWv/DtR7ZNj145/H5HbtASqZIqgG6930xfJDwGj5+ExAkxZ8YsBFhuP9uXcDqxYBp1JvtHZbHXuTheFT9QOQCgUUQQtOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mapxKrM6; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mapxKrM6"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso2907255e0c.2;
        Sun, 29 Dec 2024 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501608; x=1736106408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHqL+vpiErSUgy/1yGnLTEPBV7j+lZJ6SlOgomo86jw=;
        b=mapxKrM6sPhTEYlKS9eSctZ62mEtyCLIwVN/hDAugRGXcYDnhbvW+2+EB30hIL48o5
         rr67MNYWUSSJ/kpMxZ4lhZhRI84xWC+Ge7OmP+xIXTk7FCtI5dEgZQXU975E4F3Ej/d4
         3gY7eKRVcTQsi5G0RzPhRKfaC+zqpyzL9dMyUZSK5G4CMn8hgfVOOW00E9NMk1m2DyCf
         4fXYLqYL6Im9uwXSs0OkTzNvW5V9JQC0knhGpSzdowqniyoRybn4/yW64QZGqIUOW14a
         +S1cj0/QseV59PQqwIX7abEQjMh15SYQVbqJdM21PKHMWMqrlqMOKy7ZyJD2qnx9h7EY
         f/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501608; x=1736106408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHqL+vpiErSUgy/1yGnLTEPBV7j+lZJ6SlOgomo86jw=;
        b=c1WO/8qOwS8r0d3S92zSOpWxLgPFZDbiaP47tFWQWIlYi28hqDP9UY9CsG3DfzfaOv
         keZ8KIQi6yyt7rFfQIhXPhQq6bHYmN0jFhh5JN+m9ZeqowGQLgOWFQtuMuwtSTHwQwwC
         9LwpWDnlk183cC3qE+lbDulwyFKZSLVoszbfYT7OnNjvqQh/twNB7/BliXzGSlBrFH+4
         aE04byLPbhL0WrstNuLLYU9YCb/I1Gq3jzMRP2j0RDi1VjdY8Df3Ei9y2unAdtAiabdb
         INna39C6c7m8vAzr/qmV/kMdr30mDpdltXHj70/xAnBlms+HgHH5TdBbIS2NnXWxLwYl
         FP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV8Bi6PYQNLvlBgj053BTjqMS8glPL6jadvy/qWWHtHuHZGDeuVnHsSm6MO5STlcJYOVkdk+RERRWOs4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXef6HcN2u6KFQ9HmiBXA7hvTd4vnMGHb9xZOH7J4S8ivJWagE
	M4fmchM9OZfkG+P6NYYh5mZxSW/nr3dcbvgxO2MZ24ilnv+eYurdCqIskw==
X-Gm-Gg: ASbGncub1V4oZN1ImFTygYgUKHmWkmWKQVDRfmNslTHde+3657dLRu3BZ3Aw+qrKF6O
	V5dxLGvR4XpZrZxt7hgliBetHiTTPSXnPrvogKOjwX4wQTqFsJQjwe/Yvn/S+QMJpvypq7hr5rE
	tmbpu0ZnM1bj9Ys/qiJX58MN1H8b7NfxVvQmBGXvk1o02f9pCbjR9c0DoKvvv0xIDqfhOACRN4n
	aZzSStZleni3PKZq5E4YQeSXOXqdmJCUlzhAJl/7C/3i0i3L08fJTVcglkdEndU
X-Google-Smtp-Source: AGHT+IFLazO7QN4Vx/HhHAoEo89f3TZplbh/iyIBmZR100gIU/ar7b+epW+etJOhfG450DuSyo30rg==
X-Received: by 2002:a05:6102:dd1:b0:4b2:af3b:90e2 with SMTP id ada2fe7eead31-4b2cc35dd51mr27711091137.8.1735501608661;
        Sun, 29 Dec 2024 11:46:48 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:46:47 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 02/20] alienware-wmi: Move Lighting Control State
Date: Sun, 29 Dec 2024 14:44:49 -0500
Message-ID: <20241229194506.8268-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place Lighting Control State logic next to other attributes of the same
sysfs group.

While at it, rename:

store_control_state()	-> lighting_control_state_store()
show_control_state()	-> lighting_control_state_show()

Replace DEVICE_ATTR() with DEVICE_ATTR_RW() and do a general style
cleanup.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 74 ++++++++++++-----------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ed66720260ab..c5ad0f95c442 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -545,6 +545,45 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
 	return ret ? ret : count;
 }
 
+/*
+ * Lighting control state device attribute (Global)
+ */
+static ssize_t lighting_control_state_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	if (lighting_control_state == LEGACY_BOOTING)
+		return sysfs_emit(buf, "[booting] running suspend\n");
+	else if (lighting_control_state == LEGACY_SUSPEND)
+		return sysfs_emit(buf, "booting running [suspend]\n");
+
+	return sysfs_emit(buf, "booting [running] suspend\n");
+}
+
+static ssize_t lighting_control_state_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	u8 val;
+
+	if (strcmp(buf, "booting\n") == 0)
+		val = LEGACY_BOOTING;
+	else if (strcmp(buf, "suspend\n") == 0)
+		val = LEGACY_SUSPEND;
+	else if (interface == LEGACY)
+		val = LEGACY_RUNNING;
+	else
+		val = WMAX_RUNNING;
+
+	lighting_control_state = val;
+	pr_debug("alienware-wmi: updated control state to %d\n",
+		 lighting_control_state);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(lighting_control_state);
+
 /*
  * LED Brightness (Global)
  */
@@ -589,41 +628,6 @@ static struct led_classdev global_led = {
 	.name = "alienware::global_brightness",
 };
 
-/*
- * Lighting control state device attribute (Global)
- */
-static ssize_t show_control_state(struct device *dev,
-				  struct device_attribute *attr, char *buf)
-{
-	if (lighting_control_state == LEGACY_BOOTING)
-		return sysfs_emit(buf, "[booting] running suspend\n");
-	else if (lighting_control_state == LEGACY_SUSPEND)
-		return sysfs_emit(buf, "booting running [suspend]\n");
-	return sysfs_emit(buf, "booting [running] suspend\n");
-}
-
-static ssize_t store_control_state(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
-{
-	long unsigned int val;
-	if (strcmp(buf, "booting\n") == 0)
-		val = LEGACY_BOOTING;
-	else if (strcmp(buf, "suspend\n") == 0)
-		val = LEGACY_SUSPEND;
-	else if (interface == LEGACY)
-		val = LEGACY_RUNNING;
-	else
-		val = WMAX_RUNNING;
-	lighting_control_state = val;
-	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
-	return count;
-}
-
-static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
-		   store_control_state);
-
 static int alienware_zone_init(struct platform_device *dev)
 {
 	u8 zone;
-- 
2.47.1

