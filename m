Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE01F0E2B;
	Sat, 21 Dec 2024 06:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760808; cv=none; b=bdSi6kSQNhkfjLhDToBiBweSymZVxd+CJ+vrT/6Y9Vx5EzZQqcqXPHD+EdoFRQ2qDwQbd3glvec1rGl9YULH0xBnraPrgeEnyotHgTlQg7y5Twu4Vo7BZaz/s2JIrf5j0ft+8FJpYZFgYL5+OlpjzK+2+xSg5dmgBJDfAdeK5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760808; c=relaxed/simple;
	bh=pQ65vHHw1KfkcPhrLO9oZxVlO05EwgMUCzrI0idNl5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArAfj+3LlceLVbtBRewRiqR9RVNhjlsiL5bf5FKCy5c30zcsROAZC53UuVlw7WLCeKAWy4OGkH++h+ctIA/uxZcC5leEFhB3jJT5xNPmRVXT5stFwLzuG0r+5RwZ8KNpOpIq6xW6IbmQcZOCXOHyYGLbY3g5ZrJk/Z/tspjzkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDcH/LYp; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDcH/LYp"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ef81222be7so23712577b3.3;
        Fri, 20 Dec 2024 22:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760806; x=1735365606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D151A0a1z9BJk2SJvhiNFRuL20PvtPUMAFhgT1XqVU=;
        b=dDcH/LYpHbAhgaMIMhNT3sj7ca+2FuKih8CCnFj5d4RG03uDPskI0ee9rGGM4lc4Yv
         aJzZog9iTNUWc9g9vp5pU8KtbChI60plKpFH5e2skbMZR/pkxhrB3XBGtaYl24msLqmy
         rRt9COFci5nWsRxUZem+6HDNaeTnpAVDqobKpM+kQttw02y1m0q68pr5VyAir6X/T6Ev
         TrjFpRDiMmreEUTuD17cRNc26C9AQjGc1vyq5EC4YGOMG9LEot1zpFwyWYgH7xwp6wP5
         FpEjcBK+cttkw6MhfvOyOiTqg9/8aW67fejFd06FIX8PmE4Z+u0v4H/rRpCcEUwYIrrk
         QNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760806; x=1735365606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D151A0a1z9BJk2SJvhiNFRuL20PvtPUMAFhgT1XqVU=;
        b=WFaGSh5add45dH/Yr8lUbVLfD33NZA/sPmod1hLDO/W5V1aJej7XcGsxig/zlXzdoK
         kLsUyxUZVrAuO7QnHUxY2AgxsStZRHRQvrTCwAu+SeleeQbhymc9FW8hMMKk3X8w/IVO
         WV09MkxBHw+E4ty3QCXK6c9I5dHkUy/SmG9c08eWfO0n0Ii8keK5OmJGCGkRCcjxb7pe
         vpR0MkrK4RSQ9VTaPpA3HHGWJLaTzdlF3vTCVrHznYsBMH7JCgUY/uORbnqUlYgzPd7x
         u4nu13t2PB0cQO20g35i8v+I3RCAdcHv4s4bQy888BqfLsya+xOJOw1MlmESxdkpdhqt
         4tFg==
X-Forwarded-Encrypted: i=1; AJvYcCXNXQConOI72G6olBVYeK28smMEhffQRhOUryM80lQ0OGFig4ECi21EPDs/KotHsRPQkznFBYTfmtIBJUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVXq9CAFjQnZQpUWWg2M9n3q2yUlLkMaKqrVrB9btkK1M9EPD
	cnomUx0NnYZ5RofeqloClpPrAr8hVxgQ/ZLook2go500tVtTKwRWFdheJA==
X-Gm-Gg: ASbGncuVPO5/7ZpNRXIj10q373m13p7hFdAvPLKY/69BTFOadpxpGbHlXVDatI47xOP
	R3Rnk6azFcaDBNX/jDLC8KPOXwj8eNBP2pJCN42aHYW/+klq2HaZP0x3zbZt1nzGn3ZqyX94nPy
	GSN2js+4pUW9pws9evmYKJf41IYBJslyJjinLt7oPmrjuYtRaOgLmdQFhc98OfHQkzn5j9l9Uem
	sMnbPLrr1L1nKLf01w60c4vTnnz1YjOx4U5pdZhhCmP/FMRt+14D1AUuDL2QhGi
X-Google-Smtp-Source: AGHT+IEnMX5yjNtAOfbd4ycyPAy5XYFLJ3MYeXSOH+vzT+wS8VaqjMGKGUF3llyqIWyshU839qoEmw==
X-Received: by 2002:a05:690c:fc2:b0:6ef:68b9:c956 with SMTP id 00721157ae682-6f3f8240672mr44243007b3.39.1734760805703;
        Fri, 20 Dec 2024 22:00:05 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:05 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 06/20] alienware_wmi: Clean variable declaration in thermal methods
Date: Sat, 21 Dec 2024 00:59:03 -0500
Message-ID: <20241221055917.10555-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder variable declaration from longest to shortest.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index a431b1fec9fb..67cf376df0f5 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -923,13 +923,13 @@ static bool is_wmax_thermal_code(u32 code)
 
 static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 {
-	acpi_status status;
 	struct wmax_u32_args in_args = {
 		.operation = operation,
 		.arg1 = arg,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
+	acpi_status status;
 
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
 					WMAX_METHOD_THERMAL_INFORMATION,
@@ -946,13 +946,13 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 
 static int wmax_thermal_control(u8 profile)
 {
-	acpi_status status;
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
 		.arg1 = profile,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
+	acpi_status status;
 	u32 out_data;
 
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
@@ -970,13 +970,13 @@ static int wmax_thermal_control(u8 profile)
 
 static int wmax_game_shift_status(u8 operation, u32 *out_data)
 {
-	acpi_status status;
 	struct wmax_u32_args in_args = {
 		.operation = operation,
 		.arg1 = 0,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
+	acpi_status status;
 
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
 					WMAX_METHOD_GAME_SHIFT_STATUS,
@@ -1045,11 +1045,11 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
 static int create_thermal_profile(struct platform_device *platform_device)
 {
-	u32 out_data;
+	enum platform_profile_option profile;
+	enum wmax_thermal_mode mode;
 	u8 sys_desc[4];
 	u32 first_mode;
-	enum wmax_thermal_mode mode;
-	enum platform_profile_option profile;
+	u32 out_data;
 	int ret;
 
 	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
-- 
2.47.1

