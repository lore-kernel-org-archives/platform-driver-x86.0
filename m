Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACF3E49FE
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521817; cv=none; b=kdAJfaTdG0Mk/ULDDboBFYsOFft7bhTBL8T92hhli+vwgBn60wPjHZ7NcYaGvBqAk0St7JmvKM8drY12cCyiUztqb4j4vD/hG73zBdUVPtlD5NEH5cspeCDjyYTVGwtOq0c9JZd+yu8asmR8n3uF/3sYmJAwjM3EIhJbptq3Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521817; c=relaxed/simple;
	bh=1V1PGNnMiVJlvQ+2h23UkWjskInlsqTJRbSJ0k9QFEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KElB6N/2qMw79AL5qJnyqjTdvo/NtZsztXhtiEwkuYWFSsKyPtjaO8KkJuwZ1Elfe7F02c/6/3EGtyZfIAwCUiUYqeD9//DZAa2jjqszhFQthBrFth7TB3SYNR7riQ/XJXZyr19ndNCLtNSSBMYNqXvjidzvAQHooqtP17DQ/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea1JLyxj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea1JLyxj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso775829a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Sep 2026 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521816; x=1789126616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERgD93A5qmrkOabxCTstekFkXdOEhiGFqiDK0U4F1eA=;
        b=ea1JLyxj9cWA9kI9IjmN/O5WvSjhh5aOHQENDMCnghoVSxGDSeD2f5mwpv7Uv2RiJy
         CF1DDazoOqUlIbO0X8apxyqwge2spNOUjYDnI8DzCLG90zRMbxFCr3/VHB2GNvllsgtA
         N04nt7ZvKkRFFh+xQZ6xAVF5+Iih83EsjPb/CKIr7VGArF2YjO5ePkpBYKH2H99/iQaE
         QoL2iYdNR95uJw/pYUdb6a6tG814tPQy6X7RFOsMjHjHjeaoZgPle0Pyrp8oC18Gz/7+
         HkB9xoSaLO54LYCGw0lEVCSAxwriRPGasIAa2553Tru6le5xzT2EKfGQGOL6+ZM21jdW
         7emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521816; x=1789126616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERgD93A5qmrkOabxCTstekFkXdOEhiGFqiDK0U4F1eA=;
        b=pjiLpq0BzCRkpoykZT4Mn629qLrkM4cLZSEVji6sdoieLTglOnPeGVWKz1eURxdDmF
         aOIhothcqaTftPC1cJ705lWBl/KJJaE403pXccB9gfZYlLpQSu4B9mI438jQM3cJ9MVl
         NZy9lVCLGmHirNETA0E7/KgAe1jDSZ0MQUy+eh8sCOvuvbiLGd2fRM4oMXgJERzkhALx
         L4+nZ+fQ/s8KBBtt27Og/f87kq4sOnro4MWq0UnZq5q9Fk/evIJiyZmYxCPNUsXbzEbP
         pbA1ESxd7X8TPN8gpJCsfDX5y7yjIanbDBulYRsi+k2epSRTIshoLltA+KHFFzjVWMCj
         CAPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyvTvPMavoxm8x8Zu1g2fa0qOPz7nCbWDuO4PRmPswSihIxaut378N1vXiCECvKiKWklzkmvESGIL93rmQiBfWJ4UC@vger.kernel.org
X-Gm-Message-State: AFuF++ncACdXYci6IAiJWi/PwQHdwZwKD1u6KMPaLY6hUZ0cTUxxJfdB
	qBM8SviaVLPhFWSji7aIuPJuk85AQaittXE89cZAGh++2mOp31n079Aw
X-Gm-Gg: AYBFou0z8r+VBaEYpN7tejGDLcycgSGoLc97zI9qyLBkCLO9dgndW/Sd3wEvLtU6pXS
	Cfl9VHHUYbojOGiuWCv6IRmMpavpaVMG7ehzI+N6IY3USaeckmPMWXZUIM5cHR1Y3RMJG7XsvUl
	15QGgIYvdaNWSoKkdrhRKIOkpWMIyua4+qdLZExoYp4YSXD0nKeqeTEIzOtAnyB9GHR/be1IUXL
	mJW4hFXRLvkuCat4kTHC+hR2eGs2csmjqdMPQZLHlaDdMejqawiQglaOpIzoRqWP0P4CP32v8Ap
	Y0OIcSXKpwTquI+FNBhBpxkgYQn51vh7GvnkOAT/xw/iCyQnS3mO7Gmbn4LpP/V91r6bvvcyxS+
	mwNL6mgxhYzhcM+9rLQIiF5iNT2vHdRFYZNX7CTyt16r3lWJUqz9bVuT5K8t5kHRb5eBhBFk+Kp
	pm7Np+qIjUzS/p1s18C0zegzzCdE1AQXxjJakw/nQ1tBHrPd/3G0fFl/F5yGK5G1EHszYcsMYGK
	H2Jht9HluxrqdM=
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr8584204a91.18.1788521815937;
        Fri, 04 Sep 2026 04:36:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6221194eec.13.2026.09.04.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:36:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: [PATCH] platform: x86: fix typos in comments
Date: Fri,  4 Sep 2026 17:06:49 +0530
Message-ID: <20260904113650.18527-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c571..bfb292e727c4 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -7069,7 +7069,7 @@ static bool software_mute_active;
 static int software_mute_orig_mode;
 
 /*
- * Used to syncronize writers to TP_EC_AUDIO and
+ * Used to synchronize writers to TP_EC_AUDIO and
  * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
  */
 static struct mutex volume_mutex;
@@ -7262,7 +7262,7 @@ static int volume_set_software_mute(bool startup)
 
 	/*
 	 * In software mute mode, the standard codec controls take
-	 * precendence, so we unmute the ThinkPad HW switch at
+	 * precedence, so we unmute the ThinkPad HW switch at
 	 * startup.  Just on case there are SAUM-capable ThinkPads
 	 * with level controls, set max HW volume as well.
 	 */
@@ -7981,7 +7981,7 @@ TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
 	   );			/* all others */
 
 /*
- * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
+ * Uninitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
  * HFSP register at boot, so it contains 0x07 but the Thinkpad could
  * be in auto mode (0x80).
  *
-- 
2.48.1

