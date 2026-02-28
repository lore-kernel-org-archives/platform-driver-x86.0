Received: from outbound.baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E913B293;
	Sat, 28 Feb 2026 03:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772250796; cv=none; b=UA1Abuae4egoUnugSikTqX9Zpu43wHDmapGyLbEo4px5QntRRPv5P073m79vV7goZK7nOeEBGGARKwgqJZnX/MF/HF76MPXa54nXrpfiyqOfEkxnjiQ2jbEY+pMtBqG/5O3vXo4VQLV438Phtt4F+RyMGzCbRFvPvobO6bdXSlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772250796; c=relaxed/simple;
	bh=J5qk968q0DPeb/T1KNKBJDnKesdQi7hf0GKAmYxkqCM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fkqVQSsnC2bQFOwipF//4FQBolXskT/01DmrRt6e0f4bTwPJjhJslGx/xOaaVWyJXY+1SRwcEQd0o65EyIiVuKxOSln5tflYLArdAD7tTwEx1WmjsZNNOLIA9R94qDeVPtwWYM1kb22pBBdEqedHxIz0jGbVZS7txsD6htILfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: lirongqing <lirongqing@baidu.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][RFC] platform/x86: intel_speed_select: Use static_cpu_has for HWP check
Date: Fri, 27 Feb 2026 22:51:08 -0500
Message-ID: <20260228035108.2543-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc10.internal.baidu.com (172.31.3.20) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
X-FEAS-Client-IP: 172.31.50.47
X-FE-Policy-ID: 52:10:53:SYSTEM

From: Li RongQing <lirongqing@baidu.com>

The current implementation of disable_dynamic_sst_features() reads
MSR_PM_ENABLE to check if HWP is enabled. This can be optimized by
using static_cpu_has(X86_FEATURE_HWP), which is the standard way
in the kernel to check for HWP support without the overhead of
an MSR read.

Replace the MSR read with static_cpu_has().

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index b8cdaa2..416620b 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -556,10 +556,7 @@ static struct tpmi_per_power_domain_info *get_instance(int pkg_id, int power_dom
 
 static bool disable_dynamic_sst_features(void)
 {
-	u64 value;
-
-	rdmsrq(MSR_PM_ENABLE, value);
-	return !(value & 0x1);
+	return !static_cpu_has(X86_FEATURE_HWP);
 }
 
 #define _read_cp_info(name_str, name, offset, start, width, mult_factor)\
-- 
2.9.4

