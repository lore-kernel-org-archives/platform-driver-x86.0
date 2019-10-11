From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v5 12/14] software node: implement reference properties
Date: Fri, 11 Oct 2019 16:07:19 -0700
Message-ID: <20191011230721.206646-13-dmitry.torokhov@gmail.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

It is possible to store references to software nodes in the same fashion as
other static properties, so that users do not need to define separate
structures:

static const struct software_node gpio_bank_b_node = {
	.name = "B",
};

static const struct property_entry simone_key_enter_props[] = {
	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
	PROPERTY_ENTRY_STRING("label", "enter"),
	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
	{ }
};

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c    | 48 +++++++++++++++++++++++++++------
 include/linux/property.h | 57 +++++++++++++++++++++++++++++-----------
 2 files changed, 81 insertions(+), 24 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 546fc1b20095..a5b592a4e956 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -265,6 +265,12 @@ static int property_entry_copy_data(struct property_entry *dst,
 		}
 
 		dst->pointer = new;
+	} else if (src->type == DEV_PROP_REF) {
+		/*
+		 * Reference properties are never stored inline as
+		 * they are too big.
+		 */
+		return -EINVAL;
 	} else if (src->type == DEV_PROP_STRING) {
 		new = kstrdup(src->value.str, GFP_KERNEL);
 		if (!new && src->value.str)
@@ -460,21 +466,47 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 {
 	struct swnode *swnode = to_swnode(fwnode);
 	const struct software_node_reference *ref;
+	const struct software_node_ref_args *ref_array;
+	const struct software_node_ref_args *ref_args;
 	const struct property_entry *prop;
 	struct fwnode_handle *refnode;
 	int i;
 
-	if (!swnode || !swnode->node->references)
+	if (!swnode)
 		return -ENOENT;
 
-	for (ref = swnode->node->references; ref->name; ref++)
-		if (!strcmp(ref->name, propname))
-			break;
+	prop = property_entry_get(swnode->node->properties, propname);
+	if (prop) {
+		if (prop->type != DEV_PROP_REF)
+			return -EINVAL;
 
-	if (!ref->name || index > (ref->nrefs - 1))
-		return -ENOENT;
+		/*
+		 * We expect that references are never stored inline, even
+		 * single ones, as they are too big.
+		 */
+		if (prop->is_inline)
+			return -EINVAL;
+
+		if (index * sizeof(*ref_args) >= prop->length)
+			return -ENOENT;
+
+		ref_array = prop->pointer;
+		ref_args = &ref_array[index];
+	} else {
+		if (!swnode->node->references)
+			return -ENOENT;
+
+		for (ref = swnode->node->references; ref->name; ref++)
+			if (!strcmp(ref->name, propname))
+				break;
+
+		if (!ref->name || index > (ref->nrefs - 1))
+			return -ENOENT;
+
+		ref_args = &ref->refs[index];
+	}
 
-	refnode = software_node_fwnode(ref->refs[index].node);
+	refnode = software_node_fwnode(ref_args->node);
 	if (!refnode)
 		return -ENOENT;
 
@@ -493,7 +525,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)
-		args->args[i] = ref->refs[index].args[i];
+		args->args[i] = ref_args->args[i];
 
 	return 0;
 }
diff --git a/include/linux/property.h b/include/linux/property.h
index ac7823d58cfe..08d3e9d126ef 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -22,6 +22,7 @@ enum dev_prop_type {
 	DEV_PROP_U32,
 	DEV_PROP_U64,
 	DEV_PROP_STRING,
+	DEV_PROP_REF,
 };
 
 enum dev_dma_attr {
@@ -218,6 +219,20 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
 	return fwnode_property_read_u64_array(fwnode, propname, NULL, 0);
 }
 
