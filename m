From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v6 05/15] software node: clean up property_copy_string_array()
Date: Wed, 23 Oct 2019 13:02:23 -0700
Message-ID: <20191023200233.86616-6-dmitry.torokhov@gmail.com>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Because property_copy_string_array() stores the newly allocated pointer in the
destination property, we have an awkward code in property_entry_copy_data()
where we fetch the new pointer from dst.

Let's change property_copy_string_array() to return pointer and rely on the
common path in property_entry_copy_data() to store it in destination structure.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 12ca439bab30..f41692e0f63b 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -337,8 +337,8 @@ static void property_entry_free_data(const struct property_entry *p)
 	kfree(p->name);
 }
 
-static int property_copy_string_array(struct property_entry *dst,
-				      const struct property_entry *src)
+static const char * const *
+property_copy_string_array(const struct property_entry *src)
 {
 	const char **d;
 	size_t nval = src->length / sizeof(*d);
@@ -346,7 +346,7 @@ static int property_copy_string_array(struct property_entry *dst,
 
 	d = kcalloc(nval, sizeof(*d), GFP_KERNEL);
 	if (!d)
-		return -ENOMEM;
+		return NULL;
 
 	for (i = 0; i < nval; i++) {
 		d[i] = kstrdup(src->pointer.str[i], GFP_KERNEL);
@@ -354,12 +354,11 @@ static int property_copy_string_array(struct property_entry *dst,
 			while (--i >= 0)
 				kfree(d[i]);
 			kfree(d);
-			return -ENOMEM;
+			return NULL;
 		}
 	}
 
-	dst->pointer.str = d;
-	return 0;
+	return d;
 }
 
 static int property_entry_copy_data(struct property_entry *dst,
@@ -367,17 +366,15 @@ static int property_entry_copy_data(struct property_entry *dst,
 {
 	const void *pointer = property_get_pointer(src);
 	const void *new;
-	int error;
 
 	if (src->is_array) {
 		if (!src->length)
 			return -ENODATA;
 
 		if (src->type == DEV_PROP_STRING) {
-			error = property_copy_string_array(dst, src);
-			if (error)
-				return error;
-			new = dst->pointer.str;
+			new = property_copy_string_array(src);
+			if (!new)
+				return -ENOMEM;
 		} else {
 			new = kmemdup(pointer, src->length, GFP_KERNEL);
 			if (!new)
-- 
2.23.0.866.gb869b98d4c-goog
