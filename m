Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290CA4A11
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746583749; cv=none; b=iApUGppYzWBbZ1h1/7xibnNLN82xtvXU0ifqEb0bY2ZI4xeUfiOp3K5xjddULf2oCkgE12t6kRjRRqnjyC+tHFbZxISsb4gJ3Dk3QRL4kyEJz5Y5O5sMOwNIDa0GYR8mmrpqNnKoPLU1Ce2PZSHkpkKIeWZnMHpJ5OayPEpDGdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746583749; c=relaxed/simple;
	bh=Wh9PU8OY3GaZ7n7D0amRntk2SR6X3tqCELsPYfnBv4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yh0coMM76pD6Ozhj3ap9klvAQke7VqXPVw3wm2T7zJXUGuOEKlBoza1ttnpSJ9TFEANif35edvAR6uhi9gh7pgLDlhzJWqAfCvRdqvOINmLpjuLDMb6MuOf3i9Y+3C6+rHCHCzfBVJuPe7RFVvm9nw25O70xPq3lQtZuWLo4v8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjQ5zXy3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjQ5zXy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26DDC4CEE4;
	Wed,  7 May 2025 02:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746583748;
	bh=Wh9PU8OY3GaZ7n7D0amRntk2SR6X3tqCELsPYfnBv4c=;
	h=From:To:Cc:Subject:Date:From;
	b=DjQ5zXy3oTrKSFmfYL8nHqci7S+ibhWT+ohvUh4gG+8Zw0RLaf+tdchmN+e16U7d7
	 bXtzbbH8yjo1utwewNfkwd0N6OOxR1VIdEkTAFxXMjq9nXvis/6upLwnVGXdKJB7bI
	 2Mp0YTyr9755q+TzurJdTkzJ+olBQXfysartFtt8NAOH273Xdv9Rm2dbABnUW3jSV7
	 HU3sJlgRYZsA/DCR1EpPEmqAuo7fRHluPpFK/7wk7Q8mQTsqizkDwBzZcizLoYxs6C
	 ubEl1/yFdEpmaFYjtNeybKvYUjQmwEKek61/ruM3MmIcBxXACe9wKJ5ietYP0PBceO
	 sNT4zyrqNPDzw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	dan.carpenter@linaro.org
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86/amd: pmf: Use device managed allocations
Date: Tue,  6 May 2025 21:07:23 -0500
Message-ID: <20250507020838.2962896-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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
v1->v2:
 * Correct commit message with correct offending function root cause
 * Switch to device managed allocations.

 drivers/platform/x86/amd/pmf/core.c   |  3 +--
 drivers/platform/x86/amd/pmf/tee-if.c | 30 ++++++++-------------------
 2 files changed, 10 insertions(+), 23 deletions(-)

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
index d3bd12ad036ae..50c082a78cd9e 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -532,13 +532,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
@@ -546,21 +546,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
@@ -575,7 +575,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		default:
 			ret = -EINVAL;
 			amd_pmf_tee_deinit(dev);
-			goto err_free_prev_data;
+			goto err_cancel_work;
 		}
 
 		if (status)
@@ -584,7 +584,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	if (!status && !pb_side_load) {
 		ret = -EINVAL;
-		goto err_free_prev_data;
+		goto err_cancel_work;
 	}
 
 	if (pb_side_load)
@@ -600,12 +600,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
 
@@ -621,11 +615,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
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

