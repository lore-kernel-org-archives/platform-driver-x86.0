Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC052AE78;
	Sat, 25 Apr 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777138680; cv=none; b=eHXUYl4mwkooMhIGXsx+beM657QerNdlOo4h2Q+e7qNQfxR+dw9pu5JhEiwT7yopsVa8daYQVyf8N2vMqPGxbhWYrVtCfobD4QQoQ5F7sKcNb/vGBumMYTkUPeEEFbZ57nw0Wic6SzyRQL1vFMn31/OEdKXtuKvVJEiowb5LmOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777138680; c=relaxed/simple;
	bh=+pdmtcon42VWElEZHR1aaLdDpfyPWhH24qOPGS4yq/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNtt0luToviJST/94p4xStMtgaOxcJQTGqYQJKpgIPFAb0EtVFb/SOTvB+lfituHe4VETDJe9BhdhSca8NNtVWLY/zCzBn/QXzY7ONxrvbv2ai3ltBeDRK+qoDfWzKdfwa7J72NrOFFR1aYwkM1yS7Pfn3dq/k/s9Wj0MqdItBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmsFCtQS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmsFCtQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777138679; x=1808674679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+pdmtcon42VWElEZHR1aaLdDpfyPWhH24qOPGS4yq/A=;
  b=OmsFCtQScaTWM70s/b+BDb2tEu0qkP3dmGtAdz+xUjaA2ghjMQGnBt2j
   jiyPu3U1h1qIPAy/LOllZwFMWAjvGBjNyaqotLBKP8c/eXKPl0+enzRgl
   2ka/Hkoel09fN3it7pItsXmdnX3GvaV6JrMaQB/SCc15gS1Qd2CIU6fct
   IsblPY7AD1enNOdQT5bQ5oG6Yz323OlwQdB7RZilwY14g/thdagsN0cp0
   x1r1WvV4HJ8XNG7rYs3vYL6f/3KyJr2Rhaq2jpYDLy1NxOOgqrL9qrjki
   NAsIV3QnRw2vugJnb/ABTeneVEDiS8aOWi8KMGIc5944/Vg8v5NTw97yr
   w==;
X-CSE-ConnectionGUID: EehzlSfhRE+1QVosSU/YGg==
X-CSE-MsgGUID: jDH5c9RvQUKPpRMwqmb3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="77113488"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="77113488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 10:37:58 -0700
X-CSE-ConnectionGUID: LmmiCsbURaK8Q7+0k+O6tw==
X-CSE-MsgGUID: E88mEBj/SgiBfVr38VYh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="238233209"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2026 10:37:58 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Ahmet MEMIS <dev@unknownbbqr.xyz>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Harden daemon pidfile open
Date: Sat, 25 Apr 2026 10:37:56 -0700
Message-ID: <20260425173756.862547-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ali Ahmet MEMIS <dev@unknownbbqr.xyz>

Avoid symlink-based pidfile clobbering by opening the pidfile with
O_NOFOLLOW and validating it with fstat() before locking/writing.

The daemon currently uses a fixed pidfile path under /tmp. A local
unprivileged user can pre-create a symlink at that path and cause a
root-run daemon instance to write into an attacker-chosen file.

Fixes: 7fd786dfbd2c ("tools/power/x86/intel-speed-select: OOB daemon mode")
Signed-off-by: Ali Ahmet MEMIS <dev@unknownbbqr.xyz>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
[Fixed commit message for long lines]

 tools/power/x86/intel-speed-select/isst-daemon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-daemon.c b/tools/power/x86/intel-speed-select/isst-daemon.c
index 66df21b2b573..acedb7432849 100644
--- a/tools/power/x86/intel-speed-select/isst-daemon.c
+++ b/tools/power/x86/intel-speed-select/isst-daemon.c
@@ -148,6 +148,7 @@ static void daemonize(char *rundir, char *pidfile)
 {
 	int pid, sid, i;
 	char str[10];
+	struct stat st;
 	struct sigaction sig_actions;
 	sigset_t sig_set;
 	int ret;
@@ -200,11 +201,17 @@ static void daemonize(char *rundir, char *pidfile)
 	if (ret == -1)
 		exit(EXIT_FAILURE);
 
-	pid_file_handle = open(pidfile, O_RDWR | O_CREAT, 0600);
+	pid_file_handle = open(pidfile, O_RDWR | O_CREAT | O_NOFOLLOW, 0600);
 	if (pid_file_handle == -1) {
 		/* Couldn't open lock file */
 		exit(1);
 	}
+
+	if (fstat(pid_file_handle, &st) == -1)
+		exit(1);
+
+	if (!S_ISREG(st.st_mode))
+		exit(1);
 	/* Try to lock file */
 #ifdef LOCKF_SUPPORT
 	if (lockf(pid_file_handle, F_TLOCK, 0) == -1) {
-- 
2.53.0

