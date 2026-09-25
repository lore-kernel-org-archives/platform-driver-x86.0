Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896504E06D2
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352076; cv=none; b=qY+UIkC8mgtPqaCVet5TseRR6k4s6cmLMILI1S94pJjrf9xETEg2ayojUD41P6rUQB1FgK+3g+auziLq/GmaWywnWS3AQ560s8qHnf13X3sKXpAPZX13YuVedDpJgd/0xRkifZi+yH02g0XRieKx8YQaJEzwA5DCvcvycLVD5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352076; c=relaxed/simple;
	bh=EuXZBMFhOjnyUpWBsU8j36nNckggbOYify0Nw+7Zqxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCz8/8M2+zsHGH2BU4C9gIH+azMPBYyMavbt4+DkqlRHctt/Qt+9kna+jE9StFTOPEAr1IPbj0PiqcX0BDHFZPqCLAfLHiDMdARmQoXHP0QGF0elwqMa5vned2ER2lOAH5jn/obMN5sb7MrH6NH0/vCxBULoYlH0jfT7k52kK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=lJZKU/ey; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PxMUDJEQ; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="lJZKU/ey";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PxMUDJEQ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 02F821D0004E;
	Fri, 25 Sep 2026 12:01:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 12:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790352072; x=
	1790438472; bh=045UL+sehXbCCvqmN7upf1pB5Gm5JxphRScFV/D4680=; b=l
	JZKU/eyql+nQQbr8f3X3iJ6FaiIx7KKliZhkJjraDi6b9lO3OfHczsCxpMI4OSd1
	/qUzlWMNXwKqkhcVIVpH2feQ+hMMdne7eZUHed3FUxc+eTaHBd4uVsS/F2p55l24
	01l7Jmb4rEwJoSYJxVhGOBkAeJJbiPkyMd+mReolNMTwBc3+XmTGHM1fW26AG9va
	ZjBcsQQCjWaDrmaxt534RZjEYPFBWz27hcee3QYU615OG8j5cdyaLFIjXHvk8SxA
	R7a5rDvT/mgBa1Yp+3tIR39fYTTLE82kr8nS+ZC2JUTNm6LBhhxYwWKWDqWWn+wO
	HzYwLEgqMsnFdXGDWa14Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790352072; x=1790438472; bh=0
	45UL+sehXbCCvqmN7upf1pB5Gm5JxphRScFV/D4680=; b=PxMUDJEQBLXnK+nte
	xUtmKB8MudWivRtSXH0ndWS5r/YtsqunjppTmt/bsEXDMCgW1lFUIVl9YQWBCIvK
	rPNuMzKW/axJWhpGn5WgFPR2M/QOrPFQXa0RN/l30QMS8eKJikP7l3XmGs23fvL6
	L5GjVuKUxOtMWB5dCxDXBBN2bw0bZ1yx2+HhOSUgN3x4HiErZ3lKTnENxOx6Q5MM
	FCJN1Hl9GSfUYD0aagjTctXIVpuUK0kRW82pMbM4sYgeNBBceU6H8wVnJuUvJ28M
	C9nPKQl/gTQILjisVWUv2zlZwnZnjlG9Fu8YrXWsTrd3+mJ30g9/OFpvDU3Quo5D
	QZzsQ==
X-ME-Sender: <xms:yJq2auubc17_WxTg3T4lVsf7vg1kV7VEzBGOFZ7zL284OtSDpxiMmg>
    <xme:yJq2atei2xCtUQHkw5pckcC246obrJz_QhbqeqBij1rn4vPYiSon1pr0bWspRzw07
    ZRQldo8rY7u2tOIY_mGTmZtuoS1_O5ZDP7GXnvs9ase4FPoHYHlZfXT>
X-ME-Received: <xmr:yJq2agYORDqoHn5eeyiG9-aj5KcnyJlF5nyxpF4BhH3u4_r5EhCwubC65S2yEkOC5-UO_ME2kRjEu6w6Mk4>
X-ME-Proxy-Cause: dmFkZTEliJhTBRg9lQYVfrbho/aTtMDkPejvbmTmjDgNCYJvC7nGcUgZtcOKftwwdHjufo
    Ip8uoljJ1AZtBe57UI1AqDdCnpm04rh4qHP6ko6Llv+NQM8fR5QAS+LMHN1sbGanN28E+H
    Zvey9bTFefXNWOjnfEChbqb5joXAqF0MsVcRJ9hXK2K7GXvrJ/6OUdYICG7uZhZCV6Qv9T
    gTfcldajsfkQZ4+ewJcg5LSe92IUYbyDsI7p8ElE7bI+TM8HQ3CcarBNl6TqP3NeEnZVzH
    HxNaeHlFMLVci/Ip4XKXcTrD7jzQST9YVizB8W+6RwoQlRQFmq2F5pokef8oLbiitlmNAq
    fFIFnEt1WlnCDjfcroAKa56cdCISEAIQSbRv0WQj+roqoYUE5KJJf/LqDe/TTiI0Ym2nbp
    AJjhOjFUD4PbnycZ/6ac0RLrXpzu6uZQArv+VYxXVsXk+8TDZjtpG8oGGPSUdAJ62wb3VH
    aZZP8KfQQ20l/gcr6RxUIQ+51Do1yoyL+v76eSeUMEOH6zITQ1favU0Qoj84xaxyMKpXvs
    rDpN7SGC5m9rZKRT2fnZqdm0ZUgONFN8Cp8BevEjVI6DA0LPFvYvI35H8oO3ermsoqEBPw
    JG4LHkp86hsjj8Ay2Blwh9o18IGj/63j8BArncMqpiN21v9b+ixJnwjtYA+w
