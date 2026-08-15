Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BAD4B0483
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786786554; cv=none; b=Fx11w1aiN48UeJhyVTxC28tVCrniV+7LiuNYbZXv+7CehUKTIDkJcMDN2nCOGbXrBmhpP6MvdMvHndpeGcw1ZAiCPluSFl3H4+NoU8iYG7O88nFqVakPSQbHtPYJ5BFNCFdniAdruWR+pn9HCR0UELSH53WTvCgt03y95e2eW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786786554; c=relaxed/simple;
	bh=gMNZJzMy8fvGZnwzy1l+ago2w//J+DKZSCPQ/3w/mP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sW+WxEccy9OyL3HRTtzumXTA0hh6iHLy7HRk4g/nmTZ3JHhyMi8G5AYj1j4nEDgSo5O9/DKQ6OzeAFf3iRcbtPAYToqvKsk1r2Aliiuuw5RcmY/tVg+T9Y1zAfUIHzetOWebSR6FZEm1ZZktytEyWKBIEcoGQ+mxwPn37rk5ms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UybbAAkN; arc=none smtp.client-ip=95.215.58.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UybbAAkN"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gMNZJzMy8fvGZnwzy1l+ago2w//J+DKZSCPQ/3w/mP8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786786549; v=1; x=1787391349;
 b=UybbAAkNFHIXb/9/ldUhhnBvXLjmsTP8bLFz39rk/6nyt67zgZ0e6a/eALknyZ3TX8A7dBwt
 ig1HSpUM1j/Hs0vekNJjaNbtjTn9m1a8+NR289hmUsir6P/c79R00jC7jqPRFitlL47O0iUPS4N
 U0AgifiyGDdqqbaYuO3NIuZQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from fedora.fritz.box (62.216.208.217)
	by mta12.migadu.com with ESMTPS id 828fdea9f6f9e662;
	Sat, 15 Aug 2026 09:35:49 +0000
X-Migadu-Flow: FLOW_OUT
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Use ARRAY_SIZE() in tlmi_errstr_to_err()
Date: Sat, 15 Aug 2026 11:34:32 +0200
Message-ID: <20260815093431.98950-2-thorsten.blum@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=thorsten.blum@linux.dev; h=from:subject; bh=gMNZJzMy8fvGZnwzy1l+ago2w//J+DKZSCPQ/3w/mP8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkNRsu/3Pe2dklrkb/w7aqN1Y/jOs+Kp584/7z+mUxqs XGyRcuGjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjI68sM/3QzYzqlbyt180XJ n+NRn32WO5xxfd5HxWtWr/XYNx14zsrwT+0OUySXckXAspNd8sEbk462H6/++ePGu/tLOlj/Cvx L5AYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use the ARRAY_SIZE() helper to simplify tlmi_errstr_to_err().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/x86/lenovo/think-lmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 26ee6ab34a15..81ab6aafee47 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -249,7 +249,7 @@ static int tlmi_errstr_to_err(const char *errstr)
 {
 	int i;
 
-	for (i = 0; i < sizeof(tlmi_errs)/sizeof(struct tlmi_err_codes); i++) {
+	for (i = 0; i < ARRAY_SIZE(tlmi_errs); i++) {
 		if (!strcmp(tlmi_errs[i].err_str, errstr))
 			return tlmi_errs[i].err_code;
 	}
