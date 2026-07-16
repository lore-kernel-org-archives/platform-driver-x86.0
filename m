Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674073F824A
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195705; cv=none; b=V7E89NLHHiiLJKjB8AaWpiUjDME+I7WajSPqeWFTOyTY+6zPHucHjggZ/N6wnWs0Tv8mo5cI9b+rXEWYPqwe6YxrpDdxagZj9lmbFno+axEXhSnyehfLifzwzXU+X6ByKOAD7TAaqa6wCCtwCKl8OCxhQy+NdV8rm/WhbT0jKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195705; c=relaxed/simple;
	bh=uBlgmCUO+kSJeqMOyxoRXP9mzwn3H2Zxwb6KHpRp8a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4snaFx1JdGBskByWTMiN/463BZTYbbB9vDs/3eA7YYI4dZTvKA9V8dmIoaxOQU6pkFVMQ3H0+/soFi504JzMczQetISxclDKNgRazh2AT7kgWzaxWPdGBv5WO36B/yvhVLMcdEJdk4htiN5/5ES029Q8nOGjpDE6RjANDR5HJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXjOvWxf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXjOvWxf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15b51ba80dso60437266b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195701; x=1784800501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FoyX1lbtjjAFUSqHFix+1M+3EiQfqddD6tx6JBLvw0w=;
        b=SXjOvWxfK9Dkj+iojv1dNPSa2qSDSW0nTU0lbSKMJnHXFxS1PyZLKc+xpWNaIQ1jJa
         CJDoXqPUOxyAJIr99ST9dgTIZjUINFi1+bG9YJ83aegLVxyxTC1Yv2vLXPckIOc1q8kr
         /G3l5/VowjTzMrqV3ZhWvTSH7FCnGYyOPv25Jp8r6kD1ims+V3s/6z8UvYZgI8kCHJYw
         j9m+MaF7ha9r58wJgjnGhaL4SlqHe00LNoyftonvESsYFiSyAl1CHtLkKGM5fb+TQheP
         FLuPQWlVvLoI/a0EEP2pYoJOjg9BVaTnxts392UAjRGuYVC5ucVsuVt5Gmy4+E5uICpq
         GnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195701; x=1784800501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FoyX1lbtjjAFUSqHFix+1M+3EiQfqddD6tx6JBLvw0w=;
        b=Sb/fhc/Sv+8O7S4ba2tWgqAnb0nKJj1g8no1bnlk+MHnHXruPSUeal9k1O2WzHQcIS
         2CjqS4AureAk9lug5Yo7onlsuV1WzQVku2AJTCbRc+BxivDeW5U3yTbSE5cUXLWw9G1L
         9ihibUPgpqeFBpo5V40MnEvGOWfA+JJh0q5vZUv2M4beKLB3XGqZnsCGUmLqpNc6T5rq
         f60Y/gB3Cx3BpWw2P8V9saqbF53LgTIk1p2BUmvVBeQ3PQfbzS/YCbecm9GuKpnrFs2h
         o7zrfJ5eJGJ/xYh7SWm3ppyfjA7XICU49y5yQ7bpiM2NMaFEwXMIib4CoHxTH1AOZGqE
         Civg==
X-Gm-Message-State: AOJu0Yz41fZA3BuIFT4zyOLqkAR3Jvx9ZvL7jjxa5uWwfuG4bBE3hXWz
	cG+gvdI6icAz6exeiwKpld83Ko5lHCvNA3L8mWz7h/3VfxgJ2CWeH7DYLNFIPkzWBV9eDwe0
