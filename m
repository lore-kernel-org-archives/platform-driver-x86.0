Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E322D785
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 01:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782611820; cv=none; b=Buy+Wn6+uU2HazNE/Xc9Zqwvo9v0JQiBfLYSWFr04oDDZvMxa4RbzU/eaKCbwZJqWbipuqkvD1FFWQgd9pG3fq0h3C+pmrs2Wk2p6prJCRECOK6QI1mSZqXTey5ohDL+4nhEFDJLUpliUOa6zQa5jfx8n3QNXKxrLq8wNQSapIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782611820; c=relaxed/simple;
	bh=ZAEaxq8KHxi3raDx3jUBO1b8XkrfR68gF0m9FcjoadA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQMw7ay0VN+P7Mcr3nlP/1bG2kP/2n8ErgtH2uLCNxTkYYbq3srFyGsUuodumSFpPZPmpwlHfbfmXns/4vffHXeQqzlg1a5PHMmWjXYomL5H2G7PQl3gmH+G4MmUfcVUooJB/F3Rk/whD/FX5ypx9dxc5Y5u1qbc82HSKj/tvII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFxc0E9S; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFxc0E9S"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30ca1b4b278so3854253eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 18:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782611818; x=1783216618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGjSPqO9EV4oT2YiJnBSjD/F4QD4HC0Av37hHvZ2pPM=;
        b=DFxc0E9SgKwjG242GJs6ZwYUDUta/Hr+6ZNowsFxbz1ZIIfiVJE5cb+3q39OBnXJW6
         v83Sddr9k0i3Wn4eDkJlGfQU9kvaN7OAc60tCMW9ls4WPKX9lNnFe8lct7R2AsBDdjni
         yBYxFFi3YrAFxEFZy2sxcSUhUSInch/gnaverj6TNMeNJI769HVT4REZesHyOKg80vuz
         xspF8sOBiNVvPc29WcnCkNOgPyMCcjbfmRW6uwalfVBMumvbs0yeR0qBcbUmt2fHBwTy
         7xyQ12Kb2YWXNFtpAQFsHmywKvDJ2FfBjVpU0ZNNJ21gJeME41JQI5TKjpbVlvRRR2P0
         mPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782611818; x=1783216618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGjSPqO9EV4oT2YiJnBSjD/F4QD4HC0Av37hHvZ2pPM=;
        b=KpxKx5reAlcSeacqZpaqiolHvZ+iuxEp+gz7H/P6psLVvlBFku1vpK93qv7fgIBNrA
         bLGeoGTmFs4nNX4k7dCpU/V1d2rCC/MV1TS0Pc059WO+6ER7KPnem/htDVa1DBHWT4ED
         VEfsHb/OyKj1jL/XFHapmaf9L6nhMWlfNR0r8PooT2XCKEA5s/Y2ICkL7NwmQcGXNTEf
         aLZqVnEwfK1fK5eH0DcaPnxaie3evmH2tGlKPXhM4GJaCupU/LAqQEVK4ouidqPyCKVP
         coDA3NFpTJAilgSTyLelh+zKVnz9eb5gwVJHRhixZnX4pHX+x8a8rsQmeC1mYYJ6IBhH
         cjzA==
X-Forwarded-Encrypted: i=1; AHgh+RpOEGBhRGm+L27jV9pwfg9MPrDe7ftLTLjdlg9DiJMRSWX6d//fnmmaESpf37BlMAlI2FImmHr5Ulei83w368kGf3LB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UxvdhztmBRx5YE0QQ8d4L+h1w6HX/i8BUVwpgPCAU1aT9PTr
	ZcD5bUIjpXnGilgmmlBvgZ6RMgTIchg65hd+I2YRkPJ+nQcsbKEnbHVi
X-Gm-Gg: AfdE7ck7SoVkh+EgJ2JLsJxhLkLbw959yzUW0z7d+8CJjGNjsHpZIidC29VjA/DUsIp
	Vhksps2CAChzG/3QuDzXp2YDrzPYm0Ws6j5HTgL2o/3JanJ5rNmQCvErcpTHvEf/ieWreg4+S4J
	tMqnYGKMnfBSAnx8S6gukLF5JgPy+soo7RZSUx2grqwr5QlcJ5HuhoFVekMAcrYJi5TpbathZXJ
	JkRHsUPOWLn5Sw7jp1PF1oyftNbIW8Vm48ROeiR71YjCJRce6pkN+2mytl5s9X9udUui4RSylCx
	D1QNHL+G/rPbuePXEpjPZklFlh50lppG8M6CScGg82duVPgeUU78Rr7afqZijUKpzeTlLw7prmK
	sgn8qkoC2vGBbMfTnPfTO2cycmC4DE08Z2Z2/7N9wP3VPQyhd2H22c74W9wcksjmQtGzknOlb49
	vVTnOu
