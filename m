Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F83F12DE
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627432; cv=none; b=uiF2nrDgJke9NPcOnhapPSbSo6hAkXopUzxn1yJsvsfp0gRwQyI3a9N2zw51SmIWocxEUbhBJx32zpEQa/jpo3ziG6NHnhW8OC/e7BiOgFh2fwTR571LlyCXF+HcugN/Ez7mLKvXg3YdRYbNGRz+3YBuMB0wrf0BZXGJsL3CEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627432; c=relaxed/simple;
	bh=J6vDvjbCk7MX9LMkq+wxze1fd6NDlSnZqCj5f9c4+ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtvkKMQ9/K5FGZtZvNAgE0rOpsHsLUuydwLg6tsJhg1NOGbv2qzj2yR29LNa5VVlHlQlR8eJ5dkWJ8L0/jNqo9NAw3ZUQKV+JCx/IziLGRW82Pj33vJSSoICGXT2O5pwwBt1jB76ln4YBZwvAOfAEzl1wtJuKOYl0JsBeZTmSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+9UkMdt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+9UkMdt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-486e70f2457so224304f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 03:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627423; x=1792232223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pmb79NaTW27JYmEVgkO6fhUqLko5WfA8ujw653XjoMk=;
        b=K+9UkMdtgssN7RUKlVEm7ikmSWN2s3yOAKc+5Go4e1PbOlqFF7cwQL3r7zJnLWV6To
         N7j6YMVRHhio2Ettd7pXnu17pNVN++uYYNbXlcCt0YaU9+PgqBWZVwjTnxHJQyb1UXUi
         kMKBUuA3K7SB46uNUzQr+Euyi6iXxt0gu9RTv+Lr7W94vrlN5LQEuUSgkCrlg8MvV0db
         ItvFR+FAWVKQq/XKbrq1+p1Zqy8nY0GYBwGtUmHOpk1BTLHB2dbJEWs8zZjgPycKgLuq
         YL5NVnrs78WFs2U+X8XyAuZ8FWqX89LZ+w5QW/UwERll7PURNmBTsS0gkKxyYdIGOsUS
         PxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627423; x=1792232223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pmb79NaTW27JYmEVgkO6fhUqLko5WfA8ujw653XjoMk=;
        b=djC9GHhsZ5FMyUXVtGGkxnlnaDk+Mln6358OZElfAsVBjuL1Y3YMTT27xAqfrWKYKm
         lUuektKvPr3MjNdcoIxI/yQ9Ja8TRUJ+fVEQ6i9JjCmGxyqMrbzn6/PCW4iI2YxKSBVo
         IlmC/stkK1HHxLllbLWPNT6yMjwjtKhierivlz2ZHEzzRoa0C9cpMYE9mn1t5A4QYXR+
         pYS9AaVHeniMBHOI8DSMm0jAWAhGavsta59wj6s9Xes0eyEPaRTHm/wHIJ43pYfSxVVh
         2hHfKvAexEa+QUdvsxCkftO8c8sKDsqp0dprz/fdGScErgimy2ySh5rh3Frmsba5Jfvv
         EtsQ==
X-Gm-Message-State: AFq9FYJfu9E+YFb+9gVCEbIQW1tpNtTO/xIzoE2xUMApd/531MTZTk7Q
	btA4A6m9DOfLJC5sOt4E6X+mrB+EBaYnicrlGdMq1BM07BQiaQ1pnuGDVbrHi8Jw2/2vLKWB
X-Gm-Gg: AYBFou0HTTFrpFoQWvUlg6p/YI8IowxKiD0Mzn5ik+8ca2wnsSauqyK212T2yjJDpq3
	Q90YPALYTAYCv5H7n2nMytMBLEvLmGq5cQXxVNxJ0aWWbcsNN431uPBlQVZbs2VdXvcVfksjHLq
	wWkKyLICFdPtv/WFpmufggYrm73b3rLzBk3tcHol0sNgHPfngWhm0MMIl19m4xRM3Gtl0txHHGJ
	pb2fn5/TzRRBDHhZwbrOO0sy1214awhnGSkwbJtZKojWenOtSyAUxirKC++W7vgFjzCWqAZ7eWs
	cPY5YCRCySPpKu6yXUnB3QklrLJTE2nrVcYkkR4iaURtcIkWWkw2iilfUUcSdKNQxyNTlgHyTE5
	HN113/fNlaoHlEKs7T2zjIJ/GqSDYaKodkA0F3fbjaXI8UNAYdbsCSlqt7UTUN0YxbZkDKcl+YB
	bqBfu5dijOB9IhrDqGPc/362be7vkHgyyk8ADHrfDG7NjNlz9yehmXXPvzybxK
X-Received: by 2002:a5d:5386:0:b0:487:767:b301 with SMTP id ffacd0b85a97d-48dbacd94c0mr6289963f8f.57.1791627423442;
        Sat, 10 Oct 2026 03:17:03 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c38f4sm9417856f8f.27.2026.10.10.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:17:02 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	luke@ljones.dev,
	denis.benato@linux.dev,
	benato.denis96@gmail.com,
	corentin.chary@gmail.com,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v3 5/5] Documentation/ABI: asus-wmi: document TUF keyboard RGB attributes
Date: Sat, 10 Oct 2026 13:16:01 +0300
Message-ID: <20261010101601.888709-6-bartualev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010101601.888709-1-bartualev@gmail.com>
References: <20261010101601.888709-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kbd_rgb_mode and kbd_rgb_state attributes predate their
documentation: they were introduced as write-only interfaces and never
received ABI entries.  The readback support now being added makes the
omission visible, since the read format is part of the interface.

Describe both attributes, their positional write formats, the write
verbs, and the readback form.  The attributes are gated on WMI device
presence rather than on the laptop model, and userspace tools route
several non-TUF ASUS lines through the same devices, so the
description says ASUS laptops that expose the WMI zonal RGB devices
instead of claiming TUF models only.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 .../ABI/testing/sysfs-platform-asus-wmi       | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index f9825c6150b5..c63e7cdaefb0 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -238,3 +238,45 @@ Description:
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_mode
+Date:		Oct 2026
+KernelVersion:	7.4
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls the keyboard RGB lighting on ASUS laptops that
+		expose the WMI zonal RGB devices (the kernel names them
+		"TUF" for historical reasons; TUF models have them and so
+		do some other ASUS lines).  Writes take six positional
+		values:
+
+		    <cmd> <mode> <red> <green> <blue> <speed>
+
+		cmd is 1 to save the setting to flash or 0 to apply it for
+		the current boot only.  mode selects the animation, with 0
+		static; values of 9 and above 12 are sent as 10.  red,
+		green and blue are 0 to 255.  speed is 0 (slow), 1 (normal)
+		or 2 (fast).
+
+		Reads return the current hardware configuration in the same
+		format, with the command word fixed at 1.
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_state
+Date:		Oct 2026
+KernelVersion:	7.4
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls when the keyboard RGB backlight is lit, on the
+		hardware that exposes kbd_rgb_mode.  Writes take five
+		positional values:
+
+		    <cmd> <boot> <awake> <sleep> <shutdown>
+
+		cmd is 1 to save the setting to flash or 0 to apply it for
+		the current boot only.  Each flag is 1 or 0: boot, awake
+		and sleep enable the backlight during boot, normal
+		operation and suspend, and shutdown keeps the backlight lit
+		while the machine powers off (S5).
+
+		Reads return the current flags in the same format, with the
+		command word fixed at 1.
-- 
2.56.0

