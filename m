Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401470;
	b=YnWDuaBduU8anrroxQC+/vdWoTAcVNVOobTO/lD4j4G0Y1kF8ktN6LY0hciyOvPo7vn1
	 TeYA4NCivY/lZ7WnDAs2gb664F004WCKUSYvRGc4U1IIfjdP3bHZZayHHtfkF4PA98Ht/
	 94m86Q7cTN0RDFlcLhx2BjuIWK6O257yAoGvytqoer5k3AEK5uyoWNFG/am0ZoJbsfXiP
	 FSW0eieKMlI2gW8AQ/gt7u4Vba3RVIKaUNlt07APr91/SSZcXk4ZJro9ByoCvgBNAH7ns
	 WDVEBZJaccDJs7M5nB/DmjbFTfV7C4p9aJ4dwnSZZuyG7JYkreZdYphIbA7FPpB5AbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uapr75yZLj7Tv4B9SqUwtXKVvOOX4yQmtXhP7eAjMSc=;
	b=0F8bUc6U1k15VFI//gSqWly3IFSSFu9JszxKrFrZSuTv6Nnn8GX9bYawsxN/sjdoHHDD
	 HeOtlHutG9wqKvG654sSvk+jiIN+EIbHFNJI5EbFpfdD8KhvQM4OCpt+sBtbLd64h14GG
	 mgy8gcWrIMYw/ap2YbHAqzcKBxNCYTMKjxuPtg18+gbWvWmwCmsubNDGTYzpHNbULBc1Y
	 is/4VbXPahgLNFDAnQNJsaIjYYrvGDcF0IvRqjNCBTUOq8Xz4/f006tkhwCrfspE6yoOj
	 Tl89mkXoNCnqXOkwlvH8K+24g9S8Tm5NZDrVJJkmoT3Ofr9xiDqy+MySmgu1LIhTnpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMLfuTgj;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9C606A326
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 12:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A9C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMLfuTgj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so23203525e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 04:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401468; x=1795006268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uapr75yZLj7Tv4B9SqUwtXKVvOOX4yQmtXhP7eAjMSc=;
        b=bMLfuTgjGwNqjCK3J5qEDY7VJ62o8iUt8dcjlb/akdFWQvLLdUT4nOkdYJz4yFDYTs
         vVWpozvbFq+LAN7CUMigA6Jweua8VGK/3CfZuoiQFp/Ye4k4qYBctBOgjlvxoPFjWh7+
         6Ncqp74M+hBo8ekz+l/uhj6RA4U/0gemFtknNiwM2QT0uTLHchgvYKBlqZoEANWgeq/Q
         6ORYr6NPWoVuduIAq1jsjgExk45gvyWl+8XPhV5gvlfGg9yMU87+m45dgNxDM5oOWBmI
         c/UTQPDrn7sj3yNwSFioahR+kTWvDrNGAPYxK/FOKPKYdeJrcCY8qZ7GyiQFv7V8krna
         eTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401468; x=1795006268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uapr75yZLj7Tv4B9SqUwtXKVvOOX4yQmtXhP7eAjMSc=;
        b=pKTh8dh7bFqROewoVdP63drYS3+M42lpZiUv9/+ROnCEWm20FfKyzLnEKfAhm0KJik
         LjDcLVzQwbQZh7nWClgkQFdoQgEFJ96ZJccxopqi3y63UUqpyaQu1Jl9gNE5EQsQbo/i
         pQGmGGRV3WCABKLjMJEsgZd72sf7uEZlkWZx9V7+BzPsJCT823BOo/MVApaq763Fp1Z0
         +sO1j8Bh9fO0H2agxJu3F3e8lZ0uqCNknrxek1v1CuHHBOhCK5yPetsVzh+vwTOKCH7F
         q6ZES93fXObYTbrgzkLpZvCxsF+N0Ruw5vAimxhQw2h2Aj4lWYoh1rYSZlQnkY+eGJ9o
         NEvA==
X-Gm-Message-State: APuU4Z/tf5wkB9Zdcs/Y+fuoNYxn4E+wrtv6i9oDOtmrCsmMlIGSSze4
	Y7OdN/MwB0Dz4JFyILjbglx4EQbdPIZETbzdfq60GUKrNH7uqY0RHA8z
X-Gm-Gg: AYBFou0sS/osKJry9WvqIz7lUPGELn5FiDvxHe6kPSaCi596aDQlMRN6ZMAuHb/1AVb
	NKkq3Y+hURSN5WVQTeV9eaUoLDl/yRydOwmuornXAZq1QQGWtJt/x2attF98eX7hb3Q3TSmUGbn
	Ubkotg2neGfo3CA/J+zLUj4pAh8h2J9o3wecOHRWsRwg2HIV0E0Ka/HPlQM3gQwMeWQnJMioQIX
	lVZHosM/x+fSyGPAA7GC2l5c4KP04vVbp9RR67M/MZHTf930PlKvtlfxKePQM0ebeQapyT9/+Yk
	6J4x174wzC7Uzck4/4l9IPFWu1DJVexiVqAE+o7bOdeltoM/lPISEZYi60DomVah07d2SrbWFAY
	BCKG7VLd1CdPbpUXVHt79JybBzvX+30fAKC5bU3/SYH54tF/bGaPRaFiQLkCpi9RxYSzmlKYzmL
	GRjO2GQFXIdQB7hLropAM0b3Y4LxcoSUQHCmsfzSaQD7y5hsGGHxvku4gGyy5vWo+SGMtAYzX14
	N0FDlZo/KcFAXxz35MdWqJYmWUnlV9qdmyC+PMk2E38XlBd+H4J9P4w7zoIaK2lydYTYKLEXo9I
	pm0cO/iqRJBuK6Iox5ZKeo3y76L4aQ42bBA=
