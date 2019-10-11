From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v5 03/14] efi/apple-properties: use PROPERTY_ENTRY_U8_ARRAY_LEN
Date: Fri, 11 Oct 2019 16:07:10 -0700
Message-ID: <20191011230721.206646-4-dmitry.torokhov@gmail.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Let's switch to using PROPERTY_ENTRY_U8_ARRAY_LEN() to initialize
property entries. Also, when dumping data, rely on local variables
instead of poking into the property entry structure directly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/firmware/efi/apple-properties.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/efi/apple-properties.c b/drivers/firmware/efi/apple-properties.c
index 0e206c9e0d7a..5ccf39986a14 100644
--- a/drivers/firmware/efi/apple-properties.c
+++ b/drivers/firmware/efi/apple-properties.c
@@ -53,7 +53,8 @@ static void __init unmarshal_key_value_pairs(struct dev_header *dev_header,
 
 	for (i = 0; i < dev_header->prop_count; i++) {
 		int remaining = dev_header->len - (ptr - (void *)dev_header);
-		u32 key_len, val_len;
+		u32 key_len, val_len, entry_len;
+		const u8 *entry_data;
 		char *key;
 
 		if (sizeof(key_len) > remaining)
@@ -85,17 +86,14 @@ static void __init unmarshal_key_value_pairs(struct dev_header *dev_header,
 		ucs2_as_utf8(key, ptr + sizeof(key_len),
 			     key_len - sizeof(key_len));
 
-		entry[i].name = key;
-		entry[i].length = val_len - sizeof(val_len);
-		entry[i].is_array = !!entry[i].length;
-		entry[i].type = DEV_PROP_U8;
-		entry[i].pointer.u8_data = ptr + key_len + sizeof(val_len);
-
+		entry_data = ptr + key_len + sizeof(val_len);
+		entry_len = val_len - sizeof(val_len);
+		entry[i] = PROPERTY_ENTRY_U8_ARRAY_LEN(key, entry_data,
+						       entry_len);
 		if (dump_properties) {
-			dev_info(dev, "property: %s\n", entry[i].name);
+			dev_info(dev, "property: %s\n", key);
 			print_hex_dump(KERN_INFO, pr_fmt(), DUMP_PREFIX_OFFSET,
-				16, 1, entry[i].pointer.u8_data,
-				entry[i].length, true);
+				16, 1, entry_data, entry_len, true);
 		}
 
 		ptr += key_len + val_len;
-- 
2.23.0.700.g56cf767bdb-goog
