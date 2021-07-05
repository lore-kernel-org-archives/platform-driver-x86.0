Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2924C11F69
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 15:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B17E7619AD
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 15:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhGEPd7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Jul 2021 11:33:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:58050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232077AbhGEPdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Jul 2021 11:33:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4121B619B9;
        Mon,  5 Jul 2021 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625499032;
        bh=6ZrR1ymv8LTmt10RCYBoPgMQIITczbUgsWc1rlMEc7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HpuCOpHJjIneYJjWTa4cBDjMPZQrWF5KuWsDC0VF29z3BUmNcQlerashZKH+RcqVs
         yZbZ7Ue68OSBN6enLmjDKKY7HWX8U7vU2sqCnxoXeoFUpzN4WWCyGx8ZfPhXsgPgdr
         IR81NZyry4hORI2A0VaSjVonMcprzKHUcIV7OC+ZrKaBV4PiG3cZ5kNkURyMhO67fw
         J78cm/clEnucnvA9is6xMgmb+w/nSG1/0j7Gfu9hTQnjNp2jm0SiYO5Mg3zCa96wGZ
         dQpJZuVMBlAqIez3Ugpd0c6aeJBAZdZvihA1CL5+ZVYtx44oLjTbH/ksK1cQvQqbv4
         /nt/aIg6AKRbg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 24/41] platform/x86: toshiba_acpi: Fix missing error code in toshiba_acpi_setup_keyboard()
Date:   Mon,  5 Jul 2021 11:29:44 -0400
Message-Id: <20210705153001.1521447-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705153001.1521447-1-sashal@kernel.org>
References: <20210705153001.1521447-1-sashal@kernel.org>
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

