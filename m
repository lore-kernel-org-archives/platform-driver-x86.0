Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A413C1961
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469238; cv=none; b=frF5hcechEBsp8mCFqnLg+q6aGAfzUuqMljaAisGGlIKr+yG2BaWX0i+6zouD6Wk3Jv0lFXn5GiP1aAjB80cNHBx0alPih73h9HPZcCE2diuTOaxdyNQ6+cuIOmlQiQMHBUlwpNgwuJ6FSC6htTWZFahE5jNJYE2QNWpRwk9NHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469238; c=relaxed/simple;
	bh=3rjNe5SzwzUAH8Fg/UbI3DxCjsSKhvvrLIJo3HOpTn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E2fv5tuDf31Jt2K8BquuhTQrHRYSFoOOPy6j+JySuhGI8LGQM5GjOiI1EY7eiw8tIn4mDWrNNUrWvUfsKPJJrznazinSDIRRbtb9nKMgJs/jBJ9VycxbGjb9ZvoJ7SXJ6DbKnBVNt7wBlZjqebmzfM5GhwbqhdMKJlfuZ/T1c1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyJyrdvG; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyJyrdvG"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-61316792e42so7096532137.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777469236; x=1778074036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWadTGnijLoIiyjf+xOJkjY7LVS3xMvY0Q85Yez1n+I=;
        b=AyJyrdvGFhQ8AvUFEtkDVPgaefJUEuarSa3uHrQlAJY/blGbTCZWyrzEkLXZz9obD/
         S5HsRG6zIA7LLRp/WvhUTxJUA+3jQuUfaNHt2lQ8GmbVHcCX3xDIp+lEGX3+bgj8CpaZ
         ZfZkgu/R6RB92TDr/wktcTKqQHFOeWaW8ufnvxZMjzgL6cxz72Aj3h0Kv4QB3n5rt+jj
         dgbyp0d3vWIVPX1g+EIgoOzgWFnPe+OYbpJY8/Uwm0U58ekVxVMrKuKIKTGOLfV0JFzS
         R2jNUova+5q92jt5yaWZQBdZA8J5zJtSWBdW4hkvhtl6QkZNrSTudewbH6/R7c4hkpxv
         qZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469236; x=1778074036;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWadTGnijLoIiyjf+xOJkjY7LVS3xMvY0Q85Yez1n+I=;
        b=l1d58Nl+oTpjOdqqwzeCWk4ECe/YjZMxouZW1mGbnQoaPJeclpLl0CBUDFvOTGOewM
         crY0kWSN5PeOpQbAlWQqkGVdvWfQTjLT8gc22Be9i4RdSz/bLbydfasZgLhYv3x3n2gd
         ukcruxuljGb6rfl/pqvcNkYJj0FuK/5frOI8aTGm48aKAiOqO9VV7pvtaUey6DG94e2A
         3LYVh0wzriTgUj+XgEvtQwZS6CpzklZGm4BxmW+mBGb7SkvPDBDh2hQTkFGz3HAHnJY+
         DvX/f1jaash/K2jnUwoG28NVqY9N9fnQLgLCJJ5VFmJNSnB+RSXVTbPYftbYeIa/+5kU
         bVUQ==
X-Gm-Message-State: AOJu0YzZKoUdmlSsNRu/5y3Aa3cQolzQkHE+wxErrOg1fsn1fhd+JKOt
	y8Z8x1DlXW19QglvlQ/kkdB2GsyLzIJZCrchJOFdz9POEr0ncFqlmPGolgd56g==
X-Gm-Gg: AeBDievgVGApyFsIYpEcsykweqOhD3BvTxulgpvlTp5Y0aWFoLHcz0pv4rXZvZTL7xj
	CqorVqD2GslWdVNoUswZnGCRoMu5YUQWTBzzyXLK9nSzENp9brgeK7KP+wZEo5B11BTZtd0QOmU
	qr24OpiSFQAl78SnTwlUtfpofGWpbLx3oMJAeauXXgkQOvwMsAvpvY/Y3QQq2a6Ok6FwfNKtxdi
	9DKb8ZUf13sWT+w8ixjUBTvUu7GR/5fDNkFvPZBqucXtFfScqa7GfwmAnAKcHxJBW3qpclmoAW3
	AVl+hHyT+EUFDOGCcXsbo1DtN4d2ZZ0ZCN3Of2zf+cM0XiUEtkLx2f3WL/+a/xwluJJUgu3D/yb
	N2rLVAyLa61nrasWVTqGlmEJTzTcmhp6DGsgPiqBm8ZWxVu3/4HYzinWXrnOKP18dpfHuDZOr6/
	lsoDDd5I5FgVKxDZfKdW8v2t5mT9Yf3VVZ
