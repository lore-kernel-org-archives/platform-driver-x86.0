Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF0CC48BE8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 15:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D54961626
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 15:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhFOPue (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 11:50:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:44576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231830AbhFOPue (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 11:50:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07D3661603;
        Tue, 15 Jun 2021 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623772109;
        bh=s3Sx6HFfbj/xDoJQAsWIo6+vWziz620qNYjm/K82GfM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=USFwiu3qkZ7J54OZgavVUfBkdCCeplp1HbRsempqIbaw3tTboil1QYXWBpHWLowIr
         PBigb16/mPtFSiRN3GDgXdRVdvZh6JWiE9eMgDCZkDOrOLTya/FbfLVo1U+TZcdb9P
         yP38h+2/FhJ6ni5PQyB2W7NvZgLW85luYZuAp9w28OYqzP8AlkTmLFYNy7QV1pvAVi
         pU+FbxHScvotGerMjQloaUmtSck4IdfG90fQhkefTsXl7pAau/SmKuHvs3u+AreRz/
         X6IITKUhr2LuCLf4zmopV9KOKlwMFlSmzrgLaPUEBh9fo9NJCRSiGMbuBFmU4ouhDj
         /r52oqjTu6J6g==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Til Jasper Ullrich <tju@tju.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 04/33] platform/x86: thinkpad_acpi: Add X1 Carbon Gen 9 second fan support
Date:   Tue, 15 Jun 2021 11:47:55 -0400
Message-Id: <20210615154824.62044-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Til Jasper Ullrich <tju@tju.me>

[ Upstream commit c0e0436cb4f6627146acdae8c77828f18db01151 ]

The X1 Carbon Gen 9 uses two fans instead of one like the previous
generation. This adds support for the second fan. It has been tested
on my X1 Carbon Gen 9 (20XXS00100) and works fine.

Signed-off-by: Til Jasper Ullrich <tju@tju.me>
Link: https://lore.kernel.org/r/20210525150950.14805-1-tju@tju.me
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 61f1c91c62de..3390168ac079 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8808,6 +8808,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
 	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
+	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
-- 
2.30.2

