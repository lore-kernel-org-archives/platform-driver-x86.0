From: Joe Perches <joe@perches.com>
Subject: [PATCH 01/23] asus-wmi: Remove __init from asus_wmi_platform_init
Date: Tue, 29 Mar 2011 15:21:32 -0700
Message-ID: <ae73e8c570d9ee701af6bad5c1479c3615418826.1301436234.git.joe@perches.com>
References: <cover.1301436234.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1301436234.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentincj@iksaif.net>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

It's used by a non-init function.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/asus-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index efc776c..c382af6 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1223,7 +1223,7 @@ static int asus_wmi_sysfs_init(struct platform_device *device)
 /*
  * Platform device
  */
-static int __init asus_wmi_platform_init(struct asus_wmi *asus)
+static int asus_wmi_platform_init(struct asus_wmi *asus)
 {
 	int rv;
 
-- 
1.7.4.2.g597a6.dirty
