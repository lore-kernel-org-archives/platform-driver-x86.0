Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB922D4E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747084320; cv=none; b=CZO6bdeFyRzSrsrfGatPq8BKpXZrITIGAKajVLS7mepFRyFnzUOr3E1AFPP84bZmQ4dZuxIqu7Day2Z0DuD4EVtIV4IFEKT86eG4lXBhKyYiUkXZzPvggEiaWos2MEKhOKB/T3UJoPftbt5mqV+ZyMxWWGEX/8Alq765BbsdobM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747084320; c=relaxed/simple;
	bh=83jD7ErwISx+A9IrXt1cBbDXGJ80E0+pTfoXlDxwyC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CowI8ugDtvhy9X37C0cP16A17/plm9eutyD8tYoxUxcvl+4e8lHhGD9UgZVBCPGGx3ncjGKmQDuqV5vCclQ2F4OTvnfGDMTdSjfBkXI5dMgjOlNLFnWeDTKxU2T/0t0hP/5dIqlJCH4Kv3K5L4HAKqYgCzQ47A5fQnCndFsOBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYqQuuWZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYqQuuWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F60C4CEE9;
	Mon, 12 May 2025 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084320;
	bh=83jD7ErwISx+A9IrXt1cBbDXGJ80E0+pTfoXlDxwyC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYqQuuWZRi7FGRt9etbWT/NZ8Aec3wXPKwptDCp2UeI9oD5ADZcCufb9HnH4xLG5W
	 LadOjvLDOH/VcL9lS3tiPa6nlu71S7q3933AmvMGaPcGgXz/6AYbQ89B0ZUmFgKmiY
	 nPm9XGcajIH9aA5Oam/lFOkxy+6nr8lJq/hetb01e9OUb4WUxqXqoUC1N4a1R9Xui9
	 M9XjC60S7Fag/FawkR/JxUGQny1C5TsDBqkZ59F+01NSj7Qu32LKoPHU3tKJH7oeUz
	 m36NuYbdEjo5/6PLEYQxMrBhIb+tHv19VJCmnKcEAx639bk2G2tuqBLC4ZpZVvtdye
	 Toe5raEFUMJTA==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 1/3] platform/x86/amd: pmf: Use device managed allocations
Date: Mon, 12 May 2025 16:11:52 -0500
Message-ID: <20250512211154.2510397-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512211154.2510397-1-superm1@kernel.org>
References: <20250512211154.2510397-1-superm1@kernel.org>
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
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c   |  3 +-
 drivers/platform/x86/amd/pmf/tee-if.c | 48 +++++++++------------------
 2 files changed, 16 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 96821101ec77..395c011e837f 100644
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
index d3bd12ad036a..513dbbe3f214 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -362,26 +362,20 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (IS_ERR(new_policy_buf))
 		return PTR_ERR(new_policy_buf);
 
-	kfree(dev->policy_buf);
-	dev->policy_buf = new_policy_buf;
+	devm_kfree(dev->dev, dev->policy_buf);
+	dev->policy_buf = devm_kmemdup(dev->dev, new_policy_buf, dev->policy_sz, GFP_KERNEL);
 	dev->policy_sz = length;
+	kfree(new_policy_buf);
 
-	if (!amd_pmf_pb_valid(dev)) {
-		ret = -EINVAL;
-		goto cleanup;
-	}
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
@@ -532,13 +526,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
@@ -546,21 +540,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
@@ -575,7 +569,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		default:
 			ret = -EINVAL;
 			amd_pmf_tee_deinit(dev);
-			goto err_free_prev_data;
+			goto err_cancel_work;
 		}
 
 		if (status)
@@ -584,7 +578,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	if (!status && !pb_side_load) {
 		ret = -EINVAL;
-		goto err_free_prev_data;
+		goto err_cancel_work;
 	}
 
 	if (pb_side_load)
@@ -600,12 +594,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
 
@@ -621,11 +609,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
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

