From: Joe Perches <joe@perches.com>
Subject: [PATCH 12/23] ideapad-laptop: Add pr_fmt
Date: Tue, 29 Mar 2011 15:21:43 -0700
Message-ID: <685c9e00532982dba8f88ed1ab6859693aae267c.1301436234.git.joe@perches.com>
References: <cover.1301436234.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1301436234.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add pr_fmt to prefix logging messages.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/ideapad-laptop.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 21b1018..bfdda33 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -20,6 +20,8 @@
  *  02110-1301, USA.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
-- 
1.7.4.2.g597a6.dirty
