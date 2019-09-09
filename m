From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 08/13] software node: introduce PROPERTY_ENTRY_ARRAY_XXX_LEN()
Date: Mon,  9 Sep 2019 01:15:52 -0700
Message-ID: <20190909081557.93766-9-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
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
 include/linux/property.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 911ace267247..793d05cbc3b2 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -280,6 +280,25 @@ struct property_entry {
 #define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)			\
 	PROPERTY_ENTRY_ARRAY(_name_, str, STRING, _val_)
 
+#define PROPERTY_ENTRY_ARRAY_LEN(_name_, _elem_, _Type_, _val_, _len_)	\
+(struct property_entry) {						\
+	.name = _name_,							\
+	.length = (_len_) * PROPERTY_ENTRY_ELSIZE(_elem_),	\
+	.type = DEV_PROP_##_Type_,					\
+	.pointer._elem_ = _val_,					\
+}
+
+#define PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u8_data, U8, _val_, _len_)
+#define PROPERTY_ENTRY_U16_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u16_data, U16, _val_, _len_)
+#define PROPERTY_ENTRY_U32_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u32_data, U32, _val_, _len_)
+#define PROPERTY_ENTRY_U64_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, u64_data, U64, _val_, _len_)
+#define PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, _len_)		\
+	PROPERTY_ENTRY_ARRAY_LEN(_name_, str, STRING, _val_, _len_)
+
 #define PROPERTY_ENTRY_ELEMENT(_name_, _elem_, _Type_, _val_)	\
 (struct property_entry) {					\
 	.name = _name_,						\
-- 
2.23.0.187.g17f5b7556c-goog
