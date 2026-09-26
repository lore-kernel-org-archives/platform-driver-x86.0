Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C03644C4
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441447; cv=none; b=kUPmWwD3jcsjaoEXyr9gI9m+9X+XEekc1btKTiMkwjwZZJayKkGjINcLHFoR+akvvrvp7kXh0DVk6iPx/2Y5iiWownk0tsIKFrnSucSIONDp2wAtezXV98EmzzINunV86w+L4U73UL77HfVf4CYWZQLw8RvQA+lkKjLTY5X1WCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441447; c=relaxed/simple;
	bh=9ToSpazp9szOS3s71KT/NZ2ANqsW0n9CU2Ous0H+GYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6xRuOTbZMQYJF0VlRn18SvjRnG1ZYKjQPVy4R6w/L6fPEAFGQmGQFW0uapN0G6ZIBsz3BnkXPG7aRK0ZZJTcvhFEjjC18vmauChAB2teV122cu0Y1q/3OEWjUUJVlSwvpSJaspjoLrFv3x41ZglZaCKVhMp2PQqhh5A/CZ7Ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQKGBqo/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQKGBqo/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso5046955e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790441444; x=1791046244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbvG6DpwILpGJJJKu/S8pOrc1OBCr3aRWelSEGRwlP4=;
        b=IQKGBqo/Et254JfPIRx+7iiDuOAlZ5kaWeRVzMaumbWuFzcbkW9EFZ+1cqxvi5XuWR
         g8qaP3gitUPxfoqrsjjxkMHZoKxqVFfkZIyVPTD9iJMrKe0TSak+SHTM1rT92y71RG2o
         Og8GNTzHWqutgZl5SsabdnWego4M8cghVY9SNjOOCmxmZeSPGrIAp8QcroRBLCowcuwJ
         YUe2dxKTJ/cbTMfFw+amu31xn9P51zIj8HRjTkbh6L6880zzxGKTpbCKZM/sYWOiIq4M
         TsIiWj53h/4ndrDeaZmC4NNdA1iDCqL3d3A4HLPlwOw27tjYGbEzOtZfuZ/NWGdpc3s9
         +tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790441444; x=1791046244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbvG6DpwILpGJJJKu/S8pOrc1OBCr3aRWelSEGRwlP4=;
        b=QUzo5X7WnpSd/dqGAi20eP9dk4Btp8sOqi+94WArICBSe+gUBQllV9Lx0ntvxzbxCT
         lWSjYG7WAszzVDhe/LpCdDFjLuCkEH1eerRgj/PxEDJuaQ98DnD9HVznNsFofYgbKMy5
         0CkT3HlVZLv2WeO6fRa3LDzScLRxhuExrJCn2YizdiFslwbB69wjcLE9n67tq7msZEpr
         MkGmuAvc+4jOGfIV8UsreMDa/+Iuh4nWoT0kZNyvLRkobhxRP56Of/EllakpbyNoR/KU
         PQEuuJg8spkQ6f5udqaPWW9AVsJbGwfj8nFxce0h6PunqJvMixOXSnlHuZmpkBQSpFPG
         wH7A==
X-Gm-Message-State: AFuF++mLRJwl1w5aMiCgHeybTaSAbzlpY2fWodGAOfAsubrUQbv7tWXB
	vyhljKZdnnuCE9hRoQP80SXxhWrFAHIkeO4fLQf3oRoghe3TsljhSy24
