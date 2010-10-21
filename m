From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH 2/2] panasonic-laptop: Simplify calls to acpi_pcc_retrieve_biosdata
Date: Thu, 21 Oct 2010 11:50:47 +0200
Message-ID: <201010211150.47998.jdelvare@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45244 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756177Ab0JUJut (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Oct 2010 05:50:49 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Harald Welte <laforge@gnumonks.org>
Cc: platform-driver-x86@vger.kernel.org

From: Jean Delvare <jdelvare@suse.de>
Subject: panasonic-laptop: Simplify calls to acpi_pcc_retrieve_biosdata

Function acpi_pcc_retrieve_biosdata is always called with parameters
(pcc, pcc->sinf), so we can drop the second parameter. It was
dangerous to pass the sinf array separately anyway, as its length is
checked as pcc->num_sifr, which pretty much assumed it was pcc->sinf
(or at least had the same size.)

This change makes the code slightly more compact and thus marginally
faster.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Harald Welte <laforge@gnumonks.org>
---
Note: cleanup inspired by code inspection, I don't have the hardware so I
can't test.

 drivers/platform/x86/panasonic-laptop.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- linux-2.6.36.orig/drivers/platform/x86/panasonic-laptop.c	2010-10-21 11:18:23.000000000 +0200
+++ linux-2.6.36/drivers/platform/x86/panasonic-laptop.c	2010-10-21 11:35:52.000000000 +0200
@@ -267,7 +267,7 @@ static inline int acpi_pcc_get_sqty(stru
 	}
 }
 
-static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc, u32 *sinf)
+static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc)
 {
 	acpi_status status;
 	struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
@@ -299,12 +299,12 @@ static int acpi_pcc_retrieve_biosdata(st
 	for (i = 0; i < hkey->package.count; i++) {
 		union acpi_object *element = &(hkey->package.elements[i]);
 		if (likely(element->type == ACPI_TYPE_INTEGER)) {
-			sinf[i] = element->integer.value;
+			pcc->sinf[i] = element->integer.value;
 		} else
 			ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 					 "Invalid HKEY.SINF data\n"));
 	}
-	sinf[hkey->package.count] = -1;
+	pcc->sinf[hkey->package.count] = -1;
 
 end:
 	kfree(buffer.pointer);
@@ -322,7 +322,7 @@ static int bl_get(struct backlight_devic
 {
 	struct pcc_acpi *pcc = bl_get_data(bd);
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf))
+	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
 	return pcc->sinf[SINF_AC_CUR_BRIGHT];
@@ -334,7 +334,7 @@ static int bl_set_status(struct backligh
 	int bright = bd->props.brightness;
 	int rc;
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf))
+	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
 	if (bright < pcc->sinf[SINF_AC_MIN_BRIGHT])
@@ -368,7 +368,7 @@ static ssize_t show_numbatt(struct devic
 	struct acpi_device *acpi = to_acpi_device(dev);
 	struct pcc_acpi *pcc = acpi_driver_data(acpi);
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf))
+	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_NUM_BATTERIES]);
@@ -380,7 +380,7 @@ static ssize_t show_lcdtype(struct devic
 	struct acpi_device *acpi = to_acpi_device(dev);
 	struct pcc_acpi *pcc = acpi_driver_data(acpi);
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf))
+	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_LCD_TYPE]);
@@ -392,7 +392,7 @@ static ssize_t show_mute(struct device *
 	struct acpi_device *acpi = to_acpi_device(dev);
 	struct pcc_acpi *pcc = acpi_driver_data(acpi);
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf))
+	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_MUTE]);
@@ -404,7 +404,7 @@ static ssize_t show_sticky(struct device
 	struct acpi_device *acpi = to_acpi_device(dev);
 	struct pcc_acpi *pcc = acpi_driver_data(acpi);
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf))
+	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_STICKY_KEY]);
@@ -640,7 +640,7 @@ static int acpi_pcc_hotkey_add(struct ac
 		goto out_hotkey;
 	}
 
-	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf)) {
+	if (!acpi_pcc_retrieve_biosdata(pcc)) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 				 "Couldn't retrieve BIOS data\n"));
 		result = -EIO;

-- 
Jean Delvare
Suse L3
