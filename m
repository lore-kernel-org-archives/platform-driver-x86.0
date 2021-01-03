Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2F3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun,  3 Jan 2021 14:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D964E2080D
	for <platform-driver-x86@archiver.kernel.org>; Sun,  3 Jan 2021 14:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727293AbhACOFO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 3 Jan 2021 09:05:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:36134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726616AbhACOFO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 3 Jan 2021 09:05:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C2A720936;
        Sun,  3 Jan 2021 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609682673;
        bh=zmUHFqvjqtfLJXF85/Hm1Z5hmOhl2hMkFbi6NnBIHVQ=;
        h=From:To:Cc:Subject:Date:From;
        b=p4UhIZVLqe0yE0mfmOeYHDcVKyiVOzOqKLszjvRygqI5x8KrC8RiQlVC6zDm3QxdJ
         To3w0JzmKsvqDvn6Bo35f/bmsKx6NK2nNKEq1qXy7dFNocwVYf8af3cdAyNXHRc4uO
         D5mbdG2EuZeXiqEf5CjDTjJvSjh1X8SHGZtio5mvWnm4f6J81pwWyNslDb4fKGmakS
         SrQIBs4i+D5wEnCUvwFmti9/11ot4qXDyJnD0zbo42teHSxC6e2IrYotMm7r1SPdVu
         mukYACQvQhXcc9cABxBuMQn52HX/KoHObEFLD0Pf1T1Sf1cQO7uLOgvJ3j65sv5PCu
         hbqpreoxjPjng==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/surface: mark PM functions as __maybe_unused
Date:   Sun,  3 Jan 2021 15:04:21 +0100
Message-Id: <20210103140429.3929810-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_PM is disabled, the compiler produces harmless warnings:

drivers/platform/surface/surface_gpe.c:184:12: error: unused function 'surface_gpe_suspend' [-Werror,-Wunused-function]
static int surface_gpe_suspend(struct device *dev)
drivers/platform/surface/surface_gpe.c:189:12: error: unused function 'surface_gpe_resume' [-Werror,-Wunused-function]
static int surface_gpe_resume(struct device *dev)

Mark these as __maybe_unused to shut up the warning.

Fixes: 274335f1c557 ("platform/surface: Add Driver to set up lid GPEs on MS Surface device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/surface/surface_gpe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index e49e5d6d5d4e..86f6991b1215 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -181,12 +181,12 @@ static int surface_lid_enable_wakeup(struct device *dev, bool enable)
 	return 0;
 }
 
-static int surface_gpe_suspend(struct device *dev)
+static int __maybe_unused surface_gpe_suspend(struct device *dev)
 {
 	return surface_lid_enable_wakeup(dev, true);
 }
 
-static int surface_gpe_resume(struct device *dev)
+static int __maybe_unused surface_gpe_resume(struct device *dev)
 {
 	return surface_lid_enable_wakeup(dev, false);
 }
-- 
2.29.2

