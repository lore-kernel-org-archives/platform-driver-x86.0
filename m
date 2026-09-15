Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D074BEE58
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 02:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438335; cv=none; b=n8tcqQTcdl7dy3481KnxxjR8qF+RO5hHeA2Gjg/Vl3HMFf4RmoRipXnUPdi96ZD52IpvsdEXMCeFDRbKQ4+WnsDXEo01S/ziMfISpyNlv4HVxoILeRH/YHktEG9Snw6B3DIFZjNewWAnKdgvz9p3D1ioK3YucynIYON91EeMcyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438335; c=relaxed/simple;
	bh=iUbksB/ZvUQkmomybs67pyiUrrD20nBPxhzbitYBgbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P+fIu+AL946ZuzRe1/v8SagYDgyC9/AIgMbtlnbn+Fl9PVPr2svsIhq0BuHl/Z0zwN1zFRK6jElyaNrFFGc9kNkKol3V8GicsJXp14emuV6bKB/Y61PGB2jcjc0E1UviRXvjwlxT8IZEgqewB0+3LF/6chdHicRwUo8h4hWGID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em6CNldj; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em6CNldj"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso90862e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 19:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438332; x=1790043132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3cpSBmQm8alFaHwHDuj2nhX1nF1XTIa1cBVUNSO02I=;
        b=em6CNldj5QKytWAIlJN8sWW2620+fDNlZH9bsd+c0a9LoBH0I9iB3PG44SBKqwB1vT
         kIZHf4KQLj6lHpu4Sl87noO/W9zDKn8qImrIa67HUo62Y1cUPHABKO2W7x51dXl9N89X
         V0xttQNvKGNSJSHWRyKQj69MtQknnaPs0cQh/hs+btw/iVr/ggHuVeHtiI6CnLKolTPd
         PeXZ8opDqPdIIJfzryE5QSsPaDkl1LdXgGId+TgmfQ4qC3m0HKrTPoV4AKKr0GLQ8a2R
         Xesk8AILQrGZT19YZscKoe5bhI1beMpGpowKBher3KA4hhQemY8FE05JbZ+9slVtlfZE
         nbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438332; x=1790043132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3cpSBmQm8alFaHwHDuj2nhX1nF1XTIa1cBVUNSO02I=;
        b=S+R/NWIxK77MVpbx8/MfK9TQCQvmfVv2gBtOjBYG+BTV+ij0pFGKtqQAjkJrQufzY6
         ap/mKVtoaO0Zm7tGyp1F2LwrAGNeXY3pxm4qZkIfNQxeriTOgiLS1DarhiblbPkwIRg5
         749w5zHbofxBdqvErqLJ5Jhu8owfZHKeh67zU2mN0kbohNOS+qGS+GyIqSNjmpmCmGpX
         Dem7KqH5Oz3kup4xMuiOB+x315FzOAhMbcb1nkriE4KMZJzvjYcHqHNoul2BSl1+j99C
         Aes/ilmxszG2VtgNrqYWTePlSW/I7QF2ivc18VbBIDUlDDGPAc8LV3jwL48+QXNl2RQi
         hNOQ==
X-Forwarded-Encrypted: i=1; AKwUvByWr4OajrjLvvYIRaoV5+Masds/0AyIE509BlU4LAn7pnGNnpKgYF4+4y6mB3xdv8uVZmuo56/3LJtMwu1aq1RuHzbq@vger.kernel.org
X-Gm-Message-State: AFuF++n2hiVfAOLSzxQt9PK6hQV33fHI2xztsIpdhZar3lRYkqyf18pV
	aGZ5kP/jf8AAD2KjAqsgA/qbVrK2LVeAiRfDWDkJJ4RSPnGCTquLuTov
X-Gm-Gg: AYBFou1Ymgk5akJoqmfepC66lo72cnEf7amfBl86CiJNK0/vBRS73D3fKiJ5g8WHG/B
	nELMH594r6UhUwm8tJSrF0uxMYqdumgn667OQRVPcooc7HBdkpRFpuEDNJCUzSoY3Z2UaF5J7+r
	dIfBo+hURpBSsDm/C8r17Beqp0tM5AKTxhRZzJoWTnxLYrqMCp/vaPxI3gDlyUwAC9NCfjm4avU
	PmjzFnIq1Ob+aagu6sRax6StT6Xd0hQP7kH69W2wDTY2XjTe+mwytdFsc+05+XdQs0Zs+dxx577
	fRwBxLdYpAw5V8rfpzsXtTihMVjG1eHZDtAa66OoAVB+YjaHxPLUeuf6T/0AS+Lf1VMqsSiC6xF
	yPq8RAp+B8h3HRZbXEKzDRdnj5Cfisfs97Mm2InO259zpfCF973+Twr15TGIfOl6F9TGNdlgudZ
	nWu34abK34msHswO3HhhZna+GzjNAyJOrfz3FzghJjFCv4yvT0RKRl9m4WNeqbjTaXsIe3uw5rw
	7A0coZTHbAemn0enlmIqAWbFjBaACRJWdWwQe2wZJ1S
X-Received: by 2002:a05:6122:547:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c981d5aaf4mr5604934e0c.4.1789438332528;
        Mon, 14 Sep 2026 19:12:12 -0700 (PDT)
Received: from dani-ThinkPad-L440.. (host179.190-30-68.telecom.net.ar. [190.30.68.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8471137bdsm14283811e0c.12.2026.09.14.19.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:12:11 -0700 (PDT)
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
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Fix fan speed reporting on ThinkPad L440
Date: Mon, 14 Sep 2026 23:11:54 -0300
Message-Id: <20260915021154.23252-1-salmundani@gmail.com>
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

Add the J4 BIOS family to fan_quirk_table. The fan then reads about
1900 RPM at idle and 2900 RPM under load. The L540 shares the J4 BIOS
and the same EC firmware, so it is covered by the same entry.

Tested on a ThinkPad L440 20ASS20200 with BIOS J4ET93WW and EC J4HT30WW.

Link: https://github.com/lm-sensors/lm-sensors/issues/510
Signed-off-by: Daniel Salmun <salmundani@gmail.com>
---
Changes in v2:
- Note in the table comment and commit message that the L540 uses the
  same J4 BIOS family and is covered by this entry.

Manual fan control works on this EC (0x93 = 0x14, target written to
0x94) but is not part of this patch.

I have not checked FAN_RPM_CAL_CONST against a real tachometer. With it
the range is 1927-4428 RPM, which fits the 5 V blower in this machine.

I don't have an L540 to test, but it uses the same J4ET BIOS package
and J4HT EC firmware as the L440.

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c..c7c905e65 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -8846,6 +8846,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
 	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
+	TPACPI_Q_LNV('J', '4', TPACPI_FAN_NS),		/* L440 / L540 */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
 	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.34.1

