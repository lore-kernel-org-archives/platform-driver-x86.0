Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659B2DB7BE
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924138; cv=none; b=P/h7AX1JSCmNNElbwpUzroDGdeGCsNhGjaKB/77T8E4CSJbW6nrBqILjSy5tAz6tZSy1lBaNa+TGffzs2ljvAh66yAtqF2wHrmNIn9nD7OZX8mhU9Tg1pw2vcPldS/uIjxeARN7N4uazO2x9qdo9lN+gUhHOrtMy1XNojJ6L54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924138; c=relaxed/simple;
	bh=MzVVASsNizB+GyaQ0ecRPb3T1mBvjMGS+6FlJ0PSfNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XuuNumMMoSQWNXShGSRMho7RzMtSARoARzC5RJjlLZb1EjLaIYqPkueFQYCy1TSR21+P2rdvSunnRLUBHLGEKLTUKimGu2BRFi0r71w76rcedI2lhCdS40UgrrmODryFViyiFKtJSgAldbrrWNKg73mHjnITYqwurLWVS1H9ksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9mH8z6W; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9mH8z6W"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493be1b9682so6621435e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924134; x=1783528934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNK6yP4DtKKIWH11Br1ywJAsRZJ3+ILF31oArDhaIxQ=;
        b=S9mH8z6WQTETH8Nsj3huoYL5a/iW2yDLBtzvqLXjOJqkNt8PrEwoszrCc91asoZvJk
         cDfj49124cl9FPHi5MRg+NskXfVL6nAGzYt5ptoOV7HkRaxQ99YvpcXuZkZIrG5MeCKK
         PdbwLzrG5ycShLDOzLpspI5ZTfEbjSg4oi6j2hNxcEHtnP5OhdkmuyG6rEQLi7usm6o+
         nHp6sKs8VYkPFsm3RTr+ZTc6FePI/7xnU1qko3/4wHtyG5T0jew4nF9DVJwpTsxuydyB
         scjTAGNy3TsPg2VCd1zEogXgv9k1iSb4j1w8EWIhBnjwOEmp45V8o0AG7mXxE1b7Hfdz
         Y7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924134; x=1783528934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNK6yP4DtKKIWH11Br1ywJAsRZJ3+ILF31oArDhaIxQ=;
        b=FKAtdnWkLUPooUMvKLdEcnmgjYZGgHa1yMn5/WgOj4/Bph3CxKr4zXObgFWubSKohb
         FXzHGZJjeV4ejQjuOZ4lxfHRBGPtyNimb+s0lTfEc8jcO6Uc49B1CHpSKMP7uxTqB5Pd
         iRsBFU5u4i2a8lgtByO2PDrBWVIfRz7gOIuCJ4XFZCVbkdivqKi2wPOFQFtrJRuOu6eY
         VMk/QySE0uPhyfZrrUdDajh3m1KhuISiRU4qpGZIUIUrE/f96EdF3Hnvu0g40BNZLdcP
         jGRPLj1UuNgBD6BaRww/zaLvI8sIuZllwVxIv9f1ODqidX7cWrkfoJXQlIWLePht/eO0
         tIfg==
X-Forwarded-Encrypted: i=1; AFNElJ9Wftncgd63sYYlPWvMFBbdFNr7sej1rwvLe3UGi+OuRrOsOlrRihGBxWGMSOuq9lp+PJOGhrbi8AbFo5ScxYUY4j11@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mxwxbyEFCH84NnbRE6UpiWqk9gYLnF1i3EFBEyCOc12wiGJe
	LT3A52O5UyTpTr37r+YK0ierGUi4ruXEABfAcw3oVF79KjWqdsI8kgY4
X-Gm-Gg: AfdE7cnikRqVXeYTq40XZNWm3JFlHAS4uBNhtNywdXvVEn8EdQSXrZubzoQtGHNApxK
	avMOmtDgvJ1T9dQAwIInvOPxW4Tgq1bObuRc2SogbPCiWjyeINE+l44TNE0LD6UlK8OXWKu465C
	lX5quAwAN/dUG/HxhTW6D40YYERLCHS3mIvMI9D3VwJk9P8cTC2I+sTtfWBw+D0WcwBG3c3IohJ
	DpGvHBJC7M6BTDYKHEDcC+L33sZlsObPoNgMBYgOg/Q3lK1I5kxpre4fa9J/yqGM1FkGjDFJ3gn
	WkhAGxXBdhDWXC7hzkqpHaw5ZLDhDX+irtAykKEX7+42jXynjuucBD9QcrjAY7lmEVqAERBSINj
	YlMTYvl3jfz005ie4i7Kj1An5UuSGrS5osr7EEZilSrvldXnMe+4kPYIZmZk/yrIIAItFbujNJG
	WN6lAj8RD0kzqrHppi6r+Z9xDvWg==
X-Received: by 2002:a05:600c:530d:b0:493:c478:8744 with SMTP id 5b1f17b1804b1-493c478875bmr8270915e9.18.1782924134085;
        Wed, 01 Jul 2026 09:42:14 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c9b5sm1048977f8f.20.2026.07.01.09.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:42:13 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: jlee@suse.com
Cc: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v3] platform/x86: acer-wmi: reject missing gaming WMI results
Date: Wed,  1 Jul 2026 18:42:04 +0200
Message-ID: <20260701164208.8998-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260630204645.18124-1-alhouseenyousef@gmail.com>
References: <20260630204645.18124-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WMI_gaming_execute_u32_u64() returns success when firmware supplies
no output object, leaving the caller output untouched. Gaming getters
then inspect an uninitialized result value.

When the caller requests an output value, return -ENOMSG if firmware
supplies no object. Preserve a NULL output pointer as the supported way
for callers to ignore the result.

Fixes: 2d76708c2221 ("platform/x86: acer-wmi: use WMI calls for platform profile handling")
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v3:
- Add the Fixes tag requested by Ilpo Järvinen.

Changes in v2:
- Preserve NULL as the supported output-ignore case.
- Only reject a missing firmware object when output was requested.

 drivers/platform/x86/acer-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d0..61ae622c93d9 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1581,7 +1581,9 @@ static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
 		return -EIO;
 
 	obj = result.pointer;
-	if (obj && out) {
+	if (!obj && out) {
+		ret = -ENOMSG;
+	} else if (obj && out) {
 		switch (obj->type) {
 		case ACPI_TYPE_INTEGER:
 			*out = obj->integer.value;
-- 
2.55.0
