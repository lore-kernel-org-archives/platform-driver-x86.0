Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433494;
	b=i80GMfyDcpDGWHZ2mR6/PiA7NKnsE9/iLNzqRDGiz+0g/bAqxQ9BeUDUAWQC/e76CNeN
	 uouGEakluZUSZW5BFDMlKSEmt6TgpgleA4vlWrLoLV2TXkez8TQowChCaez7JBRhSCbIG
	 BLtI5H9pkdRKe5XU/PYna/WmqOLRN+kJhhsoeR17RdS0rsHJvNqVc/lDvbR4Jw2KR4GOR
	 yauGJ2hquNME1SCPHEIRyHAmR+NAvwJtzyABgoRDOw0ERZTfX/ZvP+TyrGQDFDMwnFG5M
	 57UGInqaPV7Y3lNRVbbApo60bw547poG9HU+bgOzjmC/N7fmjxZorNANQrZiEjuW5NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ob+rHnVcyvihM2cjsMId5sTJmUmQkH+KTxRLQJzqkyI=;
	b=jJx5gwUSjsl/HiAN396RpnGDdTXSaOb1NishkEpw4FTkfY0NfbYTx0TJ1QT/FQq5NyNL
	 pMPTjqwgxg4OqAOmpzaa7khULY3g2UDNNMZtgcZVtlIfZ30+PRCXSwMbU0p6XKmMDQQSv
	 l63o91jZERP+sp/xRZCtEI74rTiM1R4nU5RDl6gSskuplZPVD8tOvFGDmR/u2ob5LTB6G
	 9vwO6mfDRxugIC3tn0Yw9dsrdvTMI6z2qbPgaCtiWylh+rEPNekN+kYFNRCVlXSsss0N+
	 EPLYtF+WUxiNVXS7g5woW2+RagheiAWbCKqf/CPeFq3oI2Uw4X4sR7u41dYIOybO2rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1GXhTJD;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A283606A332
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A283606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1GXhTJD
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2527681a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433493; x=1795038293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ob+rHnVcyvihM2cjsMId5sTJmUmQkH+KTxRLQJzqkyI=;
        b=B1GXhTJDLSH/sbuUa5jSEc+ggEJT593kzWdFrcMoAqEoM6d3UXG6ql5ltwv3OrBuZ0
         cnlFkbVj9eTIzQn47Oj9GCJuhTNYrbJa0uhwQaZJKceq7u1OS6q5PpizzHsHhD+3IWpm
         ntIgZSYAXRCivMYSI4bXIsqQXp41ZJY4jwKgdwypUf2hI8uN17gXzHnqqcI0pFnZsNjY
         yP3TX6XN6I5gMij+OlupZQW06YhzGt9HL2s+uz3ekUDWQGmLKm9QuKeWxBENxYGbZFj8
         Z3lpXpG6iJ9wS84sHBVsd/+1L8uBs3vYpI46cGQn0QRyZ2zq8Yims5Ns6GADY0JQAos6
         5t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433493; x=1795038293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ob+rHnVcyvihM2cjsMId5sTJmUmQkH+KTxRLQJzqkyI=;
        b=ldvFjBsk9xlDw698VH2KUgGt86jaUIfoZQQLlWO+cb7c14uwm944yutT9iTV7WM2N1
         c6jFORzB7pxPqT145EIn7d1s6hp41we17qny/Z0+TyyiTytMJ3f/0M7b2YCJoYu2cWFA
         vIz92OGaZXae/3d6PT2lKwaKpvaq5y1R09ZiBl20fVlrkXhsJmjEBO3EonuDJk/Hshep
         5jHC8c1TZV1urtFSFtIbrpG646cY0+oXHwaK8ef/iQCdh+m85qf93ejlYFMgnfbLQmaC
         JkOtjDtc1S92H5HMNZubptP1c15UZimvLKVkA70T5Koy+fUVts7PauhB07L9SfKXt0j5
         A+JA==
