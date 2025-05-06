Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51868280003
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537097; cv=none; b=eIfFbpali07XA5gG4b9bF0BQUCxHU8/P2xtBGG9zS43mlqlqDV7C3t0quNxdEgheodN4UPl4iJfTSBW8iVnY7fsFDyG7Hg5Utcc6oBux/ujXGTc9+1uzZIyeyFMgGgYNRLsnMiyXpjgkaYLCk5vSCwMhaJBCPvnNX7fb/xIjLGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537097; c=relaxed/simple;
	bh=h1xSMAt3r2+nJWcru+W42nvfujrV1QQq8a9EYIi81jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0S8xIy5MmowEAsU9TXsJzysmhB5FGKIsDHoGhplzpTXWe8bdriS6mahtwYnzQl3Q6fuePCAyULWTmoee9w837AOX3pGPlHfiXKjKBPtDL05jqXbl+6Mwi/0lBNXBRgK15Mv9OlrpR5oX7DAV56flvjQrt+ixPn7j4rH7BXFjkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttHOTMei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttHOTMei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33007C4CEE4;
	Tue,  6 May 2025 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746537096;
	bh=h1xSMAt3r2+nJWcru+W42nvfujrV1QQq8a9EYIi81jQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ttHOTMeiYIGMhAlkJJA3uNiAypY1F9MUd19IoeQPlHNId/x6VernKAH+6IxSkROfm
	 g77rR8JLx3EFQJ8GvD2uGJseZsu7FHPg9HjxH6JN/kJY+O0sgV1cSVqJgFqvqXtnYo
	 INPF/Jad9RiPZRRBEH1pWcwq1ZXgoGlA0KaRGHwDvwqF2yXtqjwAivPYCtSUl9462O
	 piKEDcOeeFVwZJG/SNDUIHaKEnBr2OjRNEs9LiDqkizh6hZgEdJjpM2ROtm3IcT6rO
	 v9r+cIcQubB9H/voL1uY3J9VA1eG2taQGisieloYhcuUaz2lknm/SYdlV8iPnJ+E40
	 lEkpM5jbUMWvw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	dan.carpenter@linaro.org
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] drivers/platform/x86/amd: pmf: Fix a double free on module unload
Date: Tue,  6 May 2025 08:11:29 -0500
Message-ID: <20250506131130.1446262-1-superm1@kernel.org>
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
freed but never set to NULL and is again freed in
amd_pmf_deinit_smart_pc().

Explicitly set pointers to NULL after freeing them to avoid the
double free.

Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index a1e43873a07b0..48902f1c767c6 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -579,10 +579,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	amd_pmf_tee_deinit(dev);
 err_free_prev_data:
 	kfree(dev->prev_data);
+	dev->prev_data = NULL;
 err_free_policy:
 	kfree(dev->policy_buf);
+	dev->policy_buf = NULL;
 err_free_dram_buf:
 	kfree(dev->buf);
+	dev->buf = NULL;
 err_cancel_work:
 	cancel_delayed_work_sync(&dev->pb_work);
 
-- 
2.43.0

