Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF293D0938
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437937; cv=none; b=A+EWaIFDxjz71v2UtqUcYsf6c9YZi+xFlnxoxHAPZBYJfqN1X7y5ZgX0wRWdBjFbjit1tePRL8okpCLD95tzgTv8ot9TT8Ig5FWBAdWwJVwgc3GOGwShTaLRgP1XEtrRh9OYIP6r5xJLqh+sDG2QrYt6B0+uoAS9T82ojWyk4bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437937; c=relaxed/simple;
	bh=toGVihiKQWI3brdkbe26S6tXSUBzjalKtQseTywVV2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JGz10TENK6ozgTsSbD9/mOtaRmljfItx+HCDyhofWRPhHo/ZlH/AaL/uHqdI7SKfU0eMrH5OEgW9nbHF4csbuNy5qBHelNfJqTEofQi/zWos0kIce72+gG/jSw2B2sMoX323H+jA1yQAEd3c9lJ8m4mMkvQLHX++b5KXD5Lgreo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMFoRzCj; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMFoRzCj"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-982d6efbeadso604830241.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 19:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437932; x=1790042732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5CrPwqMTvBIo1H9wqlWbS8N0rGTeQYGG+qkc5z9ajs=;
        b=IMFoRzCjKMSfpP2+TGQ2OiHdiZ/a0iMUDAefuMAAAWwPXlK+PfWY0KNYJlQBtx9Ggc
         4ST45C/hsY4l5zHcXbukvfJ/xoPhRWtLT6+uoUK+w7D+8e3eEOJFVS1g55CuOGAUZhVN
         LS8WLvQ/mc9CFuFK80bI8jsu7S8JZ6MKheO7/eV/fBCsjHQo5MlCnKc2qa7yIIFjirYI
         MAQI8L9YnIKISqGYJ62Pue7sKo/ehLZP+zSc7b8w+bVHG9ENP88qdTEtbA5p3Uh45TAw
         5f7hfJ8HC2/f0c8OJeDPVTnXzrI1okpnQ6Z1RivMO2G4O9ejGvpZUvZaAWQhgrTIJG+7
         wLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437932; x=1790042732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5CrPwqMTvBIo1H9wqlWbS8N0rGTeQYGG+qkc5z9ajs=;
        b=UjxemHeHG2Agctro/VWa1xWTlQLfJdH/Oy5Vf1Kr3TxgXokE0smwem5J537zY6fJrf
         bQjFyoOnz/hEt4wLRZNT9l4cA3g0dFGOYv2hNXxNMNPfv0kbbpawVenOCprhXfRPhwDc
         FwsbkSHGrJL+ufm0jzSuM09msr23wgJGoLgumc0G9wfBNvCN4PgJQWvzjcZG7x3Yu6Kb
         mEeX5c3dGfFpc3fKjxiV/O7whw0nlPaNt8iI1yp3hP0GpwmFwoUay6RrPND4fMkSMvW8
         uNPwaxaCHnuvV46SeGbGRYRFhxsGIofGS5BBSTPknN3IpMC5pnwTJdQN2B1GnX6vx2Hc
         rC7g==
X-Forwarded-Encrypted: i=1; AKwUvByRDTHpG7SoFM0CygnDFjrMUJo4TnkzFqMXpbaHB360/V2RD7dJKW+cIuk+NgRnDwknYO3k7xyGyYSkMXmD0LUT9wEp@vger.kernel.org
X-Gm-Message-State: AFuF++kw65V71J8TU+T+jOra6hNVRqsVPjdjsa2+6zcpgXzfbo5ov4h2
	B6puolV3kepk//AeN9prIltHfEfGLdj6H8YkRz6oSfbNrSjcAqSn5zPo
X-Gm-Gg: AYBFou27+CFEyUg3e2yxL32pxAJ6POTOCceI95L1A4b1ey1++hLGZA+b7m1UH8OL9o1
	WVpGurajeCas1rTzxOSVnbsCcht2d7nkz3EtNOqJ8QN9yZlKalVCwYp6GI7Iq0oQFOG80vPy7Mp
	zw9VyJ+OLgXSDvECokc0KSu5rje88SobUEe+SmHaLWg+qui5a5w1PPVRBqEesVEaRA/EEG81OMJ
	m0DWgcEgsheoPrbCPW450qjwtcLhgYJWE/Uxyml6JE5DCW3uQcubGTLhTigraH2nLr9y2NBYYRe
	GEaLBPc0Xmvs7xM10hkZBqnaGMMdIMNNqWHMuybOzx2eggCo0AA1XZWTlcK0AATtgEu2yT6f+18
	pb+m/OyYzsxBfAhO/E6mAGT9HRTXykOwfnhMTtPc/KzjBaqM8hf/lNZQoP4IiR24FV8qvsO7au3
	mgyyLoueAi8pxxNLWDUdSLj+/1WW3EgAS/4OTzrZ8nFcmj0pIM8mSDhP/4mf5Nk5tlZ/4DBDipB
	W09a4UsOB9fpOGq2EZvzlmFyas9F2t6ExZnAzZGFf+1
X-Received: by 2002:a05:6102:c01:b0:78d:31e7:e02 with SMTP id ada2fe7eead31-79b5d1cc89cmr4840004137.4.1789437927829;
        Mon, 14 Sep 2026 19:05:27 -0700 (PDT)
Received: from dani-ThinkPad-L440.. (host179.190-30-68.telecom.net.ar. [190.30.68.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982ba1789b8sm13201793241.13.2026.09.14.19.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:05:27 -0700 (PDT)
From: Daniel Salmun <salmundani@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Salmun <salmundani@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on ThinkPad L440
Date: Mon, 14 Sep 2026 23:05:03 -0300
Message-Id: <20260915020503.18987-1-salmundani@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The L440 (BIOS J4ET93WW) reports its fan as stopped: /proc/acpi/ibm/fan
shows "status: disabled" and "speed: 0", and hwmon fan1_input is 0 under
any load. EC registers 0x2F and 0x84/0x85 always read 0 on this model.

The EC uses the 0x93/0x95 layout handled by TPACPI_FAN_NS. 0x93 reads 4
(FAN_NS_CTRL_STATUS) and 0x95 goes from 255 at idle to about 111 at full
speed. The DSDT has no fan methods.

Add model ID "J4" to fan_quirk_table. The fan then reads about 1900 RPM
at idle and 2900 RPM under load.

Tested on a ThinkPad L440 20ASS20200 with BIOS J4ET93WW and EC J4HT30WW.

Link: https://github.com/lm-sensors/lm-sensors/issues/510
Signed-off-by: Daniel Salmun <salmundani@gmail.com>
---
Manual fan control works on this EC (0x93 = 0x14, target written to
0x94) but is not part of this patch.

I have not checked FAN_RPM_CAL_CONST against a real tachometer. With it
the range is 1927-4428 RPM, which fits the 5 V blower in this machine.

The L540 uses the same EC firmware and probably needs the same entry,
but I don't have one to check its model ID.

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c..c63e54eaa 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -8846,6 +8846,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
 	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
+	TPACPI_Q_LNV('J', '4', TPACPI_FAN_NS),		/* L440 */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
 	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.34.1

