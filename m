Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347FE36492A
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453413; cv=none; b=M7DI27+fmLJ5qAnHk8wuTSwMBxy3Tx3HELqfL/6S05rUKSrKOzrNshfj/UjRDI8Tqiy5O6IEpwtw1Cs6qvCf9APhg2u4//cKKe85f12m0ubG9ZHWJMOmlnqVUBRytfb3J083G/IsXop43358VfyQU59s7nR+4BieSYjrOfrba+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453413; c=relaxed/simple;
	bh=ujuYV0pSwCtZOJwyM0F/+J7velSQIeFiLkVjt+sG9TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfR9UpMILo9K9ixnvcbo9/Kjx3pyHHEbZ0YwXDPHOE7EocW2Hkf6qIelqpHgs4HwGHVyVtb4W+dq0G4zwdmF2y8YQAOMdF49aCAyvmg8Pe5e5axnEBD8+6AATWHOmv7PT7YOCu6VDoFZnzN+oQXFNK4gzZ4JRZ7uWUEyPKN/YU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oll95xjg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oll95xjg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so527998a91.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776453412; x=1777058212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OekRKekk3j1AeClebcRERfCyBBA7D7adqLjQiMd5w7Y=;
        b=oll95xjgfZHQo50hAJZPLIVnXdHT1iFP+M6V40eAjX8LN0Uf4mPmeE9RZrxjvC6qvg
         4pfrESXzp2lkw8LxkBOdAhcCIFLmcQdK4180IVa3PsFf27DH5eZnDXkH5TXU9/4AHfMW
         JuxNMWpbmxK05tvMk9JALehvVhTGGLPsJSDuZNNYYXlTlARrAjBUSsexTRvuNH8z+5cX
         8kiRRY+EQpwpkhhibMccAy0q22alPFhANFri4tdT6RUiYs3aZ99yMlwlULNLJpaiNtWF
         FcpdyOYm6D0KR0jJnveuUHAONgOMtISrFWp29QZHJrBNt/bmzCAN+I1YkLjdbGlkJznk
         +xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453412; x=1777058212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OekRKekk3j1AeClebcRERfCyBBA7D7adqLjQiMd5w7Y=;
        b=QVWad6/MEwdVxm3aBSdZj7/4f+wXUsHvecc9qILDmTou0PxGhIICPSKMVxxY69FPZK
         l5MS8w1GmqE3iW5CXIssyNdukqMxDVxCXfRYO7idkAW3i4WvkJatPDUFbU5INwmvqK9L
         GplsKA0+RyvNTkTraxZ4K/Xtem+XyO55QsSNMPP1USfOZXTJ1fBPIAb9jY1j4KN1QwBf
         cu+TGljhhXvCr8ALrUHK1FCzktX2lWhiwAuYcub0fFsFWtECkMFdGpivYP5VmOfMOelH
         5M86A9YI7QZSlfLWCTcSGd9hkueUxbo3mEdpPJqIoUrXcVA0ytG8eUopvNWkdX5GWjKM
         jigw==
X-Forwarded-Encrypted: i=1; AFNElJ/pjkPAyFgL28b/WbeSwqIpxxHbIjuM3bdOzCZrUHuT0hkSXQbMkLU4UFmmNH8q5/IUiUkMQlaqolO+GKYmHw9jy8Q+@vger.kernel.org
X-Gm-Message-State: AOJu0YzE17NQW9wxjwX7bkuCRP1kPFKWaf7pM9P9PMgyWkjKAMHpn5mm
	6Q938rvizxbcphQAYpadwhhpRJ/1UB1oekTjS+E2b8yhkXpiIKnA4hr+MdWvBQ==
