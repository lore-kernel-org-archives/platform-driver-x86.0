Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDF4C678D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:07:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjCGLHW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjCGLGK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:06:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF55D7BA14
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678186920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tbWi3MEooi7QXfom721p8/q2q4DbH6hQwh2VvDXrFw4=;
        b=Jsl8AVDGV9jll2ROZiGqsZ/1zplfi93PT4Nqq6GOBv/drJLI275mSECdjYIgOgrDoAfv2F
        rxb/k38fhvwraqoeZBSTJC2mmv+WN4w+y9+WvWuH3zn3A2USEHdqLA1onsXPHre66ROmG+
        B/C4MIjCvnK7Ha/u0RFQO8y5QpIDnGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-pRbRvwKwPnyGUPkuQNrbxw-1; Tue, 07 Mar 2023 05:58:45 -0500
X-MC-Unique: pRbRvwKwPnyGUPkuQNrbxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4D4B800B23;
        Tue,  7 Mar 2023 10:58:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.222])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C444C140EBF4;
        Tue,  7 Mar 2023 10:58:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH] platform: mellanox: mlx-platform: Initialize shift variable to 0
Date:   Tue,  7 Mar 2023 11:58:42 +0100
Message-Id: <20230307105842.286118-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Initialize shift variable in mlxplat_mlxcpld_verify_bus_topology()
to 0 to avoid the following compile error:

drivers/platform/x86/mlx-platform.c:6013
 mlxplat_mlxcpld_verify_bus_topology() error: uninitialized symbol 'shift'.

Fixes: 50b823fdd357 ("platform: mellanox: mlx-platform: Move bus shift assignment out of the loop")
Cc: Vadim Pasternak <vadimp@nvidia.com>
Cc: Michael Shych <michaelsh@nvidia.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/mlx-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 7b6779cdb134..67367f010139 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -5980,7 +5980,7 @@ MODULE_DEVICE_TABLE(dmi, mlxplat_dmi_table);
 static int mlxplat_mlxcpld_verify_bus_topology(int *nr)
 {
 	struct i2c_adapter *search_adap;
-	int shift, i;
+	int i, shift = 0;
 
 	/* Scan adapters from expected id to verify it is free. */
 	*nr = MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR;
-- 
2.39.1

