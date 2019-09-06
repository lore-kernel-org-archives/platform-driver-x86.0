From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 3/3] software node: remove separate handling of references
Date: Thu,  5 Sep 2019 21:38:09 -0700
Message-ID: <20190906043809.18990-3-dmitry.torokhov@gmail.com>
References: <20190906043809.18990-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906043809.18990-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Now that all users of references have moved to reference properties,
we can remove separate handling of references.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c    | 31 +++++++++----------------------
 include/linux/property.h | 26 ++++++--------------------
 2 files changed, 15 insertions(+), 42 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 01325705b8e4..21771b29b641 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -568,7 +568,6 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 {
 	struct swnode *swnode = to_swnode(fwnode);
 	const struct software_node_reference *ref;
-	const struct software_node_ref_args *ref_args;
 	const struct property_entry *prop;
 	struct fwnode_handle *refnode;
 	int i;
@@ -577,30 +576,18 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -ENOENT;
 
 	prop = property_entry_get(swnode->node->properties, propname);
-	if (prop) {
-		if (prop->type != DEV_PROP_REF)
-			return -EINVAL;
-
-		if (index * sizeof(*ref_args) >= prop->length)
-			return -ENOENT;
-
-		ref_args = prop->is_array ?
-				&prop->pointer.ref[index] : &prop->value.ref;
-	} else {
-		if (!swnode->node->references)
-			return -ENOENT;
+	if (!prop)
+		return -ENOENT;
 
-		for (ref = swnode->node->references; ref->name; ref++)
-			if (!strcmp(ref->name, propname))
-				break;
+	if (prop->type != DEV_PROP_REF)
+		return -EINVAL;
 
-		if (!ref->name || index > (ref->nrefs - 1))
-			return -ENOENT;
+	if (index * sizeof(*ref) >= prop->length)
+		return -ENOENT;
 
-		ref_args = &ref->refs[index];
-	}
+	ref = prop->is_array ? &prop->pointer.ref[index] : &prop->value.ref;
 
-	refnode = software_node_fwnode(ref_args->node);
+	refnode = software_node_fwnode(ref->node);
 	if (!refnode)
 		return -ENOENT;
 
@@ -619,7 +606,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)
-		args->args[i] = ref_args->args[i];
+		args->args[i] = ref->args[i];
 
 	return 0;
 }
diff --git a/include/linux/property.h b/include/linux/property.h
index b25440344743..005b90d9e608 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -223,12 +223,12 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
 struct software_node;
 
 /**
- * struct software_node_ref_args - Reference property with additional arguments
+ * struct software_node_reference - Named software node reference property
  * @node: Reference to a software node
  * @nargs: Number of elements in @args array
  * @args: Integer arguments
  */
-struct software_node_ref_args {
+struct software_node_reference {
 	const struct software_node *node;
 	unsigned int nargs;
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
@@ -255,7 +255,7 @@ struct property_entry {
 			const u32 *u32_data;
 			const u64 *u64_data;
 			const char * const *str;
-			const struct software_node_ref_args *ref;
+			const struct software_node_reference *ref;
 		} pointer;
 		union {
 			u8 u8_data;
@@ -263,7 +263,7 @@ struct property_entry {
 			u32 u32_data;
 			u64 u64_data;
 			const char *str;
-			struct software_node_ref_args ref;
+			struct software_node_reference ref;
 		} value;
 	};
 };
@@ -305,7 +305,7 @@ struct property_entry {
 (struct property_entry) {					\
 	.name = _name_,						\
 	.length = ARRAY_SIZE(_val_) *				\
-			sizeof(struct software_node_ref_args),	\
+			sizeof(struct software_node_reference),	\
 	.is_array = true,					\
 	.type = DEV_PROP_REF,					\
 	.pointer.ref = _val_,					\
@@ -344,7 +344,7 @@ struct property_entry {
 #define PROPERTY_ENTRY_REF(_name_, _ref_, ...)			\
 (struct property_entry) {					\
 	.name = _name_,						\
-	.length = sizeof(struct software_node_ref_args),	\
+	.length = sizeof(struct software_node_reference),	\
 	.type = DEV_PROP_REF,					\
 	.value.ref.node = _ref_,				\
 	.value.ref.nargs =					\
@@ -415,30 +415,16 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 /* -------------------------------------------------------------------------- */
 /* Software fwnode support - when HW description is incomplete or missing */
 
-/**
- * struct software_node_reference - Named software node reference property
- * @name: Name of the property
- * @nrefs: Number of elements in @refs array
- * @refs: Array of references with optional arguments
- */
-struct software_node_reference {
-	const char *name;
-	unsigned int nrefs;
-	const struct software_node_ref_args *refs;
-};
-
 /**
  * struct software_node - Software node description
  * @name: Name of the software node
  * @parent: Parent of the software node
  * @properties: Array of device properties
- * @references: Array of software node reference properties
  */
 struct software_node {
 	const char *name;
 	const struct software_node *parent;
 	const struct property_entry *properties;
-	const struct software_node_reference *references;
 };
 
 bool is_software_node(const struct fwnode_handle *fwnode);
-- 
2.23.0.187.g17f5b7556c-goog
