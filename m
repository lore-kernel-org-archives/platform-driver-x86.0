Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838781F0E23
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907509; cv=none; b=Bl5pCwpGWMu8mXWTSp+jqPcofmZntH77mjUMQuI8367OWQyZVAHDLN0jyokjmSDTCCGXrE7oR/QdmgNrU9adTsVYF9Lzuecg5++LHE8OWJxEDjQ8LzlAYSW/XAir8+idRhUBRI2AszlGr6K1wRYsZ9nZGGWagcV/6bXuN/MNzfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907509; c=relaxed/simple;
	bh=xzc6iGnRfO2ycLx4vdmfPT3zKhztKlRw4dH2t5xdNOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hGA3QUzaJXEqlEkSPeZHq93xXrOPsJsJbG4DkaI5k3afPefjJAn7PvqK9l4fwhR9ot8EALLU0KtYeap5ZUisZx5i+GKmcfINLgWoqgxgrOavpY8T73SFhX58TW92tzHjc+HLR+0+N8cpFRSkc98FXMkLmZh+w1FBIcgqLU5NHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Do00WNjP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Do00WNjP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21644aca3a0so36137915ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 00:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733907506; x=1734512306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFVH/KSSEXPTec1UmYQBvbmL053Dhf4N6OBXbNMVafk=;
        b=Do00WNjPMSUh6QzCM17G42o0V9WkesH6nSq3TJVeBX7OZGTEVwox5dDAA62neJwHPP
         CCmKN+tWFOL2zgHlV04Rs3yTFy7QT8ApiJ5mZgrBUirWXBOmNnmODhRVqXKFQfdNSRtm
         t4z3tWUOZ4s2OT8B0WD6rOTap0BojfCxFpemyNj5P48D2bOczRVjunncuXqYOfl/p5FV
         Gf4DAR2RuF6YFeh1jc18vReWFKrObF7/jfnwOJsjx3v5fYa0zr8Q20jPeo9VISJTeEZ2
         6MlOCHAr/erQtuM+3oCeeu2OXK3yOiIGn0F9i1YeaTfHRLaVVQUxDLKeZ6+xQeOPhqQD
         Nrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733907506; x=1734512306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFVH/KSSEXPTec1UmYQBvbmL053Dhf4N6OBXbNMVafk=;
        b=CLZ0dDD/jVVOGzvFop/k2Lg2yEvXCsUhJGSSuVT1Ayq7rtAKpDSVHmXlZygOkJ/G0E
         mb89bFDpaCCXo0wZQtUN2KuE2StZyKH3N+hQn4PdYUSRVUD+Dtw0bnar/xl5CF64sy6J
         OkBO6qcrnnbkO/HzPp0nEiPdAVD/r2pPBnF4rAbZduwChBV/nw4O6hXxLmDWGyJLXQdf
         ADG5k7YGUbyu0QLaM+V04FSoPUIA21OvtAXvippNPn/5ocKzJZHG4oySOfwtI7An4U3K
         uvrW+pOJzR0GjZSUvj8zsqXN+CYgSZoM0bazl1aYjwi7Av/fGb7KBnDppInhR/8AyqfB
         rjMw==
X-Gm-Message-State: AOJu0YwBIljumRFsh7nwh2/uKhwVz6w1t6ePnT/vJBtb+JuW3PImSny1
	upVrErFGfLGOgop6u+Oge97EyqVUKgKEDaEyeufGVoYIWn72oEFV3/YMNPPxPhY=
X-Gm-Gg: ASbGncv0Nq5wSRLBqEig4lSh7klrG7kyrzHGuSn0DEG+e+P9/IrNJcFyLNtSzHtkhKM
	UTTBZt5Jtt/76JYLGvZ/0kNsGOdKDqTGKda/PU1vkCtUGBWUTSmBSwpauyy3aRhXjBvxS9g2Pe4
	6SMl8GDWr3V4sqgKFzT7KEB0WFviMsFgDoWloSqorbzDKqLrKh3m65aaV96gkdOQqY71XlCwFi2
	jZE5w9gACqYOsKyuieV3v9DaubSsKsuXHQpq0+KGRy/ep0Ft+jweOo+ud0ubCm0/ZmvtRXK8rA4
	Yv9aaWQR9fwPXY75YuC73lkPq1iZD2G21wJMBlcs
X-Google-Smtp-Source: AGHT+IEN2TQWg5alB2iZyxATEqbqSVdgLrONQtd7LEM6OpZ3jFRjRxinDWswvL07oAOLnTqsITAzVw==
X-Received: by 2002:a17:90b:1b46:b0:2ee:c9dd:b7ea with SMTP id 98e67ed59e1d1-2f12802ca23mr3452587a91.24.1733907506576;
        Wed, 11 Dec 2024 00:58:26 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2701d0a2sm12961033a91.25.2024.12.11.00.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:58:25 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Andrea.Ho@advantech.com.tw,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] platform/x86: adv_swbutton: use devm_add_action_or_reset() for cleanup
Date: Wed, 11 Dec 2024 17:58:21 +0900
Message-Id: <20241211085821.3982351-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe() and .remove(). Also, the registered input device is not
unregistered. Add a devm_add_action_or_reset() call and cleanup these
resources in the callback.

Fixes: 3d904005f686 ("platform/x86: add support for Advantech software defined button")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V2:
- Use devm_add_action_or_reset().
- Call input_unregister_device().
---
 drivers/platform/x86/adv_swbutton.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
index 6fa60f3fc53c..5b07c42adfad 100644
--- a/drivers/platform/x86/adv_swbutton.c
+++ b/drivers/platform/x86/adv_swbutton.c
@@ -44,6 +44,14 @@ static void adv_swbutton_notify(acpi_handle handle, u32 event, void *context)
 	}
 }
 
+static void adv_swbutton_release(void *__input)
+{
+	struct input_dev *input = __input;
+
+	input_unregister_device(input);
+	device_init_wakeup(input->dev.parent, false);
+}
+
 static int adv_swbutton_probe(struct platform_device *device)
 {
 	struct adv_swbutton *button;
@@ -78,6 +86,9 @@ static int adv_swbutton_probe(struct platform_device *device)
 
 	device_init_wakeup(&device->dev, true);
 
+	if (devm_add_action_or_reset(&device->dev, adv_swbutton_release, input))
+		return -ENOMEM;
+
 	status = acpi_install_notify_handler(handle,
 					     ACPI_DEVICE_NOTIFY,
 					     adv_swbutton_notify,
-- 
2.34.1

