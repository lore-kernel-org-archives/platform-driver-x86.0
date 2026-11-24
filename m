Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544386;
	b=rF9MaTemEuZ/knX3PjJI2oNfYYpCLzOXJuX6ZNLXEy2QChBSU2QkgP2T7sXV7rSPRi4h
	 b3uXUP3gbQh+DFVUv+g7h/oYTcHyZTzQuTlNAOs1TI6n0/GNbfgWUnahgdmaQfXhXzzht
	 aTVZxD+eQdkuleL0Kzj6LDwmdY4A83yY6u/GVzTo5DNzNU5M0cC/gSx2dKYInJGyGfeeu
	 3lKaw0AO3vEOYr9gt9PSi9l+uwiMN9wG5OlRZ7ixs/V4Y8AgV74ZPOLH9VYm5AgxPGxbS
	 xQqKPlkQDLK2ts/5ir4aEHUFpYme+W8Aw2m5fGm41dbFp09EDE4LHJ/4jJgFxAeVA0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544386;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=0CFwRkc7fD2jpDw8kPdd9uyzkG3LdOvAaySDOx0LxLM=;
	b=OehWGkU9iod3+jmAyvJqars02n810jrybJLlwh0IUW/qJlyhparxvQagwPLZoOd3ui4r
	 slYNcGsyqFIXmxrL0SRTefB+XOPsUP3zg540BlCN1L2H70atAzxZ4j106bnF9maqOwBtX
	 8W758qV7ic72O90BY2MvnuMrX+YYbdZE5E781hSB4vGiyeSJj13gDpxkA+J6S4uQJ2tfg
	 3+LKM5LoIe94c900Xlm6KZtVa0lxnpm6BglYKH8VNXPBQqVbbCPvfLKAxrFBVs0ZsTbqq
	 nL/QO+JupnD05EyK9jlnEkdxxNUl3A5b5yNIA2GU0x95ikiF5WvJbGB1VGHPS6pGbXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=M2i7jdDQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44915606A69C;
	Tue, 24 Nov 2026 18:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44915606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=M2i7jdDQ
ARC-Seal: i=1; a=rsa-sha256; t=1795544281; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PpaHgY46gBH4qcNI8PeqHu4EYeMkcgVRcpnJe9MA1DqIuxLgIEGE+WT9cwUpGjQw0TwMC+n4qKEJdBtDwRXv2bGFyBO/SkWvjSsv6ZwlTVAT5Jji8E6SVrtujMzi1zHzzb2V47E0NrmQpURX2rnPFCvtJ3Ng660xUVRCgJX0SkY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795544281; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0CFwRkc7fD2jpDw8kPdd9uyzkG3LdOvAaySDOx0LxLM=; 
	b=B9AUlWPG60fNnEQPUd6DsoLoMxfigI7/IpxB56tiAIKjkBfUEuw+pskiHMqBFMJChXCQuVWheuSJNEAHn3CTfP0OET34b4bVwo5iRCeK3g4gCkItoGVr5tX/YWTWT1vCqKd7Ut6oAR7b755bHQ91bTerPWdzUMGyqDbnxP65P9A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=M2i7jdDQIyzPtkcjXwYWyPG+ZYbbYy65mrs77bfqJVI5J7XOehKwUkFplUM33qBQ5tmWFC+kUX5lS+c/HRSoM20li1wXVRDAGR1mnkKyqkkbio8GIRO7MBaimwBNwyUEcxecnvZ1oKtottRE8Jd9IeHKKnT+qSj9HG4AobA7k9OUitKFDsj6Vzi34RrAJlSQt60tDE4RJSFYQKwUBGAMkEyPiAs8bA9WR5DUef5pdVauhclQnQxXoeCd3Nu+HeHjKdDyb/vDKYn14UroQGQ0ftRTwZsi3aQbVROhm2JMExbyoBVJBOvlGiZWCDcXhHJ0ElIFQYBoKKvMzAFlQkmQYQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=0CFwRkc7fD2jpDw8kPdd9uyzkG3LdOvAaySDOx0LxLM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795544279714605.8739311643643;
	Tue, 24 Nov 2026 10:17:59 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:17:01 +0800
Subject: [PATCH v2 5/7] platform/x86: lenovo-ymc: Refresh posture on resume
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-ymc-82yl-v2-5-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
In-Reply-To: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

When the device's posture is changed during suspend, the software
posture may become out of sync after resume.

Add a resume callback refreshing the posture and poke ideapad-laptop to
trigger the EC.

Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Closes: https://msgid.link/CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ymc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
index cb3ae49dfd9e..b2bb8ad9de0c 100644
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -17,6 +17,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/pm.h>
 #include <linux/wmi.h>
 #include "ideapad-laptop.h"
 #include "wmi-events.h"
@@ -118,6 +119,16 @@ static int lenovo_ymc_notify(struct notifier_block *nb, unsigned long action, vo
 	}
 }
 
+static int lenovo_ymc_resume(struct device *dev)
+{
+	struct lenovo_ymc_private *priv = dev_get_drvdata(dev);
+
+	lenovo_ymc_refresh(priv, YMC_POSTURE_UNKNOWN);
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(lenovo_ymc_pm_ops, NULL, lenovo_ymc_resume);
+
 static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 {
 	struct lenovo_ymc_private *priv;
@@ -189,6 +200,7 @@ MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
 static struct wmi_driver lenovo_ymc_driver = {
 	.driver = {
 		.name = "lenovo-ymc",
+		.pm = pm_sleep_ptr(&lenovo_ymc_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = lenovo_ymc_wmi_id_table,

-- 
2.55.0

