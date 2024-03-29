Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029612E4A
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711722735; cv=none; b=CaYSwSC7SYSqdy8ye2YITb/YHa0Q5izzyQlic0a/dJZi9HpphJFNXDdeV5zxJy/iVzYf7KAhXs4p5CfYEuNW9d01tNwJH2vHc+NNLfQ+e4u8nrJPkocXfswhVIaKMl+7bd/LDbCElS+pV204XdezmCh/g/JQu5sljOz80bVQ2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711722735; c=relaxed/simple;
	bh=6gXzSfzjH8nmuYAa0pkmj7L9Rd/CTpzE9vGSbQmWup4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrP10Jtppu8yC/mpnf81gkGceVDOTmUaIbqXVtW1N4mYhGGNzS2zGib4k2dzumT65+ZoupSdpDCByd2cq6j6yysGPggUwxZo+jUfOLuLysp8k255M8uwJskGa1d/3MTIbIWihSEbldz2eZoyxdYPLeubHLUOXQzxy7b7xFNlx4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HYXPyfNg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HYXPyfNg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dfff641d10so15927185ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711722733; x=1712327533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE45PwlR3jKlrBlMBNLjL3wu0/aSGmw0zZ+ZfCCG5S0=;
        b=HYXPyfNgRqiCWi4azbc6HhmYyKXYKoHNpZH+0nDAE0mCIVlGIToTSHN7vkB7DMavq6
         nT1ZBAgNcgAqBmRGu1W0obGfWh685gMDOKEBvfJWJbFudMzfIpCLHrRFPpzWnAxrCC60
         PUaPy//UegMJNCf4mUdZIdiaSON07bI7Xm/10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711722733; x=1712327533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE45PwlR3jKlrBlMBNLjL3wu0/aSGmw0zZ+ZfCCG5S0=;
        b=TBdmz8q8ldWuVkW3SYQyRmlaO6M1n1/AuolY1BgQ8iYZinwkNNvj6aLXK25BZ5yerm
         pLZRM8lnIKm2ut7TJ0WiSG9TeCgdr57kvxhWeKbnA/oblsJwy7T4psOYcWhpzkZLpe2i
         xVWI9LoX2+6MvsEjh06oH2ELA96LnA1rDBHYbJTtAumu9sJp+3IZqdLAHOVrZb1HSu7F
         iKgi9CWMbDaal+ImCaQfqdI7UMsx+yi80dgCVVAlgriXOPk9bJ9++bO2HQYlIljPx+xS
         xfmLqqp8W0IzWVz5JqqwxM4TpcafWehu2Nvsl8F49Qk0XbBoGsRernEhErdonJ09qDp9
         68Ow==
X-Gm-Message-State: AOJu0Yw4TLopsUV79iIKKFQxLZPYdgFirrhFs9sn3+OCwEJ9Y+J2PeAL
	tM16nPd09wurkHbPzsTIuGfGukgqTK8wwd8G9HmosNHR3wM8vYEI96Vc8rmIjg==
X-Google-Smtp-Source: AGHT+IHvEpObQntGsFCH5vqjA9ure3vM7K1R9ZSp7vcSfrMn+R+kuB9xz38LvBpbMwFjaBXlJCU6+A==
X-Received: by 2002:a17:903:2284:b0:1dd:c953:cfa0 with SMTP id b4-20020a170903228400b001ddc953cfa0mr3112774plh.48.1711722732980;
        Fri, 29 Mar 2024 07:32:12 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:dfa:a229:6909:21a8])
        by smtp.gmail.com with UTF8SMTPSA id a8-20020a170902ecc800b001e0eaf9ac5dsm3506813plh.36.2024.03.29.07.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 07:32:12 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH 1/2] platform/x86: intel-vbtn: Use acpi_has_method to check for switch
Date: Fri, 29 Mar 2024 07:32:05 -0700
Message-ID: <20240329143206.2977734-2-gwendal@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240329143206.2977734-1-gwendal@chromium.org>
References: <20240329143206.2977734-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To mimic how we check if the device has virtual buttons,
acpi_has_method(..."VBDL"), use the same method for checking virtual
switch presence.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/x86/intel/vbtn.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 084c355c86f5f..48f0ac19d6ddf 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -258,9 +258,6 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
 
 static bool intel_vbtn_has_switches(acpi_handle handle, bool dual_accel)
 {
-	unsigned long long vgbs;
-	acpi_status status;
-
 	/* See dual_accel_detect.h for more info */
 	if (dual_accel)
 		return false;
@@ -268,8 +265,7 @@ static bool intel_vbtn_has_switches(acpi_handle handle, bool dual_accel)
 	if (!dmi_check_system(dmi_switches_allow_list))
 		return false;
 
-	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
-	return ACPI_SUCCESS(status);
+	return acpi_has_method(handle, "VGBS");
 }
 
 static int intel_vbtn_probe(struct platform_device *device)
-- 
2.44.0.478.gd926399ef9-goog