X-Gm-Gg: AfdE7ckfekqe8trbuaiQ0ARAhGOZ6aaouts5jvB819HlysmCp/vrclTc0T43mB9MrRO
	EjVIALZGj9iToRid64avG5KNgdKm6bDIY74xKB4D1nbyGsCUufpK2GzX+jO7DNDkLTG81ErhKRa
	lk0Pjos3YmGuwDZItIEDmFTpb0DYJJ3RLI7l4hb8He6oVcEKGzfBCM5207UTJcc1aMxgfoVjaUU
	2GVaud9e2yL0ovv7OmSkrFXZSumynaAn5Jh0mUsMr+ynPLFGM5STI0B/og8hVXgLbbYvF0tKEVs
	XZ5mH1Wtdi/0VAFnjJPP3Un+vaG0bCfZo5JF7E+ip4iIYnvIuJyl3H3bbNnSTZxDxHjNCyR/7p8
	kp2odnVtzduZZClDy8g5H3O8QRIjkcxcb1ib9owpqLwDP34n8qDdH4wTDdjFrpt4wBndU
X-Received: by 2002:a17:907:3cc3:b0:c12:2aef:af2b with SMTP id a640c23a62f3a-c161e98a19cmr705948166b.4.1784195700705;
        Thu, 16 Jul 2026 02:55:00 -0700 (PDT)
Received: from fridge ([193.32.127.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e702sm178454966b.47.2026.07.16.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:55:00 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	edip@medip.dev,
	hello@kursatabayli.dev,
	mjg59@srcf.ucam.org,
	akpm@linux-foundation.org,
	jorge.lopez2@hp.com,
	jes965@nyu.edu,
	mario.limonciello@amd.com,
	julien.robin28@free.fr,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 2/5] platform/x86: hp-wmi: handle firmware errors in tablet mode query
Date: Thu, 16 Jul 2026 12:54:15 +0300
Message-ID: <ce5cd56d2ba561272770d7992e397dfbec108d4e.1784195117.git.emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
References: <cover.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_get_tablet_mode() accepts any nonnegative return value from
hp_wmi_perform_query() as success. HP firmware errors are positive, so a
rejected query makes the zeroed response look like laptop mode.

Treat every nonzero result as an error and preserve negative transport
errors. The event and resume paths pass the result directly to the input
subsystem, where a negative errno would look like an asserted switch, so
skip the switch update when the query fails.

Fixes: 520ee4ea1cc6 ("platform/x86: hp-wmi: Fix SW_TABLET_MODE detection method")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 205a6020e9c5..e226b772ef00 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -798,8 +798,8 @@ static int hp_wmi_get_tablet_mode(void)
 	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
 				   system_device_mode, zero_if_sup(system_device_mode),
 				   sizeof(system_device_mode));
-	if (ret < 0)
-		return ret;
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
 
 	return system_device_mode[0] == DEVICE_MODE_TABLET;
 }
@@ -1198,7 +1198,7 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 {
 	u32 event_id, event_data;
 	u32 *location;
-	int key_code;
+	int key_code, state;
 
 	if (!obj)
 		return;
@@ -1228,9 +1228,12 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
 					    hp_wmi_get_dock_state());
-		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
-			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_get_tablet_mode());
+		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
+			state = hp_wmi_get_tablet_mode();
+			if (state >= 0)
+				input_report_switch(hp_wmi_input_dev,
+						    SW_TABLET_MODE, state);
+		}
 		input_sync(hp_wmi_input_dev);
 		break;
 	case HPWMI_PARK_HDD:
@@ -2431,6 +2434,8 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
 
 static int hp_wmi_resume_handler(struct device *device)
 {
+	int state;
+
 	/*
 	 * Hardware state may have changed while suspended, so trigger
 	 * input events for the current state. As this is a switch,
@@ -2441,9 +2446,12 @@ static int hp_wmi_resume_handler(struct device *device)
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
 					    hp_wmi_get_dock_state());
-		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
-			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_get_tablet_mode());
+		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
+			state = hp_wmi_get_tablet_mode();
+			if (state >= 0)
+				input_report_switch(hp_wmi_input_dev,
+						    SW_TABLET_MODE, state);
+		}
 		input_sync(hp_wmi_input_dev);
 	}
 
