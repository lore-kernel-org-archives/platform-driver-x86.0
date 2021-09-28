Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013A7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDC7261209
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241103AbhI1OXJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 10:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41703 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241080AbhI1OXJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 10:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632838889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=n92lxF//g43KZcsf5FwwJk7bZq9n1Zxju4pjYPjouy8=;
        b=E56iWgmKPk/esWcAhYGmM7abVuTp9LqvW72MXe0VPGa3atLqmtHFG4NLDTuVbk7SEHrUqi
        pwJ79Zr7UxcYIlWdQN+TNM9Xh6EE1MRUgupBqQR4ajBVoW2nG4w9M1VP0UFGLsHh4TGvPl
        6serS1pNIuj+pAj8POXXLhnLMUBHyJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-EqyKWTeOOjaManxk3FS9Eg-1; Tue, 28 Sep 2021 10:21:25 -0400
X-MC-Unique: EqyKWTeOOjaManxk3FS9Eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3788100C666;
        Tue, 28 Sep 2021 14:21:24 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.213])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5E3FA10013D7;
        Tue, 28 Sep 2021 14:21:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] platform/x86: amd-pmc: Fix compilation when CONFIG_DEBUGFS is disabled
Date:   Tue, 28 Sep 2021 16:21:22 +0200
Message-Id: <20210928142122.58417-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The amd_pmc_get_smu_version() and amd_pmc_idlemask_read() functions are
used in the probe / suspend/resume code, so they are also used when
CONFIG_DEBUGFS is disabled, move them outside of the #ifdef CONFIG_DEBUGFS
block.

Note this purely moves the code to above the #ifdef CONFIG_DEBUGFS,
the code is completely unchanged.

Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket Goswami <Sanket.Goswami@amd.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/amd-pmc.c | 86 +++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 1303366c31af..f185c43bbaa4 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -155,6 +155,49 @@ struct smu_metrics {
 	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
 } __packed;
 
+static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
+{
+	int rc;
+	u32 val;
+
+	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
+	if (rc)
+		return rc;
+
+	dev->major = (val >> 16) & GENMASK(15, 0);
+	dev->minor = (val >> 8) & GENMASK(7, 0);
+	dev->rev = (val >> 0) & GENMASK(7, 0);
+
+	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
+
+	return 0;
+}
+
+static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
+				 struct seq_file *s)
+{
+	u32 val;
+
+	switch (pdev->cpu_id) {
+	case AMD_CPU_ID_CZN:
+		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
+		break;
+	case AMD_CPU_ID_YC:
+		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (dev)
+		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
+
+	if (s)
+		seq_printf(s, "SMU idlemask : 0x%x\n", val);
+
+	return 0;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
@@ -210,49 +253,6 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
 
-static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
-{
-	int rc;
-	u32 val;
-
-	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
-	if (rc)
-		return rc;
-
-	dev->major = (val >> 16) & GENMASK(15, 0);
-	dev->minor = (val >> 8) & GENMASK(7, 0);
-	dev->rev = (val >> 0) & GENMASK(7, 0);
-
-	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
-
-	return 0;
-}
-
-static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
-				 struct seq_file *s)
-{
-	u32 val;
-
-	switch (pdev->cpu_id) {
-	case AMD_CPU_ID_CZN:
-		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
-		break;
-	case AMD_CPU_ID_YC:
-		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (dev)
-		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
-
-	if (s)
-		seq_printf(s, "SMU idlemask : 0x%x\n", val);
-
-	return 0;
-}
-
 static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
 {
 	struct amd_pmc_dev *dev = s->private;
-- 
2.31.1

