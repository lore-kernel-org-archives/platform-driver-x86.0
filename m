Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE50DC64991
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 14:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238498AbiHYOQw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241523AbiHYOOg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 10:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC62B6D3A
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661436862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SPBDJnyBcg/ja+tldaI3sfOUIfxS4pflnvqnwY+lxic=;
        b=fdmaCRalxjaAc1/npjhf0oIv1e0rHkzq3rQtYKunsAYDmVcvUcD0SWDcIqyg4M2M+dk//A
        xcvJX1ER0KrlXGsLP+/NqcROfqX2bcmGMOQJuyRiGmnLGHu78ta28Nk0Z2uJhlDtQy8eNl
        YlxQfKfIAGDA4KDpEMRJQB9rlr7ixJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-AVRxu84FPL2WUp1rnD3vIg-1; Thu, 25 Aug 2022 10:14:19 -0400
X-MC-Unique: AVRxu84FPL2WUp1rnD3vIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E46E3C2F8D9;
        Thu, 25 Aug 2022 14:13:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2B70840334B;
        Thu, 25 Aug 2022 14:13:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: msi-laptop: Fix resource cleanup
Date:   Thu, 25 Aug 2022 16:13:36 +0200
Message-Id: <20220825141336.208597-3-hdegoede@redhat.com>
In-Reply-To: <20220825141336.208597-1-hdegoede@redhat.com>
References: <20220825141336.208597-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the input-device not getting free-ed on probe-errors and
fix the msi_touchpad_dwork not getting cancelled on neither
probe-errors nor on remove.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 65db18c6e3e8..5d4b10b8d771 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1106,6 +1106,8 @@ static int __init msi_init(void)
 fail_create_group:
 	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
+		cancel_delayed_work_sync(&msi_touchpad_dwork);
+		input_unregister_device(msi_laptop_input_dev);
 		cancel_delayed_work_sync(&msi_rfkill_dwork);
 		rfkill_cleanup();
 	}
@@ -1125,6 +1127,7 @@ static void __exit msi_cleanup(void)
 {
 	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
+		cancel_delayed_work_sync(&msi_touchpad_dwork);
 		input_unregister_device(msi_laptop_input_dev);
 		cancel_delayed_work_sync(&msi_rfkill_dwork);
 		rfkill_cleanup();
-- 
2.37.2

