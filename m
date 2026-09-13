Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D130C60D
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789278413; cv=none; b=tYxnuOD44O2nEz24SfX6UX+JmLs1ZL0IaZTm4/8o24olRTz3zfL/nByIFmP9r3OxBwOoMc2RdTPLkkvB3sziGD7RHiTfq5ULCpUKbwmCZsC9X+mFk5+bgNi/eucmblbRRtAsWp2/4IZIk1PMFMTQ+DBK7rPWv57xCidxQnlNIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789278413; c=relaxed/simple;
	bh=+uK+VsHDMRyMuUOAfV5y2lMUCDN12RBkE9fAZ3K9c2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eWiMKtbph94WkX+9XD9hlIfCjcfDXql9uhjsou6AqrHLfQbm/peCx2S520Kts44Xty3eKrMxENfBxP8yv9W3p9g5qu00sze532smQyYMFcpvSxWa+XWzsMt1+OAk21x4baosc/DgenBezgZXANZSgeQ4XHEAeZmkke5QZsaFG0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDV7zskf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDV7zskf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18871655e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2026 22:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789278408; x=1789883208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaDpZD94po/Ak35KQivlsGuKrpLRFzPRKG/6fz12Jdg=;
        b=bDV7zskfXFkAaGSt2v9WczaW44kPQBXYihRD3n8P8C6xZwqfolgQanhPsrsBO5VexJ
         kNiEhIYApf7AZZnfDY0MiCQWHy0KXu4tN0/8NtIeR1x/zfgPSjLPoUM5uvVCDkNvGFir
         MAQ4kJFb7AJh6gG099DGAgtIHt1GSDYB5DXx28w7n6lPhj21CiufKpWceM73WzWTco0J
         YP5OoQ4eKda71lr0HmO0nQaP33Ty4Le67+OAV2IaqkX/H5p3geNZM1mzlbpuzRu3GpF9
         GPe6jk4v2b/+gQzuYmaOk277u3O0omhhckhHP4qW27bcJOE1gW0gCsyEK8gm8fNRDeRs
         JOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789278408; x=1789883208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaDpZD94po/Ak35KQivlsGuKrpLRFzPRKG/6fz12Jdg=;
        b=Eg6haoPnW+QwmdjVVvg92OvmmhK+oVNr3nHv6680hKrEUfh3DJRrfIBvTx0eUqrY6e
         +2cknLab71nRlnYB1mT4gv/aV3pUdtWbm2QxxN9smrvFhL7R1oxo56DMgj1a/wfjAnaS
         IdMaER8wPikhCoSo372VsOXHLCS2OSZiRHNtQNllBK3Ugsqm17ICYibSn7rNcIaH/tjD
         Aj1aUH+7TmLITuEenEb8kNODqfxwFUfCeTpKGGp8xzTn7kfFC7Q5lAKCA0ggOGRhIT6J
         PnaDVE7+fr5dGeuiUjmsPO4B/1s7CHpEZpQtjYL3aaTn8i25d6WRo4aQI8ysaFhIdq8e
         pZjg==
X-Gm-Message-State: AFuF++lt02RJOO0fyBnt/b4mrtvhaTlQIJAOpJhJ57uu34CpaPH/3B60
	QgGphkonuvEBzdZ1QIwik8RCJnuJe1WSUBRNYuSsz5MvDlHkHLGQR+Va
X-Gm-Gg: AYBFou0kIWL6ReJiuSSUxgXOuYk9dZK1cH0Kwf7EXX68bJtzmCMli2uqAmQ81IfnF1N
	KcAmzhSix129cDg6MKbkKZ0baxbaB6oLjOEN/QDhexgEyyts2cQWEZ5fJ9hbMY/7G4PvwY/0gok
	KxUxtEDKzGaxXRDqIoR62n78RAlzPugZff4r8HPtbGvwfLf5ZVcUFIbQEkTZtoZgeodtmUL/Vwf
	0KOS/Pk2NAsrPwUdr0N2+9YMPQiaG3AWVgHHVG4YdE3A0kwXkSKjZvTKGM942VST1rh1FNlsuJC
	VWQNxB1oBEM/hqyzdIbD/mAwPxer4B36JxnAMhO+tQql41SVEC+Ly6nwp6DEnHvpzNAFlienDx7
	MvlZ32NCwAzgGwzJrZ7qCOHDM5CZtnj2Xy3K8hAz1eIH+sS8O8y2jnPGUUrtnmS9TFy7XbyWoMw
	Jak0RaE2J3HowWlsink7x7hTyyknjYNPYE2UIql+JdrrezJuZRkA7IKouPxk4TTfRVb5jHU2pxN
	Z3gYTmQnzbadk243E9hM0GtjD/r1u0gjY2FOtkByp9k1FgWadNWc3E=
X-Received: by 2002:a05:600c:5253:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-49e619994a9mr128731495e9.15.1789278407838;
        Sat, 12 Sep 2026 22:46:47 -0700 (PDT)
Received: from localhost.localdomain ([105.188.24.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm17394127f8f.21.2026.09.12.22.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 22:46:47 -0700 (PDT)
From: Walid Elonok <walidelonk@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Walid Elonok <walidelonk@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for HP Laptop 15-fd1xxx (board 8DE1)
Date: Sun, 13 Sep 2026 06:46:45 +0100
Message-ID: <20260913054645.58692-1-walidelonk@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP Laptop 15-fd1xxx (motherboard ID 8DE1), hp-wmi currently falls
back to the legacy HPWMI_FAN_SPEED_GET_QUERY (0x11) command because the
board is not listed in hp_wmi_feature_boards[].

In HP BIOS DSDT table (e.g. BIOS F.26), method GM11 (query 0x11) is a
dummy stub that returns 4 bytes of 0x00 with return code 0 (success),
causing the driver to report 0 RPM via hwmon even while the fan is
actively spinning.

However, the DSDT implements method GM2D (query 0x2D / Victus S fan
interface), which reads the active fan tachometer directly from the
Embedded Controller (EC0) registers RPM1/RPM2 and reports accurate fan
speed.

Add board ID "8DE1" to hp_wmi_feature_boards[] mapped to
victus_s_board_params so hp-wmi uses the working query 0x2D interface.

Signed-off-by: Walid Elonok <walidelonk@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1a..fd9189420 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -339,6 +339,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD6") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DE1") },
+		.driver_data = (void *)&victus_s_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.43.0

