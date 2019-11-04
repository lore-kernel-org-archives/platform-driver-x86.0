From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [RFC PATCH 1/3] platform/x86: asus_wmi: Fix return value of
 fan_boost_mode_store
Date: Mon, 4 Nov 2019 20:26:34 +0200
Message-ID: <6452b246-ab31-2a0e-8324-f951681154af@gmail.com>
References: <d3dbac09-3c93-c695-ae52-4b599a0a78c6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d3dbac09-3c93-c695-ae52-4b599a0a78c6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, yurii.pavlovskyi@gmail.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Function fan_boost_mode_store should return number of bytes written
but instead it returns return value of kstrtou8 which is 0 if
conversion is succefull. This leads to infinite loop after any
write to it's SysFS entry.

Fixes: b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>
---
  drivers/platform/x86/asus-wmi.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 821b08e..723aa4d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1718,7 +1718,7 @@ static ssize_t fan_boost_mode_store(struct device *dev,
  	asus->fan_boost_mode = new_mode;
  	fan_boost_mode_write(asus);
  
-	return result;
+	return count;
  }
  
  // Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
-- 
1.8.3.1
