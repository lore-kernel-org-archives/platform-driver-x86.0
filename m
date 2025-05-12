Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090522D4E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747084321; cv=none; b=FoG2S8U2na4sguLWtf2t0OrFWq9eDEyxK8FdIHsYVDmqZFIrQBe6V5vcMnW/i9NxJfnUnY0wjRrrT6S1J+dXfMuK4hJzHZpgvrBHHukmvdG0pk6qfcuMKBXOfMxCdRUBdBTzvNYuaLM/81SKNYt4bMd+Aff8Hf79/nljeKALw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747084321; c=relaxed/simple;
	bh=rDQE7llvwEdSSGgmBz2m722y8WGmGEMYJXIfbL585/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCILrePdNl1xXf4clPHMBpd2Z01kB/9Vd4qpzr6YF9wJxGcXJlkbtPsS2Wi4G2lpoFAN2ap9vO3rtD6lHmiDGHXNySn9H1asb0M5psnpAAgTCj3sIJZLTgMQ3b9wD6f8qHVwlw+T5Sq4XnRMlKkZNGW68S01cS//PC989Dx/A9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeE3OK91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeE3OK91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797F8C4CEE7;
	Mon, 12 May 2025 21:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084321;
	bh=rDQE7llvwEdSSGgmBz2m722y8WGmGEMYJXIfbL585/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PeE3OK91WRgnAxSvLixtS72Cxdq95dztYdx0UMwx7l2uF1R/uyscewXDlLymRAmEt
	 7Xt7KUVfem1qF0gthyxFnlHGmG5V/KbpE93Ih61kXZ/HwNBEKExmooYOTxP66NvCvz
	 YcqmhikEGtewqOzxZQzOYlxcJjpY2039WVW5vRjsjMkqtx4HxEGWYssh79ZqgLF/Qj
	 FxY7ixs3nrxaXzUGfIZpxpPpzDWm9ar8apgbhRDyNd72QzJ22suPxE2mPAodyJuJjK
	 Lh0YEbiIJLgHmsn7XYxG/Si7MqWyVNfXe7FUy7k+59LjKayJ/Qdj8JEQwIP6DphEqd
	 1vkRu5CDlSSig==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 2/3] platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
Date: Mon, 12 May 2025 16:11:53 -0500
Message-ID: <20250512211154.2510397-3-superm1@kernel.org>
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

If any of the tee init fails, pass up the errors and clear the tee_ctx
pointer. This will prevent cleaning up multiple times.

Fixes: ac052d8c08f9d ("platform/x86/amd/pmf: Add PMF TEE interface")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 513dbbe3f214..eb049e36ccb6 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -416,12 +416,12 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, const uuid_
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
@@ -456,7 +456,9 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
 	if (IS_ERR(dev->tee_ctx)) {
 		dev_err(dev->dev, "Failed to open TEE context\n");
-		return PTR_ERR(dev->tee_ctx);
+		ret = PTR_ERR(dev->tee_ctx);
+		dev->tee_ctx = NULL;
+		return ret;
 	}
 
 	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, uuid);
@@ -496,9 +498,12 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 
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

