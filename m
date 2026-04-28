Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0933D43DA52;
	Tue, 28 Apr 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380816; cv=none; b=SNk/JBtngac6sODCGb3E0zTAKoUpp7z5eByM6Z1KjMgkALsHol/qGmEwpjrzNX+MB16wLlZg7LKHIfNxU8K5NbwyKbjdYEQ43eohwl9FDl5ZJ9LwC1dT8SGFV0E1ksLq7H01IBXPGfbx0d6EbYG1VJDMQ1+bTiaYqNYdWzXRC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380816; c=relaxed/simple;
	bh=YP+TimreqyKlgzbaNLpAd2ZZzUPsgI9lDuDy6EBkvRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8n64M09ncppkp9T28DNOjofAZbjYU08J4/xLa2m2IozUaDcII4bHxol2qFhzDSqBYJGwRX9f5gq2v8VMCR6ZRf3GMpcWagHah3KDO3xFZHLPTs2nS+yMNAY8MKtw31bnE1lAED3v2dH9kKbVgdWurF3xWjhgS9w44Ce1+G8+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=AvhjNNws; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S60VSwTp; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="AvhjNNws";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S60VSwTp"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E85387A0114;
	Tue, 28 Apr 2026 08:53:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 28 Apr 2026 08:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1777380810; x=
	1777467210; bh=p10XxjR97YdTdNkoJ+iuk0c3zDdvVClQb7eZGP1sQYY=; b=A
	vhjNNws5AfmOiakZxj8JUz45CTjBujoPpj5A2W9n69pw3Iou+blN9xtHQjIdLfzD
	53znEpYTiuDtmWfK8x+1+4nyI2DKyY4wOyLRh4aAyu/0m477R8WN3Mw8Fz3WIjFS
	u0mvPjFCmLZ+pna3nYM0eU+hSRc2e3F9pPznvgU3Da15m8eFh7lmOv/2WWEoibP7
	WwGZDKyId2CeziBEasCD98IPLciKAsdQY5KFTc9Tc/0/5/XgFEwzs0q4Lj0Aj2W3
	/8xKXGRQ+eWGHixhinTJjHrZWOD6/C1jnyEruXBE9dQkotDt59JZYLTmaFdqsbvR
	B8J4bhP0GIWC/cwOSPX/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1777380810; x=1777467210; bh=p
	10XxjR97YdTdNkoJ+iuk0c3zDdvVClQb7eZGP1sQYY=; b=S60VSwTph/mDTl5kX
	NbtumsM1h1LI0sedfa1y76QBs31YVee1+fdcf+4ozXOKxEN0ynF+Tz30O2PoUsHs
	t38TSKSx4NfpGjpsCyCHpdAlMvgNQsI9PnotL6yA5B8hKntRnLwuxxRY1ujgX0OF
	1T5hu7ipEG9mB5Ns+anx/rht6VcakjdQZRKbxt1A2GU1ED9FQC1ihUr7NvskrRSh
	awzZIf/RbKkqC0IuocUulBCaDP1374b3Sf9AdzhxV9cIiRJtkn22ffsf4XEyEozY
	8wYrwciPTX2dJQhuqMK15J3QxiC4rAn0fbdOf5ngjrUp2Gj5pZurj0elnYKF7p6o
	5d4wQ==
X-ME-Sender: <xms:yq3waU61xsDIZ0hFzTLwW3p74c1SVfjFxYo8ux0eUndx5GKwiC8mMA>
    <xme:yq3waYJKNWLo9U4hQuY_FEWB1oI5qRGUP3OAqbKXHkp12IWvPz_DCQFc9VMlBOvWp
    bI50SogVzmL-UTUfG7ppV_TzZTZBDZlA0I2X9JijYvElX90b7sD5Yo>
X-ME-Received: <xmr:yq3waVthvQjBnnH-5ytyRMIkuo1qTCejQHYSEjVm_T8A_p92-vPkXWmkvppHVYeUHNwW4KLwI5lPjBgiz9SCugb3fYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecuogetfedtuddqtdduucdludehmdenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcurfgvrghrshhonhcu
    oehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtth
    gvrhhnpeeftddvjeefleffvefhgfejjeehudetteeigeeugfekhffhgeejudeuteehgfdv
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmph
    gvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmphgvrghrshhonhdqlhgvnhhovh
    hosehsqhhuvggssgdrtggrpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlih
    hsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yq3wafKjrRbl_sB500wI8Ti0ZHth8vOmWUQ2sXU8-ErD6wK0gSp1GQ>
    <xmx:yq3waW8OB_CH7rTjCDTpZXGsGOjvAUkOqS7R6SrHAGf8tzWlkCwoxA>
    <xmx:yq3waQw_mmwaDIXd3Gbkk8kcO95eAkVIICiDo5AoLSJYQaopmsgB0g>
    <xmx:yq3wab77O808J8HTF_ZIYeymoAVvmzRv_JqCTHh1c3s9m4OAwiSxrw>
    <xmx:yq3waT3ZXOaA699Lywpx5NubudDJKVc1QRgZV22t9DMZgOoZ44tQp1Rh>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Apr 2026 08:53:30 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Add sysfs to display HWDD raw
Date: Tue, 28 Apr 2026 08:53:17 -0400
Message-ID: <20260428125327.1196296-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo diagnostics and support team have requested a mechanism
to get the raw data from the HWDD commands to support customer debug
situations.

Add a sysfs entry to display the raw data.

As it shouldn't be needed in normal operation, add a hwdd_raw_enable
module parameter for when it is needed

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 31 +++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e1cee42a1683..299cc4022e96 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -406,6 +406,7 @@ static enum {
 
 static int experimental;
 static u32 dbg_level;
+static bool hwdd_raw_enable;
 
 static struct workqueue_struct *tpacpi_wq;
 
@@ -11217,18 +11218,44 @@ static ssize_t hwdd_status_show(struct device *dev,
 
 	return sysfs_emit(buf, "0\n");
 }
+
+/* sysfs type-c damage detection raw data */
+static ssize_t hwdd_raw_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	unsigned int damage_status;
+	int err;
+
+	if (!ucdd_supported)
+		return -ENODEV;
+
+	/* Get USB TYPE-C damage status */
+	err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "0x%x\n", damage_status);
+}
+
+static DEVICE_ATTR_RO(hwdd_raw);
 static DEVICE_ATTR_RO(hwdd_status);
 static DEVICE_ATTR_RO(hwdd_detail);
 
 static struct attribute *hwdd_attributes[] = {
 	&dev_attr_hwdd_status.attr,
 	&dev_attr_hwdd_detail.attr,
+	&dev_attr_hwdd_raw.attr,
 	NULL
 };
 
 static umode_t hwdd_attr_is_visible(struct kobject *kobj,
 				struct attribute *attr, int n)
 {
+	/* Only display hwdd_raw if debug option has been set */
+	if (attr == &dev_attr_hwdd_raw.attr && !hwdd_raw_enable)
+		return 0;
+
 	return hwdd_support_available ? attr->mode : 0;
 }
 
@@ -11956,6 +11983,10 @@ static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
 	return -EINVAL;
 }
 
+module_param(hwdd_raw_enable, bool, 0444);
+MODULE_PARM_DESC(hwdd_raw_enable,
+		 "Enables hwdd raw output sysfs interface");
+
 module_param(experimental, int, 0444);
 MODULE_PARM_DESC(experimental,
 		 "Enables experimental features when non-zero");
-- 
2.43.0