X-Received: by 2002:a05:6102:1609:b0:607:4fe2:d3e1 with SMTP id ada2fe7eead31-6280936a768mr3823164137.13.1777469236105;
        Wed, 29 Apr 2026 06:27:16 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7608f00sm898756241.6.2026.04.29.06.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:27:15 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 29 Apr 2026 08:27:02 -0500
Subject: [PATCH v5] platform/x86: alienware-wmi-base: Transition to new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-aw-new-api-v5-1-7702668d04c6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq3pzBQEV97DuGhpC03kJ2BAQ
 7i7BReCxuU3yfPOyDrbetux025kre195+sqjGi/Y1mhqtxyb8JmKDAWgMTVwCs7cNV4DhkkDgS
 Ao4gF0LTW+ccSu1zDLnx3r9vn0u5hvr4zRGKd6YEDT6MUhHYKNCXnvFT+dsjqks2ZHtcUNhQDJ
 S0MkXaJQfym9J9SoNYJ0qmMMDU/X+WHSkw2VAZqMBMxSjBHZdZ0mqYXdqyedFUBAAA=
X-Change-ID: 20260123-aw-new-api-1c18f1011f35
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=3rjNe5SzwzUAH8Fg/UbI3DxCjsSKhvvrLIJo3HOpTn8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJmf2I0eJxtb50d9TteMDj21+Mm616YBB3cv1vXK6eu94
 VthbzGzo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACZSPJ/hf/G3N/kG/aryXst1
 prX/PcEgeu1q2tMzR/Ieie8O2jTzz1qGX0xWe/+/WV4Qktdud2l99HUpDgETzj8/qnJDu48dNjt
 ZzA4A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to the new wmi_buffer based WMI API.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v5:
  - Use wmidev_invoke_procedure in the !out_data case

v4: https://patch.msgid.link/20260428-aw-new-api-v4-1-d2c06241d7ad@gmail.com
  - Rebase to use the new wmidev_invoke_method() with size check

v3: https://patch.msgid.link/20260331-aw-new-api-v3-1-ef03b94529d8@gmail.com
  - Use __free() instead of manual cleanup.
  - Include <linux/types.h>

v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com
  - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
    returning

v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 31 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 64562b92314f..19cadf21203a 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -12,8 +12,13 @@
 #include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
+
+#include <asm/byteorder.h>
+
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
@@ -150,22 +155,22 @@ u8 alienware_interface;
 int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 			  void *in_args, size_t in_size, u32 *out_data)
 {
-	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
-	struct acpi_buffer in = {in_size, in_args};
-	acpi_status ret;
+	struct wmi_buffer out, in = {
+		.data = in_args,
+		.length = in_size,
+	};
+	int ret;
 
-	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
-	if (ACPI_FAILURE(ret))
-		return -EIO;
+	if (!out_data)
+		return wmidev_invoke_procedure(wdev, 0, method_id, &in);
 
-	union acpi_object *obj __free(kfree) = out.pointer;
+	ret = wmidev_invoke_method(wdev, 0, method_id, &in, &out,
+				   sizeof(*out_data));
+	if (ret)
+		return ret;
 
-	if (out_data) {
-		if (obj && obj->type == ACPI_TYPE_INTEGER)
-			*out_data = (u32)obj->integer.value;
-		else
-			return -ENOMSG;
-	}
+	__le32 *data __free(kfree) = out.data;
+	*out_data = le32_to_cpu(*data);
 
 	return 0;
 }

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260123-aw-new-api-1c18f1011f35

-- 
Thanks, 
 ~ Kurt

