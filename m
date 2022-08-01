Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B2EC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 14:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbiHAOzq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 10:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbiHAOzp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 10:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6065233375
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659365743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7DFWywYhT+OQLp+lGV2gVNJoTgS42WDWQgco9cRIgrI=;
        b=WQBIgX+E7hvLhNGwk+OJwDm7H53LJGGTP6PB82MAvZ4bE+4xwlHRaan2+1l55kNdkJYtIW
        PNYFchhip1fCHJsdNWvZc4LiMCXdYmfteUZPAImYZ9eGVzcV3fFpZp//c6YGLzAqQcPJlR
        C9BWdEcoASRyR4gUgQpX1iaU8ItHQ7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-61IAxOtENxioB0I9snKwwQ-1; Mon, 01 Aug 2022 10:55:40 -0400
X-MC-Unique: 61IAxOtENxioB0I9snKwwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9C328037B5;
        Mon,  1 Aug 2022 14:55:39 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF4382026D64;
        Mon,  1 Aug 2022 14:55:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        David E Box <david.e.box@intel.com>,
        Gayatri Kammela <gayatri.kammela@linux.intel.com>
Subject: [PATCH] platform/x86/intel/vsec: Fix wrong type for local status variables
Date:   Mon,  1 Aug 2022 16:55:36 +0200
Message-Id: <20220801145536.172410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The local status variables in intel_vsec_pci_error_detected()
and intel_vsec_pci_slot_reset() should have pci_ers_result_t as type
(and not pci_channel_state_t).

Also fix a whitespace error as well as intel_vsec_pci_err_handlers not
being marked static.

This fixes the following sparse errors:

drivers/platform/x86/intel/vsec.c:429:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
drivers/platform/x86/intel/vsec.c:429:38: sparse:     expected restricted pci_channel_state_t [usertype] status
drivers/platform/x86/intel/vsec.c:429:38: sparse:     got restricted pci_ers_result_t
drivers/platform/x86/intel/vsec.c:434:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
drivers/platform/x86/intel/vsec.c:434:24: sparse:     expected restricted pci_channel_state_t [usertype] status
drivers/platform/x86/intel/vsec.c:434:24: sparse:     got restricted pci_ers_result_t
drivers/platform/x86/intel/vsec.c:438:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted pci_ers_result_t @@     got restricted pci_channel_state_t [usertype] status @@
drivers/platform/x86/intel/vsec.c:438:16: sparse:     expected restricted pci_ers_result_t
drivers/platform/x86/intel/vsec.c:438:16: sparse:     got restricted pci_channel_state_t [usertype] status
drivers/platform/x86/intel/vsec.c:444:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
drivers/platform/x86/intel/vsec.c:444:38: sparse:     expected restricted pci_channel_state_t [usertype] status
drivers/platform/x86/intel/vsec.c:444:38: sparse:     got restricted pci_ers_result_t
drivers/platform/x86/intel/vsec.c:457:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
drivers/platform/x86/intel/vsec.c:457:16: sparse:     expected restricted pci_channel_state_t [usertype] status
drivers/platform/x86/intel/vsec.c:457:16: sparse:     got restricted pci_ers_result_t
drivers/platform/x86/intel/vsec.c:472:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted pci_ers_result_t @@     got restricted pci_channel_state_t [usertype] status @@
drivers/platform/x86/intel/vsec.c:472:16: sparse:     expected restricted pci_ers_result_t
drivers/platform/x86/intel/vsec.c:472:16: sparse:     got restricted pci_channel_state_t [usertype] status
drivers/platform/x86/intel/vsec.c:480:33: sparse: sparse: symbol 'intel_vsec_pci_err_handlers' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: David E Box <david.e.box@intel.com>
Cc: Gayatri Kammela <gayatri.kammela@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/vsec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 70c76f54f544..bb81b8b1f7e9 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -426,7 +426,7 @@ MODULE_DEVICE_TABLE(pci, intel_vsec_pci_ids);
 static pci_ers_result_t intel_vsec_pci_error_detected(struct pci_dev *pdev,
 						      pci_channel_state_t state)
 {
-	pci_channel_state_t status = PCI_ERS_RESULT_NEED_RESET;
+	pci_ers_result_t status = PCI_ERS_RESULT_NEED_RESET;
 
 	dev_info(&pdev->dev, "PCI error detected, state %d", state);
 
@@ -441,7 +441,7 @@ static pci_ers_result_t intel_vsec_pci_error_detected(struct pci_dev *pdev,
 static pci_ers_result_t intel_vsec_pci_slot_reset(struct pci_dev *pdev)
 {
 	struct intel_vsec_device *intel_vsec_dev;
-	pci_channel_state_t status = PCI_ERS_RESULT_DISCONNECT;
+	pci_ers_result_t status = PCI_ERS_RESULT_DISCONNECT;
 	const struct pci_device_id *pci_dev_id;
 	unsigned long index;
 
@@ -454,7 +454,7 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struct pci_dev *pdev)
 		goto out;
 	}
 
-	status =  PCI_ERS_RESULT_RECOVERED;
+	status = PCI_ERS_RESULT_RECOVERED;
 
 	xa_for_each(&auxdev_array, index, intel_vsec_dev) {
 		/* check if pdev doesn't match */
@@ -477,7 +477,7 @@ static void intel_vsec_pci_resume(struct pci_dev *pdev)
 	dev_info(&pdev->dev, "Done resuming PCI device\n");
 }
 
-const struct pci_error_handlers intel_vsec_pci_err_handlers = {
+static const struct pci_error_handlers intel_vsec_pci_err_handlers = {
 	.error_detected = intel_vsec_pci_error_detected,
 	.slot_reset = intel_vsec_pci_slot_reset,
 	.resume = intel_vsec_pci_resume,
-- 
2.36.1

