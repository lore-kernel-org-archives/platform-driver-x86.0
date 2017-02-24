From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/4] platform/x86: intel-hid: simplify enabling/disabling HID events
Date: Fri, 24 Feb 2017 11:33:06 +0100
Message-ID: <20170224103309.19463-2-kernel@kempniu.pl>
References: <20170224103309.19463-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34713 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751129AbdBXKdp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 05:33:45 -0500
Received: by mail-lf0-f67.google.com with SMTP id x142so292158lfd.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Feb 2017 02:33:16 -0800 (PST)
In-Reply-To: <20170224103309.19463-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

ACPI method HDSM takes a single integer argument.  Use
acpi_execute_simple_method() instead of acpi_evaluate_object() for
calling that ACPI method to simplify code and reduce the number of local
variables inside intel_hid_set_enable().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/intel-hid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index bcf438f38781..4d1c5eb3a96d 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -79,12 +79,10 @@ struct intel_hid_priv {
 
 static int intel_hid_set_enable(struct device *device, int enable)
 {
-	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
-	struct acpi_object_list args = { 1, &arg0 };
 	acpi_status status;
 
-	arg0.integer.value = enable;
-	status = acpi_evaluate_object(ACPI_HANDLE(device), "HDSM", &args, NULL);
+	status = acpi_execute_simple_method(ACPI_HANDLE(device), "HDSM",
+					    enable);
 	if (ACPI_FAILURE(status)) {
 		dev_warn(device, "failed to %sable hotkeys\n",
 			 enable ? "en" : "dis");
-- 
2.11.1
