Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FE29C33F
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224203; cv=none; b=aM7eWdNYlxq51UePnOk8Jbtj0NYugXGmNJGmKGWxJgHpQVdwBb2PfPZbYOMzq71+06Aodlt8NKWIMFfD9Sp+DfxNCjJsNrXqc/eVYHrAzLRlVB/K41pUdO0Ldp8PkBKQFTDJN3LkggLwDd2hzqIJKnm5JGtuvSmANLaXeX2Y4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224203; c=relaxed/simple;
	bh=MU0H5zoduInnlAJUGN0fzrqJaXf+dp1WmDv/3H1oz6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nj2wWCd4J3Kz6Icnblj5sIccMOaufI+uCEPW0GS7HPMQcV87lOB4uspr64gq4DATLgH4ozgXCjnSKqOqNt4Gwk/k4hCFd41MDtavB3PcVD6sAkLnQR9EXq4gFCD32MkkWT/cN0XCSBF6cLuRbZ4pPYEI+Qvb5XCeJk8aYhHusWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roXGVTqE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roXGVTqE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44509921fbcso890291f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778224198; x=1778828998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJE29dbOhmcP352S7NcjaKMr1lO6HHFRb3SR0spKts4=;
        b=roXGVTqEhAlyEfnobuQxijMghujrR94ioYBvu4Rj3RBp7FCIf39Mpl8CxyU0C7jzPV
         yAfTF8lllVqt3Rk0O/o7GhiuXQxsFBc9QbNSVBqK0u0jZhrWhwtJ4Al38Z6HVeH1DGn9
         awyna6ZWi2HgKHwKymJj63SfDITm2j3qfOIOGH1ZorIcGbo4u+O9Se2Eo5yXYxS6mMAQ
         C9wj3EuB8moJ8AGnZzbNtJXWqTWDRpdpSljwSxZTqDUnzl82OD+cP+o91GVSgd1SsCdy
         ElWdRpJo1jeGVPfTqu1CBN/TdxmSFZIsc3CVe4A3ZV/lw5D1xJtRakICC5OMAuCpj/2u
         K52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224198; x=1778828998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJE29dbOhmcP352S7NcjaKMr1lO6HHFRb3SR0spKts4=;
        b=PKJERjy13rAsxu4ojyYHwVgbBHkCGEwRJxMIlYgF/MznkI/NVoYdizfcAA3NP69D/k
         hMrhblOZOT7M8DiAQV32Mj3pO68sFXA5uI5JtJs/QcWkjmssYS1Lb37S69cF329ELxzM
         Nrq+mnuZ6DcY9ee8FHmP4wBqJqIR4TovBi5Bm64DR4or7acyTp/YiwLo14JgaPSKQ8Gs
         0dPNE4G/FWaKzbhdONZeXa5qd34tWpKQ3XtVU1nJz6w1WBkUDZ41UZDJyjF9QyNjhqRT
         iHvBNKrYt1NfDshFKLMknr++JHhlUvz+Q44v2eMiTyj0wRV9xIme/GXsaubLHZQ+DB9T
         g6RA==
X-Gm-Message-State: AOJu0Yxnufz5QEVqO6N9E5c5NzMWfrpn58Nd9SeOQ+6L5njusJDf5YoE
	9N+CU0pWXSJ8HCtuN4mDejEewdY57LWdrbeLvPsU+J5N581DDkLJOxmd
X-Gm-Gg: Acq92OFGQgxlZZMIxPt4+azkK4bf0SCdK+pRAWJHpMQd9CmTGEDnK4FXzjxh2CvGqJi
	GPski8EVFe+9zPs6NTVrLeY9qbvurwiRdsF7k4VxQi+8Nf1P70+7woCWyRInc86/moWvBRgo3+X
	z10pUUqL6IjPOKgWIp1xU9XaKvmYcOreldYDs3qrbYNtkSCrHh5p/c+s2SXfUHzNQZx22eQsKDE
	1AiWnwtLgBp3XKVHa8esvKo/1R3K2P5vzZOckFm33700UJTjx+0bXi2zbFGhQzj2QwSYVtRYDil
	nBSzpA8KtcDjcmZV8EvCHBo6pakSgypTg9kWZH6dhGTaLrODhmCmMfrG/TrcjJoSaVDZB24bR74
	xyp/c2quoR6d2bSrkwuunGnVjetYewiaySHlJu4otWyfu7Ar9r+2AUBrArBpgo4989657eW0Q60
	02JcQhfvlPvjUv5zMqtLSE7uu87f/Mn7CVFOOJ3grTzFcdZOP2E2Aau3ZwbUCaVLcP86IJxIpby
	zH8e3sl5C0=
X-Received: by 2002:a05:6000:4203:b0:43d:7bc9:9b2c with SMTP id ffacd0b85a97d-4515b525e4emr17396804f8f.17.1778224197665;
        Fri, 08 May 2026 00:09:57 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:3ba0:ec07:4b62:e7e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm2076506f8f.24.2026.05.08.00.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:09:56 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8407AA
Date: Fri,  8 May 2026 09:09:56 +0200
Message-ID: <20260508070956.62201-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the existing zenbook duo keyboard quirk for the UX8407AA model too.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index b4677c5bba5b4..8005c088e9eee 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_zenbook_duo_kbd,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS Zenbook Duo UX8407AA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook Duo UX8407AA"),
+		},
+		.driver_data = &quirk_asus_zenbook_duo_kbd,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUS ROG Z13",
-- 
2.43.0

