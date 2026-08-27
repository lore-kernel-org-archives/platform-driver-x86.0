Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CE3DC878
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872631; cv=none; b=jRnwDB5NgCDL88uk/QP39z/PjJN1Wu+Q1BEZN1aeDAuj/6w/eiZJTXy84we8jxwXHsW+lPU7RwcY2f2KA/EA/Gnqqr5jIPpc9z0aYaJGFaun6ngzDz8N9shAVa1X1Ct9iagNO2D7ajMVrimYRST0t28lR+RKIHaSAdpE0i/sz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872631; c=relaxed/simple;
	bh=i8e0I6RT2NONCVQGYcI7HSF2J5hymZ9G7KDgcwIVJs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIniGCySkaiQVtV08Tgt/FGkNnmSQUj5kDQN4t1RaeH5svLR0Szkr3pzARErZkck6mnPs6KXDAFFOwsWKmFVpfg11cexRmH6tJADXPseag60wQQbDu6oXldox6SuCHStn03OVduuYSzQ/7fa1wYB1NNg+CrOnSjDzfA3egfFEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdUYgCZp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdUYgCZp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso10134025e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 16:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872628; x=1788477428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kfaoFfZK2/xecQPRSoVdIJikE1e/m//LU0wNhG2/Zo=;
        b=TdUYgCZpF2p2q+A8bRpMR09AJdtOz6OYE6g0sXUC+jPl1+bMkdNBdl1czG5+a4RhJq
         pI3couCF3c4OgT0fMFMSQ6iqpiQhSKcHkez5GRMYFLXyweIrQKSMz0mGa/8sBNFhci1w
         5T7z6JWD73iU/p+Rx3vd8dJBnZXcBdngLuDHVFFGn4C6zbvlT3jZVkJjrgk8b4S9Mn/s
         1heqC2Q1lvr8so4na+1lMedMsKVM5hd1XGB8xUQMg3khmbUsa/KWKMA8ukxbMAlI3GcH
         Bdl2BdcUxAr35IGZf7QwRTENjwSnI9uAURPt+3XWlg3YRh/5wJWWIyY80EvVeQvkq8dy
         85BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872628; x=1788477428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kfaoFfZK2/xecQPRSoVdIJikE1e/m//LU0wNhG2/Zo=;
        b=rQbsaLoobL6HuNVSRThCeNyVPZ13O9T2+bbEN/9O1mgiXoNMLMvzm2Qk71Vkc7LLaN
         z+/BM8/MSziAUsQb7IwCd9aHTxdK0aJM89JDltiMkFkPDelYbSiiSP/ukSOlLF/vqVdQ
         xNGOhsgklodq53FdAv9yxTajJ6k8ed2ib4mlACvWFIa8Qbs4cay2lBX/t/6i2ZVYwlRE
         xsRisbLXa1qOdLLGtgUjoAJ0PFTE3cfdXf+PDsarGBu8/JQoEu2VWx1tjwFCSzoWwkc/
         aShT9PpCl3MKfTMdKLTxhN5FdXC3N7F/0iPG7bqeCZl08U4cTxsy1r+a5g/lpiQNtkjy
         dLpw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh+BtN+CtaCq6bSx0DYPo2vOQlkMV7/QA3P6OsK/OdXoU7QR8El0pxT6sEvfAbrS44WmFRhNV4Cxo9j7dCTWtcwhYG@vger.kernel.org
X-Gm-Message-State: AFuF++m215GFTSyTY2GTmqgPSwauGPDMKvfSZ0pVGXAaUAoL4AD2vDT9
	NxQhVQvEj1uXIfZYgELM8fRGHWmX3/lot0LjubaprtWVmgXeJGSiEg7C
X-Gm-Gg: AR+sD105aV2FtMWuM+1BSwp0LgenaYig9r9GP5577YQJimeUwkdIu3xmTiwbDHamQ8y
	XxOp9LD2D3AcKp+W8h2zA00yqfqGyFzz0kmF1izq3ckyd9Vjy7B/3/RyZKlgNma7xh/HsmWl5o+
	LSChkej8LFtXkcDoV7+hltABPeLjR8y3dtHcs+hnRJMdXeVitRabzP+G3c9NsRlnxcqQP5R2lfP
	XoTfFtI51JyaJq1Gkm3lq86l8jgCeLKkRLHu/oBrPcmtYa0ClVgJJNs6e58m3KMoodtJf0M/uIN
	sQgctZaVfFzbUHvc0aOHtQknuU2BU8F9iG2M4aDSAx3yu4pBpFfLQ1RGgc/orR4LGAXPjhdRWKg
	FKnnd6Yyy1Z8ffRDNs/kYkF4yTpt8+Upy5g9ft0YoTe3BM45CO6ujyzL9BaSwmvsSmk+tyXeS0N
	jqMjbGeeIsuNJZSUAeJ8SALMNH6UofTJUsJgwnLIV9F4zieInx+44Zel0LW2Ts3LR/61x4Qact6
	Tj4WerODyFllbl9T5yWQWjd/j7BuoihfWe+pJAkkTdb
