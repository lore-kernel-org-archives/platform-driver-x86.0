Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46837AA79;
	Thu, 19 Mar 2026 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899720; cv=none; b=t45ULHlmMWJXJS/R3FwCFM89NKu5N9sCUyNScCVMWfjlRDFImcI5jkGt6+Eb3/HLt6L8k29d7spUYOyHO5/rLUXzFcaadCzgFo/1+wNlt7P3w29rNoSISza/U3fMyRMzBxcz+9/Hqw0o2d3dHulzNbOCF8HJxrVYWLTCXNLbHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899720; c=relaxed/simple;
	bh=pmte0OUJzK13yMW+uHfRW7q9KbquQn9WhZ4LSio4Wp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbmKJUTibo853Wqt1q8IvM/68SWM5ZnFd1xoSjTav1uC+gQ47PBvRr7HTXM1NYJot/JKuWgOlWuI6AVRYJuJeJXgCyuIVLdr9KP3anhwLKvwCZ5zc9Hc7aBwqJTrOMXg7HA62nh4C4XW4BWOigDZetASidQwTljnDKcndoydexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsnHenqs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsnHenqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773899719; x=1805435719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pmte0OUJzK13yMW+uHfRW7q9KbquQn9WhZ4LSio4Wp0=;
  b=HsnHenqsNq+VUiBgpvWp29s/6/PGa/8zccRAtOt/5J+LZlXdzhtuFYJb
   gJvM7GGUokOevCQimClq/4UINwr2PAt29nmu5Xu0evxUEsm2uGcaRB3Tp
   PnbH5KuxbkWVUGK0CEfAXUlkLH9e1/3T/mofzKfedfB05GsYFpUPX+So1
   PPKJsnjLE6Ayh7XBSlPDN3idbOK4MrfC7J1mKFvaU0vVoreJ588fMcbgO
   HQAEKyFtMdD34Y8/fRP/4UER9DDoxY9V1LNohtbVeELWwEIcSxBkEtmuR
   d2+0Asn3ODCiS9eN5D9lKANQxfid0paub/KKfrH5EWYNoGVetTrRm+wds
   A==;
X-CSE-ConnectionGUID: NScDIALLSyyd7/jPUro8zQ==
X-CSE-MsgGUID: m+F0O2ReRdag4xnw2Bm9Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084793"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75084793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:55:18 -0700
X-CSE-ConnectionGUID: i5tZj/EBSpKrq3owJ0RQ5w==
X-CSE-MsgGUID: sXF0LdkoR0uu8vD+/UjFcQ==
X-ExtLoop1: 1
Received: from rzhang1-mobl.sh.intel.com ([10.239.158.35])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2026 22:55:17 -0700
From: Zhang Rui <rui.zhang@intel.com>
To: srinivas.pandruvada@intel.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] tools/power/x86/intel-speed-select: Print Version info when Incompatible API version is detected
Date: Thu, 19 Mar 2026 13:52:55 +0800
Message-ID: <20260319055256.3226034-2-rui.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319055256.3226034-1-rui.zhang@intel.com>
References: <20260319055256.3226034-1-rui.zhang@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running an old version intel-speed-select tool on newer platforms,
even with "intel-speed-select -v", the tool only complains about
"Incompatible API version", without giving the current version info.

Print Version info whenever Incompatible API version is detected.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index bd9f7a1d385e..afef3af8b446 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -82,6 +82,11 @@ struct cpu_topology {
 
 static int read_only;
 
+static void print_version(void)
+{
+	fprintf(outf, "Version %s\n", version_str);
+}
+
 static void check_privilege(void)
 {
 	if (!read_only)
@@ -1137,6 +1142,7 @@ static int isst_fill_platform_info(void)
 	close(fd);
 
 	if (isst_platform_info.api_version > supported_api_ver) {
+		print_version();
 		printf("Incompatible API versions; Upgrade of tool is required\n");
 		exit(1);
 	}
@@ -3194,12 +3200,6 @@ static void usage(void)
 	exit(0);
 }
 
-static void print_version(void)
-{
-	fprintf(outf, "Version %s\n", version_str);
-	exit(0);
-}
-
 static void cmdline(int argc, char **argv)
 {
 	const char *pathname = "/dev/isst_interface";
@@ -3311,6 +3311,7 @@ static void cmdline(int argc, char **argv)
 			break;
 		case 'v':
 			print_version();
+			exit(0);
 			break;
 		case 'b':
 			oob_mode = 1;
-- 
2.43.0

