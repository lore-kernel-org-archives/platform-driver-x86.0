Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE81E89C
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Aug 2025 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754170575; cv=none; b=Hlh5HPFdMfzvC4l/I/AaXFPTjX3C9+TX5vqRQ72zyIdYpohkxx04DIijHQuVJSXtAZum0irYBKVbM2ggY2beOr7nfNHaj0SlgJQ6AR6uNrEOmyDdLI9yxTrOg3JYmiVYB5MV3v3DIGnNRflitjpHPDpWX7xECOHisNg/MvK+7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754170575; c=relaxed/simple;
	bh=ruZHURDoAu3h4nORUNospI+cvl4F+mopDOISY7VdiZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONKgQmEN9OhgxA8g4d8fgF4Kx8teLmnqI8ZnNd+Ym7Hf9zOk0kGJ3Tt3YRt+pgFMdIdUwtPPYAA417FksCpOt1EqNO8E6wnz0mnK3RyyMKNU4oBQq8kKetDmQ5dqIMDm3ahsYxsoSFfkHuxMR6xbomsAD96hsxSAM6dz2GHemdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=GgSeG/dH; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=hxQ9XS0a; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="GgSeG/dH";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="hxQ9XS0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1754170570; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=CrWDOxBfWPwUrRtBxLQMODWaqfDXlu9Eg0Hy+KaDs0U=;
 b=GgSeG/dHKYLWM+VZfJ0VGxY24t2KaaHc880hAzqeDhBKPht/pg6wabRszZpoR8SD5Osy9
 Qty6rtt7p72upgktzVzPXc1S4fDN9dLmnrcINGpsexQcFkpV8Xjvx/XTvAM/Au8MHpwtvGI
 17UDeNxW41/szsFkjbnVIKZQuwcB5/9HI2IQ9rrY0N++Ng3QjzmFsS8U2659yEgStpA4pSX
 hcKwKseyLw+adjt5S2i9NBw2GueWIy3NDNLDRsaSNw32YfG1So3esoXGYINzwiYtD17VCEE
 ytI5c6OmfJ1Tc+v+SDNT13kD13KGlKgTMza9J69otlql4OxO5HPvLGhhqNQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1754170570; h=from : subject :
 to : message-id : date;
 bh=CrWDOxBfWPwUrRtBxLQMODWaqfDXlu9Eg0Hy+KaDs0U=;
 b=hxQ9XS0ats6w6RWJh0RdBVn1x0bpmvqPiuWCPLhDK4k1lQFB+NjIb4C/yguILKUlqMGa5
 1ieijQQwYWW3jZke/80RJj6Kc1ISVcA00hiygLYWtNWSgQzMhDXwbumJFCkQBMMQDnLaZYu
 UgjE6E1/QvBUPz2LYNP2RwzTLPpHkpCoX2cnz7TEyZ+7JpN/bryqqBnx7IB0aDfzl/WyArI
 RpvSb0iauBNu3p5grVFd5CVcsQwvyhz2LNKVtAgn+wAYTwwgKZ1jpfCl84F0aTHPYvkXb8L
 lhjiTy1OWwKu/nDrr4OshDcfyFq0+u47adu/2/Yk5Kq9hbAXnDx/K/x7DeDg==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uiJtd-FnQW0hPrQm0-HolR;
	Sat, 02 Aug 2025 21:36:05 +0000
From: edip@medip.dev
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	kuba@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH 2/2] platform/x86: hp-wmi: Add support for Fn+P hotkey
Date: Sun,  3 Aug 2025 00:35:42 +0300
Message-ID: <20250802213541.18791-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802212149.16707-2-edip@medip.dev>
References: <20250802212149.16707-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854s79-ZDZDmr
X-smtpcorp-track: RGG1Z3E_WbjS.zHK5JdqIS1sk.9dqIogccoM-

From: Edip Hazuri <edip@medip.dev>

Newer Hp Victus (And probably newer omen) e.g. Victus 16-s1011nt that i
own have a Fn+P shortcut intended to use with omen gaming hub for
changing the performance profile. see [1]

> hp_wmi: Unknown event_id - 27 - 0x7
Based on the dmesg warning. I found that the key have 27 as event_id and
0x7 as event_data (keycode). I implemented it in the driver and now
libinput can capture the event.

Tested On Victus 16-s1011nt (9Z791EA) with MB 8C9C

[1]: https://jpcdn.it/img/adadf6c927ffeb75afd8038f95db400a.png

Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/platform/x86/hp/hp-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index db5fdee2109..6467ca27db7 100644
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
@@ -280,6 +281,7 @@ struct bios_rfkill2_state {
 static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, 0x07,    { KEY_FN_P } },
 	{ KE_KEY, 0x270,   { KEY_MICMUTE } },
 	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
 	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
@@ -981,6 +983,15 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 						key_code, 1, true))
 			pr_info("Unknown key code - 0x%x\n", key_code);
 		break;
+	case HPWMI_FN_P_HOTKEY:
+		key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
+		if (key_code < 0)
+			break;
+
+		if (!sparse_keymap_report_event(hp_wmi_input_dev,
+			key_code, 1, true))
+			pr_info("Unknown key code - 0x%x\n", key_code);
+		break;
 	case HPWMI_OMEN_KEY:
 		if (event_data) /* Only should be true for HP Omen */
 			key_code = event_data;
-- 
2.50.1

