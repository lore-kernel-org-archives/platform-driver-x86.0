Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2C4611C9
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066218; cv=none; b=QhX5lpm5JrSJZ3qSvl9h7H/OIg6LbIZI0JkHqp3DhUxhLHuruSlOLAQ1X+wpohjSYTLbNEqlpymo/+6FJmbGSmKjf8V3PqJ8AkhIo/rgQYhyBadm3YIdcxu81GSYDwvpRjTkvoJFpzuwOof3XyjNg6SBNN5TdQXAPnQgdVIiNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066218; c=relaxed/simple;
	bh=OZBSs3MulL6PxfR8Rh64/Zm57qY3iFlYFkis+l/sOIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S1nlJdCTAwVBrVbRTGMBBm52tpm45wiHVjRXnbp3HoMIYYbLdFNIX7Elwv9qPYCENuJcT7QOON/qIkjX1vtKGMAXytFhSYx2g9636YTAKBtmKS5z2i04moVAm8tOSyMZNiy86knPrgtRu87xgraX9vIPiEpXRNQ/EuTeIH5roeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rDok33OJ; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rDok33OJ"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OZBSs3MulL6PxfR8Rh64/Zm57qY3iFlYFkis+l/sOIg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787066213; v=1; x=1787671013;
 b=rDok33OJMS0BK4wQi6xCUo39HR+SYSn3ZneC7/JKDZTWFdV6aoSNnEk6WTaQXdYRzwnsWHpG
 CegUITXCEs7JDLdjs8YaRN0cbxbl6S/Ai05VfVeO2AUD+gB8emh0BPqlb7DZG48FullkVOYSo44
 AXIx55whUJZB8FsVSkBqhEJY=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from fedora.fritz.box (62.216.208.217)
	by smtp.migadu.com with ESMTPS id a1cdb27a9ddcd145;
	Tue, 18 Aug 2026 15:16:52 +0000
X-Migadu-Flow: FLOW_OUT
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Mark Pearson <markpearson@lenovo.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: think-lmi: Fix current password length check
Date: Tue, 18 Aug 2026 17:16:35 +0200
Message-ID: <20260818151635.37094-2-thorsten.blum@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=thorsten.blum@linux.dev; h=from:subject; bh=OZBSs3MulL6PxfR8Rh64/Zm57qY3iFlYFkis+l/sOIg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkt5cEMrhLzPF6Z3Fo8v+D4PSaDI40bxU8WPJt2sLRu4 dfoMgXPjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE9gQLk4BmMjq7wz/NLbxtv/l4D8YOTuS sVPgp2HdtGv78pcdT7G55qF9e0HAE4b/ZZZr3ulqb7ANsp7rJ7CiTyK9k+teU8sz644Mb33lxb9 ZAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

current_password_store() checks the password length before removing the
trailing newline, which can reject valid passwords that are exactly
->maxlen bytes long.

It also passes ->maxlen to strscpy(), which truncates passwords without
a newline.

Use strchrnul() to measure the password length up to the newline, then
copy that many bytes and add a trailing NUL terminator using strscpy().

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Cc: stable@vger.kernel.org
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v3:
- Use strscpy() instead of memcpy() + manual NUL termination (Ilpo)
- v2: https://lore.kernel.org/r/20260813082049.41209-2-thorsten.blum@linux.dev/

Changes in v2:
- Keep and reword the newline comment
- v1: https://lore.kernel.org/r/20260810132018.156868-3-thorsten.blum@linux.dev/
---
 drivers/platform/x86/lenovo/think-lmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..c1ccdd7491af 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -438,14 +438,13 @@ static ssize_t current_password_store(struct kobject *kobj,
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	size_t pwdlen;
 
-	pwdlen = strlen(buf);
+	/* Strip newline; setting password won't work if one is present. */
+	pwdlen = strchrnul(buf, '\n') - buf;
 	/* pwdlen == 0 is allowed to clear the password */
 	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
 		return -EINVAL;
 
-	strscpy(setting->password, buf, setting->maxlen);
-	/* Strip out CR if one is present, setting password won't work if it is present */
-	strreplace(setting->password, '\n', '\0');
+	strscpy(setting->password, buf, pwdlen + 1);
 	return count;
 }
 
