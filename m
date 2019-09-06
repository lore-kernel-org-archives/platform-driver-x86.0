From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 1/3] software node: implement reference properties
Date: Thu,  5 Sep 2019 21:38:07 -0700
Message-ID: <20190906043809.18990-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

It is possible to store references to software nodes in the same fashion as
other static properties, so that users do not need to define separate
structures:

const struct software_node gpio_bank_b_node = {
	.name = "B",
};

const struct property_entry simone_key_enter_props[] __initconst = {
	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
	PROPERTY_ENTRY_STRING("label", "enter"),
	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
	{ }
};

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c    | 34 +++++++++++++++++++------
 include/linux/property.h | 54 +++++++++++++++++++++++++++++-----------
 2 files changed, 65 insertions(+), 23 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index e7b3aa3bd55a..01325705b8e4 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -568,21 +568,39 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 {
 	struct swnode *swnode = to_swnode(fwnode);
 	const struct software_node_reference *ref;
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
+		if (index * sizeof(*ref_args) >= prop->length)
+			return -ENOENT;
+
+		ref_args = prop->is_array ?
+				&prop->pointer.ref[index] : &prop->value.ref;
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
 
@@ -601,7 +619,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)
-		args->args[i] = ref->refs[index].args[i];
+		args->args[i] = ref_args->args[i];
 
 	return 0;
 }
diff --git a/include/linux/property.h b/include/linux/property.h
index 5a910ad79591..b25440344743 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -22,7 +22,8 @@ enum dev_prop_type {
 	DEV_PROP_U32,
 	DEV_PROP_U64,
 	DEV_PROP_STRING,
-	DEV_PROP_MAX,
+	DEV_PROP_REF,
+	DEV_PROP_MAX
 };
 
 enum dev_dma_attr {
@@ -219,6 +220,20 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
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
@@ -240,6 +255,7 @@ struct property_entry {
 			const u32 *u32_data;
 			const u64 *u64_data;
 			const char * const *str;
+			const struct software_node_ref_args *ref;
 		} pointer;
 		union {
 			u8 u8_data;
@@ -247,6 +263,7 @@ struct property_entry {
 			u32 u32_data;
 			u64 u64_data;
 			const char *str;
+			struct software_node_ref_args ref;
 		} value;
 	};
 };
@@ -284,6 +301,16 @@ struct property_entry {
 	{ .pointer = { .str = _val_ } },			\
 }
 
+#define PROPERTY_ENTRY_REF_ARRAY(_name_, _val_)			\
+(struct property_entry) {					\
+	.name = _name_,						\
+	.length = ARRAY_SIZE(_val_) *				\
+			sizeof(struct software_node_ref_args),	\
+	.is_array = true,					\
+	.type = DEV_PROP_REF,					\
+	.pointer.ref = _val_,					\
+}
+
 #define PROPERTY_ENTRY_INTEGER(_name_, _type_, _Type_, _val_)	\
 (struct property_entry) {					\
 	.name = _name_,						\
@@ -314,6 +341,17 @@ struct property_entry {
 	.name = _name_,				\
 }
 
+#define PROPERTY_ENTRY_REF(_name_, _ref_, ...)			\
+(struct property_entry) {					\
+	.name = _name_,						\
+	.length = sizeof(struct software_node_ref_args),	\
+	.type = DEV_PROP_REF,					\
+	.value.ref.node = _ref_,				\
+	.value.ref.nargs =					\
+		ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,	\
+	.value.ref.args = { __VA_ARGS__ },			\
+}
+
 struct property_entry *
 property_entries_dup(const struct property_entry *properties);
 
@@ -377,20 +415,6 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
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
2.23.0.187.g17f5b7556c-goog
