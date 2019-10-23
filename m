From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v6 08/15] software node: unify PROPERTY_ENTRY_XXX macros
Date: Wed, 23 Oct 2019 13:02:26 -0700
Message-ID: <20191023200233.86616-9-dmitry.torokhov@gmail.com>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We can unify string properties initializer macros with integer
initializers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/property.h | 64 +++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 12eff7cbb395..48335288c2a9 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -250,37 +250,33 @@ struct property_entry {
 };
 
 /*
- * Note: the below four initializers for the anonymous union are carefully
+ * Note: the below initializers for the anonymous union are carefully
  * crafted to avoid gcc-4.4.4's problems with initialization of anon unions
  * and structs.
  */
 
-#define __PROPERTY_ENTRY_ARRAY_LEN(_name_, _type_, _Type_, _val_, _len_)\
+#define __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_)				\
+	sizeof(((struct property_entry *)NULL)->value._elem_)
+
+#define __PROPERTY_ENTRY_ARRAY_LEN(_name_, _elem_, _Type_, _val_, _len_)\
 (struct property_entry) {						\
 	.name = _name_,							\
-	.length = (_len_) * sizeof(_type_),				\
+	.length = (_len_) * __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),	\
 	.is_array = true,						\
 	.type = DEV_PROP_##_Type_,					\
 	{ .pointer = _val_ },						\
 }
 
 #define PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, _len_)		\
-	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u8, U8, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u8_data, U8, _val_, _len_)
 #define PROPERTY_ENTRY_U16_ARRAY_LEN(_name_, _val_, _len_)		\
-	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u16, U16, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u16_data, U16, _val_, _len_)
 #define PROPERTY_ENTRY_U32_ARRAY_LEN(_name_, _val_, _len_)		\
-	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u32, U32, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u32_data, U32, _val_, _len_)
 #define PROPERTY_ENTRY_U64_ARRAY_LEN(_name_, _val_, _len_)		\
-	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u64, U64, _val_, _len_)
-
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u64_data, U64, _val_, _len_)
 #define PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, _len_)		\
-(struct property_entry) {						\
-	.name = _name_,							\
-	.length = (_len_) * sizeof(const char *),			\
-	.is_array = true,						\
-	.type = DEV_PROP_STRING,					\
-	{ .pointer = _val_ },						\
-}
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, str, STRING, _val_, _len_)
 
 #define PROPERTY_ENTRY_U8_ARRAY(_name_, _val_)				\
 	PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
@@ -293,30 +289,24 @@ struct property_entry {
 #define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)			\
 	PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
 
-#define __PROPERTY_ENTRY_INTEGER(_name_, _type_, _Type_, _val_)	\
-(struct property_entry) {					\
-	.name = _name_,						\
-	.length = sizeof(_type_),				\
-	.type = DEV_PROP_##_Type_,				\
-	{ .value = { ._type_##_data = _val_ } },		\
+#define __PROPERTY_ENTRY_ELEMENT(_name_, _elem_, _Type_, _val_)		\
+(struct property_entry) {						\
+	.name = _name_,							\
+	.length = __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),		\
+	.type = DEV_PROP_##_Type_,					\
+	{ .value = { ._elem_ = _val_ } },				\
 }
 
-#define PROPERTY_ENTRY_U8(_name_, _val_)		\
-	__PROPERTY_ENTRY_INTEGER(_name_, u8, U8, _val_)
-#define PROPERTY_ENTRY_U16(_name_, _val_)		\
-	__PROPERTY_ENTRY_INTEGER(_name_, u16, U16, _val_)
-#define PROPERTY_ENTRY_U32(_name_, _val_)		\
-	__PROPERTY_ENTRY_INTEGER(_name_, u32, U32, _val_)
-#define PROPERTY_ENTRY_U64(_name_, _val_)		\
-	__PROPERTY_ENTRY_INTEGER(_name_, u64, U64, _val_)
-
-#define PROPERTY_ENTRY_STRING(_name_, _val_)		\
-(struct property_entry) {				\
-	.name = _name_,					\
-	.length = sizeof(const char *),			\
-	.type = DEV_PROP_STRING,			\
-	{ .value = { .str = _val_ } },			\
-}
+#define PROPERTY_ENTRY_U8(_name_, _val_)				\
+	__PROPERTY_ENTRY_ELEMENT(_name_, u8_data, U8, _val_)
+#define PROPERTY_ENTRY_U16(_name_, _val_)				\
+	__PROPERTY_ENTRY_ELEMENT(_name_, u16_data, U16, _val_)
+#define PROPERTY_ENTRY_U32(_name_, _val_)				\
+	__PROPERTY_ENTRY_ELEMENT(_name_, u32_data, U32, _val_)
+#define PROPERTY_ENTRY_U64(_name_, _val_)				\
+	__PROPERTY_ENTRY_ELEMENT(_name_, u64_data, U64, _val_)
+#define PROPERTY_ENTRY_STRING(_name_, _val_)				\
+	__PROPERTY_ENTRY_ELEMENT(_name_, str, STRING, _val_)
 
 #define PROPERTY_ENTRY_BOOL(_name_)		\
 (struct property_entry) {			\
-- 
2.23.0.866.gb869b98d4c-goog