X-Received: by 2002:a05:7301:5f84:b0:307:37a4:15dd with SMTP id 5a478bee46e88-30c85009ea4mr15028082eec.26.1782611817730;
        Sat, 27 Jun 2026 18:56:57 -0700 (PDT)
Received: from [192.168.0.77] ([2804:14c:ca27:80b5::13c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cab28fasm35230883eec.30.2026.06.27.18.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 18:56:57 -0700 (PDT)
From: Rodnei Cilto <rodnei.cilto@gmail.com>
Date: Sun, 28 Jun 2026 22:57:03 -0300
Subject: [PATCH 1/2] input: atkbd: add softleds quirk for broken EC PS/2
 emulation
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-ideapad-kbd-leds-v1-1-50b421d94927@gmail.com>
References: <20260628-ideapad-kbd-leds-v1-0-50b421d94927@gmail.com>
In-Reply-To: <20260628-ideapad-kbd-leds-v1-0-50b421d94927@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Rodnei Cilto <rodnei.cilto@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5350;
 i=rodnei.cilto@gmail.com; h=from:subject:message-id;
 bh=ZAEaxq8KHxi3raDx3jUBO1b8XkrfR68gF0m9FcjoadA=;
 b=owEBbQKS/ZANAwAKAXzcyu9sg3HEAcsmYgBqQdD+fS2OihMwvowkO4C86LokaUl2ZTykc4Gy4
 TiyyFtrJOWJAjMEAAEKAB0WIQR5JbhU2RB8Rp1i2ol83MrvbINxxAUCakHQ/gAKCRB83MrvbINx
 xGqqD/4l7N89lhNnNVfd8ADnkYZaicmEuApb52/wTy+Jsv/Qh9DX6jmy2nDb5jYpInEoimG7nCF
 bgmEJcWH2VUkw3GOB5YaUbQoA/AH4lgFn9xzKe8AjCx59p/kcIDMqxBuGpEKAnJgOmlvijzsgZy
 fdSdb9DDnUMLu7JjhByE5CeiUyjPwMso+aETu9QEfbbxyLkDT445/2SCZuUarLe9Rc/8509WrDw
 P9nhDn8ZR6DmS6BQ8vqrJ7Ln91H78C5q+MPbSdO6AeUj5JSAEhmcliQwn2V8JXy6gHbj2UvKVwt
 L1wVSdjdQbXvGzvAXXpQzc/OsDZkuL8zsnKivCxfFp2Q6Da+FTp5MzQZn8Dd6QhQvc+0MY5y16r
 bgWPHyVQ4JTgd+hcXB4FSNznGNlPRTuS9Dg+Voww0EJ9IEpHJ1VoZw12Z3jqd5ZZ7E/we3EDqpq
 G2snjfbaOuBytJl5RlRE9tbdSxQ6eDGKvIsCRxvnNqWpM1DeEITFkfhRjYsECagA5a8jXjhQxvt
 USO22xI1A6A5cSDySS1PTlhHy1Q7htYeIHVowBidSojAudMND+EZVfXXkrTHaEhKK1UuUzunvzy
 fiPCSP7e+zediJt3wIErNkCRBHDXcbS6NF42634E3ESZdyN8Lusk5cZYQBfcQvPvzpCd1o63/gU
 507pbgSqHYhcNvg==
X-Developer-Key: i=rodnei.cilto@gmail.com; a=openpgp;
 fpr=7925B854D9107C469D62DA897CDCCAEF6C8371C4

Some Lenovo IdeaPad laptops (e.g. 83RR/83SR, Wildcat Lake) implement
PS/2 keyboard emulation via the Embedded Controller (EC) but do not
fully support the AT protocol. Specifically, sending the SETLEDS
command (0xED) after initialization causes the EC to return corrupted
scancodes (reported as '**' in i8042.debug), rendering the keyboard
non-functional.

The existing SERIO_QUIRK_DUMBKBD resolves scancode corruption by
zeroing serio->write, preventing AT commands. However, LED registration
in atkbd_set_device_attrs() depends on atkbd->write being set, so
dumbkbd mode loses EV_LED capabilities entirely.

Note: serio->id.extra is __u8 (8 bits only) and cannot be used to
pass new quirk flags from i8042 to atkbd. The quirk is detected
directly in atkbd via its DMI quirk table.

Introduce atkbd_softleds: a DMI-detected mode that combines dumbkbd
behaviour (serio->write = NULL, no 0xED sent) with EV_LED registration
so that CapsLock/NumLock/ScrollLock state remains visible to userspace
via the input subsystem.

Add DMI entries for Lenovo IdeaPad 83RR (Wildcat Lake) and its Brazil
regional variant 83SR.

Signed-off-by: Rodnei Cilto <rodnei.cilto@gmail.com>
---
 drivers/input/keyboard/atkbd.c        | 46 ++++++++++++++++++++++++++++++++++-
 drivers/input/serio/i8042-acpipnpio.h |  3 +++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 8cb4dc6fb165..826a21dc016a 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -212,6 +212,7 @@ struct atkbd {
 	bool softrepeat;
 	bool softraw;
 	bool scroll;
+	bool softleds;		/* suppress 0xED, register EV_LED in software */
 	bool enabled;
 
 	/* Accessed only from interrupt */
@@ -245,6 +246,7 @@ static unsigned int (*atkbd_platform_scancode_fixup)(struct atkbd *, unsigned in
  * to many commands until full reset (ATKBD_CMD_RESET_BAT) is performed.
  */
 static bool atkbd_skip_deactivate;
+static bool atkbd_softleds;
 
 static ssize_t atkbd_attr_show_helper(struct device *dev, char *buf,
 				      ssize_t (*handler)(struct atkbd *, char *));
@@ -600,6 +602,14 @@ static int atkbd_set_leds(struct atkbd *atkbd)
 	struct input_dev *dev = atkbd->dev;
 	u8 param[2];
 
+	/*
+	 * softleds: EC PS/2 emulation does not support AT commands
+	 * after initialization. Accept LED state from userspace but
+	 * never send SETLEDS (0xED) to avoid scancode corruption.
+	 */
+	if (atkbd->softleds)
+		return 0;
+
 	param[0] = (test_bit(LED_SCROLLL, dev->led) ? 1 : 0)
 		 | (test_bit(LED_NUML,    dev->led) ? 2 : 0)
 		 | (test_bit(LED_CAPSL,   dev->led) ? 4 : 0);
@@ -1193,7 +1203,7 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
 	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REP) |
 		BIT_MASK(EV_MSC);
 
-	if (atkbd->write) {
+	if (atkbd->write || atkbd->softleds) {
 		input_dev->evbit[0] |= BIT_MASK(EV_LED);
 		input_dev->ledbit[0] = BIT_MASK(LED_NUML) |
 			BIT_MASK(LED_CAPSL) | BIT_MASK(LED_SCROLLL);
@@ -1291,6 +1301,12 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
 	if (atkbd->softrepeat)
 		atkbd->softraw = true;
 
+	if (atkbd_softleds) {
+		serio->write = NULL;
+		atkbd->write = false;
+		atkbd->softleds = true;
+	}
+
 	serio_set_drvdata(serio, atkbd);
 
 	err = serio_open(serio, drv);
@@ -1767,6 +1783,12 @@ static int __init atkbd_deactivate_fixup(const struct dmi_system_id *id)
 	return 1;
 }
 
+static int __init atkbd_setup_softleds(const struct dmi_system_id *id)
+{
+	atkbd_softleds = true;
+	return 1;
+}
+
 /*
  * NOTE: do not add any more "force release" quirks to this table.  The
  * task of adjusting list of keys that should be "released" automatically
@@ -1938,6 +1960,28 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		},
 		.callback = atkbd_deactivate_fixup,
 	},
+	{
+		/*
+		 * Lenovo IdeaPad 83RR (Wildcat Lake) - EC PS/2 emulation
+		 * returns corrupted scancodes ('**' in i8042.debug) when
+		 * receiving AT SETLEDS (0xED) after keyboard initialization.
+		 * Enable softleds mode: suppress 0xED to hardware while
+		 * keeping CapsLock/NumLock/ScrollLock visible to userspace.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83RR"),
+		},
+		.callback = atkbd_setup_softleds,
+	},
+	{
+		/* Lenovo IdeaPad 83SR (83RR Brazil regional variant) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83SR"),
+		},
+		.callback = atkbd_setup_softleds,
+	},
 	{ }
 };
 
diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 8ebdf4fb9030..d233544ebac9 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -79,6 +79,9 @@ static inline void i8042_write_command(int val)
 #define SERIO_QUIRK_DIRECT		BIT(8)
 #define SERIO_QUIRK_DUMBKBD		BIT(9)
 #define SERIO_QUIRK_NOLOOP		BIT(10)
+/* SERIO_QUIRK_DUMBKBD_LEDS handled via atkbd DMI quirk table.
+ * serio->id.extra is __u8 (8 bits only), cannot carry this flag.
+ */
 #define SERIO_QUIRK_NOTIMEOUT		BIT(11)
 #define SERIO_QUIRK_KBDRESET		BIT(12)
 #define SERIO_QUIRK_DRITEK		BIT(13)

-- 
2.51.0

