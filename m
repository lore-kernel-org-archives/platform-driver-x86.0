Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CEA35E1CE
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750566; cv=none; b=qN2e4jTgvDq2dG8so9r9uJU+wR4lKsd1AkUUWWhFDkGe75bUMiqIQy8fzDiCaV53uIvYgaCkBqqIUjo0XAn+LIYzWYKgOap8zGdONciS1X1yzhIGqIOmZG2D3xnxtEjpYPijZYl+eVecoh6XLxcnge1KC/55Vsr0WYvV/vJWeoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750566; c=relaxed/simple;
	bh=wLjmzWdbs7GrUduEyhmiEnA3ZIOqLYxwtPW2vGd1PDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqGRwqpIxHVMdZL5FrnGtRnFJMLQeYPLm3YFK1MxZXY+R+PePMOC9QgqM+LFYT+EEGUCX6Xj8TKk9OZU2ncXTyY7VGRD8D0YZMNgewnWFrfU3OG6jHJjMHXymSNJvyMUkA4LSZzSQRA45mO/Ip86FwEFQhL5hYQFILBMPxaYUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ini/iZ81; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ini/iZ81"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so1381772a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750563; x=1788355363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxgDBawRnDal2faOPchvukpguTiYpX50Wyqo202PLqE=;
        b=Ini/iZ81OwB7Cr+GCGBi58q2Vb2FPRWu8p/SbCMhUt15BBI+pzVkDJ0HJqVghS2CMQ
         soy9hFh3uPFCHonwRiWYI5DODmnYEGgJcsOkmjh5ONUWzCJH2zXUD6/USHSpe9sSVeyz
         1kBHxJ4Sm0JADmSoHA+Zfx7/crV14LtX0d3aacK6itRKNPGLH2tKY44eMokJ6vOg+fnf
         4O4njyf8/Eb5JpTDkniAO8zhtuZHntSnCJ0KrxB/y8MdPKxptBJ7Uc3YLmLJuodllQzX
         N6Vd31KPpm5cLMn7uROh9Z3YPZiIQfUfo9S5IbsN34UBvj7BN8E8X1XyFL8P895/8Zvn
         mr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750563; x=1788355363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxgDBawRnDal2faOPchvukpguTiYpX50Wyqo202PLqE=;
        b=JCvh7i6iPM8InWOoO1X9MtaeoNw3AkadfVtUOgBFLMS8J6ltJgmpajUp6/dB5djp9b
         QQDv/HuReYhQcbeTcnL86IqRwu/eV2U1WGx7RYINLFUQa5JS80lZn2zNjdsSeCZ4B9c8
         0DMPdDTJMB+RmlrCCOvotFU2VAHEDIBXuHWl/3cfji+shFmvcXOnykZJv3v3hw/QTZTB
         Mwvrn7N+xu0ysLzTn+r4M9ipTZKEr3hJut6JSfbx1EJuXGVeS4kgg3ajVUnnZtHPnBNT
         0VnsTevdLYPA4oRNwBOzBD0h+RiSPQETig8CZWTTGptyxJSb054bQ3TQSz/AjWuori5W
         TVpA==
X-Forwarded-Encrypted: i=1; AHgh+RpSi3pwyx1xhTMy+vubtfYeffyQ1USMWE9r/3K/VUsYWJyKajrI10XGNfzOhpggaAe0VpLhWBlozOdomufYfsqxYkxo@vger.kernel.org
X-Gm-Message-State: AFuF++nhsJi3ArNIJaiYB4rXyDr2p9d6sHoH8TWsW+hxcaMM9x27OFnt
	1MKRIKM4qzTgs3BX9zduy36VN3tR17kPjU6oKyBYabdpbS89VUKDBy9w
X-Gm-Gg: AR+sD11ErJC3T5DPLrq0DffwDErezQ7NArO/4iucawrYxol3wOSgzKlShGJRMh1im+c
	7BcCaQ5Zrr8YWCnmpdjD5YZCAYEzQDE6o+7kZf3M+mQdFv5pSk7sJDvGW6Py6EULdmfAg6/gPoO
	MHzvm5S1jM33o549J2gx2ONnEKgyAxp/w7avbJjY+mdbse35CJWP+KTSm/8wlPu2EGQiahZKN38
	qXAJ0QJ1yZvR1GYM/qc8PaCEPKCxjBFrCqnwyMynP9CXUwRPi+i0UN0uWuxg2NdZ3lTray6EGEP
	j/nLAY9i8a5O/hfoBB2LLMS0PDiPtZ2+iaXq0xUYlHclQ/JjDY3WMEtqS76rr+Lvxg2IrTAi35C
	1K3RJqPzDP1jz+XNbn5BvscKfGjyPo6HDUgWB4o2VTNxDNWlWJwgAQi/siFB8fDqooQU79ftKwL
	dFm4yZ40As26ahsMqb9GYBOkRkIYJedO/2eP/z8Q2Hf0FX8Db2lRrws7Sdav+l9SkD1QsvSU4QT
	mLM4CTCBF0RSQM6wLsDrdt1PAz8vHF6PvnLfdwGhRY=
X-Received: by 2002:a05:6402:51d1:b0:6a4:cc9:c8f0 with SMTP id 4fb4d7f45d1cf-6a5df5f0b56mr8460054a12.1.1787750563020;
        Wed, 26 Aug 2026 06:22:43 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm1689857a12.17.2026.08.26.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 2/3] platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
Date: Wed, 26 Aug 2026 15:22:32 +0200
Message-ID: <20260826132233.3342481-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L firmware describes the TS3A227E headset
detector as a secondary resource of the RT5677 codec rather than as an
independent I2C device. No client is therefore created for it.

Instantiate the device on I2C1 at address 0x3b, describe its GPIO
interrupt, and provide the mic-bias setting used by the Yoga Book
design. This lets the ASoC machine driver use jack and button detection.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../platform/x86/x86-android-tablets/lenovo.c | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 413d3633b2e6..36c9424c0afe 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -120,6 +120,16 @@ static const struct property_entry lenovo_yb1_x91_drv2604_props[] = {
 	{ }
 };
 
+static const struct property_entry lenovo_yb1_ts3a227e_props[] = {
+	/* Value taken from the Lenovo Android kernel code drop. */
+	PROPERTY_ENTRY_U32("ti,micbias", 7),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_ts3a227e_node = {
+	.properties = lenovo_yb1_ts3a227e_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -275,7 +285,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.init = lenovo_yb1_x90_init,
 };
 
-/* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fuel-gauge client */
+/* Lenovo Yoga Book X91F/L Windows tablet needs extra platform descriptions. */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -286,6 +296,23 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 			.swnode = &fg_bq25890_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* The jack-detection IC is described as a secondary RT5677 resource. */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
 	},
 };
 
-- 
2.53.0

