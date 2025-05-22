Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4DEA50
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 May 2025 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874105; cv=none; b=k2ubkkOlMl4qZi4srIKGesGf70LDTySRruBF/f8TxSaVwUGqXbfxptAW1JYAtui7sYTDNPZH4/NSq/hDDpXdOuZWMIacvy2XMwQh6Qk35LHKcVCXteH05/lZfNlegLf8TX1ZE+zXGBK+1c9bujZahG1s77Zujxr1p7Id+Wm57uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874105; c=relaxed/simple;
	bh=IgpHbK7pWxn5tdSjUcqe8Hd1JVZ5j0S2LfpoE0FBCsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVZ4xT8/PcmpaBvF2wfRyafwEn87smuygQtolPdP9jC2esBmyRxhnShZgFXz0aQjQPh4nqlyk4Meu1ubr2KJ31jK07dkt3lMi32iunLHPO8zn65k9AEiHmq8ZBEbflsEUjBOeK4CjXY/33cvEaLhASnsTRlAaID9meNNoDEqFdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFMom/eU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFMom/eU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE0DC4CEE4;
	Thu, 22 May 2025 00:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747874104;
	bh=IgpHbK7pWxn5tdSjUcqe8Hd1JVZ5j0S2LfpoE0FBCsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WFMom/eU8h9eZxHx9bl6K3vq/G1zvC4rj/8vHVj8d4M34ApeXlNhSV+6ycSKe9ykg
	 RjBv3NfKD6M5RIaxhd7voxK/NsjzBRwclS5I/dcZUj2lGsatiZXTP25jBuyu8VHJbd
	 2ZllMQiVuriaJXzdMiqFrNMwjirBQOCzA/Dpf1TFEdWdlEsShGzjjiFBBvN8SaYZCS
	 ikndOmJYGBJjpj+aBA2M5d49GkCJoYMTPRKBIDkUMpH2DOyKB04XGAktBVF0OT/a91
	 0n/Pv08scq49cJPKfj8I/p1IU3Gn6u9hY3HXMZVDdz0S3nR/io+0wPBxQJjka4JBDq
	 5t+clE5V7rA1g==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v5 3/3] platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()
Date: Wed, 21 May 2025 19:34:57 -0500
Message-ID: <20250522003457.1516679-4-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522003457.1516679-1-superm1@kernel.org>
References: <20250522003457.1516679-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

commit 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
amd_pmf_init_smart_pc()") adjusted the error handling flow to use a ladder
but this isn't actually needed because work is only scheduled in
amd_pmf_start_policy_engine() and with device managed cleanups pointers
for allocations don't need to be freed.

Adjust the error flow to a single call to amd_pmf_deinit_smart_pc() for
the cases that need to clean up.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/r/20250512211154.2510397-4-superm1@kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 55 ++++++++-------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 76efce48a45ce..4f626ebcb6197 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -530,64 +530,45 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	ret = amd_pmf_set_dram_addr(dev, true);
 	if (ret)
-		goto err_cancel_work;
+		return ret;
 
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
-	if (IS_ERR(dev->policy_base)) {
-		ret = PTR_ERR(dev->policy_base);
-		goto err_cancel_work;
-	}
+	if (IS_ERR(dev->policy_base))
+		return PTR_ERR(dev->policy_base);
 
 	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
-	if (!dev->policy_buf) {
-		ret = -ENOMEM;
-		goto err_cancel_work;
-	}
+	if (!dev->policy_buf)
+		return -ENOMEM;
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
 	if (!amd_pmf_pb_valid(dev)) {
 		dev_info(dev->dev, "No Smart PC policy present\n");
-		ret = -EINVAL;
-		goto err_cancel_work;
+		return -EINVAL;
 	}
 
 	amd_pmf_hex_dump_pb(dev);
 
 	dev->prev_data = devm_kzalloc(dev->dev, sizeof(*dev->prev_data), GFP_KERNEL);
-	if (!dev->prev_data) {
-		ret = -ENOMEM;
-		goto err_cancel_work;
-	}
+	if (!dev->prev_data)
+		return -ENOMEM;
 
 	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
 		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
 		if (ret)
-			goto err_cancel_work;
+			return ret;
 
 		ret = amd_pmf_start_policy_engine(dev);
-		switch (ret) {
-		case TA_PMF_TYPE_SUCCESS:
-			status = true;
-			break;
-		case TA_ERROR_CRYPTO_INVALID_PARAM:
-		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
-			amd_pmf_tee_deinit(dev);
-			status = false;
-			break;
-		default:
-			ret = -EINVAL;
-			amd_pmf_tee_deinit(dev);
-			goto err_cancel_work;
-		}
-
+		dev_dbg(dev->dev, "start policy engine ret: %d\n", ret);
+		status = ret == TA_PMF_TYPE_SUCCESS;
 		if (status)
 			break;
+		amd_pmf_tee_deinit(dev);
 	}
 
 	if (!status && !pb_side_load) {
 		ret = -EINVAL;
-		goto err_cancel_work;
+		goto err;
 	}
 
 	if (pb_side_load)
@@ -595,16 +576,12 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	ret = amd_pmf_register_input_device(dev);
 	if (ret)
-		goto err_pmf_remove_pb;
+		goto err;
 
 	return 0;
 
-err_pmf_remove_pb:
-	if (pb_side_load && dev->esbin)
-		amd_pmf_remove_pb(dev);
-	amd_pmf_tee_deinit(dev);
-err_cancel_work:
-	cancel_delayed_work_sync(&dev->pb_work);
+err:
+	amd_pmf_deinit_smart_pc(dev);
 
 	return ret;
 }
-- 
2.43.0

