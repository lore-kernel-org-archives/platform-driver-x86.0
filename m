Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B43FB2C
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318985; cv=none; b=lPFNk33mqiFsoPYAvXdE0eLSCnm1l4iL/3IPY1TeJXSdovYG31KauIfxJ3SlT9xiMFBNi/MetGxf+3CbsNSqvvOGhB23U1jW3GO3MK/3F7ruJVknDlEcbb7jsvRk0rjlDVtbToEZ4wqTagqr+gE3tM3Z8W4BO0FjexAUixIdqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318985; c=relaxed/simple;
	bh=A6dVcyj3TpXvLRLkS0fzqxH5DLBjNaIzUh/UVu5B6N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i85Vapl6bmJmmiHpQxSxGlUKGsFQ2BYsd7oq8PWrKADwXLauKsTDtE4OPhQHgUiI2kOAchnUpN533n+oy5+VQEtLykbzCoemwosX0lgDs+ao0cdLT1pD4nEamNYEWZrOiuXLMZCEVTvOengczFAcVqheAtvHo6EYYm31hzKXYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e519696a-20be-11ef-8d47-005056bd6ce9;
	Sun, 02 Jun 2024 12:02:53 +0300 (EEST)
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
Subject: [PATCH v1 5/7] platform/x86: think-lmi: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:58 +0300
Message-ID: <20240602090244.1666360-6-andy.shevchenko@gmail.com>
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
 drivers/platform/x86/think-lmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0f2264bb7577..4cfb53206cb8 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1508,7 +1508,7 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
 	if (!new_pwd)
 		return NULL;
 
-	strscpy(new_pwd->kbdlang, "us", TLMI_LANG_MAXLEN);
+	strscpy(new_pwd->kbdlang, "us");
 	new_pwd->encoding = TLMI_ENCODING_ASCII;
 	new_pwd->pwd_type = pwd_type;
 	new_pwd->role = pwd_role;
@@ -1582,7 +1582,7 @@ static int tlmi_analyze(void)
 			goto fail_clear_attr;
 		}
 		setting->index = i;
-		strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
+		strscpy(setting->display_name, item);
 		/* If BIOS selections supported, load those */
 		if (tlmi_priv.can_get_bios_selections) {
 			ret = tlmi_get_bios_selections(setting->display_name,
-- 
2.45.1

