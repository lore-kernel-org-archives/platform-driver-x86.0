Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.12.121.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589035;
	b=KvQVB7qud6/EnjuDG+nozMuES437rcPN2QuyAYqQRNg/bpTujA9pSlx3hWbJRZFSj0CR
	 LXOxHnN6V+I8JFc3i5XNJLu0HVrH+XORU0juE7JnNSczr4KLyOsL2pTf9RXtqu2t3gP01
	 /rlOO7rhdgnQ3NCFYHEHTN16F1NI0LgkVkmA7TS6wedWK7quLlBi6q2GvYOALEl/tlsnq
	 zxu7dmCLOeX0ewrW7rT/plRBSQ9uUTxUjAcn+SEXLOn1MJ3npa77W0urY7p9/NKfBwnd5
	 rjNdHyTsTYlYIEbT52RN+sMBe6keeCOSMgbTVvmgsmJFaDBLK+QNBIAHvU/M0FlXGuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589035;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=v+2g8LhY8MFTBrF3bcNOytObBw0f5aMK4zrYQ9fE5Pg=;
	b=MQWIinuwh/8Q9yOJcsjH4nn3PEHvJ4Yb87yB//Qcwum7VQNzgX+ffFCB6xbClys3jL6i
	 tn6ZlNF4rK/K5B3vRCko3SQLksEs7ydu121MAP/7hfH5qeHyAiQ9+GHpN2lwq0YrYPwtF
	 rj25rJg7tPqgf6flxWGHfOSI6S+7xJxSbOlxWsSRzvgdidfSSAtzQNsJziy5zXMSyUWDe
	 1tuMlrWsae8tuyKdICYzlyRXnyGpQj4Kj/aJn7+jy0cVgxHQKHfbrWBpevgjmjtGTGYed
	 LVoky6e04ecTf5B1dElGqRB2fAPS+1eQzdF4nLYM8W7YxvbwL3TQFBYi+JzNl2ifuIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=barrensea.org;
	spf=pass smtp.mailfrom=barrensea.org;
	dkim=pass header.d=barrensea.org header.i=@barrensea.org header.a=rsa-sha256 header.s=mail header.b=GL5ttpFy;
	arc=none smtp.remote-ip=198.12.121.168
Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E4606A324;
	Mon,  2 Nov 2026 03:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5E4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=barrensea.org header.i=@barrensea.org header.a=rsa-sha256 header.s=mail header.b=GL5ttpFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1793589029;
	bh=4x3+38Wv6GpzVvI5o+ijYIXw99v1yzm6GISaiqzWyn0=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=GL5ttpFy1ceG8MBuOJuhPmighIar8ZSLsoXvgah3/OityDkI+TjvJPcDpl75gyaTF
	 xr1mrk5zrFx0i50v/bl/PJmJFYc60w2lJ86z74oSLfRn9eAHxwcv8aLpCMh38hzqGw
	 9YQpx+yOvC3U7Heepfd674U3btCv6qoKpTA1VL6UHtjE6P7G5GEy0XwbLN6RIiibvO
	 agIDjIsF4Kle0K/AUBlDxs5/aZHnZgfUlZf8yputaYUOqI0azdUpojH0G3oBsNLuJz
	 E5AAZUbfy3tsdt5HTBHvoBrc08k8v73YaUjfvflu7BEnhOfD2fJbBevBbcuqXfHvxM
	 gl4z5zy8YVOYQ==
From: Donjuanplatinum <donplat@barrensea.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro
In-Reply-To: <c8cb27ab-e5de-4a86-ad09-6610905e74b8@gmx.de> (Armin Wolf's
	message of "Sun, 1 Nov 2026 18:41:09 +0100")
References: <20261011081421.38128-1-donplat@barrensea.org>
	<c8cb27ab-e5de-4a86-ad09-6610905e74b8@gmx.de>
Date: Mon, 02 Nov 2026 11:10:25 +0800
Message-ID: <878q3cc4im.fsf_-_@barrensea.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Armin Wolf <W_Armin@gmx.de> writes:

> Am 11.10.26 um 10:14 schrieb Donjuanplatinum:
>


> Does the OEM control center for Windows support battery charging
> modes? If yes then you should also select
> UNIWILL_FEATURE_BATTERY_CHARGE_MODES.
>
> Other than that the patch looks fine to me, but i would be very happy
> if you could rebase it on the current for-next branch.
>
> Thanks, Armin Wolf

Hi Armin, I think some of my previous replies may have been missed. I
have added and tested the battery charging mode:

> > Can you check if UNIWILL_FEATURE_BATTERY_CHARGE_MODES also works on
> > your device?  Please note that the embedded controller will still
> > report to charge the battery to 100%, so this is not a reliable
> > indicator. Do you know if the Windows OEM app provides such a
> > setting on this device?
> >
> > Thanks, Armin Wolf
> >

> I also checked the battery charge modes in the Windows OEM
> application. The OEM application provides this setting.

> Additionally, I used the interfaces exposed by the OEM's
> ACPIDriverDll.dll to test the three charge modes and confirmed that
> their behavior matches the current implementation in the Uniwill
> driver.

This is the previous disscuss:
https://lore.kernel.org/platform-driver-x86/c8cb27ab-e5de-4a86-ad09-6610905e74b8@gmx.de/T/#mf80e6c3fdad4eb3af835504c0e512df66c474c52



> Other than that the patch looks fine to me, but i would be very happy if you
> could rebase it on the current for-next branch.

I put the rebased patch here,it now base the for-next:

From c45bac93447a52dd2e4a76395202a13c6d91763c Mon Sep 17 00:00:00 2001
From: Donjuanplatinum <donplat@barrensea.org>
Date: Mon, 2 Nov 2026 11:03:25 +0800
Subject: [PATCH] platform/x86: uniwill-laptop: Add support for MECHREVO WUJIE
 Series 15 X Pro

Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
Series-X5SP4NAG).

Signed-off-by: Yifei Yao <donplat@barrensea.org>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index f62d59f29676..d49be1caea50 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2715,6 +2715,20 @@ static struct platform_driver uniwill_driver = {
 	.shutdown = uniwill_shutdown,
 };
 
+static struct uniwill_device_descriptor series_x5sp4nag_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+	            UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
+};
+
 static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -3075,6 +3089,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &x4sp4nal_descriptor,
 	},
+	{
+		.ident = "MECHREVO WUJIE Series 15 X Pro",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		},
+		.driver_data = &series_x5sp4nag_descriptor,
+	},
 	{
 		.ident = "MACHENIKE L16 Pro",
 		.matches = {
-- 
2.56.0

