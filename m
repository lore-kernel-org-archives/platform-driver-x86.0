Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A435D615
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116672; cv=none; b=VVZZQL0qRgvabCJMZAeu3S3phGhLlvbfn6cKqNmYZDZ6r/gpzhzH8X3BuQsa/L9QuXVJyUIQv99R0t2FrKZtcz4BvA1dCSDxKU4V5aMcpV4glQybVxlTkvsevdheRHm/IHQvO6BGT3Jx/fMsUB+67pIIRoKQ5Mepa2MUfuvjH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116672; c=relaxed/simple;
	bh=Ql2A8yFn+4ufdzeFIw64rWNupDI/jRZkOBoo19GJ4fI=;
	h=Subject:Cc:Message-Id:From:To:Date:Mime-Version; b=S6JZzBOLgIWNvW+DbEEKWWtn2eE2OzQ1oKU9Vp9sRjSVETU+yYNyeBdiSmFUGfIoSAKYeA1MM3hl9Tby9PDTgVa2LfX5tO9TCPhGXx8/racTgL1MGvi0/dRKQ795oGfJjiJUiY69gZUuEL00W+1qF+3H01uGlJFWmHjTYONftl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=unknownbbqr.xyz; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=unknownbbqr.xyz header.i=@unknownbbqr.xyz header.b=Gfmtkvae; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=unknownbbqr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unknownbbqr.xyz header.i=@unknownbbqr.xyz header.b="Gfmtkvae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unknownbbqr.xyz;
 q=dns/txt; s=brevo1; bh=tjpiqEV3lHntAue4V3umDyply7Iht+6lSvFDgIM1nrA=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=Gfmtkvae91hyvxmuqnVaS27zb/wciFxJvjOqU9yrPnqioOitluV+SajBtFaUxpS4EWx+Yy61HWeZ
        yEolP6IWenqAVpBJoRsuwz+GKvp+9UP4SPUvaMzDMqVbyDDU3SMINbNzY2XPMR9QteXDrawUiP5s
        GWqBtgZ2Bhzm4G8NgksiKTcUrqSLbwn7kW9nZRpqcXx5FDXPsblqUcVVlEvtV9129yiVIGBnu0eX
        +tqMSo9nN4fbalPKpBAjC0xE8SATyFZBkDbzQO/vVXLKpPN0rKNDqw4w9I5bqMDzvNParIXvsPOh
        07ScTdfnvja/4qrmbU594JgObcLEPVLXJoXmdQ==
Subject: [PATCH v3] tools/power/x86/intel-speed-select: Harden daemon pidfile open
X-sib-id: HPyif34T-q_I8gQ7xN06Cka1wozRQYOxEO9AoJKNheO_D8RBVtj4k330VrVr3P71Na5NUbdjD921VV1tcq6ALIq1xLjjEeep4H2aRdBz-GJewDk0C8GhIxcbiSxB7T6I9lDNhK2F3xvUfubR6E_3vThTebbT80PRtFPo-KT0zzKHXWh8qnmb5pSnwtoFgWwDhZk
Cc: <platform-driver-x86@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "Ali Ahmet MEMIS" <dev@unknownbbqr.xyz>
Message-Id: <2e724c2a-40e9-4f09-9653-1ae28ff6877a@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CSA-Complaints: csa-complaints@eco.de
Origin-messageId: <20260425113057.178-1-dev@unknownbbqr.xyz>
Feedback-ID: 77.32.148.26:10473219_-1:10473219:Sendinblue
From: "unknownbbqrx" <dev@unknownbbqr.xyz>
X-Mailin-EID: NDQzNzMzMzgyfnBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnfjwyMDI2MDQyNTExMzA1Ny4xNzgtMS1kZXZAdW5rbm93bmJicXIueHl6Pn5nei5kLnNlbmRlci1zaWIuY29t
To: <srinivas.pandruvada@linux.intel.com>
Date: Sat, 25 Apr 2026 14:30:57 +0300
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


From: Ali Ahmet MEMIS <dev@unknownbbqr.xyz>

Avoid symlink-based pidfile clobbering by opening the pidfile with O_NOFOLL=
OW and validating it with fstat() before locking/writing.

The daemon currently uses a fixed pidfile path under /tmp. A local unprivil=
eged user can pre-create a symlink at that path and cause a root-run daemon=
 instance to write into an attacker-chosen file.

Signed-off-by: Ali Ahmet MEMIS <dev@unknownbbqr.xyz>
---
 tools/power/x86/intel-speed-select/isst-daemon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-daemon.c b/tools/power=
/x86/intel-speed-select/isst-daemon.c
index 66df21b2b..acedb7432 100644
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
+	if (fstat(pid_file_handle, &st) =3D=3D -1)
+		exit(1);
+
+	if (!S_ISREG(st.st_mode))
+		exit(1);
 	/* Try to lock file */
 #ifdef LOCKF_SUPPORT
 	if (lockf(pid_file_handle, F_TLOCK, 0) =3D=3D -1) {

base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
--=20
2.53.0



