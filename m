Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4D3B0AE6
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088529; cv=none; b=sSLavvrt5TI4TTSbGQfD/hi3yCLAurekq/kHDlGLx3/NRqaOHAB6krkC+kdc72qBRv+jn5rZOsEPq3t11XPQqwtZEACdk417EivNl7qNSMgOtODXqVUg/GdpTbt3PVcFmRtlefSXVs/XIIUCMv3BU2Ej4S4LTktj26OjVfsovbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088529; c=relaxed/simple;
	bh=h+o53Qix8aeQAnKvz263ljg3eLfqKPW/DCEjzSXhGOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jL24DxtwAKGvR6tYMQRIBOouR1cNSaV/BMoP7C1K8EjxRjIFBeAJhob3/KERMFIIXFv9aS2f1jdXr543AMhupEg2XUvLsFHtdNaZbUn91yROlRqnVgbvJP7JIFG6tgSmdNWtnYo0A+7B6gSBRgjWdq+SWQf2yYRX2I6xNNtaUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEMw1Q6p; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEMw1Q6p"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso3386094a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088525; x=1788693325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWrbQWo0Y4gcocP0rLe2FWzofX/15YoGTuys2b43cOo=;
        b=JEMw1Q6p+MKzUazxmZbIP2L9erRa4o22nFy1JD9o+QlDc7nlWAqhxOSqEggjlWKE0w
         vwmLM11V3GgOaBINIENG28Ig/u8oPpp8zNePXc3eAsc5mFHKd1FSsdBsK5tJgAwseQDy
         wyD5Sm71sODN5uV6otAxJDz0lFPYBoarTxtZ+dZTBv8TrKctMailx/zCL8dH9eTsKjJ+
         bubLNhgIL6cCOTDydv3/Ay8qIx5A7WhY5AoRU80DT43FH5+wyiUr+vPNTwyfw2FiqQSt
         dDbYavJCGDHDIhOPy0UOjPGvsHUeSwBv3R7Fgfj5k9u8uKU+WcNTRJ+vBqeB+EgKoUer
         U3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088525; x=1788693325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWrbQWo0Y4gcocP0rLe2FWzofX/15YoGTuys2b43cOo=;
        b=lTJNtmzWhn4TtY1fgRn/2iXQmH24MIirduUZSU9v+QBiT8FRFnOyG4wuxiyEgP1wI7
         pXSbOqWgvJYVI1Ivoyh3CAOf5DczViCW1aTUO7kFL0pe8NRMiPI4T5bypkRVlWDWeWp9
         6qFfTNsHqFY4RiGCWRBUXxljUilZjPqatdpExylGZlJr6I5ESPw3MXnFvLhf41zKBfzA
         OVSY1k3m9S/EkugGKjeDp43JNN7LQJhO3UsMKCwVHJVvQz5xPgEDWvwC6tw4rWuaxZ4W
         luOe8hcxOEXR0n1B2wdJjcaYZI9sLEtAzoLqG71sQ2YKhuJvNBRnV+g4H18qqW0ZL08L
         2V7g==
X-Gm-Message-State: AFuF++k1n/1kWqwWW+3+IG7XweNVZQRkj5IUI31xkUvLpbLwnUN2ZM2T
	GzhvuIAhLEkrr5W6XW2ijYxUQH5eXF4K5jXbAI/emGlmwfByueI+eJ9P
X-Gm-Gg: AR+sD10+8m4Nqdyc7WG1eKnTKhcU51IDVQy8GMyCWsBX6+oAPcW8qaW/LeQdkeCN+Re
	RH85HoMVBkXr+BtLauLcojLO/mHYJvyPel/7paJkK6Sqq/3zkF7VuwOu5G6Qu4by/9aJU0INBWu
	fxLHvKbmrvJF9ZTrXmxVOQ4VkGxAzEuqcmciGwvY1Y4hW0I8UCLfHB14lRQhgnXbLEOZBL50bwU
	SAmcBhTK31y+esmSq4m6kBgsl+T/6UT195tJw5VN0St8wIWl6msO84ofaY2K5oGe73e5Ia6BcUG
	EzzU5vF37l9+Wd9UvO9viIl+5xdTmE+KgG/H/fkcQXL5GjvF9v3SqmUGyN6h8DJW9avlM3OojMW
	U75u3WrxyhjxLCJjHHyy2MqsP/IgrFRuEOJxTGpqZPUSUT9dMgVTNHvuTCw89l1557kspLUnCL4
	H/ymXdlFjQbFgHb/YXzXusRaCTtOflHv3X2KlXPAXLZB53o3CW4Hsj73YPjTkVoakisn+G4IHnI
	RIvixlxbVN8BmRdcY7lJemKIj4LEteawIzar/cbX9Ls55ENReI=
X-Received: by 2002:a05:6300:4049:b0:3d3:afeb:880 with SMTP id adf61e73a8af0-3d3afeb091emr18094821637.28.1788088525106;
        Sun, 30 Aug 2026 04:15:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:09 -0700
Subject: [PATCH 5/6] platform/x86: x86-android-tablets: drop redundant
 swnode group on YT3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-5-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The WM5102 codec software node lenovo_yt3_wm5102 is assigned to the
board info swnode pointer in lenovo_yt3_spi_devs. When spi_new_device()
instantiates the SPI device, device_add_software_node() automatically
registers the software node.

Therefore, explicitly registering lenovo_yt3_swnodes via
software_node_register_node_group() and listing it in .swnode_group is
redundant. Drop the unused node group and registration.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 54068a0f4633..cd8cee1f4aed 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -997,10 +997,6 @@ static const struct software_node lenovo_yt3_wm5102 = {
 	.name = "wm5102",
 };
 
-static const struct software_node *lenovo_yt3_swnodes[] = {
-	&lenovo_yt3_wm5102,
-	NULL
-};
 
 static const struct x86_spi_dev_info lenovo_yt3_spi_devs[] __initconst = {
 	{
@@ -1068,7 +1064,6 @@ const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.spi_dev_info = lenovo_yt3_spi_devs,
 	.spi_dev_count = ARRAY_SIZE(lenovo_yt3_spi_devs),
-	.swnode_group = lenovo_yt3_swnodes,
 	.modules = lenovo_yt3_modules,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yt3_init,

-- 
2.55.0.897.gb25b4bd76c-goog

