Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566550;
	b=uOkxozwAuW3ac579dImABc2q8yMZZ9PnGPugIgpXATbGH3Fi6O8/HMzMd0BLKvUVz6Lt
	 +D7HoVv+rc906srnWPziSgs3p+bBXnysbDnPFDFgOqe2OLvlbu3iTrVwQCQTk1HxAzYqf
	 Q444R2d/HcIlQkKhI3bqTJkwUgg4qBDrSB74dz3VFwcykayC0O0XAtokQ1UOkBNsi9XKX
	 2+LWNN/aNxEJ16z/jC8Rz1f++GvUvPbXLyzOXVxRhgtv03kkBKF/v9LybdBHIqGBrvcND
	 Q/EHzSwKhr1JeBo9JFb1yJzbhG2kN99FAzxOB0uOvchCK0cLQF48mTPxHja7/Z+T6Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZMTXu6HDl3Fb62Z/q0r2kzYAYjUlfyxzgm/lDuL7ZSU=;
	b=mvQ2ZrzY7Jt1fNl5nfn0YzL6vHSu/9K9I2Lkn+1VV3bkgI4OSfq+BBipTffkGhPEgbYu
	 0SuzBzKilcievZDgLPecQgnTs+DAOZs5RzduI8Q0PuluG64vpPrGMqz40G5P9QwuwL4K+
	 1+FI88WJ7V4rw0fuNio9St0WugaLnDE8WOHwFyDYzo9glfc1zCwDpn1QFus3xqTcLreIc
	 LpIOL0eR8Dwrh7LN1eIUf9EfGRGehKXT7qb2J31j5xtC7WXpZmsm1qoOfyJrfCYevq4vF
	 BnboAfhIBvA0yNvScTtYmnn2gcnWTGYF4MYxGuf5Bok+nvEvpiy2fnNgUM8GzoBa4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Puqpcefi;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD62606A33B;
	Fri, 13 Nov 2026 10:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD62606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Puqpcefi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794566550; x=1826102550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZMTXu6HDl3Fb62Z/q0r2kzYAYjUlfyxzgm/lDuL7ZSU=;
  b=Puqpcefi2Sai574lj9JlBP7kS5B8W8juf7Hzo/+yZVSsyVZ8ZZPapUg9
   JGen2hIDcu2HICXGXBt8ihse7Ticsx8yy/bs+ub0G35f7YfOv6XIVmONU
   HUON70AQOI2YqcLLVjK3RXL1QIvSLsMiWaR0HQ+loYg9n93PZsEHBojFO
   kP1g8weTsB7m33DtCJTyQzsMtmA4FHsKaPU8s/AOHRS2odm7UJR2qYyGL
   R4B8lHGiHKypLCaofqG0CKps6HQa86bUupJ1dD6neqZsCUm7l8TbKxRXI
   5JuV7ro8Czr8W2VccuUwQdsca6q5hoSxxyN9shF+syQVVFT54Dm8sog4s
   Q==;
X-CSE-ConnectionGUID: rlpe6r+TTKSGyN+AxvFOuQ==
X-CSE-MsgGUID: /I1RmI7KShynRBeaDiz/cg==
X-IronPort-AV: E=Sophos;i="6.27,211,1787011200"; 
   d="scan'208";a="33648530"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:42:29 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:6540]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id 7e153d36-4ce3-4f6e-9249-faa344c10071; Fri, 13 Nov 2026 10:42:28 +0000 (UTC)
X-Farcaster-Flow-ID: 7e153d36-4ce3-4f6e-9249-faa344c10071
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 13 Nov 2026 10:42:28 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 13 Nov 2026
 10:42:26 +0000
From: Eliav Farber <farbere@amazon.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf
	<W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Eliav Farber <farbere@amazon.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/7] platform/x86: bitland-mifs-wmi: use devm_blocking_notifier_chain_register()
Date: Fri, 13 Nov 2026 10:42:03 +0000
Message-ID: <20261113104218.32566-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113104218.32566-1-farbere@amazon.com>
References: <20261113104218.32566-1-farbere@amazon.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Replace the blocking_notifier_chain_register() +
devm_add_action_or_reset() pattern with a single call to
devm_blocking_notifier_chain_register(), removing the
bitland_notifier_unregister() callback.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v6:
- Rebased onto v7.4-rc1. No functional change since v5.

 drivers/platform/x86/bitland-mifs-wmi.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 6dd901e54d9d..617c369c63c5 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -621,13 +621,6 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_END, 0 }
 };
 
-static void bitland_notifier_unregister(void *data)
-{
-	struct notifier_block *nb = data;
-
-	blocking_notifier_chain_unregister(&bitland_notifier_list, nb);
-}
-
 static int bitland_notifier_callback(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
@@ -727,13 +720,9 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return ret;
 
 	drv_data->notifier.notifier_call = bitland_notifier_callback;
-	ret = blocking_notifier_chain_register(&bitland_notifier_list, &drv_data->notifier);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(&wdev->dev,
-				       bitland_notifier_unregister,
-				       &drv_data->notifier);
+	return devm_blocking_notifier_chain_register(&wdev->dev,
+						     &bitland_notifier_list,
+						     &drv_data->notifier);
 }
 
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
-- 
2.47.3

