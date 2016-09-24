From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] x86/platform/mellanox: Fix return value check in mlxplat_init()
Date: Sat, 24 Sep 2016 11:48:13 +0000
Message-ID: <1474717693-6191-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:35671 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753571AbcIXLsd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 24 Sep 2016 07:48:33 -0400
Received: by mail-pa0-f67.google.com with SMTP id gg10so823172pac.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Sep 2016 04:48:33 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function platform_device_register_simple()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/x86/platform/mellanox/mlx-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/mellanox/mlx-platform.c b/arch/x86/platform/mellanox/mlx-platform.c
index e1dc152..7dcfcca 100644
--- a/arch/x86/platform/mellanox/mlx-platform.c
+++ b/arch/x86/platform/mellanox/mlx-platform.c
@@ -200,8 +200,8 @@ static int __init mlxplat_init(void)
 					mlxplat_lpc_resources,
 					ARRAY_SIZE(mlxplat_lpc_resources));
 
-	if (!mlxplat_dev)
-		return -ENOMEM;
+	if (IS_ERR(mlxplat_dev))
+		return PTR_ERR(mlxplat_dev);
 
 	priv = devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
 			    GFP_KERNEL);