X-Gm-Gg: AYBFou3JDE8SetVo5fRp57435ESdMG6sqVGfOnqdxjLc6QWdDpbZx+bu49+KbbvvQGg
	S6DVQ+9CmG1FmMP2cghBzqm4x+bb9rFiByKdJ81SdoVvzOLJb+tp8tXqqTJvcFlJhteCXU05fbn
	fhoqE3h+AFpV6CRFG3wLM+TSGFScSsshH7dkKSQ+ghYvNAP9DN7EWl7ZoUnKRMfh8Qbo3sFXqX2
	oPC1K/gRypBlax4xsdH3ENku6SXN6+5hX/JqKDUNRUE3tYNvz6Fw+JzDcJ7lZtYX8xp2Ze1pxOb
	IFbJFB31ipG2L5/BHB9/QzIZJ9I3lH0/0fmGo7fvj8MIScZciKt/ORYv8RZIePy0hgDxtq2+RL3
	Tde4TrdL0CMddS0kK4w+gFzGIc5ha7+IKbIoKDbdiIv1AYhs+WKbXnnwbXv3zN8a83oNxAfyKgo
	p8rT76rndQCSx9uG6c0nte1/5N8bbKVXKD5XIjLUd3Np6HQy6tKIlLGQoXAYNVR+oMe5agPvIZt
	is8ohkWX6J4wTWvZgFLEmm2q4R0exk/VvVSQcXlcFPMXG4bBv1ueteUPKT9Zb6Ux+GMct4zlwVR
	UKhKJlXbrdlOWVW8UyzGg3kpu3+A8S02aWnqzMmVQFHO+s9MBH7wf+ZhKu8X4BU/dsdKBotFNja
	VPdSqKQ==
X-Received: by 2002:a05:600c:1d04:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fe66d0606mr157730645e9.6.1790441444032;
        Sat, 26 Sep 2026 09:50:44 -0700 (PDT)
Received: from archlinux (2a02-8440-558a-f56e-f3da-b3f7-00de-4b6b.rev.sfr.net. [2a02:8440:558a:f56e:f3da:b3f7:de:4b6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff285550asm90422895e9.3.2026.09.26.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:50:43 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
Date: Sat, 26 Sep 2026 18:50:34 +0200
Message-ID: <20260926165034.94254-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MSI notebooks, several keys generate a WMI event through the Wind
event GUID in addition to a regular AT keyboard event. Their event
codes are not in the keymap, so every press logs "Unknown key
pressed".

These keys already work through the AT keyboard, so mark their WMI
codes as KE_IGNORE, as is already done for the MSI Claw. On models
where a code does not also produce a keyboard event, the event is
already dropped, so the only change there is that the log
message goes away.

The Wind event GUID is not specific to the MSI Wind. It is present in
17 of 18 MSI notebooks in the linuxhw ACPI dump collection (2012 to
2024), with the same _WED structure. The codes are shared across
models too: the volume keys on the tested notebook send the same codes
as the MSI Claw (0x21, 0x32).

Tested on an MSI Katana 15 B13VFK: Fn (0x0b), mic mute (0x19),
settings (0x1d), mute (0x23) and Bluetooth (0x78) no longer log
unknown key messages, and the keys keep working through atkbd.

Link: https://github.com/linuxhw/ACPI/tree/d6d30c6ef6f4/Notebook/MSI
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index c9db750fe5..6c798f6177 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -46,6 +46,12 @@ enum msi_scancodes {
 	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
 	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
 	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	/* MSI Notebook keys that use Wind GUID */
+	WIND_KEY_FN_NB		= 0x0b,
+	WIND_KEY_MICMUTE_NB	= 0x19,
+	WIND_KEY_SETTINGS_NB	= 0x1d,
+	WIND_KEY_MUTE_NB	= 0x23,
+	WIND_KEY_BLUETOOTH_NB	= 0x78,
 	/* MSI Claw keys */
 	CLAW_KEY_VOLUMEDOWN	= 0x21,
 	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
@@ -66,6 +72,13 @@ static struct key_entry msi_wmi_keymap[] = {
 	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
 	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
 
+	/* These MSI Notebook keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, WIND_KEY_FN_NB },
+	{ KE_IGNORE, WIND_KEY_MICMUTE_NB },
+	{ KE_IGNORE, WIND_KEY_SETTINGS_NB },
+	{ KE_IGNORE, WIND_KEY_MUTE_NB },
+	{ KE_IGNORE, WIND_KEY_BLUETOOTH_NB },
+
 	/* These are unknown WMI events found on MSI Wind */
 	{ KE_IGNORE, 0x00 },
 	{ KE_IGNORE, 0x62 },
-- 
2.55.0

