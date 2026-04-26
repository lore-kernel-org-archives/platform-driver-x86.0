Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449CE36167F
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777215575; cv=none; b=ofpwMRObismueuGLZDd0AhGa9UTemdF7clSinWEyplb+SPkBx6zI9+9ZhWsgED4ZiuEiFmSkA/ZtYdAkDvzthQ5YIqeHSm0vO2cl+sk1Bc/Via2xlv4Vt2J/AD60wDbBy7g0ZAm6KucwyZsR49/FXLOv1IAwcanGkpx24xKP1ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777215575; c=relaxed/simple;
	bh=8fr0qmc0yT25R2aLybbA+h+1X2keMYVAYzMmys1iFrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzS4N03RcpU/iXLnxfXpM+cDz894hu+vf0I12yhd4/UbORkSB/RYTUK4COzx8QqLlOGRM/gL4VT39WuiC6eYES+1ckM7R3ZS7dYWTiiF6BsgNmk7RJyNWYWDoRqmF/yPr+S+szmecBciCfjBCdhaOR2U4khItqV/VCR1Ovyz+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHD2YlU/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHD2YlU/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso5785495b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777215573; x=1777820373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htUqt+6vUIWK63EUzlN/4gjYgk/elzHZ7NhwiR0tRHM=;
        b=qHD2YlU/aTF/rL1zXg0IwbTbEooDnVo1d6X3WB4pxNyw8KOgBzDSn4eIMlSZo0Bi4+
         5JoDQ06DObpqRXuAORt1kNBCxmgNg6b7F+1hDZgE94xjrbG/vBsYdZ3y69+iqZSmzUvd
         DEyMgU4a1zzmqVathLeHmaK6ZBh/463TvMc7RjK0Frz+0RcfR8UoePabAkGgrQu/+tQ3
         6D3BvhtsrXRDyooB2CHlN0AE0HwOT2Kk9/cztSUUHvsyqhEBbvDul+DhkEfrf0kFG79A
         PCvrKiieCvycFEQoV4+D6y2y66pY+saaiUnKCHuYnB/gzfelTCwU3TqYn8yBLhignjLr
         fmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777215573; x=1777820373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htUqt+6vUIWK63EUzlN/4gjYgk/elzHZ7NhwiR0tRHM=;
        b=G3pX/t07NEgN/PFKhfr5ocvd/F5syVaAiOt6yGFcjdvF8nEefj+2Ycffp+NLIndUjP
         q/qczBWVcmOPgc0qEs+vU8KmVeFs6ZJkeyXHnu2CIVnoF8CZ/GrJvp/lKeQJnt/teN6e
         3eQ6Q5u/FCg+g9l9J1c9oOeP/CighFhx3xa56/HNXHFh9auzRd+DVf9Uulj1KWWuOV0Y
         Ze/HONMVBE1QRAJafYGVuKZ1v+VnhFa1xVadzKRU+SgJe8ay9BMTYKGyRLGxu2z4THuy
         hiJSy8/D/BzKZXb8kFz8jCI9ycmBd/vgVqaws8XAkpZk0vHbRJBQ+eq6SvuoaYhiosgS
         Ha7g==
X-Forwarded-Encrypted: i=1; AFNElJ8P9HQ3NB2uHVlgeXPtgesNMdjCWPp2UkQqM4QaMYGpMrK8PRacM/NvdPfD5rPdLNF2qljexVSoOgKbDFIHv4Ey8CeG@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRlcl8TuGR8dVv1/pnOua8BgDg3CPO00MhQ43eEp0mwGZLCMB
	OVmPUo4AK4APWlK5z7el1KxMFYdQt9Va7GhpqFLccM8UNXMq/k2h/BeH
X-Gm-Gg: AeBDieu4dzigSYjfDYIvmQOGHwPCjV5Thk48QhRh93XiiMlSmVf/plr4nOIPdzrbnhu
	1L2r6/a0rtYoKIfvYMXUFt/J8H8Rg+rR88gRHCl8qxvcbddLoML0zOY85HSaa/OgFiH672LkWTS
	p+SZPx2pAwHAZ9iUh1aVAE8uRxq4TvHpsJTq7rxfR1BQKgCK3zn/ygUdluLVBiWhV+rg/W57/ZZ
	LzoN8YeKrCqWt+lURDAJObZOxoiYZtMDxVBkvGW4Xsw2UTOHUiPxDKAGSi4hENJY9Z97KpG/IdM
	xEK035Jh91t9r6YrQiDTl4ULZnGGhB4LKGz1aKTrDRMQUgZyFGZagfrxFXAcV0Qq+L5UOLBZLup
	tdms3PVbx8gMXqL2FXauSgc5BenEp5iWR8jBHqBCih4lziAIQ2hJNSjNJ9T7KrCVBEKdkhMjPks
	S7x23Hq2GTQfzc6El0GliT6CkGm/S26782EivuyIOQSiprpe8=
X-Received: by 2002:a05:6a00:3a20:b0:82f:50ef:3eab with SMTP id d2e1a72fcca58-82f8b54738emr33551365b3a.28.1777215572646;
        Sun, 26 Apr 2026 07:59:32 -0700 (PDT)
Received: from LAPTOP-DV5I1MV.localdomain ([27.19.123.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm33816987b3a.58.2026.04.26.07.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:59:32 -0700 (PDT)
From: Yufei CHENG <cd345al@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	i@rong.moe
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yufei CHENG <cd345al@gmail.com>
Subject: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized variable in lwmi_om_hwmon_write()
Date: Sun, 26 Apr 2026 22:59:07 +0800
Message-ID: <20260426145907.7295-1-cd345al@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the flag relax_fan_constraint is set, local variable 'raw'
is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
value to lwmi_om_fan_get_set() resulting in undefined behavior.

This flag allows user to bypass minimum fan RPM divisor rounding,
but assignment to 'raw' only happens in the non-relaxed path.
Fix by defaulting 'raw' to user provided 'val' in the else branch.

Fixes: 51ed34282f63fab5b3996477cc56135eb4de5284
Signed-off-by: Yufei CHENG <cd345al@gmail.com>
---
v2: rewrite the commit title to be more specific

 drivers/platform/x86/lenovo/wmi-other.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa..6c2febe1a 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -349,6 +349,8 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			 */
 			if (!relax_fan_constraint)
 				raw = val / LWMI_FAN_DIV * LWMI_FAN_DIV;
+			else
+				raw = val;
 
 			err = lwmi_om_fan_get_set(priv, channel, &raw, true);
 			if (err)
-- 
2.43.0

