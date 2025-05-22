Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DDFA50
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 May 2025 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874104; cv=none; b=a9D8eSsJ5QeeY5ctffldf3jtHuQQj8dsYvJIFKhrlxj7KdvesIB9J1Yf+LGkM57s9NnTQTAgwHo3662WmEc3DUPnzXXAfpDxS1RGzQ4rta+lx4UjrFVjauto5O92JS/m1ibfrKIbnAUsO7jjvDrqVpvGc8iyeDhfYW4gPd7Iq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874104; c=relaxed/simple;
	bh=0OPjSA1zgoJ8JlXr7ZduiJ03Q9hAfriMsUXuPBXhavk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgFlpnwRgDpBdpHJopvMx16lKdoa5bI7jP8rHo1TTs1c0/xEd5vpsbIai+cIgjwbS2rNcqy1B8W2yede8TwnaiNOLIPuqVJ9I3S4rOEDELGwaVGXL9WWUdjaelJLDckq/wt7QF4lIARAkaodkAbj5OD/JZ1civhMYuIuOXLnC+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLUIlDTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLUIlDTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C7AC4CEEB;
	Thu, 22 May 2025 00:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747874103;
	bh=0OPjSA1zgoJ8JlXr7ZduiJ03Q9hAfriMsUXuPBXhavk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vLUIlDTHwKVMouv+PIk9dj7MgeUeWHsVobA0ooMbWT78RTZRnzvVoeyVmbrY9anDT
	 bPtmnZd7cPaeQECdPoYAbiFfKABdcns4nLUs7D8uaVQ7Kbug5ozc/i6jfWt49AjNuZ
	 yMFd+MDzEKImhOgQs9B0X+I2nmRyDV5M4Xk8EqOvbXTKOERQOuwGttPlMbGCyqeNO7
	 Amq5sSdBNTt/ehqM/j2nIgxvA42t647soMOYdUCnWrXE7dznd3n+jupGo4A6wd+7ND
	 RdW5BMspI4DltLzprr46j6Art/MvFqEukL9+YRjWT5KlUuvnYr/som7GK+XrXbJhx7
	 dHHQ8f4KoCFBA==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v5 2/3] platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
Date: Wed, 21 May 2025 19:34:56 -0500
Message-ID: <20250522003457.1516679-3-superm1@kernel.org>
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
index 027e992b71472..76efce48a45ce 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -420,12 +420,12 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, const uuid_
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
@@ -460,7 +460,9 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
 	if (IS_ERR(dev->tee_ctx)) {
 		dev_err(dev->dev, "Failed to open TEE context\n");
-		return PTR_ERR(dev->tee_ctx);
+		ret = PTR_ERR(dev->tee_ctx);
+		dev->tee_ctx = NULL;
+		return ret;
 	}
 
 	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, uuid);
@@ -500,9 +502,12 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 
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