X-ME-Proxy: <xmx:yJq2anZa0_V39w5B_tPO1dF1hikOt9ylAH2h5OXplmmzTIsc4Mpy9A>
    <xmx:yJq2atLYzsnmgwfj0D-mQSGQdnezoqQiF6QokFtR4SjAe2HhjKR-gA>
    <xmx:yJq2arvdKvSI04xWJXG7x8eYb0pB0UecD7I260ucW79BDNSNTRrh9g>
    <xmx:yJq2apU_-JK4_wxPnAf6AG1C8ds8gbLggJZV8fid6DysQRKBMouNSA>
    <xmx:yJq2arhurWYT8LRfYeYLcfSmHkpynmIr0wDAwK0cLzzdI3uY_bdxku6_>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 12:01:11 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: prasanth.ksr@dell.com,
	W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 3/7] platform/x86: wmi: Use common WMI string functions
Date: Fri, 25 Sep 2026 12:00:31 -0400
Message-ID: <20260925160047.2063361-4-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WMI buffer 'string' handling needed for ThinkLMI v2 is done in the same
way as on the Dell systems (I suspect this may be common on Windows).

Move the populate_string_buffer and calculate_string_buffer functions into
the WMI core module so they can be used by other WMI drivers.

The implementation in WMI core has a bit more error checking, as it can be
less certain that the inputs will be good.

Modify the Dell modules to use the new interface and take advantage of
the error checking.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/wmi/core.c                   | 49 +++++++++++++++++++
 .../dell/dell-wmi-sysman/biosattr-interface.c | 16 ++++--
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 -
 .../dell-wmi-sysman/passwordattr-interface.c  | 24 ++++++---
 .../x86/dell/dell-wmi-sysman/sysman.c         | 40 ---------------
 include/linux/wmi.h                           |  3 ++
 6 files changed, 82 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 5a2ffcbab6af..c50362365366 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/limits.h>
 #include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/platform_device.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
@@ -98,6 +99,54 @@ MODULE_DEVICE_TABLE(acpi, wmi_device_ids);
 
 #define dev_to_wblock(__dev)	container_of_const(__dev, struct wmi_block, dev.dev)
 
+/*
+ * Utility functions common to multiple WMI drivers
+ */
+
+/**
+ * wmi_populate_string_buffer() - populates a string buffer
+ * @buffer: the start of the destination buffer
+ * @buffer_len: length of the destination buffer
+ * @str: the string to insert into buffer
+ */
+ssize_t wmi_populate_string_buffer(char *buffer, size_t buffer_len, const char *str)
+{
+	u16 *length, *target;
+	int ret;
+
+	if (!str || !buffer)
+		return -EINVAL;
+
+	length = (u16 *)buffer;
+	target = length + 1;
+	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
+			      target, buffer_len - sizeof(u16));
+	if (ret < 0)
+		return ret;
+
+	if ((ret * sizeof(u16)) > U16_MAX)
+		return -ERANGE;
+
+	*length = ret * sizeof(u16);
+	return sizeof(u16) + *length;
+}
+EXPORT_SYMBOL_GPL(wmi_populate_string_buffer);
+
+/**
+ * wmi_calculate_string_buffer() - determines size of string buffer for use with BIOS communication
+ * @str: the string to calculate based upon
+ *
+ */
+size_t wmi_calculate_string_buffer(const char *str)
+{
+	if (!str)
+		return -EINVAL;
+
+	/* u16 length field + one UTF16 char for each input char */
+	return sizeof(u16) + strlen(str) * sizeof(u16);
+}
+EXPORT_SYMBOL_GPL(wmi_calculate_string_buffer);
+
 /*
  * GUID parsing functions
  */
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
index c2dd2de6bc20..611c6fac3f66 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
@@ -62,8 +62,16 @@ int set_attribute(const char *a_name, const char *a_value)
 
 	/* build/calculate buffer */
 	security_area_size = calculate_security_buffer(wmi_priv.current_admin_password);
