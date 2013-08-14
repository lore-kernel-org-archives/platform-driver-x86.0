From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] wmi: parse_wdg() should return kernel error codes
Date: Wed, 14 Aug 2013 12:02:30 +0300
Message-ID: <20130814090230.GA521@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The current code returns a mix of acpi_status and kernel error codes.
It should just return kernel error codes.  There are already error paths
in this function which return -ENOMEM and that's what the caller
expects.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index b13344c..f75ea69 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -778,7 +778,7 @@ static bool guid_already_parsed(const char *guid_string)
 /*
  * Parse the _WDG method for the GUID data blocks
  */
-static acpi_status parse_wdg(acpi_handle handle)
+static int parse_wdg(acpi_handle handle)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object *obj;
@@ -810,7 +810,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 
 		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
 		if (!wblock)
-			return AE_NO_MEMORY;
+			return -ENOMEM;
 
 		wblock->handle = handle;
 		wblock->gblock = gblock[i];
