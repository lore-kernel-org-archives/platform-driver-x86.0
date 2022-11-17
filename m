Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56A6C352AA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 11:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbiKQLGI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239632AbiKQLF6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122805CD3D
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 03:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2wK21gJAG/4mKvBEXMwV8j1V4YzDlCEtJh5SlTGAUsc=;
        b=d+4L/HX1Qs4gzflHdi9AN4jXgaRrwA8Ys80DXtwQMTDwUm+9iwuQ9ucj36sCmrjdk/J3jB
        y/tvOTWwvsqHPaQZFYqlaXV4Ll2H0yWrgPsksrfS17Reh3HhrstrCBYKA27AMsbCX9/0JF
        MNJii9/eSiAoNskZPl1dKR0cfub+TKM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-kHvVQS9LPqutqG7lM3beaw-1; Thu, 17 Nov 2022 06:03:03 -0500
X-MC-Unique: kHvVQS9LPqutqG7lM3beaw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F393F381A733;
        Thu, 17 Nov 2022 11:03:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C8E78492B04;
        Thu, 17 Nov 2022 11:02:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/6] platform/x86: ideapad-laptop: Stop writing VPCCMD_W_TOUCHPAD at probe time
Date:   Thu, 17 Nov 2022 12:02:43 +0100
Message-Id: <20221117110244.67811-6-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
References: <20221117110244.67811-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch
for ELAN0634") from Janary 2021 added a flag hiding the touchpad sysfs-attr
and disabling ideapad_sync_touchpad_state() because some devices
"do not use EC to switch touchpad".

At the same time this added a write(VPCCMD_W_TOUCHPAD, 1) call at probe
time on these same devices. This seems to be copied from the rfkill code
which does something similar when hw rfkill support is disabled.

But for the rfkill code this is known to be necessary on some models,
where as for the touchpad control no motiviation is given for doing this
and prior to this patch there were no reports of needing to do this.

So this seems unnecessary; and it is best to avoid poking the hardware
unnecessary to avoid unwanted side effects, so remove this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 9b36cfddd36f..fc3d47a75944 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1875,10 +1875,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (!priv->features.hw_rfkill_switch)
 		write_ec_cmd(priv->adev->handle, VPCCMD_W_RF, 1);
 
-	/* The same for Touchpad */
-	if (!priv->features.touchpad_ctrl_via_ec)
-		write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, 1);
-
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 		if (test_bit(ideapad_rfk_data[i].cfgbit, &priv->cfg))
 			ideapad_register_rfkill(priv, i);
-- 
2.38.1

