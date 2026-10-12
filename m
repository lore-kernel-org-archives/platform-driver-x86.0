Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C83EC686;
	Mon, 12 Oct 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816364; cv=none; b=By4rwE6CKlinFTrNlIkYyFC5kpFkjc0JCIn9nVVm+wxzNs3bUC0Qo3GxNDzlATLk8mD8s+gSwlYZgogcly3EhTem6OJt9ZxhJUHj/JRtmRmL8R2f6GiILV6YNVyuIwFWeVYV0F8Fp49HHaQ9Sr4Bm8HdV77Nv0TWJkPbKFckQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816364; c=relaxed/simple;
	bh=pVZufnKHrINpiVaAp57ncz6s9WfvuMe7UKJMPd0lBEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GJj5pLcXuYdCYKvrG4ygaiehGpOs12TTwIRpelsGcyNXfUSBcpCTkQaBPbXvZRF76dPUWD2x8ggZKO56EN5mFrkU3LjYQtBrCpG41uRUgk9s0IqlcO6gECS4EDspJBMzI4aG99Ly/g4lwdj9HmMDeOB6HTJhpOs/x6KUc5VHnzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=g9iTEBIB; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="g9iTEBIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1791816356;
	bh=pVZufnKHrINpiVaAp57ncz6s9WfvuMe7UKJMPd0lBEE=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=g9iTEBIBWUhg28wVEJ0r9DIT2d1eM/A+TDj6v9mWiLkEX/rDhPIDW3eEwcEXXJI+7
	 spt8fmhduChHlQhq2UtNbyxHURul5mp+Bv+a6/D+BhC7pL1Y8TMNChowwG34e8ElV4
	 14HL8KVW8SpwskxN8qrJotNX7b2c4VjGJG41EReuNFItbwYt8YXEBkNScZtJTCetHO
	 IOXzSdU075mz+IBdElg21voCMPZd2wOQtc8ecl+HvQi8QXKlK+d9wifNvbaoYgAlXl
	 IVbEGNceZQHEVwIUyMDZM2kYISoHf1K5Kwir9oW9qunef4h/m1hK+TVkJ9AwE+peDT
	 moODEU6Tt8oNQ==
From: Donjuanplatinum <donplat@barrensea.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, donplat@barrensea.org
Subject: Re: [PATCH v3] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro
In-Reply-To: <8f67b6b6-ce55-46cc-a0ac-e54f4bdafb3e@gmx.de> (Armin Wolf's
	message of "Mon, 12 Oct 2026 01:10:00 +0200")
References: <20261011081421.38128-1-donplat@barrensea.org>
	<8f67b6b6-ce55-46cc-a0ac-e54f4bdafb3e@gmx.de>
Date: Mon, 12 Oct 2026 22:45:54 +0800
Message-ID: <8733ub7za5.fsf_-_@DESKTOP-4UP1K6L.lan>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Armin Wolf <W_Armin@gmx.de> writes:

>
> Hi,
>
> please remove this pointless block of text.

OK, I've remove it.

>
> Can you check if UNIWILL_FEATURE_BATTERY_CHARGE_MODES also works on your device?
> Please note that the embedded controller will still report to charge the battery
> to 100%, so this is not a reliable indicator. Do you know if the Windows OEM app
> provides such a setting on this device?
>
> Thanks,
> Armin Wolf
>

I also checked the battery charge modes in the Windows OEM application. The OEM application provides this setting.

Additionally, I used the interfaces exposed by the OEM's
ACPIDriverDll.dll to test the three charge modes and confirmed that
their behavior matches the current implementation in the Uniwill driver.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0001-uniwill-Add-support-for-MECHREVO-WUJIE-Series-15-X-P.patch

From 518d89d58e3ea84af4bced696150ca1e02a4575c Mon Sep 17 00:00:00 2001
From: Donjuanplatinum <donplat@barrensea.org>
Date: Tue, 29 Sep 2026 01:29:09 +0800
Subject: [PATCH v3] platform/x86: uniwill-laptop: Add support for
MECHREVO WUJIE Series 15 X Pro

Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
Series-X5SP4NAG).

Signed-off-by: Yifei Yao <donplat@barrensea.org>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..bf46f03fb5f5 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2712,6 +2712,20 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 	.lightbar_max_brightness = 200,
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
 /*
  * The featuresets below reflect somewhat chronological changes:
  * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
@@ -2996,6 +3010,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &tux_featureset_4_descriptor,
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
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
 		.matches = {
-- 
2.55.0


--=-=-=--
