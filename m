Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FB6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Oct 2021 18:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 619E360F4C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Oct 2021 18:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbhJ3Sbe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Oct 2021 14:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56150 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232008AbhJ3SbX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Oct 2021 14:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635618532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/bfr/J+hsxQ0Z01UTG2JJSH9Wj47Az2V8snWyLCXfIg=;
        b=HK6z/7Zk6jKjBSFi3DhxhCaxfDRW6gChR77EjlOego3Uoi3VtiLayWwRkB6Lsd9Jni5vBm
        yB8ox5yrIwizv0vs6x61uTA/OMrWz3vdII0PTGk+2uXcbTgw3XQ3XeEMhcRBA0LGYiTbzi
        qMvpI1VFrJZpGfarw8H6YZ7YfY56DBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506--IRfLJ7hO1a66JEzzKlLJg-1; Sat, 30 Oct 2021 14:28:47 -0400
X-MC-Unique: -IRfLJ7hO1a66JEzzKlLJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579D710A8E07;
        Sat, 30 Oct 2021 18:28:45 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 896A55F4E1;
        Sat, 30 Oct 2021 18:28:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org
Subject: [PATCH 09/13] power: supply: bq25890: Add bq25890_set_otg_cfg() helper
Date:   Sat, 30 Oct 2021 20:28:09 +0200
Message-Id: <20211030182813.116672-10-hdegoede@redhat.com>
In-Reply-To: <20211030182813.116672-1-hdegoede@redhat.com>
References: <20211030182813.116672-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a bq25890_set_otg_cfg() helper function, this is a preparation
patch for adding regulator support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/bq25890_charger.c | 28 ++++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index 163ca5d761aa..7504e30f1e4d 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -773,6 +773,17 @@ static int bq25890_power_supply_init(struct bq25890_device *bq)
 	return PTR_ERR_OR_ZERO(bq->charger);
 }
 
+static int bq25890_set_otg_cfg(struct bq25890_device *bq, u8 val)
+{
+	int ret;
+
+	ret = bq25890_field_write(bq, F_OTG_CFG, val);
+	if (ret < 0)
+		dev_err(bq->dev, "Error switching to boost/charger mode: %d\n", ret);
+
+	return ret;
+}
+
 static void bq25890_usb_work(struct work_struct *data)
 {
 	int ret;
@@ -782,25 +793,16 @@ static void bq25890_usb_work(struct work_struct *data)
 	switch (bq->usb_event) {
 	case USB_EVENT_ID:
 		/* Enable boost mode */
-		ret = bq25890_field_write(bq, F_OTG_CFG, 1);
-		if (ret < 0)
-			goto error;
+		bq25890_set_otg_cfg(bq, 1);
 		break;
 
 	case USB_EVENT_NONE:
 		/* Disable boost mode */
-		ret = bq25890_field_write(bq, F_OTG_CFG, 0);
-		if (ret < 0)
-			goto error;
-
-		power_supply_changed(bq->charger);
+		ret = bq25890_set_otg_cfg(bq, 0);
+		if (ret == 0)
+			power_supply_changed(bq->charger);
 		break;
 	}
-
-	return;
-
-error:
-	dev_err(bq->dev, "Error switching to boost/charger mode.\n");
 }
 
 static int bq25890_usb_notifier(struct notifier_block *nb, unsigned long val,
-- 
2.31.1

