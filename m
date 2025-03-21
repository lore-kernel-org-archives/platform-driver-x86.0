Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DC18FC75
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742585461; cv=none; b=qpGK0MzpJdX0YBIYgqrBHUJtR2npFl6YxESbJ3GzfYklsH36+mMdi/avsvSMxCkZRB4CuB/3RqamdYyJoDgJvPAlKZBnQUdLluzjASEcy6pH5X8Ii6CJNvN2K1y2rjrLKsFTtqhn9PN34gxtDJvRNNV78oaOnB3sX2eteYY0gpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742585461; c=relaxed/simple;
	bh=gw3V7qnnFkKN0yhi466rojUtnhOLDgGoSLZNn8ifEAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TI0pbGDyMi1WAb4SZJmOsZzz+K+V0u8UYAYqCncKPgN0lKjwCL4BPr8mFwLfBBxyTnuzx5kZI0drJG8AZ4ilciprKhGn77ZVz4gKwOA/fzQeS0/FW4yWEOtK6QuHi66yMsfkXkVXXe8fslBl2LHuKB1GBZrzzeVKw3MpcFYvIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw2wp0zT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw2wp0zT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7999DC4CEE3;
	Fri, 21 Mar 2025 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742585461;
	bh=gw3V7qnnFkKN0yhi466rojUtnhOLDgGoSLZNn8ifEAM=;
	h=From:To:Cc:Subject:Date:From;
	b=Gw2wp0zTcp3xYW2Izd1QUZeZiW3IOQYaKWIPP5K0BH2fXJQ65nveTFUpEoYDlpqs5
	 3epxp0DMRZ0pHu8Et/RTMKXqqqjZbIldrrQtus6fsTN0iB1uCAn5we8rlqmyrds4d5
	 Y1+yn6dAJ+dnC9qqg5T2d6Q+b9JIWuHcHQZLBL40FEtu90m4oZ8b7Ic8HHz1Dy2dKJ
	 iNATOkZHZyIdN8/bPr4b+hD1K4+dVOoATraxOiUmbGl7B0F3XCnjmO/aF6Sl6Sn//8
	 U23GVzTLAm7Z5DAp5mPIR+mghuJXjUJqrE9eL73a0cUCCj3rIOCrPuulb9MpJmBztz
	 E19TQzKYGBECA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd: pmf: Use meta + L for screen lock command
Date: Fri, 21 Mar 2025 14:30:50 -0500
Message-ID: <20250321193052.2973537-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

In practice userspace software doesn't react to KEY_SCREENLOCK by
default.  So any time that the PMF policies would suggest to lock
the screen (for example from an HPD sensor event) userspace isn't
configured to do it properly.

However userspace is configured for meta + L as this is the default
in the ecosystem. Adjust the PMF driver to send meta + L.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 8c88769ea1d87..2c00f2baeec7b 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -151,7 +151,13 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				amd_pmf_update_uevents(dev, KEY_SUSPEND);
 				break;
 			case 2:
-				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
+				input_report_key(dev->pmf_idev, KEY_LEFTMETA, 1);
+				input_report_key(dev->pmf_idev, KEY_L, 1);
+				input_sync(dev->pmf_idev);
+				input_report_key(dev->pmf_idev, KEY_L, 0);
+				input_sync(dev->pmf_idev);
+				input_report_key(dev->pmf_idev, KEY_LEFTMETA, 0);
+				input_sync(dev->pmf_idev);
 				break;
 			default:
 				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
@@ -422,8 +428,9 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
 	dev->pmf_idev->phys = "amd-pmf/input0";
 
 	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
-	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
 	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_L);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_LEFTMETA);
 
 	err = input_register_device(dev->pmf_idev);
 	if (err) {
-- 
2.43.0

