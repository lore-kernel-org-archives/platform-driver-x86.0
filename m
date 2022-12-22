Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853EEC4167B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Dec 2022 10:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiLVKig (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Dec 2022 05:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235247AbiLVKid (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Dec 2022 05:38:33 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Dec 2022 02:38:28 PST
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369E464FD
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Dec 2022 02:38:28 -0800 (PST)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20221222103724ebc3b1006fd5e9ad85
        for <platform-driver-x86@vger.kernel.org>;
        Thu, 22 Dec 2022 11:37:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=henning.schild@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FKMNskZUyu+3zsjd2lYrkSASIEGUhfqqUjLO0ieJ4pU=;
 b=ArRN8+AZRJ21b/InE16Ovq09jtA0kZ86UoY6Y2hvO0FT3oYU1mBTF4KXXkGNVYo0RGslvz
 eUK64wWSYQrGzTVVHdSAcSQTks7fQOtS/CZNbb+M8mPbpiydYMAjtwHgdOY84jHSOUtYMs9w
 B5YFuZMgUmgFjtPSgiY8IYr79m4Hc=;
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH 2/2] platform/x86: simatic-ipc: add another model
Date:   Thu, 22 Dec 2022 11:37:20 +0100
Message-Id: <20221222103720.8546-3-henning.schild@siemens.com>
In-Reply-To: <20221222103720.8546-1-henning.schild@siemens.com>
References: <20221222103720.8546-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-52304:519-21489:flowmailer
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add IPC PX-39A support.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/platform/x86/simatic-ipc.c            | 1 +
 include/linux/platform_data/x86/simatic-ipc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
index 2ab1f8da32b0..b3622419cd1a 100644
--- a/drivers/platform/x86/simatic-ipc.c
+++ b/drivers/platform/x86/simatic-ipc.c
@@ -47,6 +47,7 @@ static struct {
 	{SIMATIC_IPC_IPC427E, SIMATIC_IPC_DEVICE_427E, SIMATIC_IPC_DEVICE_427E},
 	{SIMATIC_IPC_IPC477E, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_427E},
 	{SIMATIC_IPC_IPCBX_39A, SIMATIC_IPC_DEVICE_227G, SIMATIC_IPC_DEVICE_227G},
+	{SIMATIC_IPC_IPCPX_39A, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_227G},
 };
 
 static int register_platform_devices(u32 station_id)
diff --git a/include/linux/platform_data/x86/simatic-ipc.h b/include/linux/platform_data/x86/simatic-ipc.h
index a4a6cba412cb..a48bb5240977 100644
--- a/include/linux/platform_data/x86/simatic-ipc.h
+++ b/include/linux/platform_data/x86/simatic-ipc.h
@@ -33,6 +33,7 @@ enum simatic_ipc_station_ids {
 	SIMATIC_IPC_IPC127E = 0x00000D01,
 	SIMATIC_IPC_IPC227G = 0x00000F01,
 	SIMATIC_IPC_IPCBX_39A = 0x00001001,
+	SIMATIC_IPC_IPCPX_39A = 0x00001002,
 };
 
 static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
-- 
2.38.2

