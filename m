From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 09/13] efi/apple-properties: use PROPERTY_ENTRY_U8_ARRAY_LEN
Date: Mon,  9 Sep 2019 01:15:53 -0700
Message-ID: <20190909081557.93766-10-dmitry.torokhov@gmail.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Let's switch to using PROPERTY_ENTRY_U8_ARRAY_LEN() to initialize
property entries instead of poking into the structure directly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/firmware/efi/apple-properties.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/apple-properties.c b/drivers/firmware/efi/apple-properties.c
index 0e206c9e0d7a..6a09174979b0 100644
--- a/drivers/firmware/efi/apple-properties.c
+++ b/drivers/firmware/efi/apple-properties.c
@@ -85,11 +85,9 @@ static void __init unmarshal_key_value_pairs(struct dev_header *dev_header,
 		ucs2_as_utf8(key, ptr + sizeof(key_len),
 			     key_len - sizeof(key_len));
 
-		entry[i].name = key;
-		entry[i].length = val_len - sizeof(val_len);
-		entry[i].is_array = !!entry[i].length;
-		entry[i].type = DEV_PROP_U8;
-		entry[i].pointer.u8_data = ptr + key_len + sizeof(val_len);
+		entry[i] = PROPERTY_ENTRY_U8_ARRAY_LEN(key,
+					ptr + key_len + sizeof(val_len),
+					val_len - sizeof(val_len));
 
 		if (dump_properties) {
 			dev_info(dev, "property: %s\n", entry[i].name);
-- 
2.23.0.187.g17f5b7556c-goog
