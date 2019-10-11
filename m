From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v5 07/14] software node: remove property_entry_read_uNN_array functions
Date: Fri, 11 Oct 2019 16:07:14 -0700
Message-ID: <20191011230721.206646-8-dmitry.torokhov@gmail.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is absolutely no reason to have them as we can handle it all nicely in
property_entry_read_int_array().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c | 85 +++++++------------------------------------
 1 file changed, 14 insertions(+), 71 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 26e56dd66436..b11cc4dbff08 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -131,66 +131,6 @@ static const void *property_entry_find(const struct property_entry *props,
 	return pointer;
 }
 
-static int property_entry_read_u8_array(const struct property_entry *props,
-					const char *propname,
-					u8 *values, size_t nval)
-{
-	const void *pointer;
-	size_t length = nval * sizeof(*values);
-
-	pointer = property_entry_find(props, propname, length);
-	if (IS_ERR(pointer))
-		return PTR_ERR(pointer);
-
-	memcpy(values, pointer, length);
-	return 0;
-}
-
-static int property_entry_read_u16_array(const struct property_entry *props,
-					 const char *propname,
-					 u16 *values, size_t nval)
-{
-	const void *pointer;
-	size_t length = nval * sizeof(*values);
-
-	pointer = property_entry_find(props, propname, length);
-	if (IS_ERR(pointer))
-		return PTR_ERR(pointer);
-
-	memcpy(values, pointer, length);
-	return 0;
-}
-
-static int property_entry_read_u32_array(const struct property_entry *props,
-					 const char *propname,
-					 u32 *values, size_t nval)
-{
-	const void *pointer;
-	size_t length = nval * sizeof(*values);
-
-	pointer = property_entry_find(props, propname, length);
-	if (IS_ERR(pointer))
-		return PTR_ERR(pointer);
-
-	memcpy(values, pointer, length);
-	return 0;
-}
-
-static int property_entry_read_u64_array(const struct property_entry *props,
-					 const char *propname,
-					 u64 *values, size_t nval)
-{
-	const void *pointer;
-	size_t length = nval * sizeof(*values);
-
-	pointer = property_entry_find(props, propname, length);
-	if (IS_ERR(pointer))
-		return PTR_ERR(pointer);
-
-	memcpy(values, pointer, length);
-	return 0;
-}
-
 static int
 property_entry_count_elems_of_size(const struct property_entry *props,
 				   const char *propname, size_t length)
@@ -209,21 +149,24 @@ static int property_entry_read_int_array(const struct property_entry *props,
 					 unsigned int elem_size, void *val,
 					 size_t nval)
 {
+	const void *pointer;
+	size_t length;
+
 	if (!val)
 		return property_entry_count_elems_of_size(props, name,
 							  elem_size);
-	switch (elem_size) {
-	case sizeof(u8):
-		return property_entry_read_u8_array(props, name, val, nval);
-	case sizeof(u16):
-		return property_entry_read_u16_array(props, name, val, nval);
-	case sizeof(u32):
-		return property_entry_read_u32_array(props, name, val, nval);
-	case sizeof(u64):
-		return property_entry_read_u64_array(props, name, val, nval);
-	}
 
-	return -ENXIO;
+	if (!is_power_of_2(elem_size) || elem_size > sizeof(u64))
+		return -ENXIO;
+
+	length = nval * elem_size;
+
+	pointer = property_entry_find(props, name, length);
+	if (IS_ERR(pointer))
+		return PTR_ERR(pointer);
+
+	memcpy(val, pointer, length);
+	return 0;
 }
 
 static int property_entry_read_string_array(const struct property_entry *props,
-- 
2.23.0.700.g56cf767bdb-goog
