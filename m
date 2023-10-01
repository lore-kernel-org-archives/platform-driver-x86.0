Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBA5E748ED
	for <platform-driver-x86@archiver.kernel.org>; Sun,  1 Oct 2023 06:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbjJAG23 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 1 Oct 2023 02:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233320AbjJAG23 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2023 02:28:29 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 30 Sep 2023 23:28:26 PDT
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EB41BD
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Sep 2023 23:28:26 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id mpoyqui9X615Bmpozqjj2L; Sun, 01 Oct 2023 08:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1696141254;
        bh=8VNyDNwvUj63WBSAVLx12j5A3luCQB3hSbdx06sW9dw=;
        h=From:To:Cc:Subject:Date;
        b=mZm6LI0qG50vdg0Uro8unjFDDj9mH+yKMAUMUQ2ocIobQyTbRkztvejkhx/9rI3jz
         Hl+ODEgwKZFYvl2X6ERvzj7iv6gsRXKfwqvRnDZw62N5+E+DI3QJp0tunDcRjQoYFO
         BRzMlDyHaol3lIdT0vaFhd6689GkUMYJa55fCjYYRB8Swp0U96eOtqnpaZJb77WxAL
         VZ/fJgqABRSSxmUCSls5JP5lA12rFNbDMJfl0/1I6f/28qBUjGUSWKKjpcuZXr95Vw
         esFvOZH7PFjQ8dgbdYYUjcbkFIZUDtrr6GszNWIzglg7UzEtixuwXls4uoB1WipZWT
         Mzl7W0rvq7JXQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 01 Oct 2023 08:20:54 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Vadim Pasternak <vadimp@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Michael Shych <michaelsh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform: mellanox: Fix a resource leak in an error handling path in mlxplat_probe()
Date:   Sun,  1 Oct 2023 08:20:51 +0200
Message-Id: <8bd0a7944f0f4f1342333eaf8d92d8e9d5623110.1696141233.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If an error occurs after a successful mlxplat_i2c_main_init(),
mlxplat_i2c_main_exit() should be called to free some resources.

Add the missing call, as already done in the remove function.

Fixes: 158cd8320776 ("platform: mellanox: Split logic in init and exit flow")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is based on comparison between functions called in the remove
function and the error handling path of the probe.

For some reason, the way the code is written and function names are
puzzling to me. So Review with care!
---
 drivers/platform/x86/mlx-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 3d96dbf79a72..64701b63336e 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6598,6 +6598,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 fail_register_reboot_notifier:
 fail_regcache_sync:
 	mlxplat_pre_exit(priv);
+	mlxplat_i2c_main_exit(priv);
 fail_mlxplat_i2c_main_init:
 fail_regmap_write:
 fail_alloc:
-- 
2.34.1

