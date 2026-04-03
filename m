Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF442C11EF
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203326; cv=none; b=AD5PZ9EtuB516jzuSxgxXrST3i9PGj4UScZUIgqwzJsPH3ikSMcc6hLCTMuFJEj5caFAp7gf5gNo3J6KT2ebqPvXZeEWnId5ZcWV0fUhyA4GoLup5sCwCgQ/ZDNmj2HNp0JP2RikeCQpagA16TlspPu7LkcerkUAtqMcqN1zpuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203326; c=relaxed/simple;
	bh=I8dwVCalBrafFw3MwQzMRNgiZjkHyw4ozWmwjKv8aC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOZiOSPs9Xtmuvuqc3yW3vwh6jT6JPkRj4TpMDTbGKuy7tUPElo6jjayBjNgF273fiNt58jEnDgI+qIyGIWqtqaHOhNabWcl4fsZyaVcH1eceUrkJOPDFWJZes4XKIkiTYtT2c6lHma6jHsZw5nJHBbcN7DR2dshD9GnwddLK7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZf01Zm+; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZf01Zm+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c742723c863so1163300a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775203325; x=1775808125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmw3siZNXRWCh4knFRG78DwSz4QpHX7w6BgMElaiP2w=;
        b=dZf01Zm+X4qM4FDMy4JYLfd2FdQ1Xj2fQv4ST/0W+ulqo8AJPzTxyj1QFfmVimG4kq
         ud25GQtxYgkWV4ZceSle+NQXDFOPQe4WwrvECShi0d9SnKTNrQBcjydEtf7YxkqIgTg9
         zT34mEcsMiuNWWbfbJpNYkoFvsWYxxRsrd48vWxpgquyMlnt32JRxyhtK++Cpy+Yz99K
         gqQ6jfCVBwIGtgutr7IZ8GCt2Um07A3PX8wU6d+4+LE+9tqyaz7CKQPNpyfrehk163c1
         F2TGndbw8le3HMWrZ2j8dy301seuzcsEUQnwjdV6s0CdA7wFQbF42h7+oH6AJ2GILWq6
         mARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203325; x=1775808125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmw3siZNXRWCh4knFRG78DwSz4QpHX7w6BgMElaiP2w=;
        b=YKW/yjYkkAWZAPhFtL2M3t0Ond3mNAo/U3hgQx/+PVsOjRs8fWsblIYTN7DX9asM1k
         9U3i6bBeHIaZAHB0sHyDLX1xLc7RfxHAx8FJTlpw4btAu2GzuuBc92sER0VyiIGZ1SZL
         3ffVYtuHVSSwec8u+qkesmDNt+rDJqhy3+eXIBGw4QhAe3tEuAbrdHpbZBrAAq1989TC
         tD09Y28TedQwPoAKurLxZDkkWb1VFCQBfASEnJlc/rMo5Py0XMRBK1/RukiryNcDP9ZF
         xiX0jwYhSN7lARiuZypI6ylSX/XzW/i3rmN3hTu7AepqBiM+kO/K2RqscpQe0oT+3mNp
         QKiQ==
X-Gm-Message-State: AOJu0YxsbpWbylU1HtWGmqdHKmKiWgI3XI7dicfgmGuPWK0iJByEhHZV
	jkEZtocJt3eZUdtHwK4Gq7NM/maHcPLk+fvt+MIhUi/o0gwUGE4qb4jJ
X-Gm-Gg: AeBDievQmdLQfxCCYbR0nIKWbYoBXyGhXS3bEhIULDkD+3NQLRvODuRSsDPQ4bFv/4W
	VWqdgs5od4PxJlYcVaUxzDSEn9YwM4e17F2FDoVkIRWxv4+gVjP8L7YrTGJ9nOZjwKK32VmER78
	9I7KUsvhN7+AKG32Fs35Mo86i1wfxVbqk6hidPjS/UbVtZzUVznzh1BfbZch8LmzmKAuUld68eD
	HFt6Nv6wqMlkz6aOEQvxVxbVOxm2lnPLwZosA6ZmQJAV9pyycZWKoUTF3WIfHeRLia12ddUq11c
	aV9WSrvZwSs0xFFVNOv2hL5+yjoTByxWGR2cFbIIVvN6HwsTpZ1HAt7K0ojmxV7x3Pbvy253XQ7
	KwameONUX78ixUTpFDDjPDTl0ty3mjaH4jSKG6e+zlZRdA4dLy0564ans2busa6ja+53kJy8RRG
	dGDObeusC4zKKuyaUWNqt3NDwNMmkHC/p0qopMFXjpomQ19UhfvsmxWD3nK1euHpmAQZCoqGH4o
	Pqq0rZN1LcjjEeHckkXnzSPqdaxi0Q=
X-Received: by 2002:a17:903:388e:b0:2b2:6df1:1112 with SMTP id d9443c01a7336-2b281969a70mr22265455ad.40.1775203325081;
        Fri, 03 Apr 2026 01:02:05 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:9e18:7101:be84:75eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm51146445ad.78.2026.04.03.01.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:02:04 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	"Artem S. Tashkinov" <aros@gmx.com>
Subject: [PATCH] platform/x86: hp-wmi: Ignore backlight and FnLock events
Date: Fri,  3 Apr 2026 13:31:55 +0530
Message-ID: <20260403080155.169653-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On HP OmniBook 7 the keyboard backlight and FnLock keys are handled
directly by the firmware. However, they still trigger WMI events which
results in "Unknown key code" warnings in dmesg.

Add these key codes to the keymap with KE_IGNORE to silence the warnings
since no software action is needed.

Tested-by: Artem S. Tashkinov <aros@gmx.com>
Reported-by: Artem S. Tashkinov <aros@gmx.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221181
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..a35ab46442aa 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -370,6 +370,11 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
 	{ KE_KEY, 0x231b,  { KEY_HELP } },
+	{ KE_IGNORE, 0x21ab, }, /* FnLock on */
+	{ KE_IGNORE, 0x121ab, }, /* FnLock off */
+	{ KE_IGNORE, 0x30021aa, }, /* kbd backlight: level 2 -> off */
+	{ KE_IGNORE, 0x33221aa, }, /* kbd backlight: off -> level 1 */
+	{ KE_IGNORE, 0x36421aa, }, /* kbd backlight: level 1 -> level 2*/
 	{ KE_END, 0 }
 };
 
-- 
2.53.0

