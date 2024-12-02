Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F40F1DDC19
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177889; cv=none; b=kb5phEXNlVRwR2UVWxKQpiIT8E3+7QJvqSl+4UzM9Qjd+UzARjNSNaZU2bFBQYf/+Ubh6mYtnJ0VLuT3f0weHVaLEgwBC6hckZ0fKpkE1dRau0Vnh4sjSvpbKdsWr4y2AhG81Ai8R+RZP9f4LaCJwvOmu481plw1pD3lg0hJj6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177889; c=relaxed/simple;
	bh=CxfcRfBcB/tTT0/vrqsMMWVlNMVZO1tDGbQlaKxrOIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4Kx8/f71uAiWn+CEN2IUZ6eco2ITSaI+Vl8swOFZ1XXyldrVLzerKoqPHY/wv/IntKeaxmgSUd09s8O8+yyVDwoINHbmhc+NpDjIrLoLITH8FnrSiPrUqAsNeeOfYVoM9uK9s/eKZ5bk+U0l2wO5bd3cviVIPD1xRLZZpMuSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moCetbFN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moCetbFN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724ffe64923so5017919b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Dec 2024 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733177887; x=1733782687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hilj6/tL3XMV9wLJmAJ8yznJEyxAxyp09ne33kmOCwQ=;
        b=moCetbFNAAvAkXsIMRnSbprakMZF+fexghmpZwIBPbyh2jD/0y+xL/4jDkHU1ueFDH
         5ewEIFcIhuRWkxhblqqSzGskk/LhrgL9CzVcepaWHWQZzJ8Wf4ZIVmSiHBC5gXqPkks9
         KYkWwL1ybP2VbpJP6F0RMotQy7VQdCugJAf6TV25RkJNLlwhcr8ZRZtkwWaM2EZLAcV+
         I+F8537QgweEpsCqhe8BEM8pC3iYPvIn/1zUz+rlcXQkxdXnnIwZM1/K0ZywP11mKOpc
         A9qP+W93iNBL9KB0UZQ88I79GBxw3P2zxRnrpHiG0Te92Msz3z1oSoOC4iEhPvSwkBZG
         YEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733177887; x=1733782687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hilj6/tL3XMV9wLJmAJ8yznJEyxAxyp09ne33kmOCwQ=;
        b=ZJV/BPeGYHBqKjg173lLYhqkifY6yykHbU7V9RhYfLjjA0pCcdgavKjDFC5nzljifo
         +WAoAgAKzm2IFHNF592nr2OGiZ9cJ1Ie39YBZ8jlYKk/QjhQ1Bt02fyguPT5GZHxOoGM
         C9GOgkeVr005gme3z+ZbdCx3TaD4WPwe1SsmyoYVs47tHgHVfm7ktN9DRl0jSO4xs2r+
         fFCE5ba13nlxzR6DVNqAyfdP99s7UyEOKjfd1JFi2l91k8bKpOfYGeETAVTC1Y8hXdKv
         Sb4ymJIxlYyL+7uUaY/cDtY7U2Sv07f8guKPEvtPuXf6IO65YpTPV+n5dtyr4CXS4uGI
         LQsA==
X-Gm-Message-State: AOJu0YyT5gvdARBrESd3OTIhx8FLMzCUtYJ4MFxYrrDZSjN2Cb4N4ifT
	2WsKzXxX8SeNyzvM4h7VUWqXRhPEpIiXrg7/JXMSXMSfPtZ1o2auCSgsk2Ql
X-Gm-Gg: ASbGncsmVCO3yH/t4DM3Fd7VBVy+uPc4WxQmGJl/KjBx3kVa+2KO8LbCypStSV6j/gZ
	OCN6CmvMYv7mhG+dxNtDzEeH70KbbxT4fHI+fT4aCwzax5gdGExmWLwG/OEEOIOhO1tTsjD0hEo
	RIO41XYMgaFJuC4yx8D7ObuXyi6UTHk9OjbMsp2YLfXlCW4ciOspu1vVCfvRJjr9WRZWmkAMVqL
	4jVNyWZcwjZqAsK9PBdahcEBCs66ypZ0mGj3GqeRdJe
X-Google-Smtp-Source: AGHT+IGlwpyYbS58qTXxrv6QobsJotx+WHVFKjyOPcai1YWkG43PqFoc87nV43G9HXy5kirLRr5gqQ==
X-Received: by 2002:a05:6a00:92a2:b0:71e:6c65:e7c4 with SMTP id d2e1a72fcca58-72530185399mr36785276b3a.26.1733177887379;
        Mon, 02 Dec 2024 14:18:07 -0800 (PST)
Received: from gmail.com ([27.73.98.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848d96sm9307898b3a.188.2024.12.02.14.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 14:18:06 -0800 (PST)
From: buingoc67@gmail.com
To: platform-driver-x86@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for SARY Tab 3 tablet
Date: Tue,  3 Dec 2024 05:18:02 +0700
Message-ID: <20241202221802.9711-1-buingoc67@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hmtheboy154 <buingoc67@gmail.com>

There's no info about the OEM behind the tablet, only online stores
listing. This tablet uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB
of storage.

Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
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

