Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3919EC7EE2A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 May 2023 18:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjETSTi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 May 2023 14:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbjETSTY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 May 2023 14:19:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47601E73;
        Sat, 20 May 2023 11:19:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83BE760BBD;
        Sat, 20 May 2023 18:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2688CC433D2;
        Sat, 20 May 2023 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684606698;
        bh=cWB1dZy+1AbY9jcNQa0xPC8wJXDRMfc8M7uaWfwUlok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SL4YpO9rQO8N+HkY5I/ND6GJP13LcpS4hH1lze70cBGguFGvRnuGUzNVEECUQuCbU
         g7fw+DmZucW0vnLKpJCiTjlcR1+P2KzkM2MGLi9hHwgXVjEH2IEfg0/kysTfXAw1VJ
         TPCiQ1GaFvGPZjExxotImFPKXcXd6VOyIJlAQMUYN5pKe7U/RXBaZIykk04i3vqTXS
         G7X9sGRBNpDOUfEsxEFdBNPPY8srgw3CV1aIwMG1YYr24iEFIne0vGNARy2AR0dOyB
         kO8O/jNQcv2hbFjlcPXbG7d+oQdSIR+AO8sHvbiAKGU3PuOLWIwUVRyA1d4ACsgqM2
         1nsk2500Lh7dQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Julian Winkler <julian.winkler1@web.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        mika.westerberg@linux.intel.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 09/18] platform/x86: intel_scu_pcidrv: Add back PCI ID for Medfield
Date:   Sat, 20 May 2023 14:17:41 -0400
Message-Id: <20230520181750.823365-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520181750.823365-1-sashal@kernel.org>
References: <20230520181750.823365-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Julian Winkler <julian.winkler1@web.de>

[ Upstream commit 4a9b6850c794e4394cad99e2b863d75f5bc8e92f ]

This id was removed in commit b47018a778c1 ("platform/x86: intel_scu_ipc:
Remove Lincroft support"), saying it is only used on Moorestown,
but apparently the same id is also used on Medfield.

Tested on the Medfield based Motorola RAZR i smartphone.

Signed-off-by: Julian Winkler <julian.winkler1@web.de>
Link: https://lore.kernel.org/r/20230416154932.6579-1-julian.winkler1@web.de
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_scu_pcidrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_scu_pcidrv.c b/drivers/platform/x86/intel_scu_pcidrv.c
index 80abc708e4f2f..d904fad499aa5 100644
--- a/drivers/platform/x86/intel_scu_pcidrv.c
+++ b/drivers/platform/x86/intel_scu_pcidrv.c
@@ -34,6 +34,7 @@ static int intel_scu_pci_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x080e) },
+	{ PCI_VDEVICE(INTEL, 0x082a) },
 	{ PCI_VDEVICE(INTEL, 0x08ea) },
 	{ PCI_VDEVICE(INTEL, 0x0a94) },
 	{ PCI_VDEVICE(INTEL, 0x11a0) },
-- 
2.39.2

