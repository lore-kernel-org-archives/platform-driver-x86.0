From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: fix lg-laptop.rst warnings
Date: Sun, 10 Feb 2019 22:30:49 -0800
Message-ID: <16ce109c-69a3-1f27-7fd4-9b99c9780565@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Matan Ziv-Av <matan@svgalib.org>, platform-driver-x86@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix markup warnings by inserting blank lines.
Also correct one typo.

Documentation/laptops/lg-laptop.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
Documentation/laptops/lg-laptop.rst:16: WARNING: Unexpected indentation.
Documentation/laptops/lg-laptop.rst:17: WARNING: Block quote ends without a blank line; unexpected unindent.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Matan Ziv-Av <matan@svgalib.org>
Cc: platform-driver-x86@vger.kernel.org
---
 Documentation/laptops/lg-laptop.rst |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- lnx-50-rc6.orig/Documentation/laptops/lg-laptop.rst
+++ lnx-50-rc6/Documentation/laptops/lg-laptop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0+
+
 LG Gram laptop extra features
 =============================
 
@@ -9,6 +10,7 @@ Hotkeys
 -------
 
 The following FN keys are ignored by the kernel without this driver:
+
 - FN-F1 (LG control panel)   - Generates F15
 - FN-F5 (Touchpad toggle)    - Generates F13
 - FN-F6 (Airplane mode)      - Generates RFKILL
@@ -16,7 +18,7 @@ The following FN keys are ignored by the
   This key also changes keyboard backlight mode.
 - FN-F9 (Reader mode)        - Generates F14
 
-The rest of the FN key work without a need for a special driver.
+The rest of the FN keys work without a need for a special driver.
 
 
 Reader mode
