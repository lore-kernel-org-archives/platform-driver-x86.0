Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06E8E7C4E9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 18:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244616AbjJDSym (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 14:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244668AbjJDSyc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 14:54:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C29BF;
        Wed,  4 Oct 2023 11:53:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01300C433C7;
        Wed,  4 Oct 2023 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696445637;
        bh=dXqgQsJjfAWhvfig5etpj934h1JjwrT6x4JCfVoFzuc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cYjQcmalERu9mI4bJVS0/LehJ2ryG/ntAm3KL5pbo80fBsuWh20qXdy4/bDFLr6wD
         ARk6GO3LTKmqtMMVv7s0VfutnxuWU51m0jmDgvjlGu8HrLui55Z0YNx6205PJST21W
         HEeV082Cub74DzPlkzit9wFivuCjMO6ImWf6zXdOMZSGGHovTwGmKwUi6MlJGKA4Zt
         05EmSCltohrDA59hOHEPVUCdM8jWeXKWlEgB1696q0Zs7/j5FQ/YbFEFjgJtSOYTlZ
         ec939jJTnwrZerGLxBDgq4ct8tUO0tT1pxoewjM0WiRu75DQ+U2zrLE/DHLO2CqjSh
         TnT52D0o/GyuA==
From:   Jeff Layton <jlayton@kernel.org>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 10/89] x86: convert to new timestamp accessors
Date:   Wed,  4 Oct 2023 14:51:55 -0400
Message-ID: <20231004185347.80880-8-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185347.80880-1-jlayton@kernel.org>
References: <20231004185221.80802-1-jlayton@kernel.org>
 <20231004185347.80880-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Convert to using the new inode timestamp accessor functions.

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

