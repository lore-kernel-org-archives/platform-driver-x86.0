Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FC5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3ADA60F4B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbhJKNZr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35327 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236854AbhJKNZr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 09:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633958627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TrYEFsKLQ57B8sZNNIF8e4PfzCbVsd+dwGRJ3y9GpDI=;
        b=Q7ZUv2vG3Q0BZySgsQqrZ2pfQUBea4FPBO55RgIKK/x/KEfgxLhxpgeGR7615+FP8YXISU
        6qSMX84KEiBJUYOMyIBiDNetj5VmQCO4oXAEkEBDLC/8buoSHfFTTP/cti/zQsog6r0IyJ
        Uw1DXXo81ux5DRoqNUFTkCRtFiwVBlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Ab58fZULMZ-nr9AqMJ_rzw-1; Mon, 11 Oct 2021 09:23:43 -0400
X-MC-Unique: Ab58fZULMZ-nr9AqMJ_rzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2C64835DED;
        Mon, 11 Oct 2021 13:23:42 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AE5FD60C2B;
        Mon, 11 Oct 2021 13:23:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: dell: Make DELL_WMI_PRIVACY depend on DELL_WMI
Date:   Mon, 11 Oct 2021 15:23:38 +0200
Message-Id: <20211011132338.407571-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DELL_WMI_PRIVACY is a feature toggle for the main dell-wmi driver,
so it must depend on the Kconfig option which enables the main
dell-wmi driver.

Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index 42513eab1d06..2fffa57e596e 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -167,6 +167,7 @@ config DELL_WMI
 config DELL_WMI_PRIVACY
 	bool "Dell WMI Hardware Privacy Support"
 	depends on LEDS_TRIGGER_AUDIO = y || DELL_WMI = LEDS_TRIGGER_AUDIO
+	depends on DELL_WMI
 	help
 	  This option adds integration with the "Dell Hardware Privacy"
 	  feature of Dell laptops to the dell-wmi driver.
-- 
2.31.1

