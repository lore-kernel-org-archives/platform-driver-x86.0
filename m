Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6211FC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 14:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27B0164E31
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 14:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbhBDOEU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 09:04:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35115 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236445AbhBDODf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 09:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612447326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=afOXFc3qCLdwQolxxUCR/LgLLShoHjNwrhuDapcLz/Q=;
        b=C72JaR4vhYK2UWxcwgBZUiu9p/Hra81dGeLyn2uaRQLJuTwQE54j1EWigt7aIAiItgzIRS
        weCcPuNNFvB5MQdrMD3TV+S7iSehov48E5zr2cHFSivWHkgHFjNjbGSM0T4mMhoFGvW7QL
        LN4c3+CxU7xpffIVpeSQk4x/5zI6bK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-mQjhxrZnN7KKaHxSN1juuQ-1; Thu, 04 Feb 2021 09:02:02 -0500
X-MC-Unique: mQjhxrZnN7KKaHxSN1juuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B80C580196F;
        Thu,  4 Feb 2021 14:02:00 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 90C965E1B4;
        Thu,  4 Feb 2021 14:01:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH 1/2] platform/x86: thinkpad_acpi: Fix 'warning: no previous prototype for' warnings
Date:   Thu,  4 Feb 2021 15:01:57 +0100
Message-Id: <20210204140158.268289-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the new dytc handling functions are not marked static, even though
they are only used internally.

Mark these static, fixing the following compiler warnings:

drivers/platform/x86/thinkpad_acpi.c:10081:5: warning: no previous prototype for 'dytc_profile_get' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10095:5: warning: no previous prototype for 'dytc_cql_command' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10133:5: warning: no previous prototype for 'dytc_profile_set' [-Wmissing-prototypes]

Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c4a0235b101..8e9acbd9a1a8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10117,8 +10117,8 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
  * dytc_profile_get: Function to register with platform_profile
  * handler. Returns current platform profile.
  */
-int dytc_profile_get(struct platform_profile_handler *pprof,
-			enum platform_profile_option *profile)
+static int dytc_profile_get(struct platform_profile_handler *pprof,
+			    enum platform_profile_option *profile)
 {
 	*profile = dytc_current_profile;
 	return 0;
@@ -10131,7 +10131,7 @@ int dytc_profile_get(struct platform_profile_handler *pprof,
  *  - enable CQL
  *  If not in CQL mode, just run the command
  */
-int dytc_cql_command(int command, int *output)
+static int dytc_cql_command(int command, int *output)
 {
 	int err, cmd_err, dummy;
 	int cur_funcmode;
@@ -10169,8 +10169,8 @@ int dytc_cql_command(int command, int *output)
  * dytc_profile_set: Function to register with platform_profile
  * handler. Sets current platform profile.
  */
-int dytc_profile_set(struct platform_profile_handler *pprof,
-			enum platform_profile_option profile)
+static int dytc_profile_set(struct platform_profile_handler *pprof,
+			    enum platform_profile_option profile)
 {
 	int output;
 	int err;
-- 
2.29.2

