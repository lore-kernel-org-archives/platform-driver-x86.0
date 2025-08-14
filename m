Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94266272E67
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2025 20:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755205121; cv=none; b=GRJIobeX231YRmsF86x9kvHu3qo7Zg9adqu4yPEOh+jaJZZgJCgf9ijWAVtMFdfP2FoEb70FxAw6Ea/8IdyGOkoDvgsG1YbenBu2oRI3JDAD4iHg3SY9FxslJYy9WrNHhqVgNDrFXjTazHmNMKM8XPtY+sLFVmARhAZtFU3vmoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755205121; c=relaxed/simple;
	bh=j4AA4nQmJFlRP0/NnrzhPFhnYH+laj8mwQr9FuaC+Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ep8fKKLSzhrwsOZ5bTpDqbKt6oaMg+IaQdXNp/gwWj58AkW3ep6t7T7GvCuP8T1TjmJoqrvZesoRH2tSCnkSdUyi/Inzh/j75QCFwV5wcgbbRxX8IM1v2f8MEsL191ddThJAbaq4/VihaF3xZ08DXSzhwaYfop+QtLhwukNVzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=eYvRbNLY; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=h3of59Uy; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="eYvRbNLY";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="h3of59Uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1755205110; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=OKTSY4z8mDWV1jZSFIOngnqYhOU+OVtxrQywDa1UHlk=;
 b=eYvRbNLYQX202eC/yhYyG1Aus+4M66FOx2vD02dqnBWXBOJtFPzjg1fQZiIm234TFgJHz
 YDAso/+opRlil8qkGdFXIfscjMdPPUbSxfyPziGA7qtW+utR8NewyQz3PQ5DpIr75nFNR0s
 ry2mck7TlK1QZfl3uRx6va7FhPuzK/CEP0FMGzC5wNHY4AIvlmEk/KoAd1AJPUZ4RuUKc+c
 EUvdy97KI+uEd/2XiH+ltEWqGOiVV7IYPvz7EVo+3AJNKPONszFFp7hukv+lFu340dL/DKB
 nn8UE3vmYn6FPoEnYn7SklWTyMMkkNRAgsTBhwnZgLZBxdYrcDG32LSgLd6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1755205110; h=from : subject :
 to : message-id : date;
 bh=OKTSY4z8mDWV1jZSFIOngnqYhOU+OVtxrQywDa1UHlk=;
 b=h3of59Uy5cv0E2scB1grEmpXX1u0ZEz3rGbmdNl87XwE7wJP5fAVMAYvJkpQQYGxWr6Of
 pQNui/dRbaZz8uSx0k/B58N5acrt6zf41nPGAyP0mNl2/TCtwyMWRC7gS/55bCh2k+mPUze
 vHdiHOTq2X9+YdulMGeXt+6EgCwbctYBKNzwlNInRvlf7u6yTK6P1yCFoswkivOlW4cGmfg
 7yoemLToupPwfra6Wsqgx0E4Z9dQdp1IfeS3fSB1dYFN5FvPLOAq5dvi+f461Px7apvoaWT
 RWxI1AqK5llkOyfQs0J8uo9b6t1St567pGG6uHLAHG8L/eXrYuHbWC/iE2pg==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1umf1i-FnQW0hPzmup-Oj4z;
	Thu, 14 Aug 2025 20:58:23 +0000
From: edip@medip.dev
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	kuba@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH v2] platform/x86: hp-wmi: Add support for Fn+P hotkey
Date: Thu, 14 Aug 2025 23:45:32 +0300
Message-ID: <20250814204529.18467-4-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sCbqN4Q8xq
X-smtpcorp-track: 7RYdGkhaxolr.lmDe8zAZ24ow.0I4U-QpuIsz

From: Edip Hazuri <edip@medip.dev>

Add support for the Fn+P hotkey found on newer HP Victus (and probably
newer Omen) laptops. This hotkey is intended for use with Omen Gaming Hub
to change the performance profile (see [1]).

Pressing Fn+P under linux produced the following warning in dmesg:

> hp_wmi: Unknown event_id - 27 - 0x7

Implemented a handling for this event so that the hotkey cycles between the
platform profiles when triggered.

Tested on Victus 16-s1011nt (9Z791EA, MB 8C9C).

Changes in v2:
- Make the key just switches between platform profiles instead of
  assigning a key event code. 
- v1: https://lore.kernel.org/all/20250802213541.18791-2-edip@medip.dev/

[1]: https://jpcdn.it/img/adadf6c927ffeb75afd8038f95db400a.png

Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index db5fdee2109..c712d5bdaa1 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -122,6 +122,7 @@ enum hp_wmi_event_ids {
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 	HPWMI_SANITIZATION_MODE		= 0x17,
 	HPWMI_CAMERA_TOGGLE		= 0x1A,
+	HPWMI_FN_P_HOTKEY		= 0x1B,
 	HPWMI_OMEN_KEY			= 0x1D,
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
 };
@@ -981,6 +982,9 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 						key_code, 1, true))
 			pr_info("Unknown key code - 0x%x\n", key_code);
 		break;
+	case HPWMI_FN_P_HOTKEY:
+		platform_profile_cycle();
+		break;
 	case HPWMI_OMEN_KEY:
 		if (event_data) /* Only should be true for HP Omen */
 			key_code = event_data;
-- 
2.50.1

