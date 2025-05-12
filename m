Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDE22D4E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747084322; cv=none; b=RaI6L39KBnQcoAXuP8WxdlLYUFDtG43wizJ/dAAcGwd3AWdUAHInDh1X7AfmOjx724zcR6kHFk0Sz+vKyzhiImaD2vhMTXnsT3tvBq9brmZPFfLCmMM20wcmCCE8vplBoFCWbB5EEQr3FdKmS45WXPb8yXgON8wEwzncqfYixWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747084322; c=relaxed/simple;
	bh=s8BAqK95gpwsmSPQ+VQo2xc8t5pRTvXqoiDiqdzKWE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRJ2sOPoum19xY+FPr8Q44NtMG1ly98p0TVfgQD/4JuHwNtkW/5tlb0Tp6EuMpoPajut5PNhN5ksW3NvkZYblCZeNxNmDqeq8Bzkgoowj70OL97x60LYcpwAHPGAJUaOQZmUmQkFYRTehjIAwFcfxOT1xobA0wiNxUnsRZ7zVUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgNAOAH4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgNAOAH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C73C4CEF0;
	Mon, 12 May 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084321;
	bh=s8BAqK95gpwsmSPQ+VQo2xc8t5pRTvXqoiDiqdzKWE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgNAOAH4iXOFDSya/gz+Lf52RZ3u8417PBHbw0fFPgzzndlOhDz3iR8JU9AR3hde0
	 0oMmUi0N4sTXqNdRlyWFxDlbDqOqh8Yhq2BAdsJmYGNnMS2Qo7NAHJsjz9ETOENPdi
	 jxEBT+qHJ3RfCQz0DoNsMDQcKKd3llHqy8WaBOyHGPZMVYpM9FkqLmLeFVjtLL2Mvl
	 mHNjr8t89Foj//cphz+golzkRhuOWjpqcesGPdZtwB3zfJLct34DgN5ncDb3FaX4T/
	 3N1aX6U/QP1SRcBjz5Ku3W92u6cQqigHouBgiOKe/wQN1PFR70ab3TOhFsw2wtHv5m
	 frGBxheGZwIdw==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 3/3] platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()
Date: Mon, 12 May 2025 16:11:54 -0500
Message-ID: <20250512211154.2510397-4-superm1@kernel.org>
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

commit 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
amd_pmf_init_smart_pc()") adjusted the error handling flow to use a ladder
but this isn't actually needed because work is only scheduled in
amd_pmf_start_policy_engine() and with device managed cleanups pointers
for allocations don't need to be freed.

Adjust the error flow to a single call to amd_pmf_deinit_smart_pc() for
the cases that need to clean up.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 55 ++++++++-------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index eb049e36ccb6..7f80f70bcc5f 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -526,64 +526,45 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
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
@@ -591,16 +572,12 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
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

