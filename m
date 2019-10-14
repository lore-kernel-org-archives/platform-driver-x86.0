From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 00/14] software node: add support for reference
 properties
Date: Mon, 14 Oct 2019 16:57:47 -0700
Message-ID: <20191014235747.GA105649@dtor-ws>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191014073837.GI32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014073837.GI32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 14, 2019 at 10:38:37AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 11, 2019 at 04:07:07PM -0700, Dmitry Torokhov wrote:
> > These series implement "references" properties for software nodes as true
> > properties, instead of managing them completely separately.
> > 
> > The first 10 patches are generic cleanups and consolidation and
> > unification of the existing code; patch #11 implements moving of small
> > properties inline when copying property entries; patch #12 implements
> > PROPERTY_ENTRY_REF() and friends; patch #13 converts the user of
> > references to the property syntax, and patch #14 removes the remains of
> > references as entities that are managed separately.
> 
> Can we get some test cases?

Something like this? (I'll beef it up if we decide KUnit is OK for
this).

From 0b8256ceed44760e63becb5b9636099d9fc17a4c Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 14 Oct 2019 16:55:12 -0700
Subject: [PATCH] software node: add basic init tests

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/test/Makefile              |  2 +
 drivers/base/test/property-entry-test.c | 56 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 drivers/base/test/property-entry-test.c

diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index 0f1f7277a013..22143102e5d2 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TEST_ASYNC_DRIVER_PROBE)	+= test_async_driver_probe.o
+
+obj-$(CONFIG_KUNIT) += property-entry-test.o
diff --git a/drivers/base/test/property-entry-test.c b/drivers/base/test/property-entry-test.c
new file mode 100644
index 000000000000..cd6a405734a0
--- /dev/null
+++ b/drivers/base/test/property-entry-test.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+// Unit tests for property entries API
+//
+// Copyright 2019 Google LLC.
+
+#include <kunit/test.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+static void pe_test_move_inline_u8(struct kunit *test)
+{
+	u8 u8_array_small[8] = { 0 };
+	u8 u8_array_big[128] = { 0 };
+	struct property_entry entries[] = {
+		PROPERTY_ENTRY_U8_ARRAY("small", u8_array_small),
+		PROPERTY_ENTRY_U8_ARRAY("big", u8_array_big),
+		{ }
+	};
+	struct property_entry *copy;
+
+	copy = property_entries_dup(entries);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, copy);
+	KUNIT_EXPECT_TRUE(test, copy[0].is_inline);
+	KUNIT_EXPECT_FALSE(test, copy[1].is_inline);
+}
+
+static void pe_test_move_inline_str(struct kunit *test)
+{
+	char *str_array_small[] = { "a" };
+	char *str_array_big[] = { "a", "b", "c", "d" };
+	struct property_entry entries[] = {
+		PROPERTY_ENTRY_STRING_ARRAY("small", str_array_small),
+		PROPERTY_ENTRY_STRING_ARRAY("big", str_array_big),
+		{ }
+	};
+	struct property_entry *copy;
+
+	copy = property_entries_dup(entries);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, copy);
+	KUNIT_EXPECT_TRUE(test, copy[0].is_inline);
+	KUNIT_EXPECT_FALSE(test, copy[1].is_inline);
+}
+
+
+static struct kunit_case property_entry_test_cases[] = {
+	KUNIT_CASE(pe_test_move_inline_u8),
+	KUNIT_CASE(pe_test_move_inline_str),
+	{ }
+};
+
+static struct kunit_suite property_entry_test_suite = {
+	.name = "property-entry",
+	.test_cases = property_entry_test_cases,
+};
+
+kunit_test_suite(property_entry_test_suite);
-- 
2.23.0.700.g56cf767bdb-goog


-- 
Dmitry
