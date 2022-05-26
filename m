Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CAFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 May 2022 20:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbiEZUcI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 May 2022 16:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbiEZUcD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 May 2022 16:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3F229AF30C
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2022 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653597121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wQbOUriGCnynaLUc5Bo76/WwyN+TFwMe7tvzUPT6f20=;
        b=RtinIYZozaqEtRELXrDVmuRooNb0qbE66kfnQk9dpjmdQcEybZB9gkUq3Geiipp3wqYrV8
        lvbF9E37t+kciot0Mbn6DoOgXs0txUh+RhFXIIFKWaGOmJtCdiuS91M/rTRq11Zbw6kPs9
        rlPryaHT03ZgKXBF4VoLb/eHXMK6Q4k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-bnyKRFf2N3mqFq1B1yJviw-1; Thu, 26 May 2022 16:31:51 -0400
X-MC-Unique: bnyKRFf2N3mqFq1B1yJviw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 992A6296A60C;
        Thu, 26 May 2022 20:31:51 +0000 (UTC)
Received: from darcari.bos.com (unknown [10.22.8.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3913D2026D64;
        Thu, 26 May 2022 20:31:51 +0000 (UTC)
From:   David Arcari <darcari@redhat.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     David Arcari <darcari@redhat.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] [PATCH] platform/x86/intel: Fix pmt_crashlog array reference
Date:   Thu, 26 May 2022 16:31:40 -0400
Message-Id: <20220526203140.339120-1-darcari@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The probe function pmt_crashlog_probe() may incorrectly reference
the 'priv->entry array' as it uses 'i' to reference the array instead
of 'priv->num_entries' as it should.  This is similar to the problem
that was addressed in pmt_telemetry_probe via commit 2cdfa0c20d58
("platform/x86/intel: Fix 'rmmod pmt_telemetry' panic").

Cc: "David E. Box" <david.e.box@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: David Arcari <darcari@redhat.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 34daf9df168b..ace1239bc0a0 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -282,7 +282,7 @@ static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
 	auxiliary_set_drvdata(auxdev, priv);
 
 	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
-		struct intel_pmt_entry *entry = &priv->entry[i].entry;
+		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries].entry;
 
 		ret = intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, i);
 		if (ret < 0)
-- 
2.27.0

