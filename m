Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9035E732C1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 11:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjI1LE6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 07:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjI1LEb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67210CD5;
        Thu, 28 Sep 2023 04:04:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A785C433C9;
        Thu, 28 Sep 2023 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695899064;
        bh=eVFhQkfQVqf4gs9M/VScIe2dy+KCM8XqSfbuDTEEv18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D4BXIqJkjIer2J36/jjuS1leb1eoLK9uMn1alq2qlSE8DIQWS1/4lw7PHC2f9rSbY
         ME8jaBaY+iopsg34w4B7hJt0vCl3tfO8VxOzJrHx4dVAqrfd8B8RnmRmqrbIwPO2Is
         FNqowz71cjuB2n99b36G1bAQ/pNKxqZpS68fmueK2Toq7OnChcWkAIekh4C5kPhMd+
         Vp/sANvkx94Z9zHDGSXXiJCI9bimsqi2U0Pb7/C+dpMv7ueCHXb/SdmasoJrppB9Ih
         7leftXu/tEF1LDvqBsF5SVlnY7/Xu4G2pkYBTlmIM6nCaVhHUVdmNPJeCTE8Lf0yhs
         zZJmbqSwoAw9g==
From:   Jeff Layton <jlayton@kernel.org>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org
Subject: [PATCH 10/87] drivers/platform/x86: convert to new inode {a,m}time accessors
Date:   Thu, 28 Sep 2023 07:02:19 -0400
Message-ID: <20230928110413.33032-9-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/platform/x86/sony-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 9569f11dec8c..40878e327afd 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -4092,7 +4092,7 @@ static ssize_t sonypi_misc_read(struct file *file, char __user *buf,
 
 	if (ret > 0) {
 		struct inode *inode = file_inode(file);
-		inode->i_atime = current_time(inode);
+		inode_set_atime_to_ts(inode, current_time(inode));
 	}
 
 	return ret;
-- 
2.41.0

