From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 10/13] software node: rename is_array to is_inline
Date: Mon,  9 Sep 2019 01:15:54 -0700
Message-ID: <20190909081557.93766-11-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We do not need a special flag to know if we are dealing with an array, as we can
get that data from ration between element length and the data size, however we
do need a flag to know whether the data is stored directly inside property_entry
or separately.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c    | 9 +++++----
 include/linux/property.h | 7 ++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 2dfeeab919d4..03643f55e5b5 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -108,7 +108,7 @@ static const void *property_get_pointer(const struct property_entry *prop)
 	if (!prop->length)
 		return NULL;
 
-	if (prop->is_array)
+	if (!prop->is_inline)
 		return prop->pointer.raw;
 
 	return &prop->value;
@@ -204,7 +204,7 @@ static void property_entry_free_data(const struct property_entry *p)
 	const void *pointer = property_get_pointer(p);
 	size_t i, nval;
 
-	if (p->is_array) {
+	if (!p->is_inline) {
 		if (p->type == DEV_PROP_STRING && p->pointer.str) {
 			nval = p->length / sizeof(const char *);
 			for (i = 0; i < nval; i++)
@@ -247,7 +247,7 @@ static int property_entry_copy_data(struct property_entry *dst,
 	const void *pointer = property_get_pointer(src);
 	const void *new;
 
-	if (src->is_array) {
+	if (!src->is_inline) {
 		if (!src->length)
 			return -ENODATA;
 
@@ -261,15 +261,16 @@ static int property_entry_copy_data(struct property_entry *dst,
 				return -ENOMEM;
 		}
 
-		dst->is_array = true;
 		dst->pointer.raw = new;
 	} else if (src->type == DEV_PROP_STRING) {
 		new = kstrdup(src->value.str, GFP_KERNEL);
 		if (!new && src->value.str)
 			return -ENOMEM;
 
+		dst->is_inline = true;
 		dst->value.str = new;
 	} else {
+		dst->is_inline = true;
 		dst->value = src->value;
 	}
 
diff --git a/include/linux/property.h b/include/linux/property.h
index 793d05cbc3b2..5180e23348d2 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -222,7 +222,8 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
  * struct property_entry - "Built-in" device property representation.
  * @name: Name of the property.
  * @length: Length of data making up the value.
- * @is_array: True when the property is an array.
+ * @is_inline: True when the property value is stored directly in
+ *	&struct property_entry instance.
  * @type: Type of the data in unions.
  * @pointer: Pointer to the property (an array of items of the given type).
  * @value: Value of the property (when it is a single item of the given type).
@@ -230,7 +231,7 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
 struct property_entry {
 	const char *name;
 	size_t length;
-	bool is_array;
+	bool is_inline;
 	enum dev_prop_type type;
 	union {
 		union {
@@ -264,7 +265,6 @@ struct property_entry {
 (struct property_entry) {						\
 	.name = _name_,							\
 	.length = ARRAY_SIZE(_val_) * PROPERTY_ENTRY_ELSIZE(_elem_),	\
-	.is_array = true,						\
 	.type = DEV_PROP_##_Type_,					\
 	.pointer._elem_ = _val_,					\
 }
@@ -304,6 +304,7 @@ struct property_entry {
 	.name = _name_,						\
 	.length = PROPERTY_ENTRY_ELSIZE(_elem_),		\
 	.type = DEV_PROP_##_Type_,				\
+	.is_inline = true,					\
 	.value._elem_ = _val_,					\
 }
 
-- 
2.23.0.187.g17f5b7556c-goog
