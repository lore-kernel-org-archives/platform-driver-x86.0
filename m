Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0BCC77B73
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Apr 2023 15:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjDPPuW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Apr 2023 11:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPPuW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Apr 2023 11:50:22 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5382D73
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Apr 2023 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1681660219; i=julian.winkler1@web.de;
        bh=MW+CPz4TKpbB0uYr+zMJzXTS/QVgv7WQQTpAlM8ZXvg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=mddVq/+Akvo9+vUlPAY8S5N9W1bLeRyJDm8l790sBduvbfyLYMzwUUZ8JcrDz0Kdm
         ROwVj/lM1WR8RObeW3XG9Kp2M/CFBP3EuaAAROXjlJixyvv3TgLbPf79gzxQL/6hpf
         SXavh1CatAOL7pPlGo+CyKJ1DULH2t8XHBeI5J7v3HcOYVaHFyrR/QNmEQzx8553KN
         QyChUdel+Ur/lqb8A409bylf0o969wy+b/ed3Sm6d4G0+4S3+XgBbyJIi1g/QG0adD
         5O2tfvEhBLsZ4Q05GZvAlAX8WmGJgbBR9fi/iJYmA8KDEGg+4+217f5zsSJb8rwMcm
         MOE4MLPdAkYpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from hp255.fritz.box ([86.103.35.3]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6pUQ-1pguAP0FrC-008KQK; Sun, 16
 Apr 2023 17:50:19 +0200
From:   Julian Winkler <julian.winkler1@web.de>
To:     platform-driver-x86@vger.kernel.org
Cc:     Julian Winkler <julian.winkler1@web.de>
Subject: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
Date:   Sun, 16 Apr 2023 17:49:32 +0200
Message-Id: <20230416154932.6579-1-julian.winkler1@web.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rZsg/aMemUX27h3xJooOSKI761faNAux4cQ4bk8CZ+vaNfBXh9o
 jaWwYyKxFAfxNzR1gp62PKshaUGUD0e4zEX/xCAwlZAi/61EAlAjUOyJch4k8WdBbLgP9Yk
 0cCpPEdiPPmni4m+KSyGnPVppOp2Qhs5JZkxw9dDV2NfHzPItmBXpb9yOUZWxFgHRrfjayS
 e3cwKRVyT6c4Vg/uzMAEw==
UI-OutboundReport: notjunk:1;M01:P0:PY54vU5KV3s=;hdi0IF1r99btDbz4oF69oOtxdbr
 Mve9pMRbqN9EyJQP+o62bPwHeVJdyllYFxWVlg6dNARmQW9T7nfDeOmZEoY11nzeCoJutAfLS
 GNpxP2qtaqSuP2W5CMcHodi7ae6uQtR08Wt8raOfUJHZVGJxyoJ/BL0iukRVhIjAW27D+I/LL
 9WBNTB0SCVHruDMuFbTGEbsWBxPKDSt0msI2hRgKS4dQFG8y4Ykv6u6+aU4Oi+bT1gz99UX/p
 Bfl65BUwr68OgO/u7qukHiWdZrVlXgp/9SxKIm/cyj3Pmlb+frBsPN+mHzwA861lzrPaqpO2u
 mqe9RRmKlXORNYNRl27k2nJAVAbT7n0v/ocNi9bejqKgotz2w51IpQxedttRmgXS2Gdq/yB7o
 PXnKvVrUT0SCw/rHKa+leFn9gX3sPrx/eq04zwTBQfE0FrAF3QzDjmefpwxl4UcDdLCjgrQTZ
 bqtG72o3JZWVLvSrVBqcYTjkIrl9Je0ui6MasscJgQb5TTPqtr3PHSJ+/FKI3y9dyubh1dzGQ
 E94JXXDFWTDjtTHtejHpBvNfGDbQHJ517LbLpk/bDCu9lyCjroI8qOWphbmR45RdB9SosJn30
 pWx2tHfTJvOp7rVhbJCTtvz+I3bXkNkq5Nlksi1U/USCQRu/Z3E1ni3tEz4fWsMrmOLsGX0Rd
 xXEN6fpgFLRXrejeTN4iKCAeYIUsACuTvZvXj0aG4AxRbNBfrjQvAxVrqAy5ezzLlXEWUaWPM
 pqaA2aE28ZTKyN5XHfj/mezHC3XV/h4rxoSlHpGTD+5Uhw3UXxztw7J7Hsoc5inK2vC+mMc2v
 dpuUJUKCVDVWy8GivN8dA0W+UWvGWD2dfk8X4J+Hy8WCjW9nWx0Dxovu9Q2P4FtO5B0mKtp2T
 xlU70S97FbtJEgADvkYYhnp85Pnx9yRBBUGYz/Sf24PCPIsEFNb2vHbnZzzU33YHM0lYxDvC7
 YnyQeUwhJV5DTjuFeIoH22eriWM=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, saying it
is only used on Moorestown, but apparently the same id is also used on
Medfield.

Tested on the Medfield based Motorola RAZR i smartphone.

Signed-off-by: Julian Winkler <julian.winkler1@web.de>
---
 drivers/platform/x86/intel_scu_pcidrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_scu_pcidrv.c b/drivers/platform/x86=
/intel_scu_pcidrv.c
index 80abc708e4f2..d904fad499aa 100644
--- a/drivers/platform/x86/intel_scu_pcidrv.c
+++ b/drivers/platform/x86/intel_scu_pcidrv.c
@@ -34,6 +34,7 @@ static int intel_scu_pci_probe(struct pci_dev *pdev,
=20
 static const struct pci_device_id pci_ids[] =3D {
 	{ PCI_VDEVICE(INTEL, 0x080e) },
+	{ PCI_VDEVICE(INTEL, 0x082a) },
 	{ PCI_VDEVICE(INTEL, 0x08ea) },
 	{ PCI_VDEVICE(INTEL, 0x0a94) },
 	{ PCI_VDEVICE(INTEL, 0x11a0) },
--=20
2.39.2

