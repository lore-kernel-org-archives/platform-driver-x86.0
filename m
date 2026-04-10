Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAB175A76
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843222; cv=none; b=QLuQ6Uzwy7W0sxaTmcMX9xxyMe6u1turuSoPqiAZtY2oTesAjEj8lMsmlEomrcCf10v80pXego13dZNflKOfNNY4ZiZPnKasQhEYgKbFbYlUXl9OL8U0UjMtMPrMGJaLWUkSyuRAe+aDH/2+cBM6+mdnK5r2GKRkgR3dAlOKL2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843222; c=relaxed/simple;
	bh=BXDhEoIemt3dw+REQTtRyIybPvos0M/MpfWXfYQEa0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3x7ctJc/5z9GsIR5BPUCfSFhL8Qzf2U2zRs+xA/KyiS/UkMVpja63/indsvyDYImHQEjpD9WwMiMsUHzGB2W4pxMOTYOrtU/rCctK69NAlvuZINIGaGDNwWJRKDhm7BWgiBvmb7S98myICMtXbiy2WPo/JBBh48CVA6ICDgyUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVfhICor; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVfhICor"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b24fdac394so21590115ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 10:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775843220; x=1776448020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPSEL1bgWZhJViO1Tf1/oqxDmOdbttPMlE+WqXtVQFs=;
        b=kVfhICordIjEiowgcrAA5ASB3Xu6ComOJP0F0sOEMCFGuhzMci+DmLnGiFB8PIGiaA
         KufANG2USjOQ97659RoQwl9Ymiq94i2DZhXTJxWRXu94D+SzV4uaHhUEx/fYah6wMTXT
         tkhb+w3brjVcvz1rMlzj/0uqvF4O7zhiMCSo4TEJzeeNqHOINQOh4NVDruvqRBEAF6Wr
         ObIc7YhQzlWGA2BMFzwpvQ873e9BD9mXT7Zf9cDyo/r4hg03lbq6cloUE6heyt11H9jY
         WtERbOD7A00spxME7Qn78BwZEdloKhf7U1oyBLQyI5Z+N21jb11GDrUK2QtajzeFjKPC
         t8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775843220; x=1776448020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPSEL1bgWZhJViO1Tf1/oqxDmOdbttPMlE+WqXtVQFs=;
        b=K/ncjspONCIZuAz8rej3QF+U1zw5Td/qBySuzno/XRc3V89i7Y4VAGEown12R+sW0a
         Zgh2Xa9afMo9l8XYqQkWveRCTzlkZS9LkSqroZHRuYv2APYv7FA8QSEi1/7H091xkIMk
         iHRd0KupDwS8UnAAEkg4Ia1KIQ6hnZN14jqu9lgJ64OtuXVS4VoPhhkRQNYcouKh5RHC
         gWm0VvJnSswS00yhgVi5Jf9VaAfausUFULP/Mve938I81NAZ1vyTQX2+Ms/w2EWRDiap
         /FylvVZxFs4dGvFyc2Sdo+7q3he+RIT/RgJ26410kGeDYQsi7rDje4T+gQm7e0ZicL7V
         xA9A==
X-Forwarded-Encrypted: i=1; AJvYcCXddYEcPIeQmnqrIdaEFa3ZM+ctZ58FI7DEr4sv9RS6CBu7eyZYrx3imzDQ1VHLXL8OBgYBOVufsk9ozsYsMtmPNVFJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxifYhtw9VkFg9DgLLHadbCKXl9ZRsiReG1JM/JnQejlRdlP1as
	DPWgG5zHKB2AHaM00vnXrTi/0M++pZcDnYOuo72Mnwk+g1Rnk7EFUnkI
X-Gm-Gg: AeBDievUqDyB8PhZdC9XI5hLKZdERwXDtK6XWzJWsEL3pDM5mIg5rF6mrbPGIHzneBZ
	mvNti9hB1YM94myT1BbZz0MlEY8X/hRyTBiMY9enxL1T/Oz9rfovr/7mDK++Z3HliQSP3YwuHX+
	QjfAuNjvenA0ggm2CNIOg7lvS4OhkelCEbjhEtk9Th/IU0zkDtNkJwXmYGCjRbqJMclxb0Mtop9
	wX583l/2/DRO0YUOYB0OBG+XL9GHZ8WVzcCact/sqI6+ljYxv5DCeEz8G38uCMNIxtBi07y7ZAy
	tvlTN8CawVCMJC4N0OIgfVUfBcLXFQiWllpTTT/fWwrSWwSnbl7XMR5yh0uXArvaXlf7FKtZSw/
	XINRiPkFD54ofanVyKW2Y39NxO53tWYMmHJScPCSTk0Ov4JOB0graHbcNkE2gcmcNbwlxFpxkW3
	ExqXRyjgu+bZzlha6I5qi1DwcnraSggtdbzO0=
X-Received: by 2002:a17:903:1a8d:b0:2b2:3dd9:c5f5 with SMTP id d9443c01a7336-2b2d5a8381emr43987905ad.36.1775843220470;
        Fri, 10 Apr 2026 10:47:00 -0700 (PDT)
Received: from Omen-14.Dlink ([103.114.252.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f39ccbsm45694165ad.77.2026.04.10.10.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 10:46:59 -0700 (PDT)
From: ShaunV334 <shaunvarghese43@gmail.com>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	plotnikovanton@gmail.com,
	Shaun Varghese <shaunvarghese43@gmail.com>
Subject: [PATCH v2] platform/x86: hp-wmi: add Omen 14-fb0xxx (board 8C58) support
Date: Fri, 10 Apr 2026 23:15:21 +0530
Message-ID: <20260410174651.1424000-1-shaunvarghese43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402095707.64881-1-shaunvarghese43@gmail.com>
References: <20260402095707.64881-1-shaunvarghese43@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaun Varghese <shaunvarghese43@gmail.com>

Board 8C58 (HP Omen Transcend Gaming Laptop 14-fb0xxx) appears to use
the same thermal profile handling as other supported Omen systems,
including board 8E41.

Add it to omen_thermal_profile_boards so hp-wmi can expose the firmware
thermal profiles through the platform_profile interface.

Tested on Omen 14-fb0xxx: the profile handler exposes cool, balanced,
and performance modes, and selecting performance increases sustained CPU
package power under load.

Signed-off-by: Shaun Varghese <shaunvarghese43@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 988a0acc9622..3cd5679828d6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -153,6 +153,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
 	"8A15", "8A42",
 	"8BAD",
+	"8C58",
 	"8E41",
 };
 
-- 
2.53.0

