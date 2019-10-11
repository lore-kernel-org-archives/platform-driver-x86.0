From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v5 11/14] software node: move small properties inline when copying
Date: Fri, 11 Oct 2019 16:07:18 -0700
Message-ID: <20191011230721.206646-12-dmitry.torokhov@gmail.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When copying/duplicating set of properties, move smaller properties that
were stored separately directly inside property entry structures. We can
move:

- up to 8 bytes from U8 arrays
- up to 4 words
- up to 2 double words
- one U64 value
- one or 2 strings.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index ae4b24ee2a54..546fc1b20095 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -277,6 +277,16 @@ static int property_entry_copy_data(struct property_entry *dst,
 		dst->value = src->value;
 	}
 
+	if (!dst->is_inline && dst->length <= sizeof(dst->value)) {
+		/* We have an opportunity to move the data inline */
+		const void *tmp = dst->pointer;
+
+		memcpy(&dst->value, tmp, dst->length);
+		dst->is_inline = true;
+
+		kfree(tmp);
+	}
+
 	dst->length = src->length;
 	dst->type = src->type;
 	dst->name = kstrdup(src->name, GFP_KERNEL);
-- 
2.23.0.700.g56cf767bdb-goog