X-Received: by 2002:a05:600d:1:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-49b0dd4e54fmr124606595e9.0.1787872628428;
        Thu, 27 Aug 2026 16:17:08 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm10900940f8f.33.2026.08.27.16.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: x86-android-tablets: Describe Yoga Book haptics
Date: Fri, 28 Aug 2026 01:16:58 +0200
Message-ID: <9c88d16abc426c31bb34deb7e17be5e105bf6dc6.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI enumerates the Yoga Book YB1-X91F/L haptic controllers as
DRV2604:00 and DRV2604:01, but omits the properties used by drv260x to
identify their mode, waveform library and enable GPIO.

Register board software nodes and attach them to the existing I2C
devices. Describe the enable signals using their Cherryview GPIO
providers and pins from the firmware resource tables, keeping this
board-specific mapping out of the generic input driver. Hold device
references until removal, reprobe after adding properties to cover an
earlier built-in probe, and detach the nodes in reverse order.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../platform/x86/x86-android-tablets/lenovo.c | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..a8c849ee03db 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -114,6 +114,41 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
 	.properties = lenovo_yb1_x90_hideep_ts_props,
 };
 
+static const struct property_entry lenovo_yb1_x91_drv2604_0_props[] = {
+	PROPERTY_ENTRY_U32("mode", 0), /* DRV260X_LRA_MODE */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79,
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct property_entry lenovo_yb1_x91_drv2604_1_props[] = {
+	PROPERTY_ENTRY_U32("mode", 0), /* DRV260X_LRA_MODE */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47,
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x91_drv2604_0_node = {
+	.properties = lenovo_yb1_x91_drv2604_0_props,
+};
+
+static const struct software_node lenovo_yb1_x91_drv2604_1_node = {
+	.properties = lenovo_yb1_x91_drv2604_1_props,
+};
+
+static const struct software_node *lenovo_yb1_x91_swnodes[] = {
+	&lenovo_yb1_x91_drv2604_0_node,
+	&lenovo_yb1_x91_drv2604_1_node,
+	NULL
+};
+
+static const struct software_node * const lenovo_yb1_x91_drv2604_nodes[] = {
+	&lenovo_yb1_x91_drv2604_0_node,
+	&lenovo_yb1_x91_drv2604_1_node,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -283,9 +318,72 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
+#define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
+
+static struct device *lenovo_yb1_x91_drv2604_devs[2];
+
+static void lenovo_yb1_x91_add_haptics_props(struct device *dev, int index,
+					     const char *name)
+{
+	struct device *haptics_dev;
+	int ret;
+
+	haptics_dev = bus_find_device_by_name(&i2c_bus_type, NULL, name);
+	if (!haptics_dev) {
+		dev_warn(dev, "cannot find %s, haptics will be unavailable\n", name);
+		return;
+	}
+
+	ret = device_add_software_node(haptics_dev,
+				       lenovo_yb1_x91_drv2604_nodes[index]);
+	if (ret) {
+		put_device(haptics_dev);
+		dev_warn(dev, "failed to add properties to %s: %d\n", name, ret);
+		return;
+	}
+
+	/* Apply the properties if a built-in driver already attempted to probe. */
+	ret = device_reprobe(haptics_dev);
+	if (ret)
+		dev_warn(dev, "failed to reprobe %s: %d\n", name, ret);
+
+	lenovo_yb1_x91_drv2604_devs[index] = haptics_dev;
+}
+
+static void lenovo_yb1_x91_remove_haptics_props(int index)
+{
+	struct device *haptics_dev = lenovo_yb1_x91_drv2604_devs[index];
+
+	if (!haptics_dev)
+		return;
+
+	device_remove_software_node(haptics_dev);
+	put_device(haptics_dev);
+	lenovo_yb1_x91_drv2604_devs[index] = NULL;
+}
+
+static int __init lenovo_yb1_x91_init(struct device *dev)
+{
+	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
+	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
+
+	return 0;
+}
+
+static void lenovo_yb1_x91_exit(void)
+{
+	lenovo_yb1_x91_remove_haptics_props(1);
+	lenovo_yb1_x91_remove_haptics_props(0);
+}
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.swnode_group = lenovo_yb1_x91_swnodes,
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
+	.init = lenovo_yb1_x91_init,
+	.exit = lenovo_yb1_x91_exit,
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */
-- 
2.53.0

