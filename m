Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770944;
	b=r6bSYvKnmzn39klfHRayncogRaScKNqDDVPpGV2FVQdN6hlREcolvUNDX72augWKIhmK
	 zSW9i4iOiJAFGh0mMPgPlxwxGM0ZD2PE+Mp7sW4dra6KDDq52WRO5IOvADnuTiZYvlseT
	 LzR8PzbY8JDiZ2Yrd17uBkgAnZLa+2/AKXtffWrL52eg6oYIOZeQ8zu3NOz1pOVdMSmSm
	 fqv7DOi2n7MwN+zhCcxpnhLsvPlmUy4ibSjKzT3TbKsh9EincTuMSEyzob4nkyNiOqMME
	 Jbx9ZKHAU2CvB0NvblI7PWfCLdGsVEM+Wf6KePwmZuNOjEU/m7maD0Yfb7HhD3DAaKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770944;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=HCydoFSy4uRsBSSBmIlNuwbs68UlGGg2q7yzkJR/7ZA=;
	b=iMg1Xm7ro4/PosljOa4OljYcmWSWDLIYGJ2AUUV1RSctPjPiFRzP2PC9pPu55lpOI1fC
	 fkLWdEtEfEZQUyg5Z3/R5t331DgzDyV51TskMuE5WFfM/bE4nj6GlOTUWOExtxPqUOhXp
	 za+rqkwnq0FQvXWDBcJthSKnE4/z+nzcJ5B22xyoOR+h+tKctX1/U/VztihAv/hD4CKbV
	 xE2RdAgBlRE7JHSkBjz+h6+rSUE9dHZSIdxQQluXQ5YqEdMO9+U0EEDbGlj0IMiaR1/13
	 tWImQ0k1GMelOJ4+3TEx4Sak+uS/rH8XDQFb7JgKf+ahWV0F2MaSplQdf9/CXIbaMpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZO1YZ8KS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FC8606A339;
	Sun, 15 Nov 2026 19:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FC8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZO1YZ8KS
ARC-Seal: i=1; a=rsa-sha256; t=1794770893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BeKgU54R7b9vRQj40h28bRRXH125+5JEMS1MqmkBZ9sVZ+VIuObOCSuDxuF9yPj7QfX37m2fS6dxrzhXvwUmKlLuhcmz8Tz2JSVF1abexflCVeVKfm094WDjyotkIBXRQI9ywcHfNuVolpaBU2CrkYKngmiwUOgw2YzS0hOV3gI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794770893; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HCydoFSy4uRsBSSBmIlNuwbs68UlGGg2q7yzkJR/7ZA=; 
	b=FmY93b0WaeFAEKYIE0VqJAW+2ilEcvhuDvAd1ShyrWZcu5vzAfqSo4Z3i39NfGXg0tOEZ6BJvG06km8fBt0IAlX80vSP/u/G3PYhySh2Mrqhp/puraQj/Vx8ysetXM5aP19xiEGuzqOf1r95ojASn+4m32Y++76Do68FYKERGZQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZO1YZ8KSBNjajDpKc8DLURPB8zeottOoISPnuvYPdPDgvLROg1JgvXbu2Bp7NN0XiHgQUz6XYVbsK7T0UHq69idl0jAqvL3Ep8xcHj7/rP62cWXLtO1ElEzP/OBLAFtE6Ta9ft0s9Lm1b6RKkC9KZ21ASzGvOiRUJgbuGLcnoiP8LfLYulGeYnRB03kKOBsPYdlxB8gRc0mh2yvdS/3vFyhHSG8bI+4V9kGWlpd3njcOcaTYLgi5B5GOlxG3Kr2NhJVXOyM3QgzIkiRuyrO4VxOrTGDxDz8nRhfz8YMaQrHDxGW+21xLc0fotz07EgqAnpe/aG9k9cw57wukc4Ag5A==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=HCydoFSy4uRsBSSBmIlNuwbs68UlGGg2q7yzkJR/7ZA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794770891527564.4829158503505;
	Sun, 15 Nov 2026 11:28:11 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Mon, 16 Nov 2026 03:27:06 +0800
Subject: [PATCH 5/7] platform/x86: lenovo-ymc: Refresh posture on resume
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
Message-Id: <20261116-ymc-82yl-v1-5-fac1a2b01a84@rong.moe>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
In-Reply-To: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

When the device's posture is changed during suspend, the software
posture may become out of sync after resume.

Add a resume callback refreshing the posture and poke ideapad-laptop to
trigger the EC.

Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Closes: https://msgid.link/CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com
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

