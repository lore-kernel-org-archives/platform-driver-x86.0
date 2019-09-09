From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 03/13] software node: get rid of property_set_pointer()
Date: Mon,  9 Sep 2019 01:15:47 -0700
Message-ID: <20190909081557.93766-4-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Instead of explicitly setting values of integer types when copying property
entries lets just copy entire value union when processing non-array values.

When handling array values assign the pointer there using the newly introduced
"raw" pointer union member. This allows us to remove property_set_pointer().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c    | 50 +++++-----------------------------------
 include/linux/property.h |  1 +
 2 files changed, 7 insertions(+), 44 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 7bad41a8f65d..a8d12046105e 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -103,45 +103,6 @@ property_entry_get(const struct property_entry *prop, const char *name)
 	return NULL;
 }
 
-static void
-property_set_pointer(struct property_entry *prop, const void *pointer)
-{
-	switch (prop->type) {
-	case DEV_PROP_U8:
-		if (prop->is_array)
-			prop->pointer.u8_data = pointer;
-		else
-			prop->value.u8_data = *((u8 *)pointer);
-		break;
-	case DEV_PROP_U16:
-		if (prop->is_array)
-			prop->pointer.u16_data = pointer;
-		else
-			prop->value.u16_data = *((u16 *)pointer);
-		break;
-	case DEV_PROP_U32:
-		if (prop->is_array)
-			prop->pointer.u32_data = pointer;
-		else
-			prop->value.u32_data = *((u32 *)pointer);
-		break;
-	case DEV_PROP_U64:
-		if (prop->is_array)
-			prop->pointer.u64_data = pointer;
-		else
-			prop->value.u64_data = *((u64 *)pointer);
-		break;
-	case DEV_PROP_STRING:
-		if (prop->is_array)
-			prop->pointer.str = pointer;
-		else
-			prop->value.str = pointer;
-		break;
-	default:
-		break;
-	}
-}
-
 static const void *property_get_pointer(const struct property_entry *prop)
 {
 	switch (prop->type) {
@@ -380,20 +341,21 @@ static int property_entry_copy_data(struct property_entry *dst,
 			if (!new)
 				return -ENOMEM;
 		}
+
+		dst->is_array = true;
+		dst->pointer.raw = new;
 	} else if (src->type == DEV_PROP_STRING) {
 		new = kstrdup(src->value.str, GFP_KERNEL);
 		if (!new && src->value.str)
 			return -ENOMEM;
+
+		dst->value.str = new;
 	} else {
-		new = pointer;
+		dst->value = src->value;
 	}
 
 	dst->length = src->length;
-	dst->is_array = src->is_array;
 	dst->type = src->type;
-
-	property_set_pointer(dst, new);
-
 	dst->name = kstrdup(src->name, GFP_KERNEL);
 	if (!dst->name)
 		goto out_free_data;
diff --git a/include/linux/property.h b/include/linux/property.h
index 44c1704f7163..4943b40d3536 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -239,6 +239,7 @@ struct property_entry {
 			const u32 *u32_data;
 			const u64 *u64_data;
 			const char * const *str;
+			const void *raw;
 		} pointer;
 		union {
 			u8 u8_data;
-- 
2.23.0.187.g17f5b7556c-goog
