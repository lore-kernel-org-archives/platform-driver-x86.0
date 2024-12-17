Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70E1F9AAD
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734464454; cv=none; b=br3HvovM1lDBGTsxW3R4JIVcG6Do2v7Jp24ysp0PMW8TNPJsUa0rbi7opeErTkb5zSo4KbjHLps70fKyWXX3D01D18nfLrVyA4K4XS/XCGzQu6bv1WJ2a06aI3ynWpX4gMeKzxZThrIeK4ebvDo+nsW7sQaPZgVg2IS8Fl0mFr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734464454; c=relaxed/simple;
	bh=1PZe0Caw53Sm+s6tD3MOGirEo/Q5DX2E3kAapm4Tyd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcZRt16TO0lVKdLZZNoXpDMjL3SpfGq8uHFzQ5dvEW8Pv9CDqU554lc6sBfzclm7lRfgP3zW71a18U5ucDrvNikF86R0kvxsqBKAUGypIRhMwRDCBs4CMu4OtiR3FijtRiva4vBAkL30wJjv93rnxBeo3jOyybpfSgCINUBVsbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEDU5EYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEDU5EYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C878C4CED3;
	Tue, 17 Dec 2024 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464454;
	bh=1PZe0Caw53Sm+s6tD3MOGirEo/Q5DX2E3kAapm4Tyd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEDU5EYPOa4ZRJ8G+6zHdKtRRLg95bsTwjSAyZTheJ1PiBuIyB97IUZNlMJHK+1gy
	 LP+Wehmi9vKytDdwOIlr+3zxTmqWabqJXGbHMKb5KpZe7yJFw2s1HUnmEhvoeKPqSJ
	 lApEIM1PtdrqNGuDOcR1xMoC+sQ2VTZMcGVzppp+Eaoyqmz2HhdGEomEGatN0H90mU
	 696FuLtDlvMRO8eGDMbOXo2hmRIFty/Sj6eLin12q/NcexFOntsY3GGQvwHvKPvJ/4
	 AUaCxzABLGF7FTmuQGONWP4iyT3kcOErnTycNsyxATwLlwl7w5YJy0YEtQ5YzrInZ0
	 FsqGD3wqDP/dw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86/amd: pmf: Switch to guard(mutex)
Date: Tue, 17 Dec 2024 13:39:52 -0600
Message-ID: <20241217194027.1189038-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217194027.1189038-1-superm1@kernel.org>
References: <20241217194027.1189038-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Instead of using the `goto label; mutex_unlock()` pattern use
`guard(mutex)` which will release the mutex when it goes out of scope.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  6 ++----
 drivers/platform/x86/amd/pmf/core.c | 18 ++++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1b9c7acf0ddf5..debd0e4ef9670 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -327,11 +327,11 @@ static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 	struct apmf_sbios_req req;
 	int ret;
 
-	mutex_lock(&pmf_dev->update_mutex);
+	guard(mutex)(&pmf_dev->update_mutex);
 	ret = apmf_get_sbios_requests(pmf_dev, &req);
 	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
-		goto out;
+		return;
 	}
 
 	if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
@@ -353,8 +353,6 @@ static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 		if (pmf_dev->amt_enabled)
 			amd_pmf_update_2_cql(pmf_dev, req.cql_event);
 	}
-out:
-	mutex_unlock(&pmf_dev->update_mutex);
 }
 
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 01eb9ee1eccd9..57ee95a327be5 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -127,7 +127,8 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	ktime_t time_elapsed_ms;
 	int socket_power;
 
-	mutex_lock(&dev->update_mutex);
+	guard(mutex)(&dev->update_mutex);
+
 	/* Transfer table contents */
 	memset(dev->buf, 0, sizeof(dev->m_table));
 	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
@@ -149,7 +150,6 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 
 	dev->start_time = ktime_to_ms(ktime_get());
 	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
-	mutex_unlock(&dev->update_mutex);
 }
 
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
@@ -181,7 +181,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 	int rc;
 	u32 val;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 
 	/* Wait until we get a valid response */
 	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
@@ -189,7 +189,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "failed to talk to SMU\n");
-		goto out_unlock;
+		return rc;
 	}
 
 	/* Write zero to response register */
@@ -207,7 +207,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "SMU response timed out\n");
-		goto out_unlock;
+		return rc;
 	}
 
 	switch (val) {
@@ -221,21 +221,19 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
 		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
 		rc = -EBUSY;
-		goto out_unlock;
+		break;
 	case AMD_PMF_RESULT_CMD_UNKNOWN:
 		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
 		rc = -EINVAL;
-		goto out_unlock;
+		break;
 	case AMD_PMF_RESULT_CMD_REJECT_PREREQ:
 	case AMD_PMF_RESULT_FAILED:
 	default:
 		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
 		rc = -EIO;
-		goto out_unlock;
+		break;
 	}
 
-out_unlock:
-	mutex_unlock(&dev->lock);
 	amd_pmf_dump_registers(dev);
 	return rc;
 }
-- 
2.43.0

