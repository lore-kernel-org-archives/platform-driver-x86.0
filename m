Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42CDC47080
	for <platform-driver-x86@archiver.kernel.org>; Sun, 23 May 2021 17:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D40160FDC
	for <platform-driver-x86@archiver.kernel.org>; Sun, 23 May 2021 17:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhEWRZG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 23 May 2021 13:25:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51713 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231893AbhEWRZF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 May 2021 13:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621790618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=rPjSseOXT6wXtxewkQAgBMGC0GfkrBbGtzBL6bUaoqw=;
        b=f+1vMGELBY9WOfJho4WB7dfYt5ORgoKkKeEUhaRkHGHuyw3+ny2SEeiIw4oVUFRekWmY0+
        b1qsI/gBd8MqoXJt81Kk63lNZDNVqNfWIyLFsGYRHP/ycWOznmsSRH/K7O5S4foKVrBD8P
        nHHmPsE+A33A6qy38iNbsHUxGkMz/5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-B1I5jSk_MNWqE4k6a_TBog-1; Sun, 23 May 2021 13:23:35 -0400
X-MC-Unique: B1I5jSk_MNWqE4k6a_TBog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5685801B14;
        Sun, 23 May 2021 17:23:34 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-61.ams2.redhat.com [10.36.112.61])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B7685D767;
        Sun, 23 May 2021 17:23:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Ignore VPC event bit 10
Date:   Sun, 23 May 2021 19:23:31 +0200
Message-Id: <20210523172331.177834-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

VPC event bit 10 gets set on a Yoga 300-11IBR when the EC believes that the
device has changed between laptop/tent/stand/tablet mode.

The EC relies on getting angle info from 2 accelerometers through a special
windows service calling a DSM on the DUAL250E ACPI-device. Linux does not
do this, making the laptop/tent/stand/tablet mode info unreliable.

Ignore VPC event bit 10 to avoid the warnings triggered by the default case
in ideapad_acpi_notify().

Note that the plan for Linux is to have iio-sensor-proxy read the 2
accelerometers and have it provide info about which mode 360° hinges
2-in-1s to the rest of userspace:
https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/issues/216

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 387817290921..784326bd72f0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1408,6 +1408,18 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 		case 6:
 			ideapad_input_report(priv, bit);
 			break;
+		case 10:
+			/*
+			 * This event gets send on a Yoga 300-11IBR when the EC
+			 * believes that the device has changed between laptop/
+			 * tent/stand/tablet mode. The EC relies on getting
+			 * angle info from 2 accelerometers through a special
+			 * windows service calling a DSM on the DUAL250E ACPI-
+			 * device. Linux does not do this, making the laptop/
+			 * tent/stand/tablet mode info unreliable, so we simply
+			 * ignore these events.
+			 */
+			break;
 		case 9:
 			ideapad_sync_rfk_state(priv);
 			break;
-- 
2.31.1

