Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C29B42902C;
	Thu,  3 Sep 2026 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424117; cv=none; b=Pi9X2zJDVQto3PHolX7U69To8bPwf3i9nvNg5vG9/ElzsaAJqAjUrFEXgZcpVTyeL6mnywHYUR+5SvOfrHDfaGLzGyGNnLJ3yi1iuJHw33WHoUELLkso89s5Ul02RvmX66YtWxOdEdwgvTk6Ite15Y+AnlqkV9Tyb94mOy0LN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424117; c=relaxed/simple;
	bh=ij13vawnDRk6Ds/5cRqCJj+JnO3s1zFJtLylvYw4Qg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q6ZyhFOKKa57UMLwVS3CaqXjOcAcjokcRSzbpy9XMARESKCr83Lvp0Gehys1WwG3NEjoJB57/kmY1IeYStbA5KCO6UY+Jt9UWnpr0HNnRJZKeOivFBmbtrJSK8KgpykSUy8LIOAMuorF3qGKaSvZIsAUYYbGv/5urdjF1DcD3gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=FNMHres/; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="FNMHres/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=FNMHres/bS2uE0Ou0A+JSNzXYlKfm42yEGcrBbIF9rMFdYYx5DQeNmOH5ZnSnePdwzz3rteHPvkNo
	 Y43Xl3eLdqgsedIZBOy49RYkSY3tl/J1ApCXid3raJa7ZmvdQ2EYu6CojpzGqywj1giL74jADAq7T6
	 wrXCJmtdr56ToaDA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46a992fb0940-48919;
	Thu, 03 Sep 2026 16:28:32 +0800 (CST)
X-RM-TRANSID:2ee46a992fb0940-48919
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76a992faf07e-1a210;
	Thu, 03 Sep 2026 16:28:32 +0800 (CST)
X-RM-TRANSID:2ee76a992faf07e-1a210
From: liujing <liujing@cmss.chinamobile.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] tools intel-speed-select: Fix signed shift UB in BIT() macro
Date: Thu,  3 Sep 2026 16:28:17 +0800
Message-Id: <20260903082817.5203-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Jing <liujing@cmss.chinamobile.com>

The BIT() macro is defined as `(1 << (x))` with a signed integer 1.
When x >= 31, this causes signed integer overflow which is undefined
behavior in C. This macro is used with BIT(31) in isst-core.c and
isst-core-mbox.c.

Fix it by using `1U` instead of `1` to perform an unsigned shift,
matching the kernel's own BIT() definition which uses unsigned.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
--- a/tools/power/x86/intel-speed-select/isst.h
+++ b/tools/power/x86/intel-speed-select/isst.h
@@ -30,7 +30,7 @@
 
 #include <linux/isst_if.h>
 
-#define BIT(x) (1 << (x))
+#define BIT(x) (1U << (x))
 #define BIT_ULL(nr) (1ULL << (nr))
 #define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (sizeof(long) * 8 - 1 - (h))))
 #define GENMASK_ULL(h, l)                                                      \




