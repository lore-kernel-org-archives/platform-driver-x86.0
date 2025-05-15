Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35261FCE
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 May 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326238; cv=none; b=eP7jgqk9zjhr94bN0KG+aHvzB/bGH45PPNSEHJLPWuBEpYT//hpST3I9bJ91lQkBNrs509yn2HYxP3rlcZx4VfsErwmbyHMlVzg20gkD8jGk64OkCqT2jkv0bbrFQD0siTpZ0+khL2zn0jDUOnq9Puz7sx7a6UXiELWPlLLTUsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326238; c=relaxed/simple;
	bh=ue1B5BufKwAJrfQbvGiJqLXls+LbmsSvPB4lHnLWkoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDyG96v4AmwRHtcput+lHYewVLRif/epe9GWSZSXjN53QC4FKw208u7sXSh+s8xRxabXa3Ejz5/9p6K8v1MIDK6+9PVzSgUPt8yVrzDEAlD0OWXFnHwFg6Knm51qTQuB5Qs9/MeN6t4DsDxaFSIy2F94Ee9KcRliClPh/sPGoao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro4qSMEM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro4qSMEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A428FC4CEF0;
	Thu, 15 May 2025 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326238;
	bh=ue1B5BufKwAJrfQbvGiJqLXls+LbmsSvPB4lHnLWkoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ro4qSMEMLWn1zY/Pkn3Ek7GHW90MdqcA14aPtJ5r+dmFLYEoZKmSEyTwwAS7tKF9L
	 298z5LTHLwxouQN3HNezGIlPEYETzpAHyMjzcs/l2qG9gtXZOHZMHGHPHKT9EvvKjJ
	 LbxY0PX51aicGSk8OxadQ21F2iSYuc64eXTn3QGHCk+r6O5zaCaWSHDbAZtBl/HYz/
	 MXbx419yyV0DcvogqW+3VDjpttQhMpj4uw0UZh4xmbvA51ux2XsodMp/9tKYbRQjvX
	 ueWMp/y8stSwt14I+r92F8ff5msaBQjkVwwqhP2P/Ecg5IrW7z3fGmQwX7RExMRwp4
	 ACbHdjC1FdUKQ==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 2/3] platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
Date: Thu, 15 May 2025 11:23:50 -0500
Message-ID: <20250515162351.2111468-3-superm1@kernel.org>
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

If any of the tee init fails, pass up the errors and clear the tee_ctx
pointer. This will prevent cleaning up multiple times.

Fixes: ac052d8c08f9d ("platform/x86/amd/pmf: Add PMF TEE interface")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/r/20250512211154.2510397-3-superm1@kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6d85601812225..1b268fffe96e2 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -414,12 +414,12 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, const uuid_
 	rc = tee_client_open_session(ctx, &sess_arg, NULL);
 	if (rc < 0 || sess_arg.ret != 0) {
 		pr_err("Failed to open TEE session err:%#x, rc:%d\n", sess_arg.ret, rc);
-		return rc;
+		return rc ?: -EINVAL;
 	}
 
 	*id = sess_arg.session;
 
-	return rc;
+	return 0;
 }
 
 static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
@@ -454,7 +454,9 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
 	if (IS_ERR(dev->tee_ctx)) {
 		dev_err(dev->dev, "Failed to open TEE context\n");
-		return PTR_ERR(dev->tee_ctx);
+		ret = PTR_ERR(dev->tee_ctx);
+		dev->tee_ctx = NULL;
+		return ret;
 	}
 
 	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, uuid);
@@ -494,9 +496,12 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 
 static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 {
+	if (!dev->tee_ctx)
+		return;
 	tee_shm_free(dev->fw_shm_pool);
 	tee_client_close_session(dev->tee_ctx, dev->session_id);
 	tee_client_close_context(dev->tee_ctx);
+	dev->tee_ctx = NULL;
 }
 
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
-- 
2.43.0

