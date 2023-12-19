Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B43495D6
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2023 22:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z3K32+Q4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5e74c97832aso26171557b3.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2023 14:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703023854; x=1703628654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sQxNnKdSXwOL5IMJGumA1BEt1SHUOhLAZ/hzj8gvEK0=;
        b=z3K32+Q4Txlz5l4lLUzs4KGTgD5UmRIILLcLHDqt749umvbCTHY67iZSA+BWl+hpMg
         EFmYaT30uK+UwfwOSY6ipNikG7//7zsUiYqNJc1qXRs/nWJQQOYEesqjbHIDXNxLgT8p
         LqutYpdlqqaGYrinFcx9NILBfViECxwzibXCWhBVoqnOduHWFOb32T6WYlVvBLggVFsF
         PBR7hnXH+qCtLoXM8HhK6fYMcAwfEsX/I3qhY2nOxp8uwdRn9OgwDyXZJ13mNG+5AjVO
         FtfFd8kPrJzN1BTirCZabKwHQKrkhFLn8s+b9dpyvmXsSTSIVqwxnO5471BTp1OD6KZa
         7WGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703023854; x=1703628654;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQxNnKdSXwOL5IMJGumA1BEt1SHUOhLAZ/hzj8gvEK0=;
        b=p4k3iulzAQhzmkeNsFvwvPbe7Xub4YpnJQO6yh0nzF9Q3imnGkx/EOsbijJbNCPM6v
         3gqnT9+doKX8fAfniw6WbBceBcMZQwPoeS3FMuQvduuUTmUTkMxFhkjsZPNAfW9dq9xJ
         kvy6GBOHdetAvgERGUNTnGmjgzmnmQN8TM0YH4wQrNqjClgRwzjPegK1YXsRu8DKdVdZ
         IShZORoZr6W99EpEytsPbHP+edUZ7lG7eSp5ntR9ubP4d7oa4jvcLvrmvyfgW+aDYvfA
         xW9vfsVDrj7CWqrgZmvYhmik4NnS4+HDSGPL2aVG4F5T8RjTJSKx1lWnwnGiigEtvsF+
         B30g==
X-Gm-Message-State: AOJu0YyK46Ou0xAr03lv9TdvFNkAFtw4zcYzCRCF/v9tEgdPB6iUJvaI
	0U5whUAuyj3CphTmRb0t8T3lgcSp86p1
X-Google-Smtp-Source: AGHT+IFaGA1Y2qt6NgdV9Wn+S4vHzNtkJMoyFgL97CFByINQVwqjqrubRBfF/7zCHGlE8rfNnpqxeLOzIA9h
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:6902:1370:b0:dbd:4b4a:c089 with SMTP
 id bt16-20020a056902137000b00dbd4b4ac089mr78671ybb.8.1703023854045; Tue, 19
 Dec 2023 14:10:54 -0800 (PST)
Date: Tue, 19 Dec 2023 22:10:52 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOsUgmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0NL3YwC3YLE4uLy/KIUXUNLAzOLlGQTY4skUyWgjoKi1LTMCrBp0bG 1tQDiiT2KXQAAAA==
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023852; l=959;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=O5BAEiqymBRAjtGh0Tq6iAc19mxMi65Q73EvL1l5u4s=; b=SrLES+OSwqU4gyzseeTz+V/3rmlo4M6xdkCeOnNigzHj9VcQxImpTQVm6ysvp+HINOXk9Pi9w
 lVVsl0vOPtBA9U7eLAc4KfB9bevZsqw1A2xvk0jMvQR/7aX7vIDrPic
X-Mailer: b4 0.12.4
Message-ID: <20231219-hp-password-v1-1-052fe7b6b7f1@google.com>
Subject: [PATCH] platform/x86: hp-bioscfg: Removed needless asm-generic
From: Tanzir Hasan <tanzirh@google.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	"=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

asm-generic/posix-types.h is obtained through bioscfg.h so there is no
need to include it. It is also an asm-generic file which should be
avoided if possible.

Suggest-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 03d0188804ba..f7efe217a4bb 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -7,7 +7,6 @@
  */
 
 #include "bioscfg.h"
-#include <asm-generic/posix_types.h>
 
 GET_INSTANCE_ID(password);
 /*

---
base-commit: 3fb7c66ac51a87984e043d9f47b7a509e3f53906
change-id: 20231219-hp-password-19068dc438b5

Best regards,
-- 
Tanzir Hasan <tanzirh@google.com>

