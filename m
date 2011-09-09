From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 4/14] sony-laptop: add new ACPI SN06 method helper
 functions
Date: Fri, 09 Sep 2011 18:45:30 +0200
Message-ID: <1315586730.3613.85.camel@vesuvio>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:48588 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755249Ab1IIQpd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Sep 2011 12:45:33 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

SN06 method related code moved from sony_nc_rfkill_setup to
acpi_callsetfunc_buffer; a new helper sony_call_snc_handle_buffer is
added too, to be used by different handles that need it and not just the
rfkill handles.

Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -744,6 +744,72 @@ static int acpi_callsetfunc(acpi_handle 
 	return -1;
 }
 
+static int acpi_callsetfunc_buffer(acpi_handle handle, u64 value,
+					u8 array[], unsigned int size)
+{
+	u8 buffer[sizeof(value)];
+	int length = -1;
+	struct acpi_object_list params;
+	union acpi_object in_obj;
+	union acpi_object *values;
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	acpi_status status;
+
+	if (!array || !size)
+		return length;
+
+	/* use a buffer type as parameter to overcome any 32 bits ACPI limit
*/
+	memcpy(buffer, &value, sizeof(buffer));
+
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_BUFFER;
+	in_obj.buffer.length = sizeof(buffer);
+	in_obj.buffer.pointer = buffer;
+
+	/* since SN06 is the only known method returning a buffer we
+	 * can hard code it, it is not necessary to have a parameter
+	 */
+	status = acpi_evaluate_object(sony_nc_acpi_handle, "SN06", &params,
+			&output);
+	values = (union acpi_object *) output.pointer;
+	if (ACPI_FAILURE(status) || !values) {
+		dprintk("acpi_evaluate_object failed\n");
+		goto error;
+	}
+
+	/* some buggy DSDTs return integer when the output does
+	   not execede the 4 bytes size
+	*/
+	if (values->type == ACPI_TYPE_BUFFER) {
+		if (values->buffer.length <= 0)
+			goto error;
+
+		length = size > values->buffer.length ?
+			values->buffer.length : size;
+
+		memcpy(array, values->buffer.pointer, length);
+	} else if (values->type == ACPI_TYPE_INTEGER) {
+		u32 result = values->integer.value;
+		if (size < 4)
+			goto error;
+
+		length = 0;
+		while (length != 4) {
+			array[length] = result & 0xff;
+			result >>= 8;
+			length++;
+		}
+	} else {
+		pr_err("Invalid return object 0x%.2x\n", values->type);
+		goto error;
+	}
+
+error:
+	kfree(output.pointer);
+	return length;
+}
+
 struct sony_nc_handles {
 	u16 cap[0x10];
 	struct device_attribute devattr;
@@ -848,6 +914,24 @@ static int sony_call_snc_handle(unsigned
 	return ret;
 }
 
+/* call command method SN06, accepts a wide input buffer, returns a
buffer */
+static int sony_call_snc_handle_buffer(unsigned int handle, u64
argument,
+					u8 result[], unsigned int size)
+{
+	int ret = 0;
+	int offset = sony_find_snc_handle(handle);
+
+	if (offset < 0)
+		return -1;
+
+	ret = acpi_callsetfunc_buffer(sony_nc_acpi_handle,
+			offset | argument, result, size);
+	dprintk("called SN06 with 0x%.4llx (%u bytes read)\n",
+			offset | argument, ret);
+
+	return ret;
+}
+
 /*
  * sony_nc_values input/output validate functions
  */
@@ -1300,21 +1384,17 @@ static void sony_nc_rfkill_update(void)
 	}
 }
 
-static void sony_nc_rfkill_setup(struct acpi_device *device)
+static int sony_nc_rfkill_setup(struct acpi_device *device)
 {
+#define	RFKILL_BUFF_SIZE 8
+	u8 dev_code, i, buff[RFKILL_BUFF_SIZE] = { 0 };
 	int offset;
-	u8 dev_code, i;
-	acpi_status status;
-	struct acpi_object_list params;
-	union acpi_object in_obj;
-	union acpi_object *device_enum;
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 
 	offset = sony_find_snc_handle(0x124);
 	if (offset == -1) {
 		offset = sony_find_snc_handle(0x135);
 		if (offset == -1)
-			return;
+			return 0;
 		else
 			sony_rfkill_handle = 0x135;
 	} else
@@ -1324,34 +1404,16 @@ static void sony_nc_rfkill_setup(struct 
 	/* need to read the whole buffer returned by the acpi call to SN06
 	 * here otherwise we may miss some features
 	 */
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = offset;
-	status = acpi_evaluate_object(sony_nc_acpi_handle, "SN06", &params,
-			&buffer);
-	if (ACPI_FAILURE(status)) {
-		dprintk("Radio device enumeration failed\n");
-		return;
-	}
-
-	device_enum = (union acpi_object *) buffer.pointer;
-	if (!device_enum) {
-		pr_err("No SN06 return object\n");
-		goto out_no_enum;
-	}
-	if (device_enum->type != ACPI_TYPE_BUFFER) {
-		pr_err("Invalid SN06 return object 0x%.2x\n",
-		       device_enum->type);
-		goto out_no_enum;
-	}
+	if (sony_call_snc_handle_buffer(sony_rfkill_handle, 0x000,
+					buff, RFKILL_BUFF_SIZE) < 0)
+		return -EIO;
 
 	/* the buffer is filled with magic numbers describing the devices
 	 * available, 0xff terminates the enumeration
 	 */
-	for (i = 0; i < device_enum->buffer.length; i++) {
+	for (i = 0; i < RFKILL_BUFF_SIZE; i++) {
 
-		dev_code = *(device_enum->buffer.pointer + i);
+		dev_code = buff[i];
 		if (dev_code == 0xff)
 			break;
 
@@ -1371,9 +1433,7 @@ static void sony_nc_rfkill_setup(struct 
 			sony_nc_setup_rfkill(device, SONY_WIMAX);
 	}
 
-out_no_enum:
-	kfree(buffer.pointer);
-	return;
+	return 0;
 }
 
 /* Keyboard backlight feature */
