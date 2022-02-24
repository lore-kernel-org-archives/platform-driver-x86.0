Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EF5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 10:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiBXKTg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 05:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233175AbiBXKTf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 05:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E640279902
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645697943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qIHt3UUOpUTPxHsnrxT3/QQXdz/aFaiDCTEEKs6Y6zQ=;
        b=AI0E38mH3P7S5BIvd55BKV51aupCK0nkVL54G1KHWi4doszMu5N05HEIMpZrLtNgXNiLGb
        XzOZFAzCifD5Si0mgSc4V17IpYsBx02oqkZWNCfGuoB88oQIlL2YCdrKJGfgHgBHmv68SN
        CN+Olx+HqDCNjacfik3QqTrV6DvzNIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-kuV5tpaaNha1xc7lUm2XfA-1; Thu, 24 Feb 2022 05:19:02 -0500
X-MC-Unique: kuV5tpaaNha1xc7lUm2XfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8DA2FC80;
        Thu, 24 Feb 2022 10:19:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.207])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 77B0A78200;
        Thu, 24 Feb 2022 10:18:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] surface: surface3_power: Fix battery readings on batteries with a serial no
Date:   Thu, 24 Feb 2022 11:18:48 +0100
Message-Id: <20220224101848.7219-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The battery on the 2nd hand Surface 3 which I recently bought appears to
not have a serial no programmed in. This results in any I2C reads from
the registers containing the serial no failing with an I2C NACK.

This was causing mshw0011_bix() to fail causing the battery readings to
not work at all.

Ignore EREMOTEIO (I2C NACK) errors when retrieving the serial no and
continue with an empty serial no to fix this.

Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/surface/surface3_power.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
index abac3eec565e..b283bc9bb5fd 100644
--- a/drivers/platform/surface/surface3_power.c
+++ b/drivers/platform/surface/surface3_power.c
@@ -232,14 +232,21 @@ static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
 	}
 	bix->last_full_charg_capacity = ret;
 
-	/* get serial number */
+	/*
+	 * get serial number, on some devices (with unofficial replacement
+	 * battery?) reading any of the serial no range addresses gets nacked
+	 * in this case just leave the serial no empty.
+	 */
 	ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
 					    sizeof(buf), buf);
-	if (ret != sizeof(buf)) {
+	if (ret == -EREMOTEIO) {
+		/* no serial number available */
+	} else if (ret != sizeof(buf)) {
 		dev_err(&client->dev, "Error reading serial no: %d\n", ret);
 		return ret;
+	} else {
+		snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
 	}
-	snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
 
 	/* get cycle count */
 	ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
-- 
2.35.1

