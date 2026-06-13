Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD182459DC
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 02:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317020; cv=none; b=IRbiFLnmOVffMxQum6KCNlJW6zgRkH/b3Ydgc6EqgEOiuRNqtJJxe8NJqvyWq9Rth/LeZMa6RH6PSaUgVT63L42I8JfR6nUEuYT5SUukiZqDm9rtsNxNp8aRyWPHjxMZUB3d1TiBzTO21dVTfXmsQRI9nyw36AyD8M4m/rDV3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317020; c=relaxed/simple;
	bh=zVMwEyWWCc8jfTHooJjUSOaj9CWNTteTj5bXrbCRFa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P30OOhVr76yUDHI2g9N9TO+HOlQuvibjvhDjqZti8AqtywTQ7sSMjD8+vRql3lZ8hlqTUlzJ7c34NAZQjAiPIAAhAoiDI8Byi23zgaQeYp2N+EOm9lPx8NS9123q2bA0usLul8sr+JFnEu7DMgv1ForhdDqiAArRPmtrHaDjFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX/dMhFM; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX/dMhFM"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso3411209eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 19:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781317019; x=1781921819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWft2f1Im9NncRU+LFQf7xWUs7WelaDhR+JrHlWf3PE=;
        b=cX/dMhFMUO3GO+30vz/Wq8BemUsdmpxhtRNd5g/7h3X4hUADEO7UoKB5r72iOmJcyB
         0Zal99CR1LyWAL6SfyqRN7RbKa/YR9Cjpj7Uwnsk5bAbohmQ8SzLoVFsQOh+YgKfETJh
         EIGuUnQUaFnGiq80fpDXvZR9RimaVro20G191X96AkSIdTCgpLtxTOakA+uLRfIr+uJ/
         1fzUnXS5bwGqru/+4oRY9sre9cIK8ecnN4awT4L3xkSnm/e+M7tZX9tUz+JVfDHrHxjq
         8fq2kurVRRhCGTAqtIA5NgXuAJrK0T2zkmUZLiQHEpywJYaexmsFceTW4q63jcCj4ePp
         RH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317019; x=1781921819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWft2f1Im9NncRU+LFQf7xWUs7WelaDhR+JrHlWf3PE=;
        b=HrJWkk7MHTZGT7Vraq2aF+z6nN6V+UBzhCbC9/hNMip+icADzYHDRizqQSlRM0Bqy9
         WKYKvOYnmP9qVYK4peUQ2t/AF8hyvqHrB565nThO4fQJB7MX3skaTxeNKS36NoVYMxPZ
         ScPGtHcUNGHc0j5yYaCjtv1TTyJ/IIU9ueKFS8/lZ0EW89RfvnG+ceTbnykBYj0zFdw9
         wd57OEz7yrghSNp8Jk8ATvD3PbevJfR0qMCXXcFH4QQ2zgocEg4AKXmFLT92qNa8p+Is
         lheC+AdPl4ul5M4R93FhMOp/TmD8s2/3fd7nLNEg79FcXWLhXY+W/7eK0sShx55IY4fH
         ny3g==
X-Forwarded-Encrypted: i=1; AFNElJ8aOBPxJBvuSIdiypvWiNurhBGtjnwFcRPjN+d7CcrcEVdTnzejKWmjG5NDq5NPT4DUUvbxOvyIs4WfusOKuOnU4PTO@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXFUnflALaU8ApMx3RM+llKCIq82iBh4CBmzZ7xQ/OuDSRrRc
	CKhRvrLI8gTisDsQf5cTTNJGD53OACJBnvkkp5ytdbDfnqB0ypB0xHk6
