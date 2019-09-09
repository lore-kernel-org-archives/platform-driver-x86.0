From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 01/13] software node: remove DEV_PROP_MAX
Date: Mon,  9 Sep 2019 01:15:45 -0700
Message-ID: <20190909081557.93766-2-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This definition is not used anywhere, let's remove it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/property.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 9b3d4ca3a73a..44c1704f7163 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -22,7 +22,6 @@ enum dev_prop_type {
 	DEV_PROP_U32,
 	DEV_PROP_U64,
 	DEV_PROP_STRING,
-	DEV_PROP_MAX,
 };
 
 enum dev_dma_attr {
-- 
2.23.0.187.g17f5b7556c-goog
