From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: [PATCH 2/3] x86: asus-laptop: fix invalid point access
Date: Mon, 20 May 2013 10:30:24 +0800
Message-ID: <51998AC0.3070501@huawei.com>
References: <1368889004-5520-3-git-send-email-libo.chen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368889004-5520-3-git-send-email-libo.chen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Li Zefan <lizefan@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org


asus->name is null or point to const string,so it is not suitable to kfree it.

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/platform/x86/asus-laptop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 0eea09c..8e268da 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1935,7 +1935,6 @@ fail_input:
 fail_backlight:
 	asus_platform_exit(asus);
 fail_platform:
-	kfree(asus->name);
 	kfree(asus);

 	return result;
-- 
1.8.1.2
