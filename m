Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9236921C163
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 May 2025 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326237; cv=none; b=dqsSMcK0e374AD0TRzwMr9E86uhB6l8T1OqO2Ej2a7BX1J6AjDJTglTSZQkBz4L7MiuS4AuXI3hYeZsET/bOgxsWOhykq/d/xSPeoLIm4WZcxWbqH5wv2/TYMphe7w3g+hUHV3g/UxBBJDdvGt4MkGpQob3Aph/bHj6MEo66CQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326237; c=relaxed/simple;
	bh=P/WbrkCCWVAE67Eh/Edw8zOyHyBqnFPHLIgu+5SOi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaoamvJUVzNom2ovF6opsWLaOIYOY+/tDwAiZqSkXKgwNPib953PEiYGw9s9rG8K04lsQjPdCkQ1OPnD1/3eKeYn3pDtfiewVG7p/4ifaYL4Wt2y02NlwusIk3vwNQG6SkWWxZCFqp+kicAp89hOYcsleqdBopqI2me05aH/OMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG/poNuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG/poNuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AD0C4CEEB;
	Thu, 15 May 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326237;
	bh=P/WbrkCCWVAE67Eh/Edw8zOyHyBqnFPHLIgu+5SOi/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SG/poNuBDRSR9c/hGjz0soc4cTDemX6yAFxnvfcUlAO24AsEYUpHWc+l/JHnHGSxS
	 wWVDSxiAa6xM9tKMlEgG0PtBjB5PHR2uSX1ZD0hWiWNdXZafBfwfHfFWFFS4vKtCTh
	 EYXB288TdXpSxkFcvm5VCRXO5OPhOYoZloden3bh3ZneTU1CTWNLY9bsmxDfA8Jn5t
	 05v6l9taqBQ+TrqgmHqRRtvTg7kfOtW8c20kBW3YyWh0rwnEPnvSMFV6ym8F3DVdx+
	 eg0qvE+MziqNRxE65aUaYxv5znhUYavftHuHa3AOiD13phSO3ADN6/5sweQ1770iBp
	 FDn/qke3NwelA==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 1/3] platform/x86/amd: pmf: Use device managed allocations
Date: Thu, 15 May 2025 11:23:49 -0500
Message-ID: <20250515162351.2111468-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515162351.2111468-1-superm1@kernel.org>
References: <20250515162351.2111468-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

If setting up smart PC fails for any reason then this can lead to
a double free when unloading amd-pmf.  This is because dev->buf was
freed but never set to NULL and is again freed in amd_pmf_remove().

To avoid subtle allocation bugs in failures leading to a double free
change all allocations into device managed allocations.

Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
Link: https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * Handle failures from memory allocation on sideload (Ilpo)
 * Allocate memory before copying from user (Ilpo)
---
 drivers/platform/x86/amd/pmf/core.c   |  3 +-
 drivers/platform/x86/amd/pmf/tee-if.c | 58 +++++++++------------------
 2 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 96821101ec773..395c011e837f1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
 		}
 
-		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
+		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
 		if (!dev->buf)
 			return -ENOMEM;
 	}
@@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
-	kfree(dev->buf);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index d3bd12ad036ae..6d85601812225 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 				   size_t length, loff_t *pos)
 {
 	struct amd_pmf_dev *dev = filp->private_data;
-	unsigned char *new_policy_buf;
 	int ret;
 
 	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
 	if (length > POLICY_BUF_MAX_SZ || length == 0)
 		return -EINVAL;
 
-	/* re-alloc to the new buffer length of the policy binary */
-	new_policy_buf = memdup_user(buf, length);
-	if (IS_ERR(new_policy_buf))
-		return PTR_ERR(new_policy_buf);
-
-	kfree(dev->policy_buf);
-	dev->policy_buf = new_policy_buf;
+	devm_kfree(dev->dev, dev->policy_buf);
+	dev->policy_buf = devm_kzalloc(dev->dev, length, GFP_KERNEL);
+	if (IS_ERR(dev->policy_buf))
+		return -ENOMEM;
 	dev->policy_sz = length;
 
-	if (!amd_pmf_pb_valid(dev)) {
-		ret = -EINVAL;
-		goto cleanup;
-	}
+	if (copy_from_user(dev->policy_buf, buf, length))
+		return -EFAULT;
+
+	if (!amd_pmf_pb_valid(dev))
+		return -EINVAL;
 
 	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret < 0)
-		goto cleanup;
+		return ret;
 
 	return length;
-
-cleanup:
-	kfree(dev->policy_buf);
-	dev->policy_buf = NULL;
-	return ret;
 }
 
 static const struct file_operations pb_fops = {
@@ -532,13 +524,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
 	if (IS_ERR(dev->policy_base)) {
 		ret = PTR_ERR(dev->policy_base);
-		goto err_free_dram_buf;
+		goto err_cancel_work;
 	}
 
-	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
+	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
 	if (!dev->policy_buf) {
 		ret = -ENOMEM;
-		goto err_free_dram_buf;
+		goto err_cancel_work;
 	}
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
@@ -546,21 +538,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (!amd_pmf_pb_valid(dev)) {
 		dev_info(dev->dev, "No Smart PC policy present\n");
 		ret = -EINVAL;
-		goto err_free_policy;
+		goto err_cancel_work;
 	}
 
 	amd_pmf_hex_dump_pb(dev);
 
-	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
+	dev->prev_data = devm_kzalloc(dev->dev, sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data) {
 		ret = -ENOMEM;
-		goto err_free_policy;
+		goto err_cancel_work;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
 		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
 		if (ret)
-			goto err_free_prev_data;
+			goto err_cancel_work;
 
 		ret = amd_pmf_start_policy_engine(dev);
 		switch (ret) {
@@ -575,7 +567,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		default:
 			ret = -EINVAL;
 			amd_pmf_tee_deinit(dev);
-			goto err_free_prev_data;
+			goto err_cancel_work;
 		}
 
 		if (status)
@@ -584,7 +576,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	if (!status && !pb_side_load) {
 		ret = -EINVAL;
-		goto err_free_prev_data;
+		goto err_cancel_work;
 	}
 
 	if (pb_side_load)
@@ -600,12 +592,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (pb_side_load && dev->esbin)
 		amd_pmf_remove_pb(dev);
 	amd_pmf_tee_deinit(dev);
-err_free_prev_data:
-	kfree(dev->prev_data);
-err_free_policy:
-	kfree(dev->policy_buf);
-err_free_dram_buf:
-	kfree(dev->buf);
 err_cancel_work:
 	cancel_delayed_work_sync(&dev->pb_work);
 
@@ -621,11 +607,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 		amd_pmf_remove_pb(dev);
 
 	cancel_delayed_work_sync(&dev->pb_work);
-	kfree(dev->prev_data);
-	dev->prev_data = NULL;
-	kfree(dev->policy_buf);
-	dev->policy_buf = NULL;
-	kfree(dev->buf);
-	dev->buf = NULL;
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.43.0

