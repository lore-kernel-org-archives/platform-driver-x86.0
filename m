Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.83.148.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566713;
	b=gMi5Q9izCWasDiH2gZyVsEYcxXTQ2YwC0aQthNq8aNWcA6+dC63HEaO9ZivCRYmT7uiP
	 b3ssn1qDsLiWWSqlTtjSogdGxl1mAbXzlIPBNWKJKomr/U47Y5pjwPnbBgdMXj8u1xaKp
	 SoA9qWOvR/lFmt7BGjeFhXpWKbkQTrkza5wJeKFxxMZqR5lzrkBJFxdvZ7CseNQqu1PTB
	 9hbeqIXZyVHn38MoSkyz96BjcX65E+nZJwAByButiEWLImLBFTVjS49rCy6Lz/4LmeZzb
	 CF73CTSDMjrYI+SKvZpf4hZ3TInhoTLZAg8PEQpZMbql/bYKbRdcx7/K1n5InZ5bfAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566713;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZKej0lQ64EXBK9dOmJlCY+xq0rWDZVQKZAZVRfQVWrk=;
	b=LZ0jnUwvUN5vRl7F2arMOd1bk3QUJOKeYENNg3HRqdQnwt5XwZ6akBSAE/RU0flF9VfJ
	 FAkC+Q+y1ZGxTuJTKMbqw1XvOL5RDQlId72zMwRLl1IArktJDTxrmUS5ddVG7cf+cB+VX
	 xA/pUk1ulgCXKMO7z1iZ3fI8D/df4rSplJO6DAGJ5dhA6LlekN4q7JARZVYUpuPvJe6cN
	 NB3/sT3YRfJUqTuv7XODZOGQIJMcZrf463MWSKNoo+xrMtlY2IKxss/5XaGClBSCO3kWK
	 Ccbqz/JhsT5gTRc8DXuOdurKHCziC9c2Y4Ea7s4IrufOyVWevsR2YWMU1HJRrFqaWmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dPf7bKIG;
	arc=none smtp.remote-ip=35.83.148.184
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A03606A331;
	Fri, 13 Nov 2026 10:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A03606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dPf7bKIG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794566713; x=1826102713;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKej0lQ64EXBK9dOmJlCY+xq0rWDZVQKZAZVRfQVWrk=;
  b=dPf7bKIGpraIRjhp2Ksg4KktGjmOrTNtugt3AGBnQbriIi29eonUftzx
   C4xYNx8W7oU3FDJdXoRaDzvaJ5OH51O5X8UxQhDW0jFkNdNWO/z+SEzYR
   zr9L5Uo4WFXxY8PFRyYEB0Q07Yu3/V+JCVL/BnBzyN0FgOFSztsZTeOMq
   5o1ra+sbVKd9B2MU84fEQXPjMO0MXpc1RYQpG//bqTjmc2JiAkT3xu2Op
   1ipj29BF0JO4AVXjmP8lCu88vgOv8+1BSDhOdbyHolKQ4hNZLOkPLhiIf
   FSQDGnCBC+L2j8wuI8veWYjVLXLsxFQjL4x65oODpf9dAPHYetfT2PoQ0
   Q==;
X-CSE-ConnectionGUID: kKDNRPhmTNmqhkN5vGUcmA==
X-CSE-MsgGUID: NH5gEKMXS+yY60U7M4tM3g==
X-IronPort-AV: E=Sophos;i="6.27,211,1787011200"; 
   d="scan'208";a="33666140"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:45:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:26128]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id d63eb7d2-deee-4627-b101-59c0872195f7; Fri, 13 Nov 2026 10:45:05 +0000 (UTC)
X-Farcaster-Flow-ID: d63eb7d2-deee-4627-b101-59c0872195f7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 13 Nov 2026 10:45:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 13 Nov 2026
 10:45:02 +0000
From: Eliav Farber <farbere@amazon.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf
	<W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Eliav Farber <farbere@amazon.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<ukleinek@kernel.org>
Subject: [PATCH v6 5/7] platform/x86: uniwill-wmi: use devm_blocking_notifier_chain_register()
Date: Fri, 13 Nov 2026 10:44:53 +0000
Message-ID: <20261113104459.35839-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Replace the blocking_notifier_chain_register() +
devm_add_action_or_reset() pattern with a single call to
devm_blocking_notifier_chain_register(), removing the
devm_uniwill_wmi_unregister_notifier() callback.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
Changes in v6:
- Rebased onto v7.4-rc1. No functional change since v5.
- Armin Wolf's Reviewed-by retained; the code is unchanged since v4,
  when it was given.

devm_uniwill_wmi_register_notifier() is kept rather than having
uniwill-acpi.c call devm_blocking_notifier_chain_register() directly,
because uniwill_wmi_chain_head is static to uniwill-wmi.c and dropping
the wrapper would mean exposing it in uniwill-wmi.h. Discussed with Uwe
Kleine-Koenig on v4.

 drivers/platform/x86/uniwill/uniwill-wmi.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform/x86/uniwill/uniwill-wmi.c
index afcbfa4f7552..2ffa29a829ee 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.c
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -26,22 +26,11 @@
 
 static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
 
-static void devm_uniwill_wmi_unregister_notifier(void *data)
-{
-	struct notifier_block *nb = data;
-
-	blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
-}
-
 int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifier_block *nb)
 {
-	int ret;
-
-	ret = blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
-	if (ret < 0)
-		return ret;
-
-	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_notifier, nb);
+	return devm_blocking_notifier_chain_register(dev,
+						     &uniwill_wmi_chain_head,
+						     nb);
 }
 
 static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
-- 
2.47.3

