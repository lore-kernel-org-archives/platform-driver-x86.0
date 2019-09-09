From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 04/13] software node: simplify property_get_pointer()
Date: Mon,  9 Sep 2019 01:15:48 -0700
Message-ID: <20190909081557.93766-5-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We do not need to handle each data type separately, we can simply return either
the raw pointer or pointer to values union.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index a8d12046105e..bedc26189bed 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -105,30 +105,13 @@ property_entry_get(const struct property_entry *prop, const char *name)
 
 static const void *property_get_pointer(const struct property_entry *prop)
 {
-	switch (prop->type) {
-	case DEV_PROP_U8:
-		if (prop->is_array)
-			return prop->pointer.u8_data;
-		return &prop->value.u8_data;
-	case DEV_PROP_U16:
-		if (prop->is_array)
-			return prop->pointer.u16_data;
-		return &prop->value.u16_data;
-	case DEV_PROP_U32:
-		if (prop->is_array)
-			return prop->pointer.u32_data;
-		return &prop->value.u32_data;
-	case DEV_PROP_U64:
-		if (prop->is_array)
-			return prop->pointer.u64_data;
-		return &prop->value.u64_data;
-	case DEV_PROP_STRING:
-		if (prop->is_array)
-			return prop->pointer.str;
-		return &prop->value.str;
-	default:
+	if (!prop->length)
 		return NULL;
-	}
+
+	if (prop->is_array)
+		return prop->pointer.raw;
+
+	return &prop->value;
 }
 
 static const void *property_entry_find(const struct property_entry *props,
-- 
2.23.0.187.g17f5b7556c-goog
