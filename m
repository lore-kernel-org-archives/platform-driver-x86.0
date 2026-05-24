Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB7282F13
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 03:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779593693; cv=none; b=UPtyYZqofSos5lpinYlzpIC7h4gfZxKUUAVFtNEhZuTsa5R9+cqYOhEupfTUtKlyRg35Y6K2WcKTywp1Tr/9HsIXnFp8dK1+dd1QNQ7RMNIj1kyP5RehOoRDUAy7SrX+bj2PZwkjcK1V4hSMVApBhN03SuWN18eGCcxfjoXFQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779593693; c=relaxed/simple;
	bh=AjC0ktyvPQeI4RDN4A8wnPvSsIFfz5/0WHjRx9dH3UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuwnyYlkwv5Gb37rJNJWmrJMbTWkNEJPbf5Wn2qzoRtQvxq1nMpUIr7sl5RSZXSbWvvOA3KTkXrpIrAITYkPMcZJWXjxbD3uoDh4V+bg5aKUOVrQX7U7zZPGkeiMRhnvv/pTPty7ssr/kYPStJO4lnf/N6+VItzmdhb2nahpxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw76k4Sz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw76k4Sz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso97434555ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 May 2026 20:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779593692; x=1780198492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88YLIo6TgvNgnlSaPgI2NY6rAJ5rlzf0h+LiaxqanXY=;
        b=Pw76k4SzqiI3oWFXvAKGOowq0RAlB+jAPBkzueV1DgC87QEXFJ7GDAvglE2cOAxRSv
         avJfhBkKh6m2KqeqeGpjPOYK8oPzMY4kl6oFubqAoh+dDQZW0m/5SbOh5Wvdr6bxIP3z
         eioEhdSJyEDW9p2K4dIIs076MV/t0+GKjPA7Bd54fb7x5xKmzQI3ITSTpkgCyv4WEHRr
         4bc9ZKCkR0x081YvdotENii10HAfbnAEwSJUi+75WXldPy4GA0MBxT7iq+n7BCi4bFmb
         0Wj+LKV3Gx6Jm552V4FGTgXIPZRRNcn5RxLWAcrtoQWPVERYxhTh5tdo3RWZAPAkTc6I
         TtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779593692; x=1780198492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88YLIo6TgvNgnlSaPgI2NY6rAJ5rlzf0h+LiaxqanXY=;
        b=TLxKuk6V62TkegwCzJUNyAYk9JbuIC9p7KRbAiuiNivuop9NkMGqXwKxiyuyoMoEPC
         IcCUeIS06znSTQLAxqIhB6xgdcn+6IxYBJ4auaBKKs+ag/Unik6vMSXNJTq/4o1Vdh3e
         XHNDYyj1TeaJUawPfgkFU8eoJ572DXNm8+b97WIPEykGIFeXDNs+og6CTveWjHcFw13C
         OVKlHnaqFLWlc29AZvrKSU49ushGbfM595gdVekPFzcL5L3AgxeyIwVm/G8lBRittaRY
         wmFsfoPGDSfY8lz2XAFHeajSRkusCsd2ziDintTeFxtfzt0CEVO43Xg7cV/2q9mNjBkw
         6iOA==
X-Gm-Message-State: AOJu0Yy/Bhb10spkaAhP4bzI8jZ/lDpUSa2ohdiLyV3ea7YDgZNFBdUW
	YbMk7+czY20GIIcV185cN99WwIm9vKZpfpcWGxsSqXaW0Yiqi0KAWjXBopnZDxTH
X-Gm-Gg: Acq92OHT8M76cYd/nEwPdCjLgxdp6FS6iMqv6RtYe0h8v8W5RdchrB0qgnu24UTlW/X
	To9eA+EiDugoRdMXcyN3Y6QgVaep0sAIkyg/ZcwfqNdIpmdWmZGtqpQQQaLYCROj8hoLJigt8eG
	eXYtKU8Gm/OYQN2OylZYXbMv3Q9RcrAUT8475l65eHeHHEovpDEuMKBS4p09LBrRdsH0VPM9W7G
	AnKoBUx7CdJM1clvbQBU1UVl/AXQ1XICbAkmXxVuJHR0kNpsFgQY+5PPn1JehuRMyEzJ2fL+wK/
	u6qTvQypR51/SLM1VtE9/7HXuW8h7Kw5qzJPamOxk08+76nNyDuqInnkmh5xHqaEdDVKxdq2OXr
	hscDcceijRS8/M8HVLklgKuTO4GqqfEuO+WlCA6y1phvIHziQkaSiTM/H6rwmQKlSfOZk9QLzdo
	IwX6HoAJEl+Pi+VCdm
X-Received: by 2002:a17:903:390d:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2beb065e81cmr111245755ad.23.1779593691806;
        Sat, 23 May 2026 20:34:51 -0700 (PDT)
Received: from pico-cachyos ([2a09:bac5:3e0b:7eb::ca:1aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c49b2sm55469805ad.60.2026.05.23.20.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 20:34:51 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com
Subject: [PATCH v7 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Sun, 24 May 2026 09:04:24 +0530
Message-ID: <20260524033424.61847-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524033424.61847-1-radheykalra901@gmail.com>
References: <20260524033424.61847-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add board data for the
Victus S thermal-profile path and fan-control support.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6fd99b6..a25b12c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -170,6 +170,11 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.thermal_profile	= &victus_s_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
@@ -230,6 +235,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI board-specific feature data for Omen and Victus laptops. */
 static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_8a3d_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.54.0