X-Received: by 2002:a05:600c:3f08:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0937820cmr39696135e9.22.1794401467873;
        Wed, 11 Nov 2026 04:51:07 -0800 (PST)
Received: from redmibook ([143.246.42.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09517bc7sm39028095e9.3.2026.11.11.04.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:51:05 -0800 (PST)
From: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
To: qby140326@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	shlyapugin@gmail.com,
	Musaev Ibragim <atomicus.xyz@gmail.com>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Subject: [RFC PATCH] platform/x86: bitland-mifs-wmi: Add Redmi Book Pro 15 2023 (TM2209) quirk
Date: Wed, 11 Nov 2026 15:48:49 +0300
Message-ID: <20261111124849.11309-1-rybalov.oleg.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
References: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On TM2209 the power mode is the STNM byte in EC RAM. Fn+K rotates it
in EV20 and the EC0._Q24 handler then applies the matching SoC limits
with HPTC. SystemPerMode does not affect STNM, so changing the platform
profile had no effect on power.

Read the mode from STNM and, on set, write STNM and evaluate EC0.HPTC
as the Fn+K handler does. HPTC returns AE_AML_BUFFER_LIMIT because SVRP
declares its ALIB buffer one byte longer than its data; the limits are
already sent at that point, so treat it as success.

The board reports DMI_SYS_VENDOR "XIAOMI" with TM2209 in
DMI_BOARD_NAME, returns the WMI return code at the end of the buffer
and charges over USB-C only.

Signed-off-by: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
---
Based on v15 of "Merge redmi-wmi into bitland-mifs-wmi":
https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com

Tested on BIOS RMAPH5B0P0909 only.

 drivers/platform/x86/bitland-mifs-wmi.c | 83 ++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a431d3fef..b63b139a6 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -21,6 +21,7 @@
 #include <linux/input-event-codes.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -99,6 +100,10 @@ struct bitland_mifs_quirks {
 
 	bool return_code_at_end;
 	bool skip_ac_type_check;
+
+	const char *ec_mode_field;
+	const char *ec_mode_apply;
+	phys_addr_t ec_mode_addr;
 };
 
 static const struct bitland_profile_entry default_profile_entries[] = {
@@ -113,7 +118,30 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2209_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   2 },
+	{ PLATFORM_PROFILE_BALANCED,    1 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
+};
+
+static const struct bitland_mifs_quirks tm2209_quirks = {
+	.profile_entries = tm2209_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2209_profile_entries),
+	.return_code_at_end = true,
+	.skip_ac_type_check = true,
+	.ec_mode_field = "\\_SB.PCI0.LPC0.EC0.STNM",
+	.ec_mode_apply = "\\_SB.PCI0.LPC0.EC0.HPTC",
+	.ec_mode_addr = 0xFE0B0300 + 0x7E,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2209"),
+		},
+		.driver_data = (void *)&tm2209_quirks,
+	},
 	{}
 };
 
@@ -271,6 +299,48 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	return 0;
 }
 
+static int bitland_ec_mode_get(const struct bitland_mifs_quirks *quirks, u8 *val)
+{
+	unsigned long long v;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(NULL, (acpi_string)quirks->ec_mode_field,
+				       NULL, &v);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	*val = v;
+	return 0;
+}
+
+static int bitland_ec_mode_set(const struct bitland_mifs_quirks *quirks, u8 val)
+{
+	void __iomem *addr;
+	acpi_status status;
+	u32 glk;
+
+	addr = ioremap(quirks->ec_mode_addr, 1);
+	if (!addr)
+		return -ENOMEM;
+
+	status = acpi_acquire_global_lock(1000, &glk);
+	if (ACPI_FAILURE(status)) {
+		iounmap(addr);
+		return -EBUSY;
+	}
+	writeb(val, addr);
+	acpi_release_global_lock(glk);
+	iounmap(addr);
+
+	status = acpi_execute_simple_method(NULL, (char *)quirks->ec_mode_apply, val);
+	if (status == AE_AML_BUFFER_LIMIT)
+		return 0;
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
 static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
@@ -282,14 +352,20 @@ static int laptop_profile_get(struct device *dev,
 	};
 	struct bitland_mifs_output_head_rc result;
 	size_t i;
+	u8 val;
 	int ret;
 
-	ret = bitland_mifs_wmi_call(data, &input, &result);
+	if (quirks->ec_mode_field) {
+		ret = bitland_ec_mode_get(quirks, &val);
+	} else {
+		ret = bitland_mifs_wmi_call(data, &input, &result);
+		val = result.data[0];
+	}
 	if (ret)
 		return ret;
 
 	for (i = 0; i < quirks->num_profile_entries; i++) {
-		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
+		if (quirks->profile_entries[i].wmi_val == val) {
 			*profile = quirks->profile_entries[i].profile;
 			return 0;
 		}
@@ -350,6 +426,9 @@ static int laptop_profile_set(struct device *dev,
 	for (i = 0; i < quirks->num_profile_entries; i++) {
 		if (quirks->profile_entries[i].profile == profile &&
 		    !quirks->profile_entries[i].no_set) {
+			if (quirks->ec_mode_addr)
+				return bitland_ec_mode_set(quirks,
+							   quirks->profile_entries[i].wmi_val);
 			input.payload[0] = quirks->profile_entries[i].wmi_val;
 			return bitland_mifs_wmi_call(data, &input, NULL);
 		}
-- 
2.56.0

