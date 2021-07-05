Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408E4C07E9B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 15:29:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AC84619A4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 15:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhGEPbt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Jul 2021 11:31:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232032AbhGEPbe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Jul 2021 11:31:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1C3861975;
        Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625498937;
        bh=6ZrR1ymv8LTmt10RCYBoPgMQIITczbUgsWc1rlMEc7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pL3pyrIsgEL9syPPf8OuHe7Nv/5KU3GpzFBanH3eqyHXI3RXZgeE58ZprBtEQLjSX
         wyCoxJIi00tKrfOqX4+BRBx0xIhx7aJONWYCt/rE97JjujAjH3PHEHF25fnBDISoMr
         pGzWdI04xa40IMfoBLpit1ZnrFxW1kvEHajNxqvL63uPf9gtUIVLeQ4iDxYcYfjuln
         JS4q4++lj8iO83HGvj5fXkbcoZ+YQ2V35P2Mo1Ojp/Tsw3pARu+KuAwPxH5JS9nG6M
         eJQ4s1k96eQVxSKVN317Byv0woVpl23nLqJW0vo/SeWKXjJ464zhz2bxznY/iJ84xZ
         eKKCo9atrZ7kg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 32/59] platform/x86: toshiba_acpi: Fix missing error code in toshiba_acpi_setup_keyboard()
Date:   Mon,  5 Jul 2021 11:27:48 -0400
Message-Id: <20210705152815.1520546-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705152815.1520546-1-sashal@kernel.org>
References: <20210705152815.1520546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

[ Upstream commit 28e367127718a9cb85d615a71e152f7acee41bfc ]

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'error'.

Eliminate the follow smatch warning:

drivers/platform/x86/toshiba_acpi.c:2834 toshiba_acpi_setup_keyboard()
warn: missing error code 'error'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Link: https://lore.kernel.org/r/1622628348-87035-1-git-send-email-jiapeng.chong@linux.alibaba.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index fa7232ad8c39..352508d30467 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2831,6 +2831,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 
 	if (!dev->info_supported && !dev->system_event_supported) {
 		pr_warn("No hotkey query interface found\n");
+		error = -EINVAL;
 		goto err_remove_filter;
 	}
 
-- 
2.30.2

