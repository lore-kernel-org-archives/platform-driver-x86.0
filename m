Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0F8C433E1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 11:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8C076193A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 11:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCULbW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47488 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229835AbhCULbN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616326273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZKNJgfyzXzo4U0V+vbRzE1UwtMRkWindhl/j4rmwMzs=;
        b=hASAZ4F3aX/xSSC9MCN/FMdca6j/A+XUR1/bQ4ulBz2Hytyo650VqolWgJgixgFtB/CdFZ
        CnDwH3xjdliR0jdE0Ru/BIv2vMjfLesCyfI+aHWX5pOsSlJh/bpxMwvvrVz2VTfLeUghjK
        +CmN7YbhlkOIlM5m3TS4Y0v/WEBJlLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-AYHDfZK0ML-ytjbSqXmAtg-1; Sun, 21 Mar 2021 07:31:11 -0400
X-MC-Unique: AYHDfZK0ML-ytjbSqXmAtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED9357085;
        Sun, 21 Mar 2021 11:31:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 413E459468;
        Sun, 21 Mar 2021 11:31:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Disable DYTC CQL mode around switching to balanced mode
Date:   Sun, 21 Mar 2021 12:31:08 +0100
Message-Id: <20210321113108.7069-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Testing has shown that setting /sys/firmware/acpi/platform_profile to
"balanced" when /sys/bus/platform/devices/thinkpad_acpi/dytc_lapmode
reports 1, causes dytc_lapmode to get reset to 0 and then it becomes
stuck at 0 for aprox. 30 minutes even if the laptop is used on a lap.

Disabling CQL (when enabled) before issuing the DYTC_CMD_RESET to get
back to balanced mode and re-enabling it afterwards again, like the
code already does when switching to low-power / performance mode fixes
this.

Fixes: c3bfcd4c6762 ("platform/x86: thinkpad_acpi: Add platform profile support")
Tested-by: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ab5155bec22e..a5df44bbb498 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10249,8 +10249,13 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 		return err;
 
 	if (profile == PLATFORM_PROFILE_BALANCED) {
-		/* To get back to balanced mode we just issue a reset command */
-		err = dytc_command(DYTC_CMD_RESET, &output);
+		/*
+		 * To get back to balanced mode we need to issue a reset command.
+		 * Note we still need to disable CQL mode before hand and re-enable
+		 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
+		 * stuck at 0 for aprox. 30 minutes.
+		 */
+		err = dytc_cql_command(DYTC_CMD_RESET, &output);
 		if (err)
 			goto unlock;
 	} else {
-- 
2.30.2

