Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23A3C761A6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 10:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCTKkO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 06:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjCTKjo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 06:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FED87EC1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=41rZHWWI82t/0TMHQelW/23tVI9u/QtpZptJUBWsprw=;
        b=dln2LNG3ye++IhrEkC9WGelhNhAMmReivv6XqtWJvTcvUPnBvVObmtJFWLtjGheI1UmVLD
        63VoVFulgAzmJTSC03owj96nKNCiaKfTyq1fYLLFg+eJ/kW7r99qrp4eLGNzX28IsD6JOc
        Nph7c/CJUgsvRFijnVREELqVxTwcid0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-PAtBoPRWMUag_g4oK-K40Q-1; Mon, 20 Mar 2023 06:38:17 -0400
X-MC-Unique: PAtBoPRWMUag_g4oK-K40Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 699141C04321;
        Mon, 20 Mar 2023 10:38:17 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.130])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2E068C15BA0;
        Mon, 20 Mar 2023 10:38:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "David E . Box" <david.e.box@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/intel: vsec: Use intel_vsec_dev_release() to simplify init() error cleanup
Date:   Mon, 20 Mar 2023 11:38:15 +0100
Message-Id: <20230320103815.229729-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On auxiliary_device_init(auxdev) failure we need to do the exact same
cleanup steps as on device.release(), so use the intel_vsec_dev_release()
callback for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/vsec.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 2311c16cb975..cf2a20088f6b 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -169,11 +169,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 
 	ret = auxiliary_device_init(auxdev);
 	if (ret < 0) {
-		mutex_lock(&vsec_ida_lock);
-		ida_free(intel_vsec_dev->ida, auxdev->id);
-		mutex_unlock(&vsec_ida_lock);
-		kfree(intel_vsec_dev->resource);
-		kfree(intel_vsec_dev);
+		intel_vsec_dev_release(&auxdev->dev);
 		return ret;
 	}
 
-- 
2.39.1

