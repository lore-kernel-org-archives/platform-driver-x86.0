Return-Path: <SRS0=2mT5=DG=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA05C4346E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 08:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAF5A20773
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 08:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgI2IUr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Sep 2020 04:20:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54387 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgI2IUr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Sep 2020 04:20:47 -0400
Received: from [222.129.32.87] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <aaron.ma@canonical.com>)
        id 1kNAsH-00080V-GV; Tue, 29 Sep 2020 08:20:38 +0000
From:   Aaron Ma <aaron.ma@canonical.com>
To:     aaron.ma@canonical.com, mapengyu@gmail.com, ibm-acpi@hmh.eng.br,
        dvhart@infradead.org, andy@infradead.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: re-initialize acpi buffer size when reuse
Date:   Tue, 29 Sep 2020 16:20:25 +0800
Message-Id: <20200929082025.51446-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Evaluating acpi _BCL could be failed, then acpi buffer size will be set
to 0. When reuse this acpi buffer, AE_BUFFER_OVERFLOW will be triggered.

Re-initialize buffer size will make acpi evaluate successfully.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c4df41687a3..477d63c49c04 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6829,8 +6829,10 @@ static int __init tpacpi_query_bcl_levels(acpi_handle handle)
 	list_for_each_entry(child, &device->children, node) {
 		acpi_status status = acpi_evaluate_object(child->handle, "_BCL",
 							  NULL, &buffer);
-		if (ACPI_FAILURE(status))
+		if (ACPI_FAILURE(status)) {
+			buffer.length = ACPI_ALLOCATE_BUFFER;
 			continue;
+		}
 
 		obj = (union acpi_object *)buffer.pointer;
 		if (!obj || (obj->type != ACPI_TYPE_PACKAGE)) {
-- 
2.28.0

