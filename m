Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205B3CBE75
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816703; cv=none; b=aUweBGXYactZl3I7ZmW0NFV/lU7pQc7vcQxX5O9Ge3apCuibKAW7gbo06wBvt8LGg4SXbcpm86rdc5z6iTWFQtLKLeIZJUvlkFShmru7Sd3rz5G1sb3QW4AE1JttsPG5ubjhtBaLpwyGF96qQFsRqdgyL6E0DOaGRNU2NvnSUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816703; c=relaxed/simple;
	bh=q90dxw/dbkV/k1InCHOuJoxK2SJbBbHUmIOByU4fj/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FaA4LKy2lBhirxCnGuf35neaOcf9gvEjJu5xwqkffJfHxYEe5s5InruFeqsx6ourBdAewudct0ixfU2dbnoHbObfRhgzqcXp5t5FQ46Plp5L/6AdHInOX0C0KYmb376OlMlWkGGCELBF8LHV16zsjoBliSw+W7t+z4bspvCO1qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9oouj3/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9oouj3/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso355978f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 03:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816692; x=1783421492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nve1AfoRdTJRd2oQeHAkX5JoPoZFuE9ZSydXb9N9gBA=;
        b=D9oouj3/ylyQT66jliZN+D1ybFFcU4qIJAAuRyS7RsYb0vJ7zxBl4VCdsl2ug6TwEo
         Y9YcxVvY+6+cP4BjSvhKlKacG16HrfUDubI0h4GBiVlEbSEEkwOkmlaf0OHMPPYJAWN5
         Ze8BPoQ71CsyoWNNjI+WK7FGfOYd+s0sUetbXsNKlFrkNHlpd9oREbTIO0v8taFF3uWN
         GG98pSBrSxCeQjI701UAF/sC2FtvnwapeaC8qEhS1I8gYJv6e8QA9YQvCYZewgc0NFud
         u0K1d8HM/KmhiYcCHlpu61UcFMowv4JaiDmcWsUMXmHz/6Q3MDnlOCORXSJn8y7GwJ45
         SBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816692; x=1783421492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nve1AfoRdTJRd2oQeHAkX5JoPoZFuE9ZSydXb9N9gBA=;
        b=phutAbITr9Km2FyezftKSKEzH43YO70svsazJJJMERFqAcR/BJcnUuvikgk2c3HHGO
         sMqLOAc0miXyaPHZl3Z0V2eUFZ0Ap/Mh3gziYuhZ5579aAGIAqxkiPk83SdFU6QgXSYm
         OHOW3pM1c8gVm1JOauhV2/z1kRiK3pG0AOssNDlhj8LS6LTOC4Zna09HmULel5mua4Tg
         sYdoEfEZ0yK3OBKVtj7Vzc5l5iYCXnjJIbnJ4eCU+dFUAoOAos4IKBmIoCW9f7/O0iNE
         6ppaZUWTymXD/wURg4+scBUEn0UUo/Ebz5Zr8fR0CjdJZWyAjRuwhapcqNcMuSHvuUmU
         oRvA==
X-Forwarded-Encrypted: i=1; AHgh+Rrha7Mf3GJDq1CCUovrjWWMu0+EtiGWyqQ+C+NiqM7KCO2GqUqRyJU3APd68Y7i/PAjIhFRz9LYSIa6SHRYXUcXjmWH@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdxvvlwMeJe+ydYFhyIBkJcqMGK6tDzJ5GupM1L3DMUADh086
	3fLohJkBdBszHHD/9Ass7sJDJUtkdUqrLwrBl4QfX28U/tzQF+5RwsqE
X-Gm-Gg: AfdE7ckh7TLTUhrVKJt+/gKuILACtpIe86ArZX29rxK7JEFsmpoTj9LCHtAA6V4d7pn
	gKHpfOVgDvyG5a5ROloAU4CpdO9C3/TxEsBo+q4+h7lvhdv8PtEfPdSzJEMlpmj4vRt7denqQXO
	8ifVpf7gfUjz8xiPOrlgvYDiMSFMgd9PXoYFhZH76ESDNUSQ0X9qXxhzWtonE5qyMwJjx/hvexw
	civJi9O06AqUu88u1RNX8hzB+NIxWCvvyu/4vmrDNVwutjh8Q2Yx78F5lfbsFqqX2TvBfLls4KR
	yFfmVaOafQeuiEcaS4WAX7XC+xaLas77bUMzP5n3q6H2vM7QA9eJgGROg0Jir4hufpwv11T/8XW
	lKfcnD75wN22iL+N29xBccPgIClU2RfA3DCvJz8KGggrdGo+TjwOKXejtufjsLeWtiGa9igcizP
	vr/IwuxyCPb68Ihl3AZEHHe2DceA==
X-Received: by 2002:a05:6000:2006:b0:475:f0c2:5b01 with SMTP id ffacd0b85a97d-475f0c25bebmr1741739f8f.55.1782816692186;
        Tue, 30 Jun 2026 03:51:32 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636ce7esm7033280f8f.23.2026.06.30.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:51:31 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] platform/x86/intel/pmc: validate LPM mode without stale index
Date: Tue, 30 Jun 2026 12:51:25 +0200
Message-ID: <20260630105125.54053-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmc_lpm_mode_write() compares the requested mode with the loop variable
after pmc_for_each_mode().  If no low-power modes are enabled,
the loop never assigns that variable and the comparison reads an
uninitialized value.

Track a successful match explicitly, including the empty-mode case.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/platform/x86/intel/pmc/core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 9f77c0716e59..9833df172d4e 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1147,6 +1147,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	struct pmc_dev *pmcdev = s->private;
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	bool clear = false, c10 = false;
+	bool mode_enabled = false;
 	unsigned char buf[8];
 	int mode;
 	u32 reg;
@@ -1167,11 +1168,16 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	mode = sysfs_match_string(pmc_lpm_modes, buf);
 
 	/* Check string matches enabled mode */
-	pmc_for_each_mode(m, pmc)
-		if (mode == m)
-			break;
+	if (mode >= 0) {
+		pmc_for_each_mode(m, pmc) {
+			if (mode == m) {
+				mode_enabled = true;
+				break;
+			}
+		}
+	}
 
-	if (mode != m || mode < 0) {
+	if (!mode_enabled) {
 		if (sysfs_streq(buf, "clear"))
 			clear = true;
 		else if (sysfs_streq(buf, "c10"))
-- 
2.54.0

