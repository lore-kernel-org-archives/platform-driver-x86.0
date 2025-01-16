Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4449EC4
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 04:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737003150; cv=none; b=awIRB80q0ZNSINhnKv4cITLa/53FyUt5D6zQs2HvAI1u6WoXhF4oo1PDxD2oik66bUxmUFbVktp3ehGLsY+Dz5YhMVztbg1iIZx3jPFJwx/m7mQheLIJtAM+2+zsHdsDMO43Ax5BQPhegeKFsgcSXP3VDc72Mk7U2y4XEkZGQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737003150; c=relaxed/simple;
	bh=F/ZUFQ0opKyePlkwWJpY1vYqzgDvVV6wVzqQXNxgm5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dw4o4uM930s9IHrAoyOGtZCzKWbEXcTbvfLETkM9/4q6hkBQBfMWsCsw9S/44+LjfSaf0HQ1a1HyXlIDQ1y/K4pT9thuWGduotcMFy3iF8m5o0/GWZRck0L8v95u7o1R5Ahpb7X0+quW45VMbDfCZqiXgs5BVR4jggW5DAPWZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beCBQGyQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beCBQGyQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215770613dbso5194855ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 20:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737003148; x=1737607948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmPaswkW7yIOp3GlVndvYa+GgNB0IAEw1xpl9ytmZ48=;
        b=beCBQGyQuXc/2vHyUCFyalUT8GcmObKRNNagQRI6wUzqhgZA7LYw4mvo/qnEG73Da8
         q4BjjHln5ZOw01jRIFJgRmACoDJqnne8wC7ho/JsBO8snrY+e4YkKdfnY7aRnH7crkE1
         VVZkxKT6VswwX9pecR6SD7pJ2HwlsY0ye5MVXV5U+/S9xBBsmk0USxxDbh0t1COJjRWu
         lHYqxf6dxTtDe3JlYix08j85M5RX6KG0gSnbnkXKp0RNMTsk68H1CEYSOyXInTI43mNH
         bY2zvlhyOdBLbVh5RqB7LTmw0HD8uMA3i3vPpxiKSlgC/X6K+NAhn31oq0fvo9lhb5oT
         L0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003148; x=1737607948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmPaswkW7yIOp3GlVndvYa+GgNB0IAEw1xpl9ytmZ48=;
        b=KhzoqB/hvy4NRATIXx3DmJT4qPC6q6+EQ9LWhuYkVFHJ1VDW9uRqZ7gb1Za9ItBTBE
         +X/RUeXPgK+8y0Dw4RqkNZapb1J825WNU8gkw+Tq8CjcP5zy8tvNcsxIbE7Y71QfRygK
         lgKNewwqmM7lK7b9gAfndEXui9pyWhnX5CMYuwEqRft+aAwPvQ8LBuCAi1hinWDkcTMF
         d6daetnbhFwQEAY4BGfox7uI+cagYi0QWQRlkl6UnlWxdkM0jN4dD3Wvu3c9hBDNULmQ
         hbGghnUy7oQDqkfsImrU0PvtAubxQ5iautlyHDeacBzjfRasCvJU8y64O4iFlYVeLrXC
         Bt4A==
X-Forwarded-Encrypted: i=1; AJvYcCXepOmQpt3vbN6ViHPfBzgJ0d9cpzIug4QW+q+n48PQJ9utmg1oCaqSFbOUWH8s9lQuJ+kq2CfRx6eHnOWgVapr3mfM@vger.kernel.org
X-Gm-Message-State: AOJu0YyApqyUMeIzL0WjEy3UarhC6V0ofebJkXzfmX6NiPzbr185zf1P
	DuIDZNl3XRyroDHCVHfk+0NEngv3/+j5o0o8Elz8E1nq29xJix2H+KrDkxLH
X-Gm-Gg: ASbGnctbe2aq77ASW1gubLpAo7K1Y6O6Sd704BQzslSmewZvJqkx/yoduHiFz3uxRmn
	cA4UtRkxvjd4EOPN7ftH5dk3PUrlIe69xsLuGcDwyT0BkriLvy8ZASB62plVG2zNv24ls/Jl5xt
	ZYvr3T0RJYa3KUJDck1C76LljSQhxt6dg3GyiOvYQhoaEkbwqniNX4dtaCIBUyUrQ7G6DPqh3gL
	ijagHMYKSbFfDEHQ9vXxSTLBLFOQygHZf6NuzDwPeVz+zcRddbkcg==
X-Google-Smtp-Source: AGHT+IFIoDEu9IqbLCrME64mu57f2qOtvj6RIfMdyhuyaB6c0xJrjUF2yNrll3jRaiKlEf8MUjKVUw==
X-Received: by 2002:a17:902:ecce:b0:215:7446:2151 with SMTP id d9443c01a7336-21a83f36facmr464420455ad.4.1737003147723;
        Wed, 15 Jan 2025 20:52:27 -0800 (PST)
Received: from localhost ([2804:14c:79:808f:eedf:d2f1:c86f:35be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f250393sm89991655ad.212.2025.01.15.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 20:52:26 -0800 (PST)
From: Matheus Polkorny <mpolkorny@gmail.com>
To: hmh@hmh.eng.br,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: Matheus Polkorny <mpolkorny@gmail.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] Fix brace and parentheses in thinkpad_acpi.c
Date: Thu, 16 Jan 2025 01:51:54 -0300
Message-ID: <20250116045217.575059-1-mpolkorny@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses checkpatch diagnostics related to
coding style in thinkpad_acpi.c:

- Ensures open braces '{' for function definitions are placed on
the next line
- Fixes parentheses usage in conditionals, ensuring proper readability

Reported by checkpatch.pl:
ERROR: open brace '{' following function definitions go on the next line

Signed-off-by: Matheus Polkorny <mpolkorny@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2cfb2ac3f465..7a693092f398 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9519,14 +9519,14 @@ static int tpacpi_battery_set(int what, int battery, int value)
 
 	switch (what) {
 	case THRESHOLD_START:
-		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_START, &ret, param)) {
+		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_START, &ret, param))) {
 			pr_err("failed to set charge threshold on battery %d",
 					battery);
 			return -ENODEV;
 		}
 		return 0;
 	case THRESHOLD_STOP:
-		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_STOP, &ret, param)) {
+		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_STOP, &ret, param))) {
 			pr_err("failed to set stop threshold: %d", battery);
 			return -ENODEV;
 		}
@@ -9608,7 +9608,7 @@ static int tpacpi_battery_probe(int battery)
 	 * 8) Check for support
 	 */
 	if (acpi_has_method(hkey_handle, GET_START)) {
-		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery)) {
+		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery))) {
 			pr_err("Error probing battery %d\n", battery);
 			return -ENODEV;
 		}
@@ -9627,7 +9627,7 @@ static int tpacpi_battery_probe(int battery)
 		}
 	}
 	if (acpi_has_method(hkey_handle, GET_STOP)) {
-		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, &ret, battery)) {
+		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, &ret, battery))) {
 			pr_err("Error probing battery stop; %d\n", battery);
 			return -ENODEV;
 		}
-- 
2.45.2

