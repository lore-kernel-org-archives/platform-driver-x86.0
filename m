Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90618643
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711722736; cv=none; b=R90CCBCNHgYSZuS2aQcLThS1KI+tYGjez99+zFM8YZrPaktv/DgkWYeJMhhMs/UqcXr8j8350F7CjMWhhL8EIn2rrIBDuuxRG2pf5I5jdMwR+uSXy+DHce+UVdjpE66BDxZ/X6zqIHZA/81ZMySzkyNShVcGoHZEUncpOHDYYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711722736; c=relaxed/simple;
	bh=h6uVVyB0p4kTyYuKU8UShqq0HbnAOb42dwudCpNXDEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIG4PBgtu+QsS4JCckw830rWj/Pl3VUMdltlWLAreNk2oQ7i/LYsjXNApMInwnOEOtd+Zu4fEf8d9Mk8RHrGd0svAp/rsOaaKjA0BkOAhyyTb+DPLjxOCi/3LTWqSZmR6u/cZJ8s+izikAAtnmRSg5r8U5EBkztHQPbrVl2GEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mc+5BZ6a; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mc+5BZ6a"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e0edd0340fso18842895ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711722734; x=1712327534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9li+QXVjq4IwtYPiGEA+t1OfVf8WVMq0sNRHQhPORS4=;
        b=Mc+5BZ6aw1GhtP3rDeckLGWKsw1jMW5naZkYCB8HOlHwpJ39hqwZcoJpKiF3Of8dN4
         Zq07WwacDfRevbNfaytYusxJV5RdadouZsGXMDAAWe76LLgV1JyZQBBHR1Z19HQ/abja
         UK4yAn2W9d8UOfz6DYtD7TOYRwK7gu5vBl0I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711722734; x=1712327534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9li+QXVjq4IwtYPiGEA+t1OfVf8WVMq0sNRHQhPORS4=;
        b=Py7uJfk142+0XnK/tcxUhaR/yWp0qJix9Fn/xx79sdFkQn/QuIit+rtcsZ5SxXdCcj
         MQFHV0QrGTo81RyPlQcUKYiZahEv7d5aKYGMRUu+TmLD8wFyD/GSg6PAM9ir/bjIbfJ2
         aM3bzizHopfjY2VngGHiRgfYgEQiT65DH0amlF0JUu4yF5SgecKBm5F21/ZO2udH6ntJ
         Q0vYGu005o/qYjl5Nsu2MseZ1kk9Ux9SOXZf/8pFXo3twF6eHHgjviluPeJc++26jUBd
         bfQmjOUtku5m3rU4l4iPPhwKOS4ix5qhWymRokd+tb31cnIcPlRmnKXrUQfZbhPnobS5
         pMDQ==
X-Gm-Message-State: AOJu0Yx1sE04HFkbBybUWpTFXbftG9TAGcnSPsXP/UjMyqNNK0wDcZjG
	kOkwMXDGUxTgAFAv0+iDpA5GFLYuhGD4uQFHQl1UPJERPlysDRiFV+bcU2O6sA==
X-Google-Smtp-Source: AGHT+IHNr3AxU2A8hdvoQZT0J6e2vTftO8fo1WkEv5mLOJdgBBJFDFc9jpY3r+gcb3pT8iWLdEX00w==
X-Received: by 2002:a17:902:e808:b0:1e0:b12:a1d with SMTP id u8-20020a170902e80800b001e00b120a1dmr3133747plg.42.1711722734094;
        Fri, 29 Mar 2024 07:32:14 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:dfa:a229:6909:21a8])
        by smtp.gmail.com with UTF8SMTPSA id mq8-20020a170902fd4800b001dd67c8e108sm3499885plb.199.2024.03.29.07.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 07:32:13 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH 2/2] platform/x86: intel-vbtn: Update tablet mode switch at end of probe
Date: Fri, 29 Mar 2024 07:32:06 -0700
Message-ID: <20240329143206.2977734-3-gwendal@chromium.org>
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

ACER Vivobook Flip (TP401NAS) virtual intel switch is implemented as
follow:

   Device (VGBI)
   {
       Name (_HID, EisaId ("INT33D6") ...
       Name (VBDS, Zero)
       Method (_STA, 0, Serialized)  // _STA: Status ...
       Method (VBDL, 0, Serialized)
       {
           PB1E |= 0x20
           VBDS |= 0x40
       }
       Method (VGBS, 0, Serialized)
       {
           Return (VBDS) /* \_SB_.PCI0.SBRG.EC0_.VGBI.VBDS */
       }
       ...
    }

By default VBDS is set to 0. At boot it is set to clamshell (bit 6 set)
only after method VBDL is executed.

Since VBDL is now evaluated in the probe routine later, after the device
is registered, the retrieved value of VBDS was still 0 ("tablet mode")
when setting up the virtual switch.

Make sure to evaluate VGBS after VBDL, to ensure the
convertible boots in clamshell mode, the expected default.

Fixes: 26173179fae1 ("platform/x86: intel-vbtn: Eval VBDL after registering our notifier")
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/x86/intel/vbtn.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 48f0ac19d6ddf..79bb2c801daa9 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -136,8 +136,6 @@ static int intel_vbtn_input_setup(struct platform_device *device)
 	priv->switches_dev->id.bustype = BUS_HOST;
 
 	if (priv->has_switches) {
-		detect_tablet_mode(&device->dev);
-
 		ret = input_register_device(priv->switches_dev);
 		if (ret)
 			return ret;
@@ -312,6 +310,9 @@ static int intel_vbtn_probe(struct platform_device *device)
 		if (ACPI_FAILURE(status))
 			dev_err(&device->dev, "Error VBDL failed with ACPI status %d\n", status);
 	}
+	// Check switches after buttons since VBDL may have side effects.
+	if (has_switches)
+		detect_tablet_mode(&device->dev);
 
 	device_init_wakeup(&device->dev, true);
 	/*
-- 
2.44.0.478.gd926399ef9-goog

