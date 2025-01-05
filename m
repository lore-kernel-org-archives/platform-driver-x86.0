Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755D14F126;
	Sun,  5 Jan 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091072; cv=none; b=OJ1i9zaDDeapXyUkIPxD2Zov7xKX5NAVF5kZFMJIjNGpXZwx/AwmXZYbVEVE59VMZLTa5XLRENax0zIj9O2IdLjL6pIdjz8/Q0MsubNbCvhpEE8QVNaB2dil0DSxonAtv+hmpse67XniAeRJNa7wFYM6pY3YEfWPHz9RkEBvYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091072; c=relaxed/simple;
	bh=cjbHLIm6cBofFRwgshut8z/ERb1ogQg3jm93n14ZK9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ktd6nJ38bXjCFJqLT5EhmAyzE9NeiwsC1mWfu0LsPeHxrmW0IIPr7UcPHAMAsfQBqhGsdRDv8Kezsw9bGcVLx+vnWEaqv0e9VuJbqarVmbDvT6/XwbLThmnGeVX2lz4FK+l8IO+LkFWOd4rTMtoEADVFfW+deuIAAkw2PskPK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iustmf85; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iustmf85"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso4578709e0c.2;
        Sun, 05 Jan 2025 07:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091065; x=1736695865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVm57HLpMUovepuB+LlsnVv0EKiJcbDMFDe9oCSiwjM=;
        b=Iustmf85Sqe6DEOmNlBcErhg05i7VIo7qQ1kK1/w3Aij10eCCVtW8aq4ZlPpFI2kG2
         P0w6Ome9jBL06J9LVj3E6xul5BvdFMJKYWV97uHj8vRYkMEU64dlYtaB4w2OclWOa29v
         pnm8K3XdCo1PywdH+JLYD1Hxr/wtINFGNEu7Z1srYssWg3OVFdzTQP2WEi+pLhf6WAGi
         BKT4ZnwLa4WnoxypD+ZvWHHcDlHu3jS6fFj8ST0+Hh6nyIUGOWpv3o+qHBQSwxu+OfRP
         OtINbaSr3VZ4jcC+MNZyEpVaBqFKkZrx9EkRKP/VUCqwr1UBxHv/CtG9IA/kankDvym9
         NNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091065; x=1736695865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVm57HLpMUovepuB+LlsnVv0EKiJcbDMFDe9oCSiwjM=;
        b=SdN9BfqmaMD3LzM+fjajiv9+ZJwgcz4vdgPBV24m+mqdUWY87XPcmBLVzCP5hRQR4k
         zvMUaF68NUGHLXA9gg9yblRn4T/wZb8x7USL+Fp39vpXVeTFi9CouKKzzBzb6/wnwD+G
         BKRebeVBvLTjd3GFcN1FJ/IGh6tNCdkck0fb/XNpQxwrHygwBshR0vA+xvdwkaz4HF3J
         msqpvs47tVkUV/va9r8VplUekm8HyEjyn7Sfqro+l8x+BFriL5CyBMQs3Tmmdo6x8doT
         70gFRd/rrtGHEY3+vHxBOQgq0JCuJQWpSMTJUjq1291G6cRhnw9bWNJJ2ULkHJXj+cIx
         Jdeg==
X-Forwarded-Encrypted: i=1; AJvYcCVuSxrZi142pbTGbDviPwMlATK3a7zAZBkXDLT7bQMgDaSJKWtYY2KQEoNBt67GMAXR1k/todrZLYTgjgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+A2ikfnvphrs4KtmDUeZU05bwMcwFQON8gq4jCKOc3doefgx
	fSLBTHR/RlngsggQp1Xhda7GRUhWfCrQrGcxbLSbVU4wm9xohf+2rgYc2A==
X-Gm-Gg: ASbGncs6kmV8liNQgsTUlJWCPjo5Dhw3xF2BXc6WjiCNhSVlFFI0jB53ZPH+a44tAyf
	iTBRixBJClZLapIdrDuJClSrn1CVRyiYbZ8NS/EDH9RLO/bSSTnkMLE1PLFvdIRls5P1X6kEis8
	g63vtazelrstRXcx1FmDRh1Urcwa+EtYgqmqLhMjRNJmuBe1Ff345RFGXnzLcS0WMfyGKZckyrm
	D9kOoshDoK1lK7yd5lwsK57fH2PGKDVMBk4KH+2rZbSl+AeGrs5oH45l6ARBoi6
X-Google-Smtp-Source: AGHT+IHkGVeem+rN9tlY6cY6CfVyJTUsWWt1RXbv6ZezCAwHEfvwcHfEtFZCQM6KLJfcDPhCuGPcxg==
X-Received: by 2002:a05:6102:50a3:b0:4b2:5c4b:5186 with SMTP id ada2fe7eead31-4b2cc48075emr43045244137.23.1736091065370;
        Sun, 05 Jan 2025 07:31:05 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:04 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 02/20] platform/x86: alienware-wmi: Move Lighting Control State
Date: Sun,  5 Jan 2025 10:30:02 -0500
Message-ID: <20250105153019.19206-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
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
index 7212d75396b9..ec64a8f22301 100644
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

