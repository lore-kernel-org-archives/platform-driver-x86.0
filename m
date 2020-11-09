Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D4EC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 10:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2EF4206B2
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 10:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B31l5Sjr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgKIKf5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 05:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20962 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726646AbgKIKf5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 05:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604918156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mQ8rKr0Rvfx6JuyDLIVbfpiCXHsnp9cZwJC/Y27bV+E=;
        b=B31l5SjrDPKcNyWy5vQAkCFB6xgJdeG0Atv5ainH9b+PIrGAwjoQcvKgcp+32of4Bo+5x5
        Z5vp22A6iF79Dym7K2CsEaWmWcDmnXM+1OrcnmmFFpGSYnUUctA23iXbmdfeoyTidpJBUt
        zWu5CrhMVfCbwrPJr9iRHA7fO2msE4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-g8lsDroTOIGE2R_xBSp_eQ-1; Mon, 09 Nov 2020 05:35:54 -0500
X-MC-Unique: g8lsDroTOIGE2R_xBSp_eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20747802B73;
        Mon,  9 Nov 2020 10:35:53 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-3.ams2.redhat.com [10.36.114.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7F95D9DD;
        Mon,  9 Nov 2020 10:35:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Add BAT1 is primary battery quirk for Thinkpad Yoga 11e 4th gen
Date:   Mon,  9 Nov 2020 11:35:50 +0100
Message-Id: <20201109103550.16265-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Thinkpad Yoga 11e 4th gen with the N3450 / Celeron CPU only has
one battery which is named BAT1 instead of the expected BAT0, add a
quirk for this. This fixes not being able to set the charging tresholds
on this model; and this alsoe fixes the following errors in dmesg:

ACPI: \_SB_.PCI0.LPCB.EC__.HKEY: BCTG evaluated but flagged as error
thinkpad_acpi: Error probing battery 2
battery: extension failed to load: ThinkPad Battery Extension
battery: extension unregistered: ThinkPad Battery Extension

Note that the added quirk is for the "R0K" BIOS versions which are
used on the Thinkpad Yoga 11e 4th gen's with a Celeron CPU, there
is a separate "R0L" BIOS for the i3/i5 based versions. This may also
need the same quirk, but if that really is necessary is unknown.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 08d5bb3104f9..cabf450fd7d3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9726,6 +9726,7 @@ static const struct tpacpi_quirk battery_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'B', true), /* Thinkpad 11e gen 3 */
 	TPACPI_Q_LNV3('R', '0', 'C', true), /* Thinkpad 13 */
 	TPACPI_Q_LNV3('R', '0', 'J', true), /* Thinkpad 13 gen 2 */
+	TPACPI_Q_LNV3('R', '0', 'K', true), /* Thinkpad 11e gen 4 celeron BIOS */
 };
 
 static int __init tpacpi_battery_init(struct ibm_init_struct *ibm)
-- 
2.28.0

