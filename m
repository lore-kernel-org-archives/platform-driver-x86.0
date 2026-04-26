Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDD126C02;
	Sun, 26 Apr 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777216173; cv=none; b=U3PYEzeySIXl17n3hi0TUzjOD0i85GmS23VS42yYogKXB6EK0rWokCGu2wMPBNT8EY1Z1+vx32QtER9X4HxD9p7nFdOz2+uS8N6xw9JvqiEAo+coZEMajOhud0+MMww9vTdosiCskU6VvG3BBlMnWPSxXRJTTP4oj30brmCaeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777216173; c=relaxed/simple;
	bh=xF8yfcHtzpv7+ttZN4fW2qfFrN7gMv/JggNIeH7LwkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFU1h8KLD9Z0fFz7fvI6tQea5y8rJBqJFqrl90s/vlSHacyvqVqud7fwJpzUtgir36sb7ynuVuaP1JVG9yA3vUS0aE/5AIEZPS//yG9IpVo6mXoCxO4ZHCM7ufIvmUaqQe5yf0d2V2ONLb8a3UGSHBDV3bSTdYp6fGqse84H8Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aveTJhaA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aveTJhaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777216171; x=1808752171;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xF8yfcHtzpv7+ttZN4fW2qfFrN7gMv/JggNIeH7LwkM=;
  b=aveTJhaAZWfJyUtlrkgwIzrOxsCDyaCHzVP9GYvC+HWo0etnb8W92K41
   23ihH+Z2o17PR3mtKKZK6FBejdN4fwPdsAvUUbt/Dkx+V08atCLRlU8+a
   rNh3mJYNGidXTqrMrLjPrkVEwfdFsZwaXDPAVyp9b6uM5NbY8k5RrvUy+
   aTdLXJqazSWn6NkAVoTxOGx6MsQrkrev2jBPhRPq+UQVY7WSPcX3s9gjB
   IvZDeD6ocxPTFzg0VKe+Oht0NwuscMf4t3NEvoeesBz0k+MvzRnzfLU1H
   wgBXpszAeE8cB8H1n9HhhjSrpGby7mt5KqYJnaQrM4Rb24k/nbUpARH/L
   A==;
X-CSE-ConnectionGUID: VRCEQI3QTzyUyRGoD/OfWQ==
X-CSE-MsgGUID: dzAzZyUyQ9m9cPO791HpCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89501439"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="89501439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 08:09:30 -0700
X-CSE-ConnectionGUID: 4QzipPG1RNmiEY3Y9oKJjA==
X-CSE-MsgGUID: ZAeAx6hUR22bpqBqORPBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="233295920"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa008.jf.intel.com with ESMTP; 26 Apr 2026 08:09:30 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Ahmet MEMIS <dev@unknownbbqr.xyz>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	stable@kernel.org
Subject: [PATCH v2] tools/power/x86/intel-speed-select: Harden daemon pidfile open
Date: Sun, 26 Apr 2026 08:09:28 -0700
Message-ID: <20260426150928.870914-1-srinivas.pandruvada@linux.intel.com>
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
Cc: stable@kernel.org
---
[Fixed commit message for long lines]

v2
- Added CC to stable

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
2.52.0

