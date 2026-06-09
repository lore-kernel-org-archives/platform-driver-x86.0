Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50343EFD36
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999857; cv=none; b=N53EgBZR4RQ46nGFMXpbgimxlBjDLs26URulNXCuKgy3u6z0SnhmhXa8AaGlSzQXQJbJtMU43/Z6LT6p1DUk+EkuOXYC9BERzp2ocKpgDhPj3pVl6Q1HtUl2j/DXNPpmQs8FEKL5pR0V8NN5T2EwI1ui4iNEPHDOMWTRPbUT6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999857; c=relaxed/simple;
	bh=H4gk3KhQcL4oQ3I4RtT8qmHuyEqcDPBy5iKf8wKhKhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akOttLyj6xnlT1BZm7Pb9COKtiUnqS5y4XjJ6nSgmqL0kiyOhaFLgLmvUb4Um75xlhjxLblzHiKBx4qQh3sCSHbTkvN6MF1U1bU/aZCbxwzipaJIZQrvNSAk4UXGV8FQR17am+YhmTh7GX4LSy7zZInmh1MDNv0kU3WwipujWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aH+Ig8Xi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aH+Ig8Xi"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45efb698ef2so2506917f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780999854; x=1781604654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MM9p8/N850+V/KcRNjafbk4lSi41zWgek8mxZ5bvNE=;
        b=aH+Ig8XimL3Geyff1+xhNlx+GSZPmbZ/TNfkynMfNG+yMDEFRgC9We29QYODZtXv0F
         GSwTmahEhAa1XR3wwiwrcJ9IDmuyZ7+zFphP+1UDjw3BbZqk/okoLVM/07mIMjtYevn4
         aG3NzkfVAnoa8RYgiReaNPiSJjFD5gt3ypoSTO08vJa9/29pF2D+jUM6ZaLfHNOQ+KZ0
         I1rczEro0/aVVWy7JwOb44iqdQNgRC6DgXuoQ2dBHSCp+lTO+5cGyYXzHS4ZqKPbUs4E
         5KeVGwukr3NIFRgYVmnRFpiafAZbGt+h+ok/9tv38wk2q14ZatxO5wLI+9Bi05e/gHU0
         wVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999854; x=1781604654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2MM9p8/N850+V/KcRNjafbk4lSi41zWgek8mxZ5bvNE=;
        b=qCCHdRUFi9x6nXCvfe+/87K20YnDYQP6/yx/2CG2GRZP+aqqGl4EfxSJr9lRgWYlls
         Q0Y9QVyg1yr2JZXHXJQFxDOmu/shdwf6msfLLvv/B0jRiJv4oP43MFjn7VR876nkEt/Q
         dXdb22Wl6p8krKXzQcBKDtNb8X/jC2nI7M2g2GLT7kcMmIAdFx0dmVMKnPtI3Q7USkIO
         8licjKM98rMJcxO3TixG0+JeMOzhhqyRSHjs5pZpOiCPGhQedcs7lj2NMqhFSEZrZ9wZ
         iOMFSxqpYcUZHX3rpVgcL2dT87/AJSd5Rz0Dp5V/OT/I5ugIOjHqXnRQGJahbEhRGb+T
         P+zQ==
X-Gm-Message-State: AOJu0YwiYlqq6BzZGsd4O/vcqwbJK7ZPLXc9TFJDVYiwe+6FvVyev751
	HOviLF2gPNAnGqULnWKVFg7LL77f+o6qXrMcyEB/fsp7NgsRh9Oyr6eS
X-Gm-Gg: Acq92OGt5yW+OePXU3vAahU0qpCZV09BiTQD8eXkySc3lPDl5j+/mFjVUMy0Y4/n+9V
	gWkZOeJsf6ehGkW1g7iZPhvCusmeBGDPtWkPUUDL/Wpap952ZbNCPsCQJLzynMNJg+eyIntM859
	lDrbr+STAd3s5dpVpizzC2yEymrTptnd8XqD/R0yzUAGw149Q2gC3eRnw6Zb3gEVpjD/SHE51nU
	nRKOIZyaxyau0CIsbOUl6VSZKIHHEch0kMzaC/AY7T/TgYTw6TwNkvDBBnx3Qvg0QPeRfv0/Gkf
	kayf7ivbWc6FfrN3ugURdkpYOkoMy55UyQnS9Gvv5bKaWCw068U7QHBQxYHP0kI/LPHu9/MGpv4
	XauSCfb5/3yd9YYLZMi+L0YzSaI/qnSR2Qlzw5TzCSefdLtHnrebc9MOlM9XoDvkqUGj3y+2aBo
	7MuTMvvSF4Q4b+mmaa5VkVIh8BWJCpvYRA
