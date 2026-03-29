Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2122D4DC;
	Sun, 29 Mar 2026 03:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774753800; cv=none; b=uITW2dTQ98XDGvY67zU5LnNQot4S2ncDkkI27poC3iibj630iTuYiMitWU9WtRdNv0JPnnKZRnQCZVrISdZ9HbQ4Uqh98ne8Rr3cug7koSJeEd+99tcB3oy2sJSXgBntYTXrUQjCqzzEGXlFExvIv3gLEvBpr77LuZekDvDbf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774753800; c=relaxed/simple;
	bh=to8XM3mP04FAbbYPLPwwJYnnkTyFHzvDe36OXcn/8Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hutJleottSqKBupmCGoJWK7TUtcjoLE5RdZ854osUvI9d5+th4tUTeHlwtwKjuo/LV+ZCUBV1MkQZguqwv5PZK5Y6N3G0nZELsLW71g1omihHL26OgkjFewCZRnoZqdN8ZeA4m63ZkQlkBztlhYRYJP+LPokDevMUxNhyyD8Il4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABX_Wj8l8hpsOd8Cw--.46091S2;
	Sun, 29 Mar 2026 11:09:49 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: prasanth.ksr@dell.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: divya.bharathi@dell.com,
	mario.limonciello@dell.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] platform/x86: dell-wmi-sysman: bound enumeration string aggregation
Date: Sun, 29 Mar 2026 11:09:48 +0800
Message-ID: <20260329030948.32467-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABX_Wj8l8hpsOd8Cw--.46091S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4UAFWUWr1rGw1UJw1rXrb_yoW5CF1DpF
	WUtwnaqrnrJ3ZIqwnFvFs2vwnYk3y8Aw4UKFsFvrnYywsFvryUKw43twn7Z3ZrAr48C345
	Xa1jq3W7CFZruF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDOz
	3UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

populate_enum_data() aggregates firmware-provided value-modifier and possible-value strings into fixed 512-byte struct members. The current code bounds each individual source string but then appends every string and separator with raw strcat() and no remaining-space check.

Switch the aggregation loops to a bounded append helper and reject enumeration packages whose combined strings do not fit in the destination buffers.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 .../dell/dell-wmi-sysman/enum-attributes.c    | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
index 09996fbdc707..14decb219128 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
@@ -10,6 +10,26 @@
 
 get_instance_id(enumeration);
 
+static int append_enum_string(char *dest, const char *src)
+{
+	size_t dest_len = strlen(dest);
+	ssize_t copied;
+
+	if (dest_len >= MAX_BUFF)
+		return -EINVAL;
+
+	copied = strscpy(dest + dest_len, src, MAX_BUFF - dest_len);
+	if (copied < 0)
+		return -EINVAL;
+
+	dest_len += copied;
+	copied = strscpy(dest + dest_len, ";", MAX_BUFF - dest_len);
+	if (copied < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
 static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	int instance_id = get_enumeration_instance_id(kobj);
@@ -176,9 +196,10 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 			return -EINVAL;
 		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
 			return -EINVAL;
-		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier,
-			enumeration_obj[next_obj++].string.pointer);
-		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier, ";");
+		if (append_enum_string(
+			    wmi_priv.enumeration_data[instance_id].dell_value_modifier,
+			    enumeration_obj[next_obj++].string.pointer))
+			return -EINVAL;
 	}
 
 	if (next_obj >= enum_property_count)
@@ -193,9 +214,10 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 			return -EINVAL;
 		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
 			return -EINVAL;
-		strcat(wmi_priv.enumeration_data[instance_id].possible_values,
-			enumeration_obj[next_obj++].string.pointer);
-		strcat(wmi_priv.enumeration_data[instance_id].possible_values, ";");
+		if (append_enum_string(
+			    wmi_priv.enumeration_data[instance_id].possible_values,
+			    enumeration_obj[next_obj++].string.pointer))
+			return -EINVAL;
 	}
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
-- 
2.50.1 (Apple Git-155)

