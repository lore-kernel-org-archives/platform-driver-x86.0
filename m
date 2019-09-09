From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 06/13] software node: unify PROPERTY_ENTRY_XXX macros
Date: Mon,  9 Sep 2019 01:15:50 -0700
Message-ID: <20190909081557.93766-7-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We can unify string properties initializer macros with integer
initializers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/property.h | 70 +++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 4943b40d3536..911ace267247 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -257,57 +257,47 @@ struct property_entry {
  * and structs.
  */
 
-#define PROPERTY_ENTRY_INTEGER_ARRAY(_name_, _type_, _Type_, _val_)	\
+#define PROPERTY_ENTRY_ELSIZE(_elem_)					\
+	sizeof(*(((struct property_entry *)NULL)->pointer._elem_))
+
+#define PROPERTY_ENTRY_ARRAY(_name_, _elem_, _Type_, _val_)		\
 (struct property_entry) {						\
 	.name = _name_,							\
-	.length = ARRAY_SIZE(_val_) * sizeof(_type_),			\
+	.length = ARRAY_SIZE(_val_) * PROPERTY_ENTRY_ELSIZE(_elem_),	\
 	.is_array = true,						\
 	.type = DEV_PROP_##_Type_,					\
-	{ .pointer = { ._type_##_data = _val_ } },			\
+	.pointer._elem_ = _val_,					\
 }
 
-#define PROPERTY_ENTRY_U8_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u8, U8, _val_)
-#define PROPERTY_ENTRY_U16_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u16, U16, _val_)
-#define PROPERTY_ENTRY_U32_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u32, U32, _val_)
-#define PROPERTY_ENTRY_U64_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u64, U64, _val_)
-
-#define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)		\
+#define PROPERTY_ENTRY_U8_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_ARRAY(_name_, u8_data, U8, _val_)
+#define PROPERTY_ENTRY_U16_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_ARRAY(_name_, u16_data, U16, _val_)
+#define PROPERTY_ENTRY_U32_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_ARRAY(_name_, u32_data, U32, _val_)
+#define PROPERTY_ENTRY_U64_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_ARRAY(_name_, u64_data, U64, _val_)
+#define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)			\
+	PROPERTY_ENTRY_ARRAY(_name_, str, STRING, _val_)
+
+#define PROPERTY_ENTRY_ELEMENT(_name_, _elem_, _Type_, _val_)	\
 (struct property_entry) {					\
 	.name = _name_,						\
-	.length = ARRAY_SIZE(_val_) * sizeof(const char *),	\
-	.is_array = true,					\
-	.type = DEV_PROP_STRING,				\
-	{ .pointer = { .str = _val_ } },			\
-}
-
-#define PROPERTY_ENTRY_INTEGER(_name_, _type_, _Type_, _val_)	\
-(struct property_entry) {					\
-	.name = _name_,						\
-	.length = sizeof(_type_),				\
+	.length = PROPERTY_ENTRY_ELSIZE(_elem_),		\
 	.type = DEV_PROP_##_Type_,				\
-	{ .value = { ._type_##_data = _val_ } },		\
+	.value._elem_ = _val_,					\
 }
 
-#define PROPERTY_ENTRY_U8(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u8, U8, _val_)
-#define PROPERTY_ENTRY_U16(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u16, U16, _val_)
-#define PROPERTY_ENTRY_U32(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u32, U32, _val_)
-#define PROPERTY_ENTRY_U64(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u64, U64, _val_)
-
-#define PROPERTY_ENTRY_STRING(_name_, _val_)		\
-(struct property_entry) {				\
-	.name = _name_,					\
-	.length = sizeof(const char *),			\
-	.type = DEV_PROP_STRING,			\
-	{ .value = { .str = _val_ } },			\
-}
+#define PROPERTY_ENTRY_U8(_name_, _val_)			\
+	PROPERTY_ENTRY_ELEMENT(_name_, u8_data, U8, _val_)
+#define PROPERTY_ENTRY_U16(_name_, _val_)			\
+	PROPERTY_ENTRY_ELEMENT(_name_, u16_data, U16, _val_)
+#define PROPERTY_ENTRY_U32(_name_, _val_)			\
+	PROPERTY_ENTRY_ELEMENT(_name_, u32_data, U32, _val_)
+#define PROPERTY_ENTRY_U64(_name_, _val_)			\
+	PROPERTY_ENTRY_ELEMENT(_name_, u64_data, U64, _val_)
+#define PROPERTY_ENTRY_STRING(_name_, _val_)			\
+	PROPERTY_ENTRY_ELEMENT(_name_, str, STRING, _val_)
 
 #define PROPERTY_ENTRY_BOOL(_name_)		\
 (struct property_entry) {			\
-- 
2.23.0.187.g17f5b7556c-goog
