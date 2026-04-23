Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D903A6B9E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964607; cv=none; b=XqIKQq1n91h0yS27YHHAWgOTm70pTxeD8vNoamGC6m2hPRt3TaQxWtrcZUcEM8Z3v1NZsDfUNfhQ+1PL5agveNHYFqfH7ApUDI0yUraQ++I185vPAgkqbuAtTlZ6C6XKmLT9pC7wU5ted2ydfDg6TtVX3GQZhDzBGPIVeCRgqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964607; c=relaxed/simple;
	bh=pvyYirCSrkeM14cOovyt45wUxDqhLZpCtG6pmoVTDY8=;
	h=Message-Id:To:Date:Subject:From:Cc:Mime-Version; b=duzcd4XfW9HLE6DBd/63GHGkmuU505kfoDGX6xuAUpEY5lZ902g3JXYUsnXx9YUsbjwgpfNU0J/6+tgNF8NaPZ25U/lnzH4R6RAiilSbYG626EBzR4meYs8NhpGyCFZhDdn5SQkUC+Zsp2Kw29uzVE+WSJ28tKY9X9wmtnPJStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=unknownbbqr.xyz; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=unknownbbqr.xyz header.i=@unknownbbqr.xyz header.b=Qqx9j0Ns; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=unknownbbqr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unknownbbqr.xyz header.i=@unknownbbqr.xyz header.b="Qqx9j0Ns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unknownbbqr.xyz;
 q=dns/txt; s=brevo1; bh=kfcuniS6RT21aqFvwTrT2zicvEoH/Fexf2RcvUJZJlY=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=Qqx9j0NsTOmqOdQDkXdr8y/XmW1lDQBGmwc35hVda6juSTV6ku+/Urbgi9CAkpdxdCns+wyHHj8z
        pZ9yrKW0p3WTg2dBFaxongt+bO1CJRopOWwnduq65lV5V259OWcy2m0ZsJAaJ04O1+txOXqFa0dM
        bkHN05rLfvLaXTchozXe5W7kb8Zgs6AiZ4WNJxRwSLi2qtFMvRZLQq2e6J94HjnHB2eHdBxVBWmf
        24SgPDbcC4lpfLl8+quA6+5SvzhFE17vty0cDRZprx3k/WLghxe5dknHUZZGYF0iCpQJnPhd4mYz
        rMPsfIE9bZcpo3Bc0kuWrUdCWbMoO3Vv3kkQgA==
Message-Id: <8f0eac73-54af-4ab4-8017-acc497b38023@smtp-relay.sendinblue.com>
Origin-messageId: <20260423171635.4355-1-dev@unknownbbqr.xyz>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.26:10473219_-1:10473219:Sendinblue
X-Mailin-EID: NDQzNzMzMzgyfnBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnfjwyMDI2MDQyMzE3MTYzNS40MzU1LTEtZGV2QHVua25vd25iYnFyLnh5ej5%2BZ3ouZC5zZW5kZXItc2liLmNvbQ%3D%3D
To: <srinivas.pandruvada@linux.intel.com>
Date: Thu, 23 Apr 2026 20:16:35 +0300
Subject: [PATCH] tools/power/x86/intel-speed-select: harden daemon pidfile open
From: "unknownbbqrx" <dev@unknownbbqr.xyz>
X-CSA-Complaints: csa-complaints@eco.de
X-sib-id: Lq5nyagRVp_G1hE9Bm5s27IVExWVijlQWevXSQF9HUf2ISwEH_wKEqPEIHZW-zhMohsRU_mqi3VfqOSy9OJF28oa7VBf0CGRisk7I-K8Zd0cVPemgDQFzlq33kvfByrRMD1kbHstQ3ffBmDaTrMBDn9OFbq39q1thzdsPRjwdzYtXNfJJWFEur68qj2NayfOwbA
Cc: <platform-driver-x86@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "unknownbbqrx" <dev@unknownbbqr.xyz>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable


Avoid symlink-based pidfile clobbering by opening the pidfile with O_NOFOLL=
OW and validating it with fstat() before locking/writing.

The daemon currently uses a fixed pidfile path under /tmp. A local unprivil=
eged user can pre-create a symlink at that path and cause a root-run daemon=
 instance to write into an attacker-chosen file.

Signed-off-by: unknownbbqrx <dev@unknownbbqr.xyz>
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
prerequisite-patch-id: b61dd51dee390277603975bf729a687113185c3a
prerequisite-patch-id: df28525061dd528875c7c75880b4684d80f4aa7d
--=20
2.53.0



