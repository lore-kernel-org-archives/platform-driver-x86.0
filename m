Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400F374E76
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371256; cv=none; b=ROnkInSLBflvpaSLF8RDjU9ZKA75FFls6gzAbGUuEVi0l+0rpeV8zt4pbxJsEtzpAJqDMZF5wAXdctXE6IwPr+kpjDfR0tgo2QhbGQahTpJtWB8dOkAYEc4/doBVdD9fjuo7OSovjjvssn1jk70X+12RjGN5uzcHTeF69V/yf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371256; c=relaxed/simple;
	bh=RSO5hJPt/u6vxLaap4YM1BOcxseAMLB98i5YdofYKNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hyYI4IvjjCcOkMa5fZznFH/YfDlW53tdh0oEJNuHh+56wsnGF3nECSCS0CZJ5jrjiePKs/NoVwXoEp1KF0OII+pKsDsJKPOfYBfBsiLYQoN2UsL473iqY0ZvF9AtcwVVuEznXCaoaBBRlTu9XGZaTjFs693XeCUsKSUPZPt+K/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE8GIO/h; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE8GIO/h"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso1138601a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371254; x=1788976054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ajJdf+X/nuYZVAyiO85HtOmnTDxcjy4YZBTuYBU9do=;
        b=EE8GIO/hpF7t8arLp5OxtZ+FzhEp+XhRTET/3yVvZP16Ijd2qExS3LV8fAr8sNm8jV
         GDqaff0BlaJkg0oO6L5XYLL8oQGaEzwB41o6qwOTnYKT8N3YNwsTDyb4wqsIC6FtvoPJ
         JthULVAUnI/oAvG7HSOF8qWD7cSIE6nK6CxOYpbVF6OLIa0RkFj0OAJesjy3yjhmqghc
         9p8h5WoLKUzrtMr3SfVwx+osovE2Tf0/Tj0wDfpQopxTOZV+eW9rbJvqwdHOn0iZnEe/
         S/s0GdMAh7BPzXFXz9cPCouC2fUZavvnmCoow84gM5YV9eOpVO6Oqo4fpNa7stC/UmLP
         Q+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371254; x=1788976054;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ajJdf+X/nuYZVAyiO85HtOmnTDxcjy4YZBTuYBU9do=;
        b=BMLzWe87U32a9EvHJt9c6CvEHYS06hK88arIhUIwfnmbPg0oyPNCvUiXs4nJ5KAYQT
         pwp9p/GIWvA59oc/nI5s85alR08J+O0w49RlV0V8TBM9yQMHQ4v94QvSQzyoeA/Sjg6m
         Kv29WHGIsMIS6Nbxo/KmG7QZ8R3MAjO4qPFwuqW5lRY0mXFE6tmcih8fwRt2gLOeB9/k
         Jb79mrAvnN7tji3iv5t2iDiQGUkRA/3jJCdMmazvwg/GYXS/g8fXBiSZHusAkrIKB13r
         JmGK65+ySgQOblXXkK8LpRdfVwZJwoFoKPzOh5mLFljejT+strSCt4L/TXV5Rl1nDyHY
         fP0g==
X-Gm-Message-State: AFuF++mo5paaRtUrlNkrO7gYHmYb29LvFNGn5JL/pZ2sHScmOg5vOcYn
	gRiWlRtD5qF93H8Qedt8I/Qf2WbCjv8Z4eAO6AJlhjhG/nOKimvItgc1f2L3qemD
X-Gm-Gg: AYBFou2bJ8GN+ZOPxxGR70hw/KlZ5gGBrrrIRj97kKLKfgpngW8sNTd1BKcfevu9n2b
	QjecVeccPm/CeWlP2VmqtcThLIkfSZRTTrnI40vLeK8h0y+F0HGvbfherqD3xIWX4Vtyo1AiToy
	q0IntisEjwxEJccroF8zpvz+rd6GCpQx8fh3JyxiFCBKFwino4O5Kki6jLs73xg+At6un+N0LNQ
	bCOhKXNa7UDnGobwnG98n7RHAIMOqGoQVhSYZlQWq+aEcJ0M3LtJR/3ihr2RVJVxM3bj2rEVYn9
	J3rQGjftI/y7Q8Z9NwhW6g1Kbyi1SnuVnYN1K61LA/7YscqTCaPjdyyobogvDrYE7e7mY9zsEVI
	ZmBeBtbPra3R64iaLmbU4cVtWeqEAwjjIAIaMKmCCxJsFtk+30RdccmCdfSdI4Z6autitn3flFg
	L7l9GLHjQzFi+bEKwqJpuBIBbc/85X754sFgGLhetDElAE0jeob2AfX9I6Kb9POkY24pupTdm/G
	+fdwQ==
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr9248404a91.12.1788371254420;
        Wed, 02 Sep 2026 10:47:34 -0700 (PDT)
Received: from mizar.onca-liberty.ts.net ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm470584a91.8.2026.09.02.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:47:33 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	"Luke D . Jones" <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: asus-wmi: fix FA401 series keyboard sleep strobe
Date: Thu,  3 Sep 2026 00:47:15 +0700
Message-ID: <20260902174718.16228-1-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes the keyboard sleep strobe effect on ASUS TUF Gaming
FA401 (A14) series laptops and refactors the TUF RGB state/mode
interface.

The FA401 does not report the TUF RGB state WMI device (0x00100057) via
standard DSTS probing, yet the EC supports the state flags required for
the sleep strobe animation. In addition, Modern Standby (S0ix/s2idle)
entry requires re-asserting the keyboard backlight and power state at
LPS0 prepare time because display servers and DRM drivers blank the
backlight to 0 prior to sleep.

Changes in v3:
- Split the series into 3 patches: preparatory bitmask cleanup, FA401
  DMI quirk, and S0ix sleep re-assertion (per Ilpo Järvinen).
- Use FIELD_PREP() and named GENMASK() definitions consistently
  (per Ilpo Järvinen).
- Address Denis Benato's feedback regarding userspace policy:
  * Check the TUF_RGB_STATE_SLEEP flag so the kernel honors any user
    decision to disable sleep LEDs.
  * Dynamically track the user's active brightness level
    (kbd_led_last_level) so the sleep strobe preserves dim/bright
    preferences rather than forcing max brightness.
- Hook into ACPI LPS0 s2idle dev ops (.prepare): ensures brightness and
  state are re-asserted after the display server and DRM drivers blank
  the screen, immediately prior to S0ix entry.
Link: https://lore.kernel.org/platform-driver-x86/20260902032353.16106-1-idotohors@gmail.com/ # v2

Idotoho Reimon Simanjuntak (3):
  platform/x86: asus-wmi: use named masks for TUF RGB commands
  platform/x86: asus-wmi: enable TUF RGB state for FA401 via DMI quirk
  platform/x86: asus-wmi: re-assert FA401 keyboard state before S0ix

 drivers/platform/x86/asus-nb-wmi.c |  13 ++++
 drivers/platform/x86/asus-wmi.c    | 120 +++++++++++++++++++++++++----
 drivers/platform/x86/asus-wmi.h    |   1 +
 3 files changed, 118 insertions(+), 16 deletions(-)

-- 
2.55.0