+struct software_node;
+
+/**
+ * struct software_node_ref_args - Reference property with additional arguments
+ * @node: Reference to a software node
+ * @nargs: Number of elements in @args array
+ * @args: Integer arguments
+ */
+struct software_node_ref_args {
+	const struct software_node *node;
+	unsigned int nargs;
+	u64 args[NR_FWNODE_REFERENCE_ARGS];
+};
+
 /**
  * struct property_entry - "Built-in" device property representation.
  * @name: Name of the property.
@@ -255,14 +270,20 @@ struct property_entry {
 #define __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_)				\
 	sizeof(((struct property_entry *)NULL)->value._elem_)
 
-#define __PROPERTY_ENTRY_ARRAY_LEN(_name_, _elem_, _Type_, _val_, _len_)\
+#define __PROPERTY_ENTRY_ARRAY_ELSIZE_LEN(_name_, _elsize_, _Type_,	\
+					  _val_, _len_)			\
 (struct property_entry) {						\
 	.name = _name_,							\
-	.length = (_len_) * __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),	\
+	.length = (_len_) * (_elsize_),					\
 	.type = DEV_PROP_##_Type_,					\
 	{ .pointer = _val_ },						\
 }
 
+#define __PROPERTY_ENTRY_ARRAY_LEN(_name_, _elem_, _Type_, _val_, _len_)\
+	__PROPERTY_ENTRY_ARRAY_ELSIZE_LEN(_name_,			\
+				__PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),	\
+				_Type_, _val_, _len_)
+
 #define PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, _len_)		\
 	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u8_data, U8, _val_, _len_)
 #define PROPERTY_ENTRY_U16_ARRAY_LEN(_name_, _val_, _len_)		\
@@ -273,6 +294,10 @@ struct property_entry {
 	__PROPERTY_ENTRY_ARRAY_LEN(_name_, u64_data, U64, _val_, _len_)
 #define PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, _len_)		\
 	__PROPERTY_ENTRY_ARRAY_LEN(_name_, str, STRING, _val_, _len_)
+#define PROPERTY_ENTRY_REF_ARRAY_LEN(_name_, _val_, _len_)		\
+	__PROPERTY_ENTRY_ARRAY_ELSIZE_LEN(_name_,			\
+				sizeof(struct software_node_ref_args),	\
+				REF, _val_, _len_)
 
 #define PROPERTY_ENTRY_U8_ARRAY(_name_, _val_)				\
 	PROPERTY_ENTRY_U8_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
@@ -284,6 +309,8 @@ struct property_entry {
 	PROPERTY_ENTRY_U64_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
 #define PROPERTY_ENTRY_STRING_ARRAY(_name_, _val_)			\
 	PROPERTY_ENTRY_STRING_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
+#define PROPERTY_ENTRY_REF_ARRAY(_name_, _val_)			\
+	PROPERTY_ENTRY_REF_ARRAY_LEN(_name_, _val_, ARRAY_SIZE(_val_))
 
 #define __PROPERTY_ENTRY_ELEMENT(_name_, _elem_, _Type_, _val_)		\
 (struct property_entry) {						\
@@ -310,6 +337,18 @@ struct property_entry {
 	.name = _name_,				\
 }
 
+#define PROPERTY_ENTRY_REF(_name_, _ref_, ...)				\
+(struct property_entry) {						\
+	.name = _name_,							\
+	.length = sizeof(struct software_node_ref_args),		\
+	.type = DEV_PROP_REF,						\
+	{ .pointer = &(const struct software_node_ref_args) {		\
+		.node = _ref_,						\
+		.nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,	\
+		.args = { __VA_ARGS__ },				\
+	} },								\
+}
+
 struct property_entry *
 property_entries_dup(const struct property_entry *properties);
 
@@ -373,20 +412,6 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 /* -------------------------------------------------------------------------- */
 /* Software fwnode support - when HW description is incomplete or missing */
 
-struct software_node;
-
-/**
- * struct software_node_ref_args - Reference with additional arguments
- * @node: Reference to a software node
- * @nargs: Number of elements in @args array
- * @args: Integer arguments
- */
-struct software_node_ref_args {
-	const struct software_node *node;
-	unsigned int nargs;
-	u64 args[NR_FWNODE_REFERENCE_ARGS];
-};
-
 /**
  * struct software_node_reference - Named software node reference property
  * @name: Name of the property
-- 
2.23.0.700.g56cf767bdb-goog
