Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630228;
	b=dsyYAbD1JMvVALKi3ISZcwGp3bSEjXN6ecahHXff6i2glzq+c1iKJRtX7S1How7xkQHY
	 yNbCyoqguPLl2RqPWzj6WfYjHue/Hl41cq+FtRQva5lxKfhA316jxKcs73ZYCCPzO1qTO
	 GUJOhtSZG2tEIgjelTmlvBXUQxNZ29ZUAZ5Zp6kmJxYl/Gres03Kb5A1OYZ2rKBgo+rl+
	 76mTAHERhcB+N4RMSj7UUIKmZSe26jKL890rm4Ae7Qkqtq9Ha9FmnITiUJqLCe44hVHeF
	 sbfJlyo6xlVTg9fh+uvw/3USZH/Ti/XBr5HnLadkvscI02BsSuBFziJr8Uii8EwQ6AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630228;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=20wZpdy+jF9gpBwqNyXb/kyS28XM9wK/dHyZKNxLEmE=;
	b=B9Wix38y19aGshw56onu4m/jlSsGX3RoHgIDr5nf3MOdirDa1/gT4Kx4D0tvJ6BBl1hQ
	 Tfy3Uc8DacbRSIjZZyRLPdMIvIT2WRC80qbpmxr2wkK+yZQaZCzkEyQDbcBIPp9N33H93
	 ytb7z0SvTYv2Z83l/R3DqD/HqojmKhwtrwn1PUqk7RBQX30dzvg9PRDGBILraC6a2B79a
	 37whlkeSY55gGBSVxS6U/naSkyRnxbLWZmlw9VXuYJtBquZiMvVkQ5qKi2P1IbxJ8+fA3
	 9EvTPOU/XkYw1rv2XIwLuHWQifP6BRagY4cL6iRIkfQc8sebzjNDC9CRSaJLRLU1+kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=XQdKN74C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE6606A31E;
	Wed, 25 Nov 2026 18:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=XQdKN74C
ARC-Seal: i=1; a=rsa-sha256; t=1795630139; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hp4hGLZvJOFpAWoslAWwDNXZyVqF8UOX7YCebmDl685O/fmUDer6etQU3vUebNAsL3NIWd8O7DkioXdGsmvmxjYAQdA8T0xz2QTIvsGub+MvrZoMVsJeL93gTkg1IbcqKOtIEfieNuRz3e5E9IpKJCSVMZ2XfsT4KO2knR9DhTo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795630139; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=20wZpdy+jF9gpBwqNyXb/kyS28XM9wK/dHyZKNxLEmE=; 
	b=X2BeBAT02V5X0YM/PmmbOWttx0S/3DOUvAQyepM5Mr3sm/aNcC2pycFuj9Z/PZdCnmHYyHAHW7eTgZ81yMaky9Wk3m+qsYIKQl8UUA8q8PU7mtUuE2i+PuCZkOGruUQwErAgBLvv35bBIA/S0GkdLUZYWHKUrGzgQhVZbk+EDoM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=XQdKN74C8QTfHCtWsiwqIFeeqfqiSWQHQcSk7/yNXQJbdAhnjnNW7w1vKLwGzKT59o0Z8k3aiGRCYdfbUJkakIYbuZNZZh48qQXsoYXoA7/8SMnb95kS6/dZTsIn0HEzv2WOFh9y959JtwnrBsagnpMcoHdjLMT4kjV9Zd42FrzMq2T/rCb4tJNoctkBUaUSFod3rwgY3CzpBKGkPRhVFGnk0WE7C8nNwU5wpNQfjGSf2SdZPoc2z/TCWGZ+FN/A2eaCYAtLuUq5dlu2JBVrvFBKr8wQ/hiQDM9FUp5lF3eyOgM8tQHX5BybREkm15sCtVy0uKoU7cV8X2bK60UnyA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=20wZpdy+jF9gpBwqNyXb/kyS28XM9wK/dHyZKNxLEmE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795630137716804.0860999527707;
	Wed, 25 Nov 2026 10:08:57 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 26 Nov 2026 02:08:23 +0800
Subject: [PATCH v3 5/8] platform/x86: lenovo-ymc: Refresh posture on resume
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
Message-Id: <20261126-ymc-82yl-v3-5-e30842671ec3@rong.moe>
References: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
In-Reply-To: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
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
Tested-by: Eduard Aliman <edialiman20@gmail.com>
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

