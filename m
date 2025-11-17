Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A929D268;
	Mon, 17 Nov 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395195; cv=none; b=o58mV1zvlmC6pgU5SgE4bzKjVSD+A5AgMzMu/U1d/jyVXX0MdcgIP+/xey8bp6DmHbOhwA2q/IQbEU5POnhJ8ON4Mr/IfDfmm6BGNnlDZM9JkF8/fl+ytWJTeSiN24fCg3XIiIdg882opUQlfz7b8/dJ88MS1OCUx+OiE3uxXkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395195; c=relaxed/simple;
	bh=8n1LL5gZKOCxgaaYc1LSzqjgYBCSzLi7M0r+M7qOq5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ob6nX3hjVQLc7iF4Zk9O7zzAxa/CpeIeMvm8fXTSlJYpmX1bWnKim1Y23AcRBaM9tulAyw87Nq9hVyVsoJAGOrXxlQHx6+Rtutcxa0jnZwKn/gt31dTtvZeDLegwWtV9mASncm3VlWbfNQrPt5gYtXO6Pub/IbeW27DJf0oRfy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tthKcL9i; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tthKcL9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763395182; x=1763999982; i=w_armin@gmx.de;
	bh=96diJ2evE6gKAFj69VVHsvT1C06yUf7SYVovtRvOcj0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tthKcL9ia2S0NEdhHZKnrSJHecvxnBH3CRJh/X9Kmhjc/+GOlt5ThxX4WCwp/Lfs
	 k/JY8BYKP359Q+DAeb8TePjl8Eo6Jdjm9HdpHwzOSVtey1Zd1wysd3BqK2BnWt+dF
	 zYDiUmpxCUDvO7VT8urGxn0Ce/xKX0/KnjaHiTjkgM0sY3JZh+R9MMtPRlmpsE1nz
	 yi4mzVVmnwliR041UNRJFIH7nAbNREzFtXPd7NXKsDIiSMukaNgtK0fbXhDfkKWHQ
	 79y2OtLOEJfaUjvoGeP+PrF5sNRKLz6KlKSKUtIGjGWNlDv/SXTslNmlWFab5sKfw
	 jMKUzUerM8aPBUFqFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-inspiron.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1McpJq-1vtoE80ZnO-00gxfx; Mon, 17 Nov 2025 16:59:42 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: jlee@suse.com,
	Bugaddr@protonmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Ignore backlight event
Date: Mon, 17 Nov 2025 16:59:38 +0100
Message-Id: <20251117155938.3030-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IXzUsm+dBWbWYzLdR9aL2JkPDW3xj1BHgcB1u4qQm1vQ3xnuMLj
 QORxOhR3ZMrMe4rd+LXLjoET4UQz6QsxnMnjHjoChZysjVvj9Gt30BXb9WC7M7dmivEReUc
 yymAjQmcvGW2lDVQsXbIIyhXmcJIGS5bQ9gwjBxmJiTiyBWA6fKIuSB2NTQlICmcGjnWVpc
 Z2ok2wx4y6B/HQgLkPozw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2UZs1tPrw2w=;44pJ58VNfNG6INsLTWoZhV/eM0H
 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

On the Acer Nitro AN515-58, the event 4 - 0 is send by the ACPI
firmware when the backlight up/down keys are pressed. Ignore this
event to avoid spamming the kernel log with error messages, as the
acpi-video driver already handles brightness up/down events.

Reported-by: Bugaddr <Bugaddr@protonmail.com>
Closes: https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-a=
n515-58-fn-f10-keyboard-backlight-bug-on-linux/#wmi-interface-issues
Tested-by: Reported-by: Bugaddr <Bugaddr@protonmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/acer-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index 18cb18e98e5d..bf97381faf58 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -121,6 +121,7 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026=
");
=20
 enum acer_wmi_event_ids {
 	WMID_HOTKEY_EVENT =3D 0x1,
+	WMID_BACKLIGHT_EVENT =3D 0x4,
 	WMID_ACCEL_OR_KBD_DOCK_EVENT =3D 0x5,
 	WMID_GAMING_TURBO_KEY_EVENT =3D 0x7,
 	WMID_AC_EVENT =3D 0x8,
@@ -2512,6 +2513,9 @@ static void acer_wmi_notify(union acpi_object *obj, =
void *context)
 			sparse_keymap_report_event(acer_wmi_input_dev, scancode, 1, true);
 		}
 		break;
+	case WMID_BACKLIGHT_EVENT:
+		/* Already handled by acpi-video */
+		break;
 	case WMID_ACCEL_OR_KBD_DOCK_EVENT:
 		acer_gsensor_event();
 		acer_kbd_dock_event(&return_value);
=2D-=20
2.39.5