X-Gm-Gg: Acq92OF4ojHW8FSXh6XqZ0b/7UWhcoFcvQhsSKCwxn2bNBm4Q8fxHFfRSPmGYo+Dn29
	Z3Zh992G7+atE/CXUySwGlwL8g+8WpZiCs9F0I8q+AeA60Tu+cGP0ukKodnHvY0lZwhXU9r6NRW
	l7q6pE7F1E9UJ8hJCvD7HtQT1O37sIuhZusMSqDCc7SY+nF99PKo83KFw+LosVhFmQ0Hlzx+22l
	VaLcNqR+WdlGXKw9/JJ7FDKrwpuNb4GReSXsAF4l+Xb+ifnPqZfIN6M1kqna62xbw0oSgGTzwIb
	5FewlZhN34VOqnKGKw10yMeg9F9Qj2s14LimMNBG8R4KBnMkrC5edJY1znBIRAu+Vj5oA9eoc1F
	rroTA6Z3RkOtoGYP3wjz3yHK3fkY371Napx915otOebDEj5ZimVU8X0ofp+KYqAqyNFMIHRhMyp
	H/S3r7fMN2CzP+LckDNRcKB5HwnM8N3ET+Du0puEFt5eYIDe5+HKy0Eqkhhoqw43IIs2/xY/xUg
	s5N
X-Received: by 2002:a05:7300:6916:b0:307:3a6c:e708 with SMTP id 5a478bee46e88-3081ff57263mr3376737eec.5.1781317018931;
        Fri, 12 Jun 2026 19:16:58 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm6417828eec.4.2026.06.12.19.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:16:58 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Thomas Renninger <trenn@suse.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: msi-wmi: Add MSI Claw M-Center keys
Date: Fri, 12 Jun 2026 19:16:54 -0700
Message-ID: <20260613021654.933618-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613021654.933618-1-derekjohn.clark@gmail.com>
References: <20260613021654.933618-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID for
some of their buttons. When pressed, these cause spam in the kernel. For
the majority of devices these events can be safely ignored as they are
duplicated by the AT Translated Set 2 Keyboard device exposed as an
evdev. For the MSI Claw A8 BZ2EM model's M-Center Menu button (left of
the screen) there is no associated keyboard event, so this event must be
exposed. Map this button to the same scancode produced by the AT
Keyboard device on other models. This does cause double F15 events on
the A1M, 7 AI+ A2VM, and 8 AI+ A2VM, but it appears to be harmless in my
testing.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v2:
  - Add comments explaining buffer fields & length.
  - Test that we have at lease u8[2] before assignment of key ID
---
 drivers/platform/x86/msi-wmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index d00ced756581..c9db750fe5ae 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -46,6 +46,12 @@ enum msi_scancodes {
 	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
 	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
 	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	/* MSI Claw keys */
+	CLAW_KEY_VOLUMEDOWN	= 0x21,
+	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
+	CLAW_KEY_QUICK_LONG	= 0x2a,	/* MSI M-Center quick access long hold */
+	CLAW_KEY_VOLUMEUP	= 0x32,
+	CLAW_KEY_QUICK_SHORT	= 0x58,	/* MSI M-Center quick access short press */
 };
 static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
@@ -69,6 +75,15 @@ static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, WIND_KEY_TURBO,		{KEY_PROG1} },
 	{ KE_KEY, WIND_KEY_ECO,			{KEY_PROG2} },
 
+	/* These are MSI Claw keys, used for MSI M-Center in Windows */
+	{ KE_KEY, CLAW_KEY_CENTER,		{KEY_F15} },
+
+	/* These MSI Claw keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, CLAW_KEY_QUICK_SHORT },
+	{ KE_IGNORE, CLAW_KEY_QUICK_LONG },
+	{ KE_IGNORE, CLAW_KEY_VOLUMEUP },
+	{ KE_IGNORE, CLAW_KEY_VOLUMEDOWN },
+
 	{ KE_END, 0 }
 };
 
@@ -183,6 +198,17 @@ static void msi_wmi_notify(union acpi_object *obj, void *context)
 		eventcode = obj->integer.value;
 		pr_debug("Eventcode: 0x%x\n", eventcode);
 		break;
+	case ACPI_TYPE_BUFFER:
+		/* Field returns u8[2] here, but is u32 by spec. Allow "oversized" buffers. */
+		if (obj->buffer.length < 2)
+			return;
+
+		/* pointer[0] is key ID, pointer[1] is active state. We don't get release
+		 * events, so ignore the active state and treat as autorelease.
+		 */
+		eventcode = obj->buffer.pointer[0];
+		pr_debug("Eventcode: 0x%x\n", eventcode);
+		break;
 	default:
 		pr_info("Unknown event received\n");
 		return;
-- 
2.54.0

