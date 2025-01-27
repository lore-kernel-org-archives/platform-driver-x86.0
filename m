Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A0E1FDE39;
	Mon, 27 Jan 2025 04:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950693; cv=none; b=CyeEH7I0AoVTMYhPUofrheuGmj23WXyKfSadoAwUzdtv2lu9cBjXfgPzz7EhSB8PWcDiaj+iTlDFe9sDIjAfjqJ9MhpNFykqxJUx2yDbGk6DLmqFLVe8T5Z3U7KcS4izGOR0Oy41EJel/nJAT/opUzrYO1X3+kDxq+VyRkaIpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950693; c=relaxed/simple;
	bh=uln2bSp8cCgoiDtrWN2ZC+ClZjMq3WgUM/z2IQmiA7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjVpLFVzT5F1R/u2C1zl3ggj/lGvUl4gEFB4gjOzRuRXxV4N74SZmG60njDCLnb+FHuJXC+KuoAqGOF6VttiztkIkHshARXZZTNle6vTRm3EIt73gG6JfhGUWvxrpExhpbKHHB2Hq62DXOQ7WyW/mkKVGT8v44sEU7qaERo0g4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7UauQ5/; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7UauQ5/"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe7429d37so1001183137.2;
        Sun, 26 Jan 2025 20:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950690; x=1738555490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HguH/5GHeVMnOVWR0BWd76PxkLkAFvISPM4MfQHocJ0=;
        b=e7UauQ5/YH8SGStFDNqiQGjBR6x9QZMG4Qy2/9mN+eXnpc/s+NwzNB6XH5wNClfDwV
         FPU/RvuDWW8ObgYkbQA/uBHBMv2AKK8sDwjDtUC88Q7MrxeNZqyCNPaop9TikMY4Wq2l
         jSEttJBLfBEV0QhPdeldP8eFRZsTxyxEOc3lKo4XHMZddn6Jpx5IrSTpLZtxrp/2w5sS
         XauLjNr/Ih1Er4ziCo5CpOtyFRMEBjPgaN6HBo73nuAQwSCE+H75IkXmGCkt8jHaSgpl
         /3jcmT3jqh917WXA/GaDQGcNwZXR+IIOaZLQ7kjd7CYbUkWfUEO0S/4eQCENU7Lp2TSD
         b65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950690; x=1738555490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HguH/5GHeVMnOVWR0BWd76PxkLkAFvISPM4MfQHocJ0=;
        b=qMdzv4ioqpU9c6cE14nC/iOQIYW3Od5DijUQmetgJelpr4qLdXQt0FZX2N90GqMIO2
         0iTFqxh0Qte+L9veH4sKjig2a135j3ubQJaduBGu/TkWKsdHE0HgE9ZJWt9xX18eJIDA
         5sMV7vHbLpAtvaiuviBjceAGimGg2xs4xfH3k0QXDAkL/0BgSz96089XxfAhJVNrG6pQ
         C7eiJTJEA1mAzCynS87LeqH2m7ccT4sPbyGzkHoW+yLN9NAUdgUb59X7ZOcNhbSKb31p
         XnDQrlNEv2F2eIXjbhO4BrqTU0U9QNgqLrt0TN2qBV97UxYthqxL7NXC4OaRLJJW0ipz
         ZGkw==
X-Forwarded-Encrypted: i=1; AJvYcCVNbnjAGs8/PQaj0Qu93qAShxOJF/FevQNell2NyCqrF8bp8ehpm52uvHVaPGEz6g5xBbZ+GHqLeDOoWtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzApNQxY7BMohaKlcKtJ9eZVGWQXi0jGR/OetMQ4mxoinnne6V7
	LpvaIB9ItKNRGkgSW913VOTcVBk1C0HQ9PB8jVk8tmeTeZmIGflYdfSNYw==
X-Gm-Gg: ASbGnct/nGgS7RvaXpINCZUGadY2RwRTEZMwLDUF1Mn4CixdXHrig+yn3oj0xuq2Rap
	EAEcXJpXsUxv2FYSnT/B0+dEtwvjBXNqYLK9JVPG62AU+tYToQ8Jl8Nnh559uEwEu6syseB/6zw
	Z4umtxu/COpgThTgO7zxb3UOHZn51FgfrfXyzo8WRNsDf12rj6DnfLYW2zhJvMigUS4a6Ogw04E
	tVuuN4cNPdMHtH75Jv6CFa56f3Y7aNotoiCM/ahjBAYikv12bIBPiGLypR042XsbMjci9G3mUln
	osX2ySLWLuj4Vs2k9mikrtQ=
X-Google-Smtp-Source: AGHT+IFCwL1lnWSIFQWSFb5gYcRgFQOhhIEn3uaZgn+V2gITJJHFR2g9sfbHz2fNLxrFEtoM93PUpw==
X-Received: by 2002:a05:6102:442b:b0:4b4:7cb0:ac58 with SMTP id ada2fe7eead31-4b690b80749mr35313150137.2.1737950690054;
        Sun, 26 Jan 2025 20:04:50 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:49 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Sun, 26 Jan 2025 23:04:06 -0500
Message-ID: <20250127040406.17112-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
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
index d0f0b3c7a915..4561720fdf2f 100644
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
@@ -16,6 +17,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.48.1

