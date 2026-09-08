Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DAA38886B;
	Tue,  8 Sep 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850228; cv=none; b=u4G5YMQedgbR06haHA+YeGRl96Yb2Cye3TjuYYdldqoHonyOoBbNgkwOQivzru2DJFosJwYJDN6FVwjcQH+TF2y9TMBhnc34qR5TClbHRTGBafmu2lFgRbSZX1AjKz2IK9c7dt+bT8Wig+Ka1qJbKb8GWaUT6lAoVldRLnjAUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850228; c=relaxed/simple;
	bh=NtjbLC7sUqFVEim0JQeGgw8EhYFbjMRlHjELuExr8hI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYxzkFEvgZm1idbHijgQrxsknunwwWatD7N+llKTcct78Ku7qN/76UPgqM2NO5WNb4qR2PXlPLljwpmecuVWcbxV1X8yikGGKt7YT5rgHpE/7V8rrAfKYe6n10v/d+GzY+gR8QZYCWpKvNYO/YK25siB5289C2GeEwR7gtGfp68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWpNXeQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWpNXeQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F9B1F00A3A;
	Tue,  8 Sep 2026 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788850226;
	bh=/PPp8rYmucxJLkZ72D3LWIniJqu+l1/sZxASHHNm1/s=;
	h=From:To:Cc:Subject:Date;
	b=FWpNXeQuK6+YaQ0QuePlmJm2pSLgQrsl4DiZTlXVFLN1KQ5oCrU3IL0fYf6OAGF5E
	 eRPYcqQAmqGmnMC3XI+YKYWUWVyow8/x/ozRfBaKppuKF6YZRyNd/q9diMHRc7hNvF
	 tet/ExPwo6L25cLZJ1Ejor6dI+6lhl8AeSlUWqGARw47i1vejKxEFqLbyV8L214j1k
	 8BQSkPNr77oHu/ewscaum2zSJVD3ZFGm7YOmK4jJ9Xb66qlvb8eKndUYsg5GSTmyIt
	 MXKrv47xKVQzvI8QJRJxYJx/tAPUkI8huGp7CNcreQGpFOD4MCA3IQc6oK/nI3JUaP
	 0PUImbsPejKmA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: srinivas.pandruvada@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] tools/power/x86/intel-speed-select: clean all the produced files
Date: Tue,  8 Sep 2026 08:50:23 +0200
Message-ID: <20260908065023.168234-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1) The commit 7d440da009b6 ("tools/power/x86/intel-speed-select: HFI
   support") added the thermal.h link, but did not remove it up on
   cleanup. Do so.
2) .*.cmd files were never deleted, so were left dangling. Clean them up
   too.
3) The "*.d" pattern was updated:
   a) the backslash was superfluous,
   b) it was made more explicit by specifying ".o" in ".*.o.d".

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Cc: platform-driver-x86@vger.kernel.org
---
 tools/power/x86/intel-speed-select/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 6b299aae2ded..6f896f40c1a8 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -52,8 +52,8 @@ $(OUTPUT)intel-speed-select: $(ISST_IN)
 
 clean:
 	rm -f $(ALL_PROGRAMS)
-	rm -rf $(OUTPUT)include/linux/isst_if.h
-	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+	rm -rf $(OUTPUT)include/linux/isst_if.h $(OUTPUT)include/linux/thermal.h
+	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '.*.o.d' -delete -o -name '.*.o.cmd' -delete
 
 install: $(ALL_PROGRAMS)
 	install -d -m 755 $(DESTDIR)$(bindir);		\
-- 
2.55.0

