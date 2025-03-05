Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7966D207A01
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170718; cv=none; b=SOGheYf+tkrlseuXu7r2Op3WvOtpVJxc36Uo8m1n4qBQ60nYpZDMCp0scXfI3Hp2skjcSQY81eYc/yEEzZulZZAZAk0jca+FZ1OFz3FbLDwUe2w5w8HxFO8O0O8FmlH03wwBTmsoCELzqrt/F8UHEvEsS5tQ4hCiRwrejDXq0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170718; c=relaxed/simple;
	bh=0v6Zt/MABbD0gYMSTn3p9nKFECTkaY5R5P9eYaq23RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9Kw/d9kTSNmMMaIu6LFCQEOsaa53/OcaNCuKG9ZpSaWhE3a1efpN33oU9rvu6SFqOWlmy1DbhHYzIJGO+xson8uwzf2noevj5A68fwEcAoHxIR7Jr0rC4TQJInHagLGHH76reb3yuStJLHjsVRuvhBHfWL2oxAbywEwHd6pUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0j+YpGz/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0j+YpGz/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43995b907cfso42555255e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Mar 2025 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741170715; x=1741775515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63++Ar5Not6v1z5SwzlcGxcT0577JgrxXolq6jAwmVk=;
        b=0j+YpGz/i8XYP9/bK0FoG19yqJqExhc60Wu+WtF90Bo4edM50LoIWjuaT4/19PCYWw
         9EY2Bhdb8y58jz5uEYuw1XrytNp4VraHsOgsdWnOLYgPhZdekqHUC5Yt6kEiKiuoh1BB
         sWX+BaHoaR6w2DCb2QY8lyKZ0LqehaaXnSiF7fKdQUl0Wmtv/ErP7E6Z0DacGNo5ERM+
         miyU95+pqnowa6uqeXH2Fq3Y0WfzYg6Rk6xxArepNaT41JFPZBxX3997Tlvyh2hERUSu
         LZqvkjghUxh09p3WQ01mGzTycHTyFBkYo3vt6Eo6QhYK1RdQ4UBQmrnqixDg1kacdYhc
         mnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170715; x=1741775515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63++Ar5Not6v1z5SwzlcGxcT0577JgrxXolq6jAwmVk=;
        b=Q2w7dIvjJGrnmxPIdBLOd2P2Hvt4gC7gWK4lBblbsMnYGOJsK24gUwKLX5xQMwmxtq
         7utrHD6+g/wM/z43eVnTUsetruR8zmMSA/WTVWrB2k8ynaa3SJpFxLQdkDLGOs84CQTQ
         6pDo+vCPWcCIwThEK/NFVQ7hW7RdfzKnWFEfaOia7FgVDoKRFDQtCMyDNS9O3OM07UXK
         hoePFk0mZZbR4JqihD4WaSK4y56q2e7Mt8vCDSNYdXkLf6Th9OCO+noYJ4gQrYtAtGtu
         1PxGpXkdggoS91d6uCS5ZZCGa8wMadB5TzLncxFjsFw8Gnf/70GeyNONornXCHqoO69d
         HyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmo/xS6bTHL/DL7yB0KPLdc+RFB/FQeAUnBeZO1H98A1EEPehgk+m1NuNgP8UlMKMm1btk+eD/enMd+Hx3TJvTc1DT@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdFC2nExve/Ojlx9TZlaogvD7CJioOODn84rcbHJnx8MEmAgY
	XRqjAVGu91AYi2hNdS98J31/rM+4FxWUHp7vhapsOnltPYpB0amTltP+dmbdlBQ=
X-Gm-Gg: ASbGncuQx3jy2/jVr/JGnO/M6kZ5mKYu5EzftGQf+Y06e6KpHHgzDoOA8X5+G6abwKX
	zJYy1M6ndZIZ0GjxCMHYFoHd/OxHNRznNIyrdZ4iqSpEURJnjN4rIWqthsCaUgJvvMlhfr27N18
	hD1ZjHHEezHIM9c7PcrFosIr/4RWt8yww82gKk4n9jMONHB6vctBbrRgfSiEtY7QrGmGUGux0mj
	NmAUd4JKu6S/Zbesbu4DG0bss55lq6R0c2dVAJquELOrZ2hvXIZB9ZiI1uY0Ga6bQdSb6daqu1p
	pevjpkSwXJzQnDZtCbzq9ou2a94o4P1tz5H9EgKfMqwb
X-Google-Smtp-Source: AGHT+IGdpofHBUYsSVKjftpHMXJCFI4qS6aBIfMRcLTGvpoDFRyhuHi7RyiMHkO579i4wWEd59VXnA==
X-Received: by 2002:a05:600c:1c95:b0:439:9b3f:2de1 with SMTP id 5b1f17b1804b1-43bd29ad100mr19311215e9.15.1741170714658;
        Wed, 05 Mar 2025 02:31:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eccsm13152975e9.27.2025.03.05.02.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:31:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: check the return value of devm_mutex_init()
Date: Wed,  5 Mar 2025 11:31:46 +0100
Message-ID: <20250305103146.53221-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

devm_mutex_init() can fail so check its return value.

Fixes: 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6128ad820ea0..d8df1405edfa 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11849,7 +11849,9 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	devm_mutex_init(&pdev->dev, &tpacpi_inputdev_send_mutex);
+	ret = devm_mutex_init(&pdev->dev, &tpacpi_inputdev_send_mutex);
+	if (ret)
+		return ret;
 
 	tpacpi_inputdev = devm_input_allocate_device(&pdev->dev);
 	if (!tpacpi_inputdev)
-- 
2.45.2

