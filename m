Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D3212B13
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845554; cv=none; b=W0dU0bH/qvTG+fxxKqZ7wZPeRWONS7sJXi+ittLJnkbJDgyOVYx8tJTXUKWJ+b3H7Av1lQpKGRl/3ftyf0V8u21WSVjABXXzNwUUoXK2pibnhu9uztooGxLLZZ2BdM9qvQrIGNG3Iw8DpeKU6rtPOUR1+gFUQWnR0srPHueQMEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845554; c=relaxed/simple;
	bh=yaWDgM/wcqkzLRVpKIhJ3GFf8WNdezvsqreAQYl8kCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQt0JwJ9KlIwqqfXUZQ1AggqTNiBv00ksMrdAY9dWSqkcX1FMxVx9sdRLtF7hQ/ia1YhHBeWkaKU5wJdT/1Wl3lQz5Q7JHOFkgpJInYBNJhLAFgpJibi/oSBpaBNk6HpiDui24a4WZxYCYHLVuZBBejAQnnr3lPXxyV7kDlU5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/DAZzA4; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/DAZzA4"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd377ff3c5so2674795a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 07:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733845552; x=1734450352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=owMRQzzCfDodC4QRumLX3NH2EKJKmeDcAX4pwGwARCo=;
        b=M/DAZzA4wY6Zl1xKYiiVhc+fQ+HUJRTTEG9vFpJZKMkctns1RIhKoSIw/xmUAmlJWA
         Fyu/fkKpnq9Cq8q24BuV+0/to44dFvUC9P+jhoaRLbNwH2N8yyHYFM1a6hpBQXhsMNGo
         KctgYQS6fJqALJXWK2silj8OF3DoE2TQI7hCFEHYA300uUiV7xj592rGPkevse/vBmvW
         251iz1UjCU6lpvFSP5vMjnNWcXjvAz2xSsG2eJeAu4kPLIHQTkzV+h+LqtfnXpJhyy9m
         NBeaAPgaQJrLeKktx63xlGP5h09w2itwU4YqSaC0nM3iVADZvF5ZaXNDVze8mZ0jemSV
         eOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845552; x=1734450352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owMRQzzCfDodC4QRumLX3NH2EKJKmeDcAX4pwGwARCo=;
        b=YhSgLNp4TzJ3fA7EfeK60F2gaieEGIFjDoyvRgJPs77LZnuNf5FEZQef+AE0RpVdm9
         74z7qA9090XqSu8LL7KwvjEPTfz3ae5e3qLDHIUjRcupdP6dNhDqZ3dmhYqgyJQO10Ru
         Vswcg01T3Jo+4aPcV3GWTap/hEch50nNuWYstpf30ADuIdGznbDrIWkdefV+6WSCis1l
         GbmkSJzshfgUxr0z/KzohzbHRltSO8cROPX2WbLVH2KnTI6oI0vxwnWI5jmdOGWxwhhZ
         iG/2HDzl7YUCnMAh2bn0m68HIH5aTaEi0nOb4luPZkkvV/UGstVBcb3ywJXh52aqzbjo
         iwQQ==
X-Gm-Message-State: AOJu0YxUgfBaQTcCnHuQoWGgUMGhUSz+Q8ClX1+UO/hwfNKTBrFupVzl
	2+xWP7PX3xPfdBs/ZMEeFsmGB7kn9lk+FG7WsMBSXgpCzlGC6lLcsOuxHpJ5
X-Gm-Gg: ASbGncu+fV5khGdBhmcgdXFnczwxJm373wpvzpDvA7FXUJbzHMmcKRFO+QU1bR8TyEx
	bMSuEr7yF2wSTLBIjsrisFuj/5fy2anQFiDLgJrZCMucxIw7l04YPnSYgfk7pO2oOYvkOEF3nJx
	LeMsgDyg961fT/UHNEtTXcWnlhDmG9D+MP8eo2CSn7wImMw9uFMkiYqCDv72qAzriT15FxvL5bm
	m1pJ6YxdB83Z16cXKohnAQutTnPd+H2U0WlrqgrbPYs/cYZ
X-Google-Smtp-Source: AGHT+IE61mG5OlSs2i6qKDVEQjVy8HVfMKbL6ZodLpoAVtVThzwwq8tY2Oyg1oSfIQOoTdTPNHR9JQ==
X-Received: by 2002:a05:6a21:32a5:b0:1d9:d5e:8297 with SMTP id adf61e73a8af0-1e1b43f6c28mr6339315637.6.1733845551895;
        Tue, 10 Dec 2024 07:45:51 -0800 (PST)
Received: from gmail.com ([27.73.98.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e8177c7esm4602722b3a.108.2024.12.10.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:45:51 -0800 (PST)
From: buingoc67@gmail.com
To: platform-driver-x86@vger.kernel.org
Cc: Huy Minh <buingoc67@gmail.com>
Subject: [PATCH v2] platform/x86: touchscreen_dmi: Add info for SARY Tab 3 tablet
Date: Tue, 10 Dec 2024 22:45:00 +0700
Message-ID: <20241210154500.32124-1-buingoc67@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Huy Minh <buingoc67@gmail.com>

There's no info about the OEM behind the tablet, only online stores
listing. This tablet uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB
of storage.

Signed-off-by: Huy Minh <buingoc67@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 0a39f68c641d..bdc19cd8d3ed 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -855,6 +855,23 @@ static const struct ts_dmi_data rwc_nanote_next_data = {
 	.properties = rwc_nanote_next_props,
 };
 
+static const struct property_entry sary_tab_3_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1730),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1151),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-sary-tab-3.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data sary_tab_3_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= sary_tab_3_props,
+};
+
 static const struct property_entry schneider_sct101ctm_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -1615,6 +1632,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-V005"),
 		},
 	},
+	{
+		/* SARY Tab 3 */
+		.driver_data = (void *)&sary_tab_3_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SARY"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "C210C"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "TAB3"),
+		},
+	},
 	{
 		/* Schneider SCT101CTM */
 		.driver_data = (void *)&schneider_sct101ctm_data,
-- 
2.47.1

