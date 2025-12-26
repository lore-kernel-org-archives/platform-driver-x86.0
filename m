Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C52857F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793269; cv=none; b=a2Oqwnl6JMQ6GX2ESC8Ymg4woXgxd1ajoxsRjlPKX/NSBOJGiB31gbRN5Q5hTpABFgE7iY2GSPyZ8UnZ8HEH/suM+a9sM40I8Rj5GOkY0Mm4cW1KzIuSDiKJbkJRZNwwmujssOzWFOLx0uwwXNZRPtOr+eHtxx7yMFugD5vQMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793269; c=relaxed/simple;
	bh=1SdlCZOHH1KcWWYXNTcQtIYihCh8YljUkPPX7+T+Z3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvNkyHtVhkXnYSVoG50RTSs7R0xEsrUaO0S70SfygMGlyZ2oeHkDc0n4t5QH9JLS4DoKOzHBEgi1mmIPbUKAJZ3grV35VIHoa1aiUE2+IWhbIhQs9uBfnTuhnj8hXq3gkzaY2A7R2I8Ntw41qz8B6HWUvVQZhwNhMg/+Jl67xbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agvX5hlA; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agvX5hlA"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7b9387df58cso12233039b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 15:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793267; x=1767398067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rRrf9jdBX343iQYo4lj0lM0On8e8PTdq9pmhf6wv5Y=;
        b=agvX5hlAeWVZM/7fqir6cRmeDDiMVL0FX2QPCOXzpddMtpXUcQ76gIWOInWEoW681/
         HBzIX9riWfjLnzhgJ93RPcKSP+J/KJik+y6rPtXHXqhgZl5tchJos0dSLr9giAdCtu/8
         fT0pVRp4MrF1PTj3vEiJusCI4NPV6dwiPcHFJeOeqWHEB7f3slg7u+2NZN3AHM/892va
         My5zq0Shdzr8rJvO7ligK8U911+3IHVYGG0nawzDcQ1dC+Tp9n+2vpbEjOEwHaboqPQc
         TmJ9cv+w5WujcYl/cH8NpoZg+WD3G4vZbOHJdBcFGHDOlGBCA7aixlBitbBtp6MbOfQ1
         uiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793267; x=1767398067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rRrf9jdBX343iQYo4lj0lM0On8e8PTdq9pmhf6wv5Y=;
        b=rJ4Ep3o/8tE4MFaJDJZEwOAYi15XMRcFGu6FJALKZyNQOh+erXcVKJbPglX4Z068KQ
         QHLSkjkQJV7vdSf3Tb71D1F0MZClvVb/qIXd5BE64IW2JOqll5ZO1u2iWyv/fqXPuPWy
         eDW6Q+44utY+OYJ7tSCvkZ1zljieqs3E0tTcKmidwdCdGf1fgFZK8934olBiRAyRvVP/
         QC6DpJCfD+4jL46x2EkqZuSCLe57E6PT61AVkWVKtGinaw1Xwvh3Do60b73Y9+aef5wn
         eHvunuaF5gpgOhCahV+RxFCJPAEQpNJO0IzCCCYpI7BGlXnVZy1VptxY7v7gvPkSayMF
         MXPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEJEkntr66LFoVr76VR6RrwquTQGFP4JmBsUjUySLwyk8Mw7AAhF2XbcCulH+Ig+aVl71We87DH7G9mrLx2O5Zkhkj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ad8c+GHwzi+KKXkgj0E6K78hBEt7GkCfnutKJa5yPnyoU9Qy
	YKqSDw2s3KH0phN/EjxWFt3sfUTfOV8otTsg0MYrg/e67Vl+V95/n9Ma2BXCfD7lWjA=
X-Gm-Gg: AY/fxX4ukcCdZbOcEDMhXUj2qIyu6bcPM4UYgdR85/xbtFVdE6XrAe8/snnMiLovq7D
	VOyXJJotskSMAn4Hs4LawRcn+e8f4x0k5sp9ZwSbYUE0DR4ebmc8ylj0M+NR/y/YmrBX8cEkNp2
	cRtdEPPdOs6HWGo6atUSn2K2N1Cx1Fx/8V0yQFQTGX8xoL/ZX7A3CjlTFzGAUVmZkFfSgHLkiG0
	PruwyqKJ6A309aFxfYIY+PY8ZrCP5I6/kMOIxfP7r64yS4zGPnO5SXGGW2aOraCsv8dU7ED9ZF9
	9JhFMbq9ZunIkmYUsbDgJYnp4jOvO67/3vO8FtOYx/N1yeUkaWislk7u4x/DbjXy03ar6d5Sqr9
	5AROvaru4wg1lojvr4jWLeKU8QrhduxyIRSl7NO5IlV7w1P8kwdTX2Hzo04KGz+nTKHqv8dlGTy
	cIyb1VIJarNn1xKsZ4QGoa3P3YlxCDF6/yatI8eLZ/jT5jKBZtWAPq2fKqO8XLnEPKRyb1iugvl
	/C2
X-Google-Smtp-Source: AGHT+IGuFiGBjFMS9oYCwzOarwUo5Emq3cwg6KxdhIJ3EU9w1ec9sB8aCPtiMnCJKi13ZbL4mqZLuQ==
X-Received: by 2002:a05:6a00:8014:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ff651c3519mr23692817b3a.30.1766793267546;
        Fri, 26 Dec 2025 15:54:27 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:54:27 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
Date: Sat, 27 Dec 2025 08:51:01 +0900
Message-ID: <20251226235101.106451-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..23bc84b0475d 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,26 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_enable
+----------------
+
+sysfs: doubletap_enable
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+
+Values:
+	* 1 - doubletap events are processed (default)
+	* 0 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0