-	a_name_size = calculate_string_buffer(a_name);
-	a_value_size = calculate_string_buffer(a_value);
+	a_name_size = wmi_calculate_string_buffer(a_name);
+	if (a_name_size < 0) {
+		ret = a_name_size;
+		goto out;
+	}
+	a_value_size = wmi_calculate_string_buffer(a_value);
+	if (a_value_size < 0) {
+		ret = a_name_size;
+		goto out;
+	}
 	buffer_size = security_area_size + a_name_size + a_value_size;
 	buffer = kzalloc(buffer_size, GFP_KERNEL);
 	if (!buffer) {
@@ -76,11 +84,11 @@ int set_attribute(const char *a_name, const char *a_value)
 
 	/* build variables to set */
 	start = buffer + security_area_size;
-	ret = populate_string_buffer(start, a_name_size, a_name);
+	ret = wmi_populate_string_buffer(start, a_name_size, a_name);
 	if (ret < 0)
 		goto out;
 	start += ret;
-	ret = populate_string_buffer(start, a_value_size, a_value);
+	ret = wmi_populate_string_buffer(start, a_value_size, a_value);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 5278a93fdaf7..3f912109c55a 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -188,10 +188,8 @@ int set_bios_defaults(u8 defType);
 void exit_bios_attr_set_interface(void);
 int init_bios_attr_set_interface(void);
 int map_wmi_error(int error_code);
-size_t calculate_string_buffer(const char *str);
 size_t calculate_security_buffer(const char *authentication);
 void populate_security_buffer(char *buffer, const char *authentication);
-ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str);
 int set_new_password(const char *password_type, const char *new);
 int init_bios_attr_pass_interface(void);
 void exit_bios_attr_pass_interface(void);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
index e586f7957946..b95b64e354c0 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
@@ -64,9 +64,21 @@ int set_new_password(const char *password_type, const char *new)
 
 	/* build/calculate buffer */
 	security_area_size = calculate_security_buffer(wmi_priv.current_admin_password);
-	password_type_size = calculate_string_buffer(password_type);
-	current_password_size = calculate_string_buffer(current_password);
-	new_size = calculate_string_buffer(new);
+	password_type_size = wmi_calculate_string_buffer(password_type);
+	if (password_type_size < 0) {
+		ret = password_type_size;
+		goto out;
+	}
+	current_password_size = wmi_calculate_string_buffer(current_password);
+	if (current_password_size < 0) {
+		ret = current_password_size;
+		goto out;
+	}
+	new_size = wmi_calculate_string_buffer(new);
+	if (new_size < 0) {
+		ret = new_size;
+		goto out;
+	}
 	buffer_size = security_area_size + password_type_size + current_password_size + new_size;
 	buffer = kzalloc(buffer_size, GFP_KERNEL);
 	if (!buffer) {
@@ -79,17 +91,17 @@ int set_new_password(const char *password_type, const char *new)
 
 	/* build variables to set */
 	start = buffer + security_area_size;
-	ret = populate_string_buffer(start, password_type_size, password_type);
+	ret = wmi_populate_string_buffer(start, password_type_size, password_type);
 	if (ret < 0)
 		goto out;
 
 	start += ret;
-	ret = populate_string_buffer(start, current_password_size, current_password);
+	ret = wmi_populate_string_buffer(start, current_password_size, current_password);
 	if (ret < 0)
 		goto out;
 
 	start += ret;
-	ret = populate_string_buffer(start, new_size, new);
+	ret = wmi_populate_string_buffer(start, new_size, new);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 51d25fdc1389..c70ce5aa5ff2 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -29,46 +29,6 @@ struct wmi_sysman_priv wmi_priv = {
 static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
 static int reset_option = -1;
 
-
-/**
- * populate_string_buffer() - populates a string buffer
- * @buffer: the start of the destination buffer
- * @buffer_len: length of the destination buffer
- * @str: the string to insert into buffer
- */
-ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str)
-{
-	u16 *length = (u16 *)buffer;
-	u16 *target = length + 1;
-	int ret;
-
-	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
-			      target, buffer_len - sizeof(u16));
-	if (ret < 0) {
-		dev_err(wmi_priv.class_dev, "UTF16 conversion failed\n");
-		return ret;
-	}
-
-	if ((ret * sizeof(u16)) > U16_MAX) {
-		dev_err(wmi_priv.class_dev, "Error string too long\n");
-		return -ERANGE;
-	}
-
-	*length = ret * sizeof(u16);
-	return sizeof(u16) + *length;
-}
-
-/**
- * calculate_string_buffer() - determines size of string buffer for use with BIOS communication
- * @str: the string to calculate based upon
- *
- */
-size_t calculate_string_buffer(const char *str)
-{
-	/* u16 length field + one UTF16 char for each input char */
-	return sizeof(u16) + strlen(str) * sizeof(u16);
-}
-
 /**
  * calculate_security_buffer() - determines size of security buffer for authentication scheme
  * @authentication: the authentication content
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index d723e4b1cafb..eeb9a97ec465 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -83,6 +83,9 @@ acpi_status wmidev_block_set(struct wmi_device *wdev, u8 instance, const struct
 
 u8 wmidev_instance_count(struct wmi_device *wdev);
 
+size_t wmi_calculate_string_buffer(const char *str);
+ssize_t wmi_populate_string_buffer(char *buffer, size_t buffer_len, const char *str);
+
 /**
  * struct wmi_driver - WMI driver structure
  * @driver: Driver model structure
-- 
2.43.0

