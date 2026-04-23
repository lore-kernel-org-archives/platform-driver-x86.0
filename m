Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0902BE053
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 19:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972771; cv=none; b=e2o+0HwbibHk3fiA2dl3vOwelk7W1QdrFhMEf+3hVz6fGtXPj5Svm/pj2N/6qR/WQTtnmdlRbrlpgOI9RcsfXsaPZxg+IdBl2WcapWxhGoOgRKB3iDim1VjLrRYY2KphEwjnqqCBVCPFgN9Vgv7HOjzqyOeRDHqQlV1cqnhZU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972771; c=relaxed/simple;
	bh=TJyFQDkT7b3c+oKe9CG3gPgrXFOx5h7CfyFvxRoK58w=;
	h=Date:Subject:Cc:Message-Id:From:To:Mime-Version; b=MmAtMDnxz7pDS4rKswdxQ3yggyEKyCsaUn1MlBDmAZBpLwSnrYomT/qOsQNXj8OvzRGQf9HuL+43W/voWSZLdkfWy8teIjWeD9by6cG51mRUamAKmJZOz3LBCSJcPtz7EvySkTrP8tfyXsrGpHvMpMfdAiSuXuhCWrrbZ0Gyi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=unknownbbqr.xyz; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=unknownbbqr.xyz header.i=@unknownbbqr.xyz header.b=h5Xak9Xe; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=unknownbbqr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unknownbbqr.xyz header.i=@unknownbbqr.xyz header.b="h5Xak9Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unknownbbqr.xyz;
 q=dns/txt; s=brevo1; bh=+fxAP06mWX2K+fo2gvpsSa8UERkEhD861J/6cN+s1N4=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=h5Xak9XeitwmFpzZMeiIeM9+ZeDcCFLvkTXjl/7IXYhY8kN4D6qLFPIIbYHISTbLv62y87hSB+zb
        vUBCWyPn5HvB3dY+7TLDOYNG2RZ/jaGIP82mVWz7yc2YAHfgHOLOkhwV/4glXXSVXkSjiTrUys8M
        cWeESbLg+sL38pTbkKKuTDhCyCRMsabOcXPY1e68P9CMruFtUBRNtn1vewBrBb6zp/u5bmIYY/L/
        DX87618e7hB1aq5FpLXlqkjJV8tkmg84HaSypYHkl2L5jIDwPvknKsJTshqLQZKsqEPuvZ19bKEr
        YEDks+OG3VdMWeJLQAbT+4e1TixALYJrHRR+5Q==
Date: Thu, 23 Apr 2026 22:32:38 +0300
Subject: [PATCH v2] tools/power/x86/intel-speed-select: Harden daemon pidfile open
X-sib-id: dOLLLPf5Euv7DzPe-iNNm8hpIyVdbzBNUoftB7N_s-jdaYv9_Ga_rPF6-_svcSoo9ts7u7IKQw9dJ2Hkho8jcMcsPNI42glt6pOK5nRv_uO-B73E8Y3gFW2-w9N5Uky5cMyJOL6v_AVW3MGab8PU3xb9rE6S1oUukWWkTYq3-fVCJyseV36uuBnkJxinIaBh0d8
Cc: <platform-driver-x86@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "ali" <dev@unknownbbqr.xyz>
Origin-messageId: <20260423193238.364-1-dev@unknownbbqr.xyz>
X-Mailin-EID: NDQzNzMzMzgyfnBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnfjwyMDI2MDQyMzE5MzIzOC4zNjQtMS1kZXZAdW5rbm93bmJicXIueHl6Pn5nei5kLnNlbmRlci1zaWIuY29t
Message-Id: <360cfdd8-c97c-4772-bc1e-85a6ee42a2a2@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.26:10473219_-1:10473219:Sendinblue
From: "unknownbbqrx" <dev@unknownbbqr.xyz>
X-CSA-Complaints: csa-complaints@eco.de
To: <srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.53.0


From: ali <dev@unknownbbqr.xyz>

Avoid symlink-based pidfile clobbering by opening the pidfile with
O_NOFOLLOW and validating it with fstat() before locking/writing.

The daemon currently uses a fixed pidfile path under /tmp. A local
unprivileged user can pre-create a symlink at that path and cause a
root-run daemon instance to write into an attacker-chosen file.

Signed-off-by: ali <dev@unknownbbqr.xyz>
---
 tools/power/x86/intel-speed-select/isst-daemon.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-daemon.c b/tools/power=
/x86/intel-speed-select/isst-daemon.c
index 66df21b2b..4346b049d 100644
--- a/tools/power/x86/intel-speed-select/isst-daemon.c
+++ b/tools/power/x86/intel-speed-select/isst-daemon.c
@@ -200,11 +200,21 @@ static void daemonize(char *rundir, char *pidfile)
 	if (ret =3D=3D -1)
 		exit(EXIT_FAILURE);
=20
-	pid_file_handle =3D open(pidfile, O_RDWR | O_CREAT, 0600);
+	pid_file_handle =3D open(pidfile, O_RDWR | O_CREAT | O_NOFOLLOW, 0600);
 	if (pid_file_handle =3D=3D -1) {
 		/* Couldn't open lock file */
 		exit(1);
 	}
+
+	{
+		struct stat st;
+
+		if (fstat(pid_file_handle, &st) =3D=3D -1)
+			exit(1);
+
+		if (!S_ISREG(st.st_mode))
+			exit(1);
+	}
 	/* Try to lock file */
 #ifdef LOCKF_SUPPORT
 	if (lockf(pid_file_handle, F_TLOCK, 0) =3D=3D -1) {

base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
--=20
2.53.0



