From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH v2 2/3] staging: lustre: ldlm: constify attribute_group structures.
Date: Mon, 17 Jul 2017 14:46:29 +0530
Message-ID: <1500282990-23929-3-git-send-email-arvind.yadav.cs@gmail.com>
References: <1500282990-23929-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500282990-23929-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, jwoithe@just42.net, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work
with const attribute_group. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
index fff930f..e0c3e5d 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
@@ -926,7 +926,7 @@ static ssize_t cancel_unused_locks_before_replay_store(struct kobject *kobj,
 	NULL,
 };
 
-static struct attribute_group ldlm_attr_group = {
+static const struct attribute_group ldlm_attr_group = {
 	.attrs = ldlm_attrs,
 };
 
-- 
1.9.1
