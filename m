From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v6 09/15] software node: simplify property_entry_read_string_array()
Date: Wed, 23 Oct 2019 13:02:27 -0700
Message-ID: <20191023200233.86616-10-dmitry.torokhov@gmail.com>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is no need to treat string arrays and single strings separately, we can go
exclusively by the element length in relation to data type size.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index f59dfd01725f..d8d0dc0ca5ac 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -173,28 +173,21 @@ static int property_entry_read_string_array(const struct property_entry *props,
 					    const char *propname,
 					    const char **strings, size_t nval)
 {
-	const struct property_entry *prop;
 	const void *pointer;
-	size_t array_len, length;
+	size_t length;
+	int array_len;
 
 	/* Find out the array length. */
-	prop = property_entry_get(props, propname);
-	if (!prop)
-		return -EINVAL;
-
-	if (prop->is_array)
-		/* Find the length of an array. */
-		array_len = property_entry_count_elems_of_size(props, propname,
-							  sizeof(const char *));
-	else
-		/* The array length for a non-array string property is 1. */
-		array_len = 1;
+	array_len = property_entry_count_elems_of_size(props, propname,
+						       sizeof(const char *));
+	if (array_len < 0)
+		return array_len;
 
 	/* Return how many there are if strings is NULL. */
 	if (!strings)
 		return array_len;
 
-	array_len = min(nval, array_len);
+	array_len = min_t(size_t, nval, array_len);
 	length = array_len * sizeof(*strings);
 
 	pointer = property_entry_find(props, propname, length);
-- 
2.23.0.866.gb869b98d4c-goog
