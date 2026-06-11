Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F939372B58
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217568; cv=none; b=uWwoTVkmn216seKot/NpBeWaeXjiDqENcUtf4g+DPDYsuqB9c//lwDiHl4jwS9zeS3NiHdSxMIZngsdO5gk/ajYaQjbsYNVpiINTb7X+M7CHoyVuYH4uByOOa7vB2LbSFBCwfEermJS1aE0jrNNJGGt4+hrsuPEw3VoPxMZoFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217568; c=relaxed/simple;
	bh=+8SUOc1xcRQSb75id7WbryItASP1S+IATD316tnttZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyWlAeXvoNsOvKRy/jd+waOwyymfd7aNcpCRajt0K2UrnID1yya36zwzPN09BZtRHDBa2sXqavlQ9NGb4SIyjMrm6j+PB9VKfonpDZXu1SIqPbAY2h1tRYv1rfYMrH8+5wvaTJRxWKdOnwWI7SuetlgSpoFLKuqwSvQIPlCkeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I736Ii8u; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I736Ii8u"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1363fe80fe8so517578c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781217565; x=1781822365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2LEHkho1IVVqEh+6wm7OHzKCMmqVyEcGJJkJ19GMe4=;
        b=I736Ii8u2rQqT5fXlmQVsegbKj0vrUyHQ2LqdkIzkGo0Nxu7qBKUd/sWQSI+2TzZJo
         FTFepuSM3ja3HNvrD2i+Wr6ePHUCjPxcXKvTCcKp0zvs0autewgAKwqsNksrQCKOmvNm
         2qq9ILnE9OFGP6Q2SmihKvONarcxvX/DBGeUxs9jiL+K36ZKjnPpsCjTSy41Uuo10jnn
         f9zwezccM55unRW/eTP86sISdPw0puZOmGZMn+6l4hhS1gdzN7fIfemURgQVJfk4cdH/
         nKFx8mX7Q/7sohTBh0g5BDIOGX9iU98ojaHUNYKvnZMjia0tAwKODuJ6/wrVXCxZYq99
         gj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781217565; x=1781822365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x2LEHkho1IVVqEh+6wm7OHzKCMmqVyEcGJJkJ19GMe4=;
        b=GHc0p3bV5CIHGawtBWoikHMg9qkVnWgfzQwEFqYHiDYwyw97OwqcJeQwK6EJ+LpqeZ
         jccgmIK12OOqSKUDI1GRXtCJqY1vM9Y6sPs6HQeLySYzpbZ+yuSTPtHiCjFLe3f5Xu9e
         LuEypd+9aSv/OJrIg8GAnpO0Fxo1B38LhqKS3q2QWbQaIuDlJKLVnYTpbuWG9cc0KMWc
         azP2IUCwfhNy7FTACmmkTOWwZ3Amfpfo5O28vtbfOgKCtnvoGBl3HrPW5LEqlVX9eifs
         VtWkIfdXKuYN7ZLleI0jPmHHLjw2UVhzHMxXdQZYUytys0GPNMO1YqN9kkDjVDgQcrFO
         0khg==
X-Forwarded-Encrypted: i=1; AFNElJ9811ldjajVr0GcEZfMGTq8RhhXIqQTy5TcD2QbdRUoXd/PjEnZYMriTrpeM4LKzf54ULRyEooT9NSK0MxYFk1Le+ph@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8bsy/YmofS2N495YYhc2XwCDUhlzx6IvT4Q5t0TX6ZrMUautI
	Cc+qj/1R/LXJJZ/fEqLlyjFTk0vYg9wBlinCA4w3UoW/P/xiMph/c5lS
X-Gm-Gg: Acq92OHwb3RWp3uBpzJcdpOLA/whHLkXIO4nagnqHQrAFqWHzSkNZFTVbBysKEsgSe9
	fzqrZ4A/lGb7SEmo4tkWog7FeHcFp0LGvoC4YAOUhJKJikC2Tn0JFz5cfUaAbD/DxeV3s9T/4TI
	9u2pP44D63dXkwKmmRC0C0ZWHdG1DLwF9ZNFrfdziTE5QsmjzdZnFyuwxNNdBbIkZPVpj7+VMwS
	BrvJnbhs9JAfyiMO42+Wme+CiBiyQq8rE+fwtphJfiFfirgDbddRqwEBKEyaaK3pMSa/DHGgzxu
	IErTj9J0fbQ9V/r1yNr0spFnESvVs//uYYQJ68/diAX9qBHxgyLC7Q2zgLX9OUVmaR5czvlg/LG
	KaYCVHY5BpaiQU4/uUUTxbCP5Z7Ft6RNLvcm/BJKSg6MWInKmO8gebauxINrXui2gzdA0PyjO0x
	d82VeNh69CXL9COYZOcBon67JoYIBzee0kJwafIvmVnEbReb/6UtM2Q3rbAA1tHgYCQJ/OWj5tp
	tsg
X-Received: by 2002:a05:7300:578f:b0:304:562c:2338 with SMTP id 5a478bee46e88-3081ff75a80mr208849eec.14.1781217565400;
        Thu, 11 Jun 2026 15:39:25 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm241273c88.13.2026.06.11.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:39:25 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: msi-wmi: Add MSI Claw M-Center keys
Date: Thu, 11 Jun 2026 22:39:20 +0000
Message-ID: <20260611223920.1679438-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/msi-wmi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index d00ced756581..73a4f0d2dc04 100644
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
 
@@ -183,6 +198,13 @@ static void msi_wmi_notify(union acpi_object *obj, void *context)
 		eventcode = obj->integer.value;
 		pr_debug("Eventcode: 0x%x\n", eventcode);
 		break;
+	case ACPI_TYPE_BUFFER:
+		if (!obj->buffer.length)
+			return;
+
+		eventcode = obj->buffer.pointer[0];
+		pr_debug("Eventcode: 0x%x\n", eventcode);
+		break;
 	default:
 		pr_info("Unknown event received\n");
 		return;
-- 
2.54.0

