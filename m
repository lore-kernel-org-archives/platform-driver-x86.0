From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v6 04/15] software node: mark internal macros with double underscores
Date: Wed, 23 Oct 2019 13:02:22 -0700
Message-ID: <20191023200233.86616-5-dmitry.torokhov@gmail.com>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Let's mark PROPERTY_ENTRY_* macros that are internal with double leading
underscores so users are not tempted to use them.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/property.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index fad2e83a207c..d6019bacd848 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -261,7 +261,7 @@ struct property_entry {
  * and structs.
  */
 
-#define PROPERTY_ENTRY_ARRAY_LEN(_name_, _type_, _Type_, _val_, _len_)	\
+#define __PROPERTY_ENTRY_ARRAY_LEN(_name_, _type_, _Type_, _val_, _len_)\
 (struct property_entry) {						\
 	.name = _name_,							\
 	.length = (_len_) * sizeof(_type_),				\
@@ -271,13 +271,13 @@ struct property_entry {
 }
 
 #define PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, _len_)		\
-	PROPERTY_ENTRY_ARRAY_LEN(_name_, u8, U8, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u8, U8, _val_, _len_)
 #define PROPERTY_ENTRY_U16_ARRAY_LEN(_name_, _val_, _len_)		\
-	PROPERTY_ENTRY_ARRAY_LEN(_name_, u16, U16, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u16, U16, _val_, _len_)
 #define PROPERTY_ENTRY_U32_ARRAY_LEN(_name_, _val_, _len_)		\
-	PROPERTY_ENTRY_ARRAY_LEN(_name_, u32, U32, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u32, U32, _val_, _len_)
 #define PROPERTY_ENTRY_U64_ARRAY_LEN(_name_, _val_, _len_)		\
-	PROPERTY_ENTRY_ARRAY_LEN(_name_, u64, U64, _val_, _len_)
+	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u64, U64, _val_, _len_)
 
 #define PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, _len_)		\
 (struct property_entry) {						\
@@ -299,7 +299,7 @@ struct property_entry {
 #define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)			\
 	PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
 
-#define PROPERTY_ENTRY_INTEGER(_name_, _type_, _Type_, _val_)	\
+#define __PROPERTY_ENTRY_INTEGER(_name_, _type_, _Type_, _val_)	\
 (struct property_entry) {					\
 	.name = _name_,						\
 	.length = sizeof(_type_),				\
@@ -308,13 +308,13 @@ struct property_entry {
 }
 
 #define PROPERTY_ENTRY_U8(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u8, U8, _val_)
+	__PROPERTY_ENTRY_INTEGER(_name_, u8, U8, _val_)
 #define PROPERTY_ENTRY_U16(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u16, U16, _val_)
+	__PROPERTY_ENTRY_INTEGER(_name_, u16, U16, _val_)
 #define PROPERTY_ENTRY_U32(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u32, U32, _val_)
+	__PROPERTY_ENTRY_INTEGER(_name_, u32, U32, _val_)
 #define PROPERTY_ENTRY_U64(_name_, _val_)		\
-	PROPERTY_ENTRY_INTEGER(_name_, u64, U64, _val_)
+	__PROPERTY_ENTRY_INTEGER(_name_, u64, U64, _val_)
 
 #define PROPERTY_ENTRY_STRING(_name_, _val_)		\
 (struct property_entry) {				\
-- 
2.23.0.866.gb869b98d4c-goog
