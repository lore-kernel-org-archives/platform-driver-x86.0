Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182251F754E;
	Fri, 17 Jan 2025 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101706; cv=none; b=YEJycjY4MbT1v6weaQxsFwgX2tTMcziUr8wLjWlLGN/iNdad42VLhKiLAG4B1CgXPRRAhv7FSw3Re17vfDMlNHDelKklfdrXUJ32rV5TjGH0EnZlkLGFcz6y6R9x/7MRO9IdMJetekRyLeD/JT5us9HmKVwtyQjFgAHQ8Vw7iuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101706; c=relaxed/simple;
	bh=/tlLAPnjEu3dc7dm+QQlfsQc5PU4Ea6+9T7P36+MUn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZrp9/P/cocOI4IAVIad4kyxziEDHr9FP88cC+GuoVOShbbvfOse5SgXBfgxFuyEnOOc3SRM/yLMi32Y110plIDIQjhCpNa+h+ZkMvgZEvbzDgMGYNkCucbnsivRJwqmkETIMQDlWjQK+y0rhInjXyVEN0DhXRy4n75o7Ts10u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+3ZC4eU; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+3ZC4eU"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso425602137.2;
        Fri, 17 Jan 2025 00:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101703; x=1737706503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHpbocTWC0KI6knORKA1HR6yShq2RhGQg62h68pNfkQ=;
        b=Z+3ZC4eUQmaz3T0Rl1e97Y15P0w7Eh+KSdBd8GDHlh8gSYOjEoXI3aauVnP5aHbVHv
         6vKzfgtvEPi2qcvnCyXfid+s6SivpQq9j/OdftazjPcKgUyxcbZJpgx7TPoY0IQVHuY2
         TJVOFB+I+pyxQehZyngQGb+gHUwuBecWOjxHzXPaRqEs5dY8FHA9s8ix1ijSmS6b7B4g
         y6GA2/IrWN5sBBIOcUkZVcBXW0Md1u/g1+G7422sdddMDmU5d5wAHOP7p9wSKJvIyFD1
         ETZB3nOPG1koXc5PK8WwF7Y1K5ZlncsOmITpnhy5fb1n1IF2bQpriJANnJa6jibLrVTr
         CNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101703; x=1737706503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHpbocTWC0KI6knORKA1HR6yShq2RhGQg62h68pNfkQ=;
        b=wFcGeYX8gTEQ9IA/viat7wdbk0u8/FEVEvwqk0c7+2erCqxG2MSmfyTzvs9u2Sp+WH
         MaxCxX0al8McVakWURXWAv4rFuY9dY+dth9cUQWmk8L/aeE77aJV1WB0tzCgvLh8f3Xd
         D7hU1XR1cBZ5x2O9DnqKnE7BiijAbNgeksY+fZ1TgUDSkSk2zTIIlghl8L9yJrS4jm+y
         ZZ6LEFYIEzKISHqh9UFZaeE99JYASXuImUP/eaJATbNC79cGquSizpyRb/LDvf6gmzYp
         XdHQlkzaRX47JhmBzfdVjjnThgSTITbkkrHoikcXRjeGF7pnQ4GkYh/IWpTX4qqWVday
         /cNg==
X-Forwarded-Encrypted: i=1; AJvYcCUxWGsz54r53lFKxoz3eFKfFudzK9ZSRec0hyQsZHllB2FXIg6gypFcc9sz7lXcUshbkHL1BvIdyMnRdl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHGq6R87cNmKN3bfMnR0Hxun5IjwJzAkjZc/vubA2p6fatt9w
	fSryCvpHylISRUXy5cEYzkgXwMevSuGpu2TZojpU88fDGVPnjdeB2hlmDg==
X-Gm-Gg: ASbGncuJkqqlDw5PhXCLNl65+zr/X2vkcI4rDinw0MipF26lOOH/HPWJIFGrVYN2neH
	1Zd0BDm+6MuDBpKpctxX2WW8W++UWeIun+7aTYOE7opovGZO780rpbOXWunVprq9EI7dXikbEbt
	0tgbAwZV9GiVluVCAL7TfsQJFIgkcYg52AE2GL4QyIMKTl3/Ewd/0fx8UGKvNFRAYkIuC9mm327
	akZ8xlxRFuUhzC9jeaWjtZeVhkROCnRVxwLPsb11mDA5G0ug2IcYpLjkjxlhmmn
X-Google-Smtp-Source: AGHT+IHDJDO/F5j5o2aRJZSUiSTyisMZiDh4QdaHmNeGDLJ/85OWScWonEo7sjbrIf6zuYy8FGUxAA==
X-Received: by 2002:a05:6102:c52:b0:4b4:27dc:ffef with SMTP id ada2fe7eead31-4b690be5835mr876735137.14.1737101703702;
        Fri, 17 Jan 2025 00:15:03 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:15:02 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Fri, 17 Jan 2025 03:13:47 -0500
Message-ID: <20250117081347.8573-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update module header and description. Additionally add myself as a module
author.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index e55c962c84d7..01fe08d1a224 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Alienware AlienFX control
+ * Alienware special feature control
  *
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -15,6 +16,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.48.1

