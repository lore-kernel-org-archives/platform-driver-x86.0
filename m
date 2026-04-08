Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BAE26A1AC;
	Wed,  8 Apr 2026 00:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775608842; cv=none; b=qfPIwW98XCTq0k/kzXICC5nAfrxYZpARDKho8e+FOdX93VFLdMrrEKgZALLDlGs8DNewHqvd5VueE4hHPt5jzkGnT0tBei++uC6dPcgmLGIH6Zr1HWdkaraWEZa4/8Pw9qyg6+QJ8wDtPKfXYiMNryAcSdkYwToXf8ZDWDzS0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775608842; c=relaxed/simple;
	bh=DdDZoaS+6feRBC7XcuT4t7I4McfuNXEFaSyrTut2IRQ=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=fMHSH9JRKspPm5KRyO6Xi9iLmhT65lljBQMZH5M78Nyac1QQeu4Fivwcy+tkAIeelooRBaMlCMFJYMKOrUJ3BU14wNiXlFiSnMsM1oZbns2xtXeZjtcTfM23b5UeKukFx0Xv3iukgD30fLehIFGrK8GcmXo6EVdMNxhhj062pHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-dell-wmi-sysman-v2.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABnC2f7o9VpJuaSDA--.9076S2;
	Wed, 08 Apr 2026 08:40:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Wed, 8 Apr 2026 08:38:21 +0800
Message-ID: <20260408084501.1-dell-wmi-sysman-v2-pengpeng@iscas.ac.cn>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Divya.Bharathi <divya.bharathi@dell.com>, Mario Limonciello <mario.limonciello@dell.com>, Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260329030948.32467-1-pengpeng@iscas.ac.cn>
References: <20260329030948.32467-1-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] platform/x86: dell-wmi-sysman: bound enumeration string
 aggregation
X-CM-TRANSID:qwCowABnC2f7o9VpJuaSDA--.9076S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4UAFWUWr1rGryDJFW7XFb_yoW5ZFyDpF
	WUtwnaqwsrJ3ZIqwnFvFsFvwnYk3y8Aw4UKFnFvwnYywsFqryUKr43tw1xZFnrAr48C345
	Xa1jq3W7CFZruF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

populate_enum_data() aggregates firmware-provided value-modifier
and possible-value strings into fixed 512-byte struct members.
The current code bounds each individual source string but then
appends every string and separator with raw strcat() and no
remaining-space check.

Switch the aggregation loops to a bounded append helper and
reject enumeration packages whose combined strings do not fit
in the destination buffers.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- fold changelog paragraphs to 72 columns
- use WARN_ON_ONCE() if the destination string is already out of bounds

 .../dell/dell-wmi-sysman/enum-attributes.c    | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
index 09996fbdc707..11fa6f9f9322 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
@@ -10,6 +10,26 @@
 
 get_instance_id(enumeration);
 
+static int append_enum_string(char *dest, const char *src)
+{
+	size_t dest_len = strlen(dest);
+	ssize_t copied;
+
+	if (WARN_ON_ONCE(dest_len >= MAX_BUFF))
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
@@ -176,9 +196,9 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 			return -EINVAL;
 		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
 			return -EINVAL;
-		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier,
-			enumeration_obj[next_obj++].string.pointer);
-		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier, ";");
+		if (append_enum_string(wmi_priv.enumeration_data[instance_id].dell_value_modifier,
+				       enumeration_obj[next_obj++].string.pointer))
+			return -EINVAL;
 	}
 
 	if (next_obj >= enum_property_count)
@@ -193,9 +213,9 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 			return -EINVAL;
 		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
 			return -EINVAL;
-		strcat(wmi_priv.enumeration_data[instance_id].possible_values,
-			enumeration_obj[next_obj++].string.pointer);
-		strcat(wmi_priv.enumeration_data[instance_id].possible_values, ";");
+		if (append_enum_string(wmi_priv.enumeration_data[instance_id].possible_values,
+				       enumeration_obj[next_obj++].string.pointer))
+			return -EINVAL;
 	}
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
-- 
2.50.1 (Apple Git-155)

