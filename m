Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68CC3AC1F
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318980; cv=none; b=I0IiVR1dMF4LV16OoCe0nE8bwirCFX0fWsMkP+miTAybjAyvLc1Oa/vZ4MvunCElKZp9n8okGclyZHcgrdiMfO8qg4H7N3iWKBXaGPEG9esjoSv9YHrLMwHoHcZrlK/6yDQrwh3EXPgCE9ajaonOHZhIIDg61ol+ChKEy6Xtsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318980; c=relaxed/simple;
	bh=kjAyPZMiSO/QOUSk3fdxY5FJ/AeIhJLqhUfXYyQ05PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6Uc9p5QFrfP0f2jhkPhuK+zDF2gdFewkrsRw96jZFAWBA//S+XKalazSZX1LrUJfHquCseoGh2EsFhpD/KSo2Y6vmWGzSC+0yHYx2i1fOVKDLRINKueGnxLJqt4++31CrpI8YpDUjrzK4LRuL+5wunAF8mHrMvV7xJtge9j+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e5f4102e-20be-11ef-8d47-005056bd6ce9;
	Sun, 02 Jun 2024 12:02:54 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Li Zetao <lizetao1@huawei.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Mark Pearson <markpearson@lenovo.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v1 7/7] platform/x86: touchscreen_dmi: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:58:00 +0300
Message-ID: <20240602090244.1666360-8-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 2-argument strscpy(), which is not only shorter but also provides
an additional check that destination buffer is an array.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 2d9ca2292ea1..879a63e4ecd0 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1907,7 +1907,7 @@ static int __init ts_parse_props(char *str)
 	u32 u32val;
 	int i, ret;
 
-	strscpy(orig_str, str, sizeof(orig_str));
+	strscpy(orig_str, str);
 
 	/*
 	 * str is part of the static_command_line from init/main.c and poking
-- 
2.45.1

