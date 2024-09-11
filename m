Received: from forward400a.mail.yandex.net (forward400a.mail.yandex.net [178.154.239.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A31AD9CF
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726082393; cv=none; b=T+mMFbEvP/QpzDkHiIZa1YeJtARXeyMtwNtKFVRds0lh+lVJmFvBLtt6MYkhi2SwSGLmRoqa848t9NlA5iXP/HJXF0pHZc4m3VMePlFfUKIxFrdqrMp4ncZaIlEiDhn6Nqg/4mnc52gnO8pbEIhmEr1++xqEVurLgrFlDYl05cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726082393; c=relaxed/simple;
	bh=vCja+YvLto6+7eagOWN2p6csBM8fv8Jbt6i+JyxcfO8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=iqesosLLUaRv9Y5ptP5y84tCk5d8lr+FheJv/E+hVg7RpVEezeh/8BLi8b9iti0sj8NsMJzBCM5Lqs4cPXZ8JZo1RGdYDYB4zqdWpo/Cwu9/H3i4PMojAijfa/Xi5qzQ5SF0cxdriwVDbx2lKWqPkHiAD0IGytO+UV579rsuYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=jvQjVlVE; arc=none smtp.client-ip=178.154.239.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="jvQjVlVE"
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2c8f:0:640:f9cc:0])
	by forward400a.mail.yandex.net (Yandex) with ESMTPS id 9BBE36B572;
	Wed, 11 Sep 2024 22:12:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id fCpd3F2GWW20-mg7fTHGR;
	Wed, 11 Sep 2024 22:12:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1726081962; bh=KLIopE+CPmHUizlveB+JbJ6GuPQ2J5TIN4ppN599Kho=;
	h=Subject:To:From:Cc:Date:Message-ID;
	b=jvQjVlVEztsHsTxeOpYltdiNR0YcD3Kt0TTDtIiSbfFpQ1vDH9xGsPAITjNtuhEBu
	 87m0obWnJrZEXFCNz/qBrhW8p8ukCANCLKz4UIlDN0HVJeb6oUfbJOQUaSVGk0eax7
	 K6w/qWnDtVTIriZxB+zaQCnmf9sAO/tGG4T5wDwA=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <e8dda83a-10ae-42cf-a061-5d29be0d193a@yandex.ru>
Date: Wed, 11 Sep 2024 21:12:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
Cc: hdegoede@redhat.com
From: Ckat <ckath@yandex.ru>
Subject: [PATCH] platform/x86: touchscreen_dmi: add nanote-next quirks
Autocrypt: addr=ckath@yandex.ru; keydata=
 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
 xHJ//9Ttxt77jyAoBJesKEzoBJ3h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add quirks for the nanote next (UMPC-03-SR).

After checking with multiple owners the DMI info really is this generic.

Signed-off-by: ckath <ckath@yandex.ru>
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index f74af0a689f2..0a39f68c641d 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -840,6 +840,21 @@ static const struct ts_dmi_data rwc_nanote_p8_data = {
 	.properties = rwc_nanote_p8_props,
 };
 
+static const struct property_entry rwc_nanote_next_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1785),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1145),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-next.fw"),
+	{ }
+};
+
+static const struct ts_dmi_data rwc_nanote_next_data = {
+	.acpi_name = "MSSL1680:00",
+	.properties = rwc_nanote_next_props,
+};
+
 static const struct property_entry schneider_sct101ctm_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -1589,6 +1604,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_SKU, "0001")
 		},
 	},
+	{
+		/* RWC NANOTE NEXT */
+		.driver_data = (void *)&rwc_nanote_next_data,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_BOARD_VENDOR, "To be filled by O.E.M."),
+			/* Above matches are too generic, add bios-version match */
+			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-V005"),
+		},
+	},
 	{
 		/* Schneider SCT101CTM */
 		.driver_data = (void *)&schneider_sct101ctm_data,

base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
-- 
2.46.0
