Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B561EC4CF;
	Sat, 21 Dec 2024 05:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760796; cv=none; b=PyZkfcnmMvRQMOsEoFQnJS4//Q0ImqToni8AGscFOZKs+emSHAcYNPFGbKxV6jY62vq1H+Tl58EOFE/ScuDsqrsO1/VsYvilopcSQFUvZwZ5H1bmOsywACXnAJgbwxE7PtzCoxatBrmXS+yVr9j2cEs/vEmHTsXN62NgtbfDerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760796; c=relaxed/simple;
	bh=M2mGLrLA8bJeRYP3SmyaiYpKPe+I8a0fe6+gzjryg8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmnA/Z37IMVHUuUILlkPcSHyfpRia8PpnfJZu0WemDhE7iPgyrDgcdsFUh9hJFYzAz1hV5FVCrFbrHt/BHDBh/aLOozEuvvfrojmJ3a9TWz17V8yCS13VvpICnjA94uZpnvvuE5SmkPuk/vguON+vV0kICVB+X4oOB8PGovaol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFBlto7g; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFBlto7g"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so2150906276.3;
        Fri, 20 Dec 2024 21:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760794; x=1735365594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1/P3g+wUrQlQ4pdXCe/JNPfNqTjLs97yJufPyiM8nQ=;
        b=BFBlto7ghwk/3AKMD0xyb5AfzrO46PhfWpaGbYi771q8ZcJOi13395bELvjKlBXcQb
         a18EgK9LnCrgef1sTve8JQ7pOeMyiVbiFlmBlwCml4OHXRHyIEtPk3zl5JN1K1117dVr
         /kHjHG0yAMNnJTR18TrnN/kc1ayTmU418+wv7chSxT4lMAfBGhWBUJXWP3AlL55fYuZz
         PKfKvdZGIEXTQsWcDNXAmdrz+tsVb3lr116V8zmDZXB0zLVtoXfE6hxEXDGgfTRJtZ4D
         ZCVSB8NdmfXyv+ghCSlwzIBmxU7RJk7Tj3v+93MYJiC01wX2GrilUatQ62oR+kuYLkm+
         lZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760794; x=1735365594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1/P3g+wUrQlQ4pdXCe/JNPfNqTjLs97yJufPyiM8nQ=;
        b=lPdTz44SMT0VASqrLko8gHJu8jGxwwKs+PPSQjC7B2FMj9rERoV1QmmmqsbqVD0uUu
         7YS/NXz2dOwrYTk3KImfEWNLQvVY5Gnbzv6uroENhPIaKc8LYBnItMb1dT1xoJL+CUJW
         tCrrY1TZa+n5LW12UrRdooKGu/6qyhBjP64Z46+z3fZfJdvZFseJ7x30K9aNNOY7E3Kj
         HJ1CjcXhxZiYu+Dqfb2+d/ysb9XDVQ/LxrflXR1Hiyxv8sK8MlDv34d0wilp317/Sidd
         FuNfILKHES9CzUnL/VjMdDGoIGDPT4QITBZ5VgSVEdImXBwDK0SeuAL0MPh8z2N/xFLK
         YNew==
X-Forwarded-Encrypted: i=1; AJvYcCWxaIzu5A6W5QZ2KMv3tZ6OE3ob2PIAjkmv2te3DW3nz8ag/rhMH55EQ4wwtencZPBVCvmCCWfk+UUmdaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzmjRS093e78vHp2KL5jsf8mLODXfyYEXOu6Dh1i1uxoH5HYY
	bWiKQIxmGEKwV6muUu0sxtNJQueITInJ1hCNgbFwzrWSPNW1EU8jvhTtAQ==
X-Gm-Gg: ASbGncvEyQM4Ff2OiUlNKS2CcBBCjqEOB+GIlVktbdexRZnmBd4cqRcWndpMsZbSOD0
	0vKvTx7fgUyPK+m1rIcWZ+d0VxaZkA0oWYAbyRItCbp0dqUe4tJL2rGRaJWzlllL8bIaKh3b7yu
	dJ+1FXNyNbO3bTtw3pD0QmVzaw7jlTw/BBBZ9HFZVBBB1ad8rKHW2a0iQcgHYj05Z4we370rtIT
	gq3SvNlEe2jil5q5u/dMMNUW4Wnh4V97vE89mk29khusuMb5dam89T+tnvFkCA2
X-Google-Smtp-Source: AGHT+IGAM0W9GN/QwPgwa9ia7Eopn90Y9S2aQ48utvIXU+b6VRyr+7C1lngaYTQXu/O1jVFKjBfQBA==
X-Received: by 2002:a05:690c:338c:b0:6ef:3402:9e22 with SMTP id 00721157ae682-6f3f8110182mr52462747b3.15.1734760794081;
        Fri, 20 Dec 2024 21:59:54 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:59:53 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 02/20] alienware-wmi: Move Lighting Control State
Date: Sat, 21 Dec 2024 00:58:59 -0500
Message-ID: <20241221055917.10555-3-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
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

Replace DEVICE_ATTR_RW() with DEVICE_ATTR() and do a general style
cleanup.

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

