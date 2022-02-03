Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DD2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 10:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbiBCKdP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 05:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56931 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230227AbiBCKdO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 05:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643884394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LseT0Vt6E0K1kNheTnIs5eam15SsxtUDjvPXR9oEMVI=;
        b=YVtU0rLx7eSh0AQwnYJfhwvnteyr5KvpKPJInpj3eCsA7CL8asxO7snrjq+uSc2wKZ0PLW
        LosQhe5oj527Dz7/o9sIU/rLyuwz1mHZDomS89aovt6I4oM3qMSAX1GM+nToJGt7TARd0Q
        cwUda5gE7r9+pLgUx/Rj+y7BSOlE4Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-GuagzSSxOKmbJFJ4WBXIfg-1; Thu, 03 Feb 2022 05:33:11 -0500
X-MC-Unique: GuagzSSxOKmbJFJ4WBXIfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B91039396;
        Thu,  3 Feb 2022 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.196.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 43BDC108B8;
        Thu,  3 Feb 2022 10:33:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        David Dreschner <david@dreschner.net>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add dual-fan quirk for T15g (2nd gen)
Date:   Thu,  3 Feb 2022 11:33:02 +0100
Message-Id: <20220203103302.49401-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The ThinkPad T15g Gen 2 has 2 fan, add a TPACPI_FAN_2CTL quirk entry for
it to the fan_quirk_table[] so that both fans can be controllerd.

Reported-and-tested-by: David Dreschner <david@dreschner.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index bd045486b933..3424b080db77 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8703,6 +8703,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
 	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
+	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 };
 
-- 
2.33.1

