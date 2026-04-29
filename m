Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F945232367;
	Wed, 29 Apr 2026 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777427537; cv=none; b=XlYMt8b4/eL7fIMikUP57jxorMlvyKWx2pv3l7IH2A3EpthIMImC79aZ5xqZRjqwtlI2RvbxrA7jYCYDxgM5i1zODZUsgZWBeYMVdq6VLy7457PufZZV5e3qsv+xiZCkIF62SfkSpOTIbcImkkU++DiqjxQV1HbucBLwuhJOJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777427537; c=relaxed/simple;
	bh=mG6WBptAWrCBIQkpfwmXqaoIVq5u4k407O7jd2j4/b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f24n0R5gLnIZQE63t1mFwGmevtbRHWLXp3w/z+cDzSXntbLN9mKUMa1F3/nOJHlAiLp5szvyF4MIUEnPESWW3T62wYRAZSuiC3QFa0KM3IH1co7ElB0Qln2MTtFbwVKHn+yd1fJRNXFMwA3S8boFW7dOJEeu9cjGj7AoK3rnjwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Z6fkWKmp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HPihRyeh; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Z6fkWKmp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HPihRyeh"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B4E5F14000B0;
	Tue, 28 Apr 2026 21:52:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 28 Apr 2026 21:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1777427534; x=
	1777513934; bh=/7Ahk7073iLQmcx26BI6Za3Fubkd4q3p705tRZyHOXU=; b=Z
	6fkWKmpqYXPetF5XhLrtVyZEBIkxD+1BJdfqIEaiGJeBO1zcnwQommcxbjbVzABj
	YQq68/ag5nqu5gqUNG+x+eHeDvAZQfRWljBT3D769YwWn0EtQPR/HKJCdoJnjsd/
	NllPb1q8v+g1B+q1NMvqd0wxdEGDDDgOREf9YlWwLkxEJwFe0ZZoGkAtjFzjCnA6
	U/A0XleL3IY5toUachjldrOUOBz8HvdVvWteOsLZsAcVYhwquZcr35wyBHQMVDaK
	ZByMcXz4EnJJcj0w5Xwk5uCce01Xfr2i5KHerLpWeHWsi/Wnutoj+QTGPOVzdV1g
	GFNDq6Pz3yJaTDCPfN5wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1777427534; x=1777513934; bh=/
	7Ahk7073iLQmcx26BI6Za3Fubkd4q3p705tRZyHOXU=; b=HPihRyehzCdXc3oxZ
	NS/peysBLSScUeKWyZmyzx0Luo+Qrv7u05LOofMknr5DeZuzDT5+gymN221de7ND
	3pGZR0+iPs1V/7Rk6p6DgC0JgkEgEOqF1NURchqPE8b6LwvkoQBKVll+OClpBzsx
	ImP6p1tT6cntaK2RFDZBXG8MWvPj7iP0xi5VopcJ2cra+/K8cS3zA+VenKwJElJl
	ZB/YGN2smUFvVrI06aBgw914zJLLUCo4DyFCB6hqfUtEXokU2Rrh2jG7KMBOWEDo
	bGqFG0pi5COb0dTwaqLPu9CElSLUNYj74jwpOQQV6JC2lIKqbHWPN8hHIfZ3BzXt
	44pBg==
X-ME-Sender: <xms:TmTxaZkzoz3PoWsWwoBbAw00MHVg2inMIz02Rfl9KYcQzkxTuCTOdg>
    <xme:TmTxaXFyshw5vi_rm-2JkI85wBaRedOt1bsNNJLsmmf7SFhJGFiSW1pIGwQiqa5DJ
    F7ZbTyGi9murcm4o9-DiR-v03AwzgpeYQJOhIz5dh1iraN3qgQMMw>
X-ME-Received: <xmr:TmTxaR4cPPQ1KqxcogU7HiuYSJsFhyeOy94WTd_4lKwaz0vNuJQ_KZ-NmxHxGv1p3bMYy3BDZfa_szXIejb5I7RnF3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfedujecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:TmTxaflaMn1OrnzshXZV0VSzEG5ujv0e0K5Uh1RPo0QD11IYrENOUQ>
    <xmx:TmTxaWpGbZ_HP186P-8VtcJd3gBR6L4kCdAoqjO_dvxuGcbLGiUOLw>
    <xmx:TmTxaeuWzzYaUA4S7vuVUg1q0NNzzRTyfG2PNNuzr4dnJd5aOyOvjA>
    <xmx:TmTxabG_eDaNsTQyvw4dGnhwMpqGbi_IKSXlqIOg9ZXkhpDTpsXrsw>
    <xmx:TmTxaQCPb1yb39qZSANVZCJGnOQ5C-opuN8lF67wU0Fyh7a0rgnVZhxT>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Apr 2026 21:52:13 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Add debugfs entry to display HWDD raw
Date: Tue, 28 Apr 2026 21:51:59 -0400
Message-ID: <20260429015210.1863316-1-mpearson-lenovo@squebb.ca>
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

Add a debugfs entry to display the HWDD raw data.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 39 +++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e1cee42a1683..dd3e206a1295 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -38,6 +38,7 @@
 #include <linux/backlight.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/freezer.h>
@@ -11217,6 +11218,26 @@ static ssize_t hwdd_status_show(struct device *dev,
 
 	return sysfs_emit(buf, "0\n");
 }
+
+/* sysfs type-c damage detection raw data - accessed via debugfs*/
+static int hwdd_raw_show(struct seq_file *m, void *v)
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
+	seq_printf(m, "HWDD: 0x%x\n", damage_status);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(hwdd_raw);
+
 static DEVICE_ATTR_RO(hwdd_status);
 static DEVICE_ATTR_RO(hwdd_detail);
 
@@ -11504,6 +11525,20 @@ static const char * __init str_supported(int is_supported)
 }
 #endif /* CONFIG_THINKPAD_ACPI_DEBUG */
 
+static struct dentry *tpacpi_dbg;
+static void tpacpi_debugfs_init(void)
+{
+	tpacpi_dbg = debugfs_create_dir("tpacpi", NULL);
+
+	/* HWDD raw data */
+	debugfs_create_file("hwdd-raw", 0444, tpacpi_dbg, NULL, &hwdd_raw_fops);
+}
+
+static void tpacpi_debugfs_remove(void)
+{
+	debugfs_remove_recursive(tpacpi_dbg);
+}
+
 static void ibm_exit(struct ibm_struct *ibm)
 {
 	dbg_printk(TPACPI_DBG_EXIT, "removing %s\n", ibm->name);
@@ -12068,6 +12103,8 @@ static void thinkpad_acpi_module_exit(void)
 		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
 	if (tpacpi_wq)
 		destroy_workqueue(tpacpi_wq);
+	if (tpacpi_dbg)
+		tpacpi_debugfs_remove();
 
 	kfree(thinkpad_id.bios_version_str);
 	kfree(thinkpad_id.ec_version_str);
@@ -12198,6 +12235,8 @@ static int __init thinkpad_acpi_module_init(void)
 		return -ENODEV;
 	}
 
+	tpacpi_debugfs_init();
+
 	dmi_id = dmi_first_match(fwbug_list);
 	if (dmi_id)
 		tp_features.quirks = dmi_id->driver_data;
-- 
2.43.0

