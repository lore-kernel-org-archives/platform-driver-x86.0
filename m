Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063833557C
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256579; cv=none; b=PerfEDSNhmTX7xY6v0CtMf22BM9V8i/REQbDzbrhk//p9nzqfRGzb602ukOucOv8fI/v6j4DlIQTTVzlr7l2qD4E/RlX82yW6JTupPZ8tk6WEe/GPgI15BuVjj0b/es+8YBCrkbHpVIoGGKBbmbRfZeZ3+gCWoXnH/kwXdwx200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256579; c=relaxed/simple;
	bh=EAYHD0uflfQd6sszqckCoZM9plV9potl4DoHq6i9A4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItErqmjei+FZ582H35OjmlP6K9scC2ydVyke0yRuO/U5LRTJFH6ZebTRSD9Q/aGOZkff+C5hUbwsxv7r5+s2OAhJuaX7yARqEKBK0ZxGdU5lwaH4Jc9ZcB3iDQs0SOIsWt10Abw06PznFKb+LBGrghuJNV/LcwSvZYYFM5o/z6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL1wqSw2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL1wqSw2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1136814b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 07:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764256575; x=1764861375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SI5IT2ccA/LcmNZQUHmcdI+iq0zqrTHDtVhV8fx+VI=;
        b=WL1wqSw2h9maYpLMe+Aoz7zsV1mRG8SxFJEUoTLop1jyl9mr4Opl+O+jsYhQ6XSYCQ
         iV+TGTYl6pMZq+EiCGel0zZuQ0ha+bku6KXtjmYaidTcieXGjrycHkaZQ9eetuZetU3D
         2mPDV/wd/PSt6VQgm/mBcFeppx6jdSHZuEtbvkjmE1rj1FhGAjq6DdYckOsjZHgkXhu2
         zlEXGY0yo+A7GsguADhfca3aU/oNv+WRmfP3crf+xX6C+lsfCGDU2imbS1pcTT5oB+fR
         hBNafEJm/Ec/790+miaS7bSFo9WTAp4uB5qSV+7g5+jitsQK8G56hhH2AztpTg/cJRqe
         9Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256575; x=1764861375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SI5IT2ccA/LcmNZQUHmcdI+iq0zqrTHDtVhV8fx+VI=;
        b=Heg3TzpOga8CF2fZO+75/NCIlj4oEnuac98oH3QlKEv9fckoRZ5YYGO6gtR4miJ1Sa
         vvfdG+Co3j7EJHbf6XQSp7QhKud4Yotmibz29DJamKNZMsMt76LfgzMdiieQrztZa+iH
         VjK2tYVkt09ZlAhcNUGEmfTs48yj6QM02SWEltKDs+vWoF6pSOKZvgct9w4jASe40Zx5
         hr33fPWUDOFCIz8fkD13AYFwkv+3vOW5xg5FJ7jgTpxSdpS3EtB9ZgVUGzN4EzYpNis+
         ZErSGBYM768iKRJqdP7yXph5ArAJI3WMpoMnpGQpNfqK0ce+j86u7fAOFCCHhs+Wf/VJ
         rBBg==
X-Forwarded-Encrypted: i=1; AJvYcCVni2RPMjd5y5PNDLrLacZ5owJLNtqOEcVy9dhKa0zbR0JDNeyjYkMeAlCpgDjmSxPb/0JTpk3TyNu1u+OjctgyAAA/@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIvo7kOXvERM+ovbgqjcN2LNBN6BSfdqZUHcKh58MAMHA4/Xl
	tlnvskibVZA+lAHqdPr556Ru2cw1MZzm0mNzdlrq8PiW7YYrAZ0RaNQg
X-Gm-Gg: ASbGncuJlyoX++4Szdvj7iSEF0vu7OeEoRpvJZVeqL399NAjc4TaLy4e6cxG/9uxI8t
	fSHfmu02A0ej9qXfQGGVZI0LJAIl205GlaARnRhtkB6IG2qi54KpqMlds6b5mF477vFl7sI77V4
	Iec/PGNIID6CGxjJ06mXi+lQMvyrYYmOGJafhgheYT8NoGkyWOfuS7NhQ9ZGmDwueOVaZmchFZr
	tUr5Ew4iA5YoXW7pjfX33bsD4IcXRxr8gZpusV+Lz3BqJa4ko0LvsC5vXJKyMnwksU9JNENUcID
	HtBL+n9q+G2ich1SaSitA/v9ZYIkl8ifdAzjTfnnQeAP/CJC4ttKZppSZgD+84tnJeImg/b3BUR
	q2jewQTv0EUX3a89j27CufGUVYjTDgGjjJyIyOWzCyflLgv3HgXqSFTA14SVDGK2Gpsu7QJpdOM
	vBdspYX+un703Kf8R/ScDSNrKosoDaXw8z08V/Jr45H90J7Fn4BEJJ0Dsk83I1ygzb+jU=
X-Google-Smtp-Source: AGHT+IF2C4VQYvmJzN4VQiQ587h8aO8/w5xYj9vrh6mYj3laNxKF6BXlbjKrvVYNuGLe/wityRhDKg==
X-Received: by 2002:a05:701b:208a:b0:11b:b064:f606 with SMTP id a92af1059eb24-11c9d85009cmr11987237c88.26.1764256574538;
        Thu, 27 Nov 2025 07:16:14 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb067088sm5099656c88.10.2025.11.27.07.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:16:14 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 3/3] platform/x86: wmi-gamezone: Add Legion Go 2 Quirks
Date: Thu, 27 Nov 2025 07:16:05 -0800
Message-ID: <20251127151605.1018026-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
References: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Legion Go 2 SKU's to the Extreme Mode quirks table.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index df475e52f79d..381836d29a96 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -266,8 +266,23 @@ static const struct dmi_system_id fwbug_list[] = {
 		},
 		.driver_data = &quirk_no_extreme_bug,
 	},
+	{
+		.ident = "Legion Go 8ASP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
+	{
+		.ident = "Legion Go 8AHP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
 	{},
-
 };
 
 /**
-- 
2.51.2

