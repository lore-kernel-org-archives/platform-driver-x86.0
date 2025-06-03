Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62812A937
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jun 2025 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957064; cv=none; b=gcCf06CldYpVw5k3MSVg6JjVjL2EwRsKf2XDfiMCIZo6fZJcpGW37+phY4Mz0+P6BjAbnQb08SZzMZyIzSWvK2oahrhoAdCAzZU7jAcxG0OW2H544gQVRgID451tCTzJD3u78SfEK3eRWO4qI+WcFeqcXMhbTzNlxXzsi33/sCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957064; c=relaxed/simple;
	bh=tdJpgAgsAa5eulbLihhH6VVwvpLwI9d5nt8JMReSTGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4yehWrMtZ+/Z0guEQ5AaGZ05wkpW4jwZ6NIJv+gHbpVijVkATa4/hmpw4KzOOqJxwHu8TgvPLd4SUIhZ9hy8MRwA/Ty4heSBARLAl7oTiwy6Dv3S4hF4GFambgDk+9tnhZqt7dCDAaDGNgjfkY1ovvKgX3Jvm7jkxyTw1Cb5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkM6t38a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkM6t38a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487E9C4CEED;
	Tue,  3 Jun 2025 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748957063;
	bh=tdJpgAgsAa5eulbLihhH6VVwvpLwI9d5nt8JMReSTGY=;
	h=From:To:Cc:Subject:Date:From;
	b=YkM6t38axAnr+9jAh7kXZ7Xh0TJJtiJmW1RDVaLqFvOSJ5HikAOryznRnrOsARbVL
	 DQF1Qyces4glU+9gWpGplmSjVWl6+bLUmMmtZZsEL4Mtsr2xmAQFbcZkV7kZyxmS9I
	 KMa2EXWzLd4dTDFHhkenlCrCVNyUXJiupODCug/Ys9QDfCmFzjdcreTbcpVaQLyh9F
	 GIFdKNhT8Dml8YfuctZ4tOW0CMbrnQ+yVJsLFGXFOL1KFDaIeO9uRMx7JxSUwABrtn
	 sNNzgDBlISnlRIQdM3rCYTMdqhhVf50dJPcVoF5EvWZm24qLKvkPW6KPy6sG4DfPgV
	 azqdX6KEzNRrg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd: pmc: Clear metrics table at start of cycle
Date: Tue,  3 Jun 2025 08:24:08 -0500
Message-ID: <20250603132412.3555302-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The area of memory that contains the metrics table may contain garbage
when the cycle starts.  This normally doesn't matter because the cycle
itself will populate it with valid data, however commit 9f5595d5f03fd
("platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep
cycles") started to use it during the check() phase.  Depending upon
what garbage is in the table it's possible that the system will wait
2.5 seconds for even the first cycle, which will be visible to a user.

To prevent this from happening explicitly clear the table when logging
is started.

Fixes: 9f5595d5f03fd ("platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 37c7a57afee5c..0b9b23eb7c2c3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -157,6 +157,8 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 			return -ENOMEM;
 	}
 
+	memset_io(dev->smu_virt_addr, 0, sizeof(struct smu_metrics));
+
 	/* Start the logging */
 	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, false);
 	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, false);
-- 
2.43.0

