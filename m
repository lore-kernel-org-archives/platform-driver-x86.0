Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946343B95F7
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239704; cv=none; b=UqX4EcsTJQQNko3YjmJGkKYfTJjMFX7FvJlZrzwwBFzTNOziM5JTvMyq5MM0EQqBvCuKV0duP9gdOmyoAq2Fso/yR2bsn9/GCGtXzNJ7+OncX8mJGcsZyduExaZ2h9Tfba7HM0b2bTtMUzrYH4lEFVHo81QaU6bNJNr7sy0/hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239704; c=relaxed/simple;
	bh=i2XhmUiYnFer9xzDmhFquJehlBBmC6H0pTBvtA42ATw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cK9IzHZBGLy6YchDod/pMFyrLdig7OI6PMPZu9qDhOjcmjz6qBAf8vgWFKSfaqg69x/hGUr1UlbCwBZtTV14O+PhtbLHaC0yQ068CE06mAjjZNRXWA5RS6FEEeD5dR2dAbSy3nHR7AWdvP+DdMvBc8Bb8uHjPetRoOSO9O5dh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd0WzJfU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd0WzJfU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae43042ea7so119127595ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239703; x=1773844503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha4kqWoqYsblto5PQkRWralkYomP/+jWSwYzX2+nEmg=;
        b=bd0WzJfU2YhgV/2QtHlDLHeJxmJKHuWmrW6vO3qt0i9/PQVdOaJaw90O3ufkWnWSCw
         452DraZfM+bPkqN/dn4N7C3dU33ZbarYrEeTb1mYgOmcYQkgYz5hbGN59+Hn9ZEMPf76
         eLNKVP2bDvKIwhWtW1UWkSlWOnh5kC53S5S1k6t/1l/oycoRrBIl7yavw+hSfevv0NSH
         ALuKPxkG1D+2S85MGA+gWQ3yHGmq5Soi4PkcDnSmDLAEPLH3zWDeW9y0z9VSyeAFhDVT
         EhIOBiqVa8R02IlJcrwXasJDlONIe9lURmtHEucdIEL5OmHrHwQxfEYi12wJnVQcEKd/
         z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239703; x=1773844503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ha4kqWoqYsblto5PQkRWralkYomP/+jWSwYzX2+nEmg=;
        b=jWHSmgWTqDSPUCE2x9s4TyYutQj9/DrVbCWQtKseIk//3BqLoQPi/9hFadrbQ4MKD9
         ffICXkKw2fYsdFEJex3KOsvayDOVInpdQqx2paemng08e1oAuyRnZCnt1D9ozC1d9oiJ
         NqNSBNqSunxjoW6CYsKLAlFgBR7+ZXgCMz0pTjIu9QF8SaTbKjll4F30Ida6sQJwxLQD
         h6WdrjXvHiABWxJkQtSnIINw2m6sWdKplTQF81BHOhdEakrCRt77qrY+OlWEBWG1s23h
         4dKpI3ihDM/oa3Xc3qqE9KXv+EnPiSQ8zlBRlOcpJRXsL0yarpZajMcBhEz8yTmgWnOB
         mVzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCz+rVw4zrRIKEbqI7atvRVR4M8KaNLUDabPZm1wHW6HqjhpFJSQYKKT6K1pch7xpkmHkjs8DyPWFcoAzQyScd56V5@vger.kernel.org
X-Gm-Message-State: AOJu0YzkCC5b12m8DVw1a38CB+Fdpyjor1sbnXAP5/ES5slVRcMRr44u
	d6swdl3Ck6UdeqGdEafr3SgBtA5eLFHGTC1EdEcIAaivBm2QUpPRCcn+
X-Gm-Gg: ATEYQzzHazXZoYR4uukQc+BlAVpH8Ji0eYzT+JF3KjYqWcSgJYhtlfkYw75pm8C/J4M
	3XOPJm5trlChhbGK7SKODZOHA3SFuUQUif+HjauGqVsdo2CBhW8iWEoBPgdg9QD2u2tVxnFqEai
	x6bu52StVZwvgfM4S31FWDhz2qjxJvoK/4FIZRE/0Xx+cP7VpacMgYdFjOeiL4g/G7SuVb36GBx
	spdfAGwZgMS7asEcCEk+8BsATtJgCFDt72cjG6xnfD7AVReHHFX0yx3ZCJO15jwShQ/Xa2Et86P
	NG+P0brxPkKyZNgamc04L6BzBGUc8ROk6uNUZ8cgKkAllrUSc0/VKkvnR89wW4wQ+FluVIW1laa
	F4xk/Gk2y0MbyiV5GVuxfSznTM0kf3qnGq69tEfE5dooK+NeApThg/Eo71eyTjH5aA+6BKvTPys
	JEz37VqGOZQsIafK5TkDvt75ZGUNwURH7bO8qe0BBfUs85M7BY
X-Received: by 2002:a17:902:e744:b0:2ae:7f7e:93a8 with SMTP id d9443c01a7336-2aeae904128mr28551575ad.51.1773239702933;
        Wed, 11 Mar 2026 07:35:02 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:dd5:d7ff:1c94:3624])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e070sm26399235ad.48.2026.03.11.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:35:02 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v8 3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
Date: Wed, 11 Mar 2026 23:31:44 +0900
Message-ID: <20260311143144.482145-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311143144.482145-1-vishnuocv@gmail.com>
References: <20260311143144.482145-1-vishnuocv@gmail.com>
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
Changes in v8:
- Fixes indentation

Changes in v7:
- Fix formatting

Changes in v6:
- Fix formatting of doubletap_enable sysfs documentation (separate Values list)
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 03951ed6b628..f874db31801d 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1522,6 +1522,27 @@ Currently 2 antenna types are supported as mentioned below:
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
+
+	* 1 - doubletap events are processed (default)
+	* 0 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0

