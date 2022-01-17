Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C179C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 11:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239100AbiAQL0z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 06:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31535 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239099AbiAQL0w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 06:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642418811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EyDIsE8HbbhtxAAkotZIHn+BwU1RYW7khqFRhW/hnVA=;
        b=VubMQ4Tbd8ErkUYEmIuT0G21tTb0utw/NTK8Yoj98jdzvqJJL8UjqmZrd5tE7VfhmhHlfD
        lIe6u+CJJLz9bWnRL8TRmpyJ41Mx1bBs9hKeKBXw7nXh5no0TmiUo9VkmzMGSLbokFi0bf
        vpGl10m8osdcUynK7Cn7AsD+lDunD7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500--j0ugU35OaKii7S8-uRQtA-1; Mon, 17 Jan 2022 06:26:48 -0500
X-MC-Unique: -j0ugU35OaKii7S8-uRQtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2C91934101;
        Mon, 17 Jan 2022 11:26:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.194])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 81E47105B1E0;
        Mon, 17 Jan 2022 11:26:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] platform/x86: amd-pmc: Make amd_pmc_stb_debugfs_fops static
Date:   Mon, 17 Jan 2022 12:26:43 +0100
Message-Id: <20220117112644.260168-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

amd_pmc_stb_debugfs_fops is not used outside of amd-pmc.c, make it
static.

Cc: Sanket Goswami <Sanket.Goswami@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/amd-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index f794343d6aaa..85b680297934 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -226,7 +226,7 @@ static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-const struct file_operations amd_pmc_stb_debugfs_fops = {
+static const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.owner = THIS_MODULE,
 	.open = amd_pmc_stb_debugfs_open,
 	.read = amd_pmc_stb_debugfs_read,
-- 
2.33.1

