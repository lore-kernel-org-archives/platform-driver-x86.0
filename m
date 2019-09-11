From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v4 02/14] software node: introduce PROPERTY_ENTRY_ARRAY_XXX_LEN()
Date: Tue, 10 Sep 2019 22:12:19 -0700
Message-ID: <20190911051231.148032-3-dmitry.torokhov@gmail.com>
References: <20190911051231.148032-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190911051231.148032-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Sometimes we want to initialize property entry array from a regular
pointer, when we can't determine length automatically via ARRAY_SIZE.
Let's introduce PROPERTY_ENTRY_ARRAY_XXX_LEN macros that take explicit
"len" argument.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/property.h | 45 +++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 44c1704f7163..f89b930ca4b7 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -256,33 +256,44 @@ struct property_entry {
  * and structs.
  */
 
-#define PROPERTY_ENTRY_INTEGER_ARRAY(_name_, _type_, _Type_, _val_)	\
+#define PROPERTY_ENTRY_ARRAY_LEN(_name_, _type_, _Type_, _val_, _len_)	\
 (struct property_entry) {						\
 	.name = _name_,							\
-	.length = ARRAY_SIZE(_val_) * sizeof(_type_),			\
+	.length = (_len_) * sizeof(_type_),				\
 	.is_array = true,						\
 	.type = DEV_PROP_##_Type_,					\
 	{ .pointer = { ._type_##_data = _val_ } },			\
 }
 
-#define PROPERTY_ENTRY_U8_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u8, U8, _val_)
-#define PROPERTY_ENTRY_U16_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u16, U16, _val_)
-#define PROPERTY_ENTRY_U32_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u32, U32, _val_)
-#define PROPERTY_ENTRY_U64_ARRAY(_name_, _val_)			\
-	PROPERTY_ENTRY_INTEGER_ARRAY(_name_, u64, U64, _val_)
+#define PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u8, U8, _val_, _len_)
+#define PROPERTY_ENTRY_U16_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u16, U16, _val_, _len_)
+#define PROPERTY_ENTRY_U32_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u32, U32, _val_, _len_)
+#define PROPERTY_ENTRY_U64_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u64, U64, _val_, _len_)
 
-#define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)		\
-(struct property_entry) {					\
-	.name = _name_,						\
-	.length = ARRAY_SIZE(_val_) * sizeof(const char *),	\
-	.is_array = true,					\
-	.type = DEV_PROP_STRING,				\
-	{ .pointer = { .str = _val_ } },			\
+#define PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, _len_)		\
+(struct property_entry) {						\
+	.name = _name_,							\
+	.length = (_len_) * sizeof(const char *),			\
+	.is_array = true,						\
+	.type = DEV_PROP_STRING,					\
+	{ .pointer = { .str = _val_ } },				\
 }
 
+#define PROPERTY_ENTRY_U8_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
+#define PROPERTY_ENTRY_U16_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_U16_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
+#define PROPERTY_ENTRY_U32_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_U32_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
+#define PROPERTY_ENTRY_U64_ARRAY(_name_, _val_)				\
+	PROPERTY_ENTRY_U64_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
+#define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)			\
+	PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
+
 #define PROPERTY_ENTRY_INTEGER(_name_, _type_, _Type_, _val_)	\
 (struct property_entry) {					\
 	.name = _name_,						\
-- 
2.23.0.162.g0b9fbb3734-goog
