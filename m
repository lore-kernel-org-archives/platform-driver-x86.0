Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B527031F99C
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 01:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791942255; cv=none; b=PgzOXiLn8fxPPkamdiVr/cRgLnkeHCF3qF2PeJ1z5awSpnT3X/SDJC80ThBB0rh0pRzuFyb8A5k2RbhL7b+hOxhG7r5dRlSLEUn7KtuTgSqayS+MTstuQaEGMMW19QFLXBYadavqqZDYcftWzdFl4fz3LmpOEA/vWGa9XWTfWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791942255; c=relaxed/simple;
	bh=pZLuHo5ZWjv39EmAfep7f0DI3I6NdzNmEzWVgKx/rls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt/G4dANXMIs7p88391GmZ57dcH4WK1+gaUw1iYCGuC19Iampurno++Iv0MkRKLfl54g8tHCWQr0H/wMFEHE++4syiuxIli5IuCbJOUyS0SJn7qesCK+6vrHguE7hodsLcEBdH81aykCCymtub4g4hIwlUzuBZEURhCID1X0RPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=qkRM41ms; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="qkRM41ms"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5339381b46eso37667461cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 18:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791942252; x=1792547052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dlj6aFpIYGfY0eqR7kOi/l3Gq5Y654XQkcpULmP78WM=;
        b=qkRM41msFbZxLdCCQXtPBrNJXZlirtPFWl+68p+vcX4rPpYR60J3jGXOYO3gt2awAk
         vGwDQek6LAhnthSebka1pgXWfFkR7yqaFvu/VuWe1AOlVs4GKaa9teaEX4pJAZ22lPsd
         xfv1tdGwUZp2CbMLXnsIHvcBhUzRSQld1LxVHDtQtyaat8+Tt58vgpdGHlOfDnfB16Ei
         GfjYfhjhFHiuknz9dNcUx+KH+G0F+XXzQPkzVQaEtf5N2QQZAln71owJ/GgTNgFbe6OP
         5RenyIQOFhdeZwBtv0EJbrogu8HtdgbVR9P2lHunBEYpoG4Q7ingji9NU3YD6Ol7DXG3
         b4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791942252; x=1792547052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dlj6aFpIYGfY0eqR7kOi/l3Gq5Y654XQkcpULmP78WM=;
        b=cnUrCxxKBm6nBE4+cvgsOZfZ3w+5RvLPuqkaPWUciImbon6e5thSS6AN2L2tXRD0BN
         yOiyN6ZVClGa2UiopYAADkEA+pwUt0VS91zuenwMHq7rcxxmLKUtoaYOl4x953fzOqSs
         JVxXrkx+WgJ3WgOlGQrE20mT8Q3wKf7ABwgvX9T+8cVRGg4nrKyjsoViHhA/JIQY/a3G
         e0uJs/QHrDlVjxpihfGEmZzzjZ0J3CRuwXVa8DuCGooCmqXwWrFDm/0v+4r3noZMyoKR
         elzFfBXuVlBWwpqqEsPcMzcL0Eh9g5HDmP6eAYtBxKs+veC5NYRrdk5NzzprjOa7PlI4
         iq4g==
X-Forwarded-Encrypted: i=1; AKwUvBxt4i/FI/goTqX/zeb6fp5x4bttCNO8jyVSTv5z7gxPU98ZT96ceVVod9YcDZiu9REa2laWXZQA8+uJsBT7h+UmkrvU@vger.kernel.org
X-Gm-Message-State: AFq9FYJpcFDuydih32CPLnFEANMRBNYsYMAL0rniv33AKZxpESnGKrlG
	inaGa7C7h/gw8QHYeuVEP4fk5gyXkw4SBycgM+nBgvjLEE3OdFux1LyFoBNlJd6+7tU=