X-Received: by 2002:adf:f812:0:b0:45e:f302:94e with SMTP id ffacd0b85a97d-46030644500mr21669159f8f.37.1780999853991;
        Tue, 09 Jun 2026 03:10:53 -0700 (PDT)
Received: from user ([104.28.162.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm109562326f8f.29.2026.06.09.03.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:10:53 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH] hp-wmi: add battery threshold support
Date: Tue,  9 Jun 2026 13:10:50 +0300
Message-ID: <20260609101050.50262-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5459a3d7-976a-dbb7-0ca9-540efafe93bd@linux.intel.com>
References: <5459a3d7-976a-dbb7-0ca9-540efafe93bd@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Hello, Ilpo

Rebased the code to the for-next branch and Removed
unused definitions and changed the style to match
your earlier comments, Also wanted to query whether
this feature should be accessible via a sysfs interface
or by a parameter

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
v4:
- Remove redundant definitions
- Rebase the code
v3:
- Fix coding style errors and warning
- Refine the changelogs for clarity

v2:
- Simplify detection logic via battery_get
- Add Battery Profiles enum table
- Add functions to set the battery mode
---
 drivers/platform/x86/hp/hp-wmi.c | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 48292cc02ee2..369db41ab0bd 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -292,6 +292,17 @@ enum hp_wmi_event_ids {
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
 };
 
+/*
+ * Profiles for hp battery threshold profile 0x05 and 0x06 map to 4 and 5 respectively
+ */
+enum hp_battery_modes {
+	HP_BATTERY_MODE_NORMAL    = 0x00,
+	HP_BATTERY_MODE_ADAPTIVE  = 0x02,
+	HP_BATTERY_THRESHOLD_80   = 0x05,
+	HP_BATTERY_THRESHOLD_50   = 0x06,
+};
+
+#define HPWMI_AC_REQUIRED 0x35
 /*
  * struct bios_args buffer is dynamically allocated.  New WMI command types
  * were introduced that exceeds 128-byte data size.  Changes to handle
@@ -448,6 +459,7 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
+static bool battery_threshold_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -1085,6 +1097,60 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static int battery_get(void)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int mode = -1;
+
+	if (ACPI_SUCCESS(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output))) {
+		union acpi_object *obj = (union acpi_object *)output.pointer;
+
+		if (obj && obj->type == ACPI_TYPE_PACKAGE && /* standard package sent by bios */
+				obj->package.count >= 3) {
+			 /* bios returns the result in the third buffer */
+			mode = (int)obj->package.elements[2].buffer.pointer[0];
+		}
+		kfree(output.pointer);
+	} else {
+		mode = -EIO;
+	}
+	return mode;
+}
+
+static int battery_set(int profile)
+{
+	union acpi_object args[4];
+	acpi_status status;
+	struct acpi_object_list arg_list = { .count = 4, .pointer = args };
+
+	if (!battery_threshold_support) {
+		pr_err("Battery threshold is not supported");
+		return -EOPNOTSUPP;
+	}
+
+	memset(args, 0, sizeof(args));
+	args[0].type = ACPI_TYPE_INTEGER;
+	args[0].integer.value = 0;
+	args[1].type = ACPI_TYPE_INTEGER;
+	args[1].integer.value = profile;
+	args[2].type = ACPI_TYPE_INTEGER; /* padding required by bios */
+	args[2].integer.value = 0;
+	args[3].type = ACPI_TYPE_INTEGER;
+	args[3].integer.value = 0;
+	status = acpi_evaluate_object(NULL, "\\_SB.WMID.SBCO", &arg_list, NULL);
+
+	if (unlikely(status == HPWMI_AC_REQUIRED)) {
+		 /* edge case in the bios */
+		pr_err("You have to be plugged in while setting a battery profile");
+		return -EIO;
+	}
+	if (ACPI_FAILURE(status)) {
+		pr_info("Write failed with Error code 0x%08x\n", status);
+		return -EIO;
+	}
+	return status;
+}
+
 static int camera_shutter_input_setup(void)
 {
 	int err;
@@ -2292,6 +2358,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	if (err < 0)
 		return err;
 
+	int ret = battery_get();
+
+	if (ret >= 0)
+		battery_threshold_support = true;
 	thermal_profile_setup(device);
 
 	return 0;
-- 
2.54.0

