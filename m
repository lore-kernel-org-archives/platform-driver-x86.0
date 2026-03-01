Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12752641CA;
	Sun,  1 Mar 2026 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328042; cv=none; b=dmYT+yyz6C1bP7QoaoKmEd/g6k3y/+bHqw0/OVfR5PVkBz8lkf7/dnBttQ4NqNA/PNi4ycVCqQ/ePxSdElpAWxiw/sA8jCe0dTa6Jrhmvdqv8cssS+GKQCdHMPAgT20r7o7agjSAy77aOwxNbiKRhPuaL3srY+YzffQDvZbIuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328042; c=relaxed/simple;
	bh=zzJqnElXXcmJLakDYERjjwoeHefYzGfayTg8nov3g/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e8h2mMcZwtEocCDcadEklZWSM9CU3qujpTCbG22ZAZjyn7J/zSltAfStfQH4ob8QXzw7AO5VXwKRVnMIOZvRaq4+y1n/FWKN6Ux9hp+zJaWl2+4jVOEOsUVxMU1TM7wA9tnofxWRmsqM8sBnRlIoonWJueuejkukM0KlE3ZOuZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIyYKPm8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIyYKPm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4270BC19421;
	Sun,  1 Mar 2026 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328042;
	bh=zzJqnElXXcmJLakDYERjjwoeHefYzGfayTg8nov3g/4=;
	h=From:To:Cc:Subject:Date:From;
	b=mIyYKPm8K5DK9VGNNysy6/5oVV/+6zFbn5tohbf4ZXjC/vdLF/po0mTznweqSQKtU
	 2UDqwoKozWkHTDogiJl2/mFkwC6t9y25iGNdl9gaCuY96bJkW6Us1CO1gpgZ6ZMuyv
	 wA5GOVOtFjGrn7Fd+AAVkBiTrFgEvyaTSNCzSbXA1GnbA12YwCOF3reTmgWtWZU0S5
	 KZIHxKM5NLo7XnjiiQP6fZRd9Q1VDAhAe4FSQsOKI22XZTMdVSEWDvft3vcKsyAYPY
	 Xxd95aiBsq6cIPS6fgtl6hXwLtO0fQmensbUp6vH9mZ0rfDNBzXp8G71qZewVO7TVG
	 2UdF02QFpPsaw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: FAILED: Patch "platform/x86: ISST: Add missing write block check" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:40 -0500
Message-ID: <20260301012041.1676316-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 0e5aef2795008c80c515f6fa04e377c6e5715958 Mon Sep 17 00:00:00 2001
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date: Tue, 6 Jan 2026 22:02:55 -0800
Subject: [PATCH] platform/x86: ISST: Add missing write block check
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If writes are blocked, then return error during SST-CP enable command.
Add missing write block check in this code path.

Fixes: 8bed9ff7dbcc ("platform/x86: ISST: Process read/write blocked feature status")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20260107060256.1634188-2-srinivas.pandruvada@linux.intel.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 34bff2f65a835..f587709ddd473 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -612,6 +612,9 @@ static long isst_if_core_power_state(void __user *argp)
 		return -EINVAL;
 
 	if (core_power.get_set) {
+		if (power_domain_info->write_blocked)
+			return -EPERM;
+
 		_write_cp_info("cp_enable", core_power.enable, SST_CP_CONTROL_OFFSET,
 			       SST_CP_ENABLE_START, SST_CP_ENABLE_WIDTH, SST_MUL_FACTOR_NONE)
 		_write_cp_info("cp_prio_type", core_power.priority_type, SST_CP_CONTROL_OFFSET,
-- 
2.51.0