X-Gm-Gg: AYBFou2Zwg+j+pMn7NIQsQgWEDfymxfFb79U9XpVhEWLj36FgIyJFtTi5p1P5ff1bEi
	rhAjAS4Pbzu8DnMt7Qs/bMJDWPvsE0iOjrvb25/CZTzWA1XLC/Kmqu8Nn2s1SLhBOaIlFJCJCL/
	BsWmskmL9m76cNrisQqs4aXd9ya1ApD7frCnzHZh/hTT5clDZFbLyqu1Zd/XrH71foBMqPjw028
	jHmuEghPziz4wsZ7vyIIpFJQIOc1xCvnGXvYEwUzoRvRIhmXja0Mvlmhd0hmNqb59xnZoIYx6G5
	aNrB+Mke9XIg7IC4Tn/kcmNc1NAY8BONGqn+ZVeVY3xs/bD0Lu94KpvJUgYhQCu7y6bGkYXqcFq
	z1259FZSpxnDqQLyO6PAX06VXdJXRtA8JOCrrgS7/V/z2REGSkmtfyBmqZS6hZe55H2eP5uHinT
	LUVEiVauP3HxHgnAyUvaLM+t4lnRQmV7Mdz4N0V77qL40zpz53deT0PuQjFjvEuCS6G0zsZJpzz
	r7x3hWiCCuHnsnK5L9PeVNT2MRrw9RHqCnrpUxc
X-Received: by 2002:ac8:5743:0:b0:533:90df:fda3 with SMTP id d75a77b69052e-535fc8a0915mr24634181cf.50.1791942252446;
        Tue, 13 Oct 2026 18:44:12 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7d9sm40377936d6.47.2026.10.13.18.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:44:12 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: dmitry.torokhov@gmail.com,
	mpearson-lenovo@squebb.ca,
	hmh@hmh.eng.br
Cc: derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Sync initial switch states
Date: Tue, 13 Oct 2026 21:44:09 -0400
Message-ID: <20261014014409.14579-1-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <98c68af25f9fc08500eb818a6d77d0d7@gmail.com>
References: <98c68af25f9fc08500eb818a6d77d0d7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hotkey_init() reports the initial switch states before registering the
input device, but does not terminate the packet with input_sync(). Since
input event buffers are allocated before registration, these events can
remain queued until a later SYN_REPORT.

On a ThinkPad, a userspace LED update and SYN_REPORT delivered the initial
SW_RFKILL_ALL=1 event to the rfkill input handler after registration. This
undid a software radio block that had already been applied.

Call input_sync() after reporting the initial switch states to flush the
packet before input handlers attach. This requires the input-core fix to
accept EV_SYN events before registration.

Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Cc: stable@vger.kernel.org
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/98c68af25f9fc08500eb818a6d77d0d7@gmail.com
Assisted-by: LLM
Signed-off-by: Karlos Abel <kabel@voidship.net>
---
This is the companion driver change requested in the linked discussion.
It depends on Dmitry's "Input: always accept EV_SYN in input_event()":
https://lore.kernel.org/r/asx50uz6iafsyAd5@google.com
The prerequisite patch ID is included below.

Validation on 3857c2fe5449 plus that core patch:
- KUnit/UML: all six input tests pass with lockdep enabled. The two
  regression tests fail with either the core change or the pre-registration
  sync removed, and with both removed.
- The tests model the driver's event sequence with a virtual input device;
  they do not execute hotkey_init() or operate real radios.
- The actual ThinkPad driver object builds without warnings with W=1,
  configured both built-in and as a module (x86-64/GCC).
- No new physical-hardware run of this pair yet.

AI assistance covered the change, message, and regression validation.

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c..ea8679398 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3497,6 +3497,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		input_report_switch(tpacpi_inputdev,
 				    SW_TABLET_MODE, tabletsw_state);
 	}
+	input_sync(tpacpi_inputdev);
 
 	/* Do not issue duplicate brightness change events to
 	 * userspace. tpacpi_detect_brightness_capabilities() must have

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
prerequisite-patch-id: f8539bd5b5201ef9795823552ba68a73b7dd6298
-- 
2.56.0