X-Gm-Gg: AeBDievj/FwL2IdlgUSNhPprvT7/QkVhMLz/9s0BJDevQmdwsTYHjkpig1BLZNODkH0
	7uzgPbAo7bs3SHQKMcQv7x5r2RsU43rMvJz3vIhr6xjpQz/Tn/5oXbxTVyrxgDamksvs4pe7LhI
	dVIiZy2fUTv06X9T/HDvAmMc3nTKN9TnU/erewnflstzPUznr96B6o8B/lfvC3bZdQCHg5J0En/
	TM0MZ76iwdxL/brFrTzERKAPVSJjKQgOpB6FrJXg0ur+N37t7OUKc17Csjhq7qUit+mcJP3VqdC
	bEBRkFqORrigZhP71jBt3pFMh9/PKYmpA1BRg1nCkQ8Uow73DErt19oYiqm9ryRCKCAcKMBlvK/
	dbtQgAI57S78Fm81pvvyirX8s+tnpA11VoY9gjWJ6jM9YiJud2Ei/uLgMNoXIci+T99LYid+N8f
	tCvXlQK7npCxxUvWw9/Oj/fsyYGuY87GkvBzI01oPrnLdgeu8wuHoJn1467IJRK6iX
X-Received: by 2002:a17:90b:55cb:b0:35c:10e8:1a72 with SMTP id 98e67ed59e1d1-361401f50d9mr3769729a91.7.1776453411388;
        Fri, 17 Apr 2026 12:16:51 -0700 (PDT)
Received: from gb5.tail50fddd.ts.net ([139.5.199.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140feea38sm2913310a91.6.2026.04.17.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:16:50 -0700 (PDT)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: ayaanmirza788@gmail.com,
	ayaanmirzabaig85@gmail.com,
	josh@joshuagrisham.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 2/2] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
Date: Sat, 18 Apr 2026 00:46:14 +0000
Message-ID: <20260418004613.93981-3-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418004613.93981-2-ayaanmirzabaig85@gmail.com>
References: <c46938e0-02f0-22b1-1730-4ce87603667c@linux.intel.com>
 <20260418004613.93981-2-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
mute, and camera block hotkeys do not generate i8042 scancodes.
Instead they arrive as ACPI notifications 0x7d, 0x6e, and 0x6f
respectively, all of which previously fell through to the default
"unknown" warning in galaxybook_acpi_notify().

Add handling for these three events:

 - 0x7d (Fn+F9, keyboard backlight): schedule the existing
   kbd_backlight_hotkey_work which cycles brightness.

 - 0x6e (Fn+F10, microphone mute): emit KEY_MICMUTE via the driver's
   input device.

 - 0x6f (Fn+F11, camera block): if block_recording is active use the
   existing block_recording_hotkey_work; otherwise emit a toggle of
   SW_CAMERA_LENS_COVER via the driver's input device on models where
   the block_recording ACPI feature is not supported.

Tested on Samsung Galaxy Book 5 (SAM0430) and Samsung Galaxy Book2 Pro
(SAM0429).

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Co-developed-by: Joshua Grisham <josh@joshuagrisham.com>
Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index a51ad6b03164..6382af0b106c 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -197,6 +197,9 @@ static const guid_t performance_mode_guid =
 #define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
 #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
 #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
+#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT     0x7d
+#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE           0x6e
+#define GB_ACPI_NOTIFY_HOTKEY_CAMERA            0x6f
 
 #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
 #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
@@ -876,6 +879,7 @@ static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
 	galaxybook->input->phys = DRIVER_NAME "/input0";
 	galaxybook->input->id.bustype = BUS_HOST;
 
+	input_set_capability(galaxybook->input, EV_KEY, KEY_MICMUTE);
 	input_set_capability(galaxybook->input, EV_SW, SW_CAMERA_LENS_COVER);
 
 	return input_register_device(galaxybook->input);
@@ -1259,6 +1263,25 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
 		if (galaxybook->has_performance_mode)
 			platform_profile_cycle();
 		break;
+	case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
+		if (galaxybook->has_kbd_backlight)
+			schedule_work(&galaxybook->kbd_backlight_hotkey_work);
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
+		input_report_key(galaxybook->input, KEY_MICMUTE, 1);
+		input_sync(galaxybook->input);
+		input_report_key(galaxybook->input, KEY_MICMUTE, 0);
+		input_sync(galaxybook->input);
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
+		if (galaxybook->has_block_recording) {
+			schedule_work(&galaxybook->block_recording_hotkey_work);
+		} else {
+			input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
+					    !test_bit(SW_CAMERA_LENS_COVER, galaxybook->input->sw));
+			input_sync(galaxybook->input);
+		}
+		break;
 	default:
 		dev_warn(&galaxybook->platform->dev,
 			 "unknown ACPI notification event: 0x%x\n", event);
-- 
2.53.0

