Received: from outbound.baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E7282F26
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524052; cv=none; b=UGx35S7Y8Pu7CfIMW6NHJdL4DGOWhpk1niwJP4iMvxkkGsIYqY3yNo7H5nPFqBXkbQnhnrEAgROif10iSCOKhGFDuQhl0h4O44gQzJYoJXfF6nanhmiIHGIjlS9lFznLth/QJg3pjuTM/0CDonfQUzZZXx3PWHRsrAeVH8MdkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524052; c=relaxed/simple;
	bh=+QOrO1/LPx1zKqH1r+srmlmKwe7DHlEzLGS3cd6E1wY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kDITvH0zZTBwLaHHJ58TS2/QzROWLb0g0YlbTZe/lb9R6VdMQ+fzPLif9jKUgegaJ3s1GJqZKRF9T2yueepnUAtYkUiNwzvWqg4Iy1Bgh8+BVNPTy9acqK+GJOViwm3ZpJdy906soPmEt0t77cxNOw0kXVw3DgBstiDS2O7l6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: lirongqing <lirongqing@baidu.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v2] platform/x86: ISST: Check HWP support before MSR access
Date: Tue, 3 Mar 2026 02:46:35 -0500
Message-ID: <20260303074635.2218-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc6.internal.baidu.com (172.31.3.16) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
X-FEAS-Client-IP: 172.31.50.47
X-FE-Policy-ID: 52:10:53:SYSTEM

From: Li RongQing <lirongqing@baidu.com>

On some systems, HWP can be explicitly disabled in the BIOS settings
When HWP is disabled by firmware, the HWP CPUID bit is not set, and
attempting to read MSR_PM_ENABLE will result in a General Protection
(GP) fault.

  unchecked MSR access error: RDMSR from 0x770 at rIP: 0xffffffffc33db92e (disable_dynamic_sst_features+0xe/0x50 [isst_tpmi_core])
  Call Trace:
   <TASK>
   ? ex_handler_msr+0xf6/0x150
   ? fixup_exception+0x1ad/0x340
   ? gp_try_fixup_and_notify+0x1e/0xb0
   ? exc_general_protection+0xc9/0x390
   ? terminate_walk+0x64/0x100
   ? asm_exc_general_protection+0x22/0x30
   ? disable_dynamic_sst_features+0xe/0x50 [isst_tpmi_core]
   isst_if_def_ioctl+0xece/0x1050 [isst_tpmi_core]
   ? ioctl_has_perm.constprop.42+0xe0/0x130
   isst_if_def_ioctl+0x10d/0x1a0 [isst_if_common]
   __se_sys_ioctl+0x86/0xc0
   do_syscall_64+0x8a/0x100
   entry_SYSCALL_64_after_hwframe+0x78/0xe2
  RIP: 0033:0x7f36eaef54a7

Add a check for X86_FEATURE_HWP before accessing the MSR. If HWP is
not available, return true safely.

Fixes: 12a7d2cb811d ("platform/x86: ISST: Add SST-CP support via TPMI")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Diff with v1: fix commit message(return false ->return true)
              remove timestamp in call trace

 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index b8cdaa2..6f46cbb 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -558,6 +558,9 @@ static bool disable_dynamic_sst_features(void)
 {
 	u64 value;
 
+	if (!static_cpu_has(X86_FEATURE_HWP))
+		return true;
+
 	rdmsrq(MSR_PM_ENABLE, value);
 	return !(value & 0x1);
 }
-- 
2.9.4