X-Gm-Message-State: APuU4Z/X26zUL7HH4TnsJ+n3MjiOo6ln9+8KbZB71a+L0pa/xin63Hvg
	qxHtMGwmq+0wWYEIaxZHg4PU6k57QVC0qlBtMeN2K74VVbUV91QsVJMB
X-Gm-Gg: AYBFou3HFHAKKtb1HXyUovt4Bn/A8svTy6VX6oiZ0gMSqV8/No8JT+XfCdV2byFt8Mu
	oOK3Of4f2mmGplBHbAFlLO5Cz/MTNFfSZDfy3DIWlZsV36zxjHUHGB46MzPz07FXGEyYey+ep2B
	EDjAhaOiBUbBwpo99Vz8E1XvV3SZftsXmbDnVFqiw8ILN+c4+o3KfhjeeykKUrwX2CkdV61WMdj
	v6UvdegbAiqgUVKoe3JSesubVRR+o08nHknA7Mp6lJQAEfSCD/p5e2VVmvUDNOJok/jdynjxI+Z
	P47ZQBz5iH457bRiZsuPqTUiA7xJY4Dg3d6zYcy6aCzrgvwVNXtFZ6A6vzMx81jC6uPmJsC2ZBf
	/hHrGLYZtg4qdAfK55lvraEQotuk3gHupRwZg9HmFtwFJHEa4BJ4Drg08oC7hvVtvYiD5yTXnBk
	HufT5pdk/GD0hMKhI1Uqj3s+Dh43+32bEGoKqNAIK+yrP8M/jhXzDatVA6bDeVjLUEbFpQQN0qg
	oopsj+y/cocQOgvh3AhGF1fy8EQJbRuR8ci1k9jZfVvu4M5RGu+EdWbyN1AmQsT+kszYt/pGmjP
	2FBtxYkzvJ8qRwKw48HLIn6U1wN4swYNKPLvJa1t8i7E9kBCpQs/HJDKjKd91u+OdE3gRwMQhDo
	Znumgt/Y5dB4q7Mj0ecZN4kAmb1MgRjyq28vCeQK4tsFJYSB3V1HMKfaGUgihobXTPhwtYTinze
	jFKw==
X-Received: by 2002:a05:6300:670b:b0:3dd:85aa:452d with SMTP id adf61e73a8af0-3f2fe0a3583mr3945379637.31.1794433492804;
        Wed, 11 Nov 2026 13:44:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d6940f6sm2042637a12.12.2026.11.11.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:44:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-smbios: Accumulate supported commands across 0xDA tables
Date: Wed, 11 Nov 2026 13:44:40 -0800
Message-ID: <20261111214440.5473-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_da_table() runs once for every SMBIOS 0xDA structure and assigns
da_supported_commands from each one, so the last structure wins. Some
systems expose several 0xDA structures where only some fill in
supportedCmds. On a Dell Precision M4800 there are seven: the first six
report 0x40361f5f and the last reports 0, which leaves
da_supported_commands at 0.

As a result dell_smbios_call_filter() rejects every call made through
/dev/wmi/dell-smbios, even token reads from root:

  dell-smbios ...: invalid command, supported commands: 0x       0
  dell-smbios ...: Invalid call 0/0:      5c

and dell_smbios_class_is_supported(CLASS_INFO) returns false, so dell-pc
refuses to load.

OR the field across all 0xDA structures instead. With this change the
token read succeeds and dell-pc registers its cool/quiet/balanced/
performance platform profiles on the M4800.

Fixes: 1f8543a5d602 ("platform/x86: dell-smbios: Add filtering support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index c8e93c12c445..f79847f0bfe2 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -406,7 +406,12 @@ static void __init parse_da_table(const struct dmi_header *dm)
 	if (dm->length < 17)
 		return;
 
-	da_supported_commands = table->supportedCmds;
+	/*
+	 * Systems may expose several 0xDA structures, and not all of them
+	 * fill in supportedCmds, so accumulate rather than letting the last
+	 * one win.
+	 */
+	da_supported_commands |= table->supportedCmds;
 
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
-- 
2.56.1

