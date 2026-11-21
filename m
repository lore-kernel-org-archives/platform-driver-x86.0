Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245406;
	b=CpWEy3KswS8p9prPPLrie9oPvPzxdT/cmj1YtIiBVvUu3SWnTajBXIPzg7P9atn+JTUp
	 jp8b+WY6L7rcEwvLFMihZdP9wvkAUuuIJA5RSuVCVNi+sFBv0ruk5WkAjdMNUTfMhN/SC
	 nqW065HusEqN9WQRV3i+qaBPzJ2zbr3iTnS4HWqRyB82HUz6yrkA5BxOR1YYthkzkM2LR
	 PDu2WICfEzKFyGtiSaH+UJiTzwZOYbJu3fjIZk3HCiPrS08FIeQsDe9H2j/8NIxsRHBZ8
	 haCQ7GoGZTOWYt0G/kue/iudEXEC5upu0kkEEWbyX6umkzIPmL79s1jznKVuv8odagw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mYq2jtOrJLY6sKHqCT+nIWSwy/ZRL+QownEH1kRdhD0=;
	b=hKUiK5dyr4k95aHT/zGkVc3Uo9jLwDFiMk8ulOYk7h5wQadfUn0H+UHE34JHrP1+hI6t
	 aTA9pW7QtGJ5LJZgYPYyojiTkLfigTyWcoN37p5HWLAn4NotnPbjHfu+QOkLHd5wQbThA
	 XhnyxTtqnmV3o6o6KUaNc+snC1rcts9+xuEn646TFQ7qXgowDVPQoTEhFfmJkDPxEKnSW
	 ZJnrz4XGld8xPSSqeH7zmW+ljHj0ao0ZkLh8s+ZYXlCFcX5kwQyuk+A3x9MVjlkznZl1A
	 O1FVtZS11ORJHGZlPU9AB9ycYpeqBKR0kPzWpQlhJimdvCP57tfgGusvMlq97RQxMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryU7Gb31;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4B606A332
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 07:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E4B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryU7Gb31
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so3723877c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 23:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245405; x=1795850205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYq2jtOrJLY6sKHqCT+nIWSwy/ZRL+QownEH1kRdhD0=;
        b=ryU7Gb3189lbMLwd8X28moCAhKcxEl3rsYmfp5v4e5CyupNCGj5Ge58FnS89TS/GkN
         hLXelRbRkcE0ybBI9bb2Cm500muc4CEyUHy9SCi60OW5lZpdqNqjLJtsMfwyT5OAOKYZ
         KHZ98H1v1yu0VOVr6/kJKOmsfuhghheANH7XyVBDVp4tuquZJZnsyxGJYfdgIT8WZHSZ
         safzQZLV9DZKSp6NfAl8Q7htThhX5X2sbOW3p9I07UhNmsZhBInF0p3GVkMbVQ28l8gv
         NJQGIhGgmsuqcPONMxmyrWlfOkuNx126bC8xAeb0B0jC8wrjMkv4Eo23xh6E0s1XF5Gy
         8iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245405; x=1795850205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYq2jtOrJLY6sKHqCT+nIWSwy/ZRL+QownEH1kRdhD0=;
        b=Dn60wf5P+YuygdZyF48o2tydNZxM1Or9yerhT+PATb/mc1DWJrFuk+jPiFNlhfs+KB
         5o1TUZgvurf2fGNgKK/FYelnTeBiAlxQwIu5Y6oowbBNU/oMi3BM1pDjXRFfdT00bNjX
         y4H9w5Mhj4TfiBON/OH3NVXKGZ+6J6OHQjHvpbzqcYV4JEYi8Ao2mFxWYF6jCKJK9VMg
         JnO0SYYrbHY+WgHNwU+SUPlQQsfMXu1uRVy+/OmNGhSbfu1OA66MNFzEBR1uWkYlB18C
         PPVvZbmQQE2IyPHih/BCt9dQ6QI6ixTRzVzMiMiHpZJrDx/BnpZ7OYDvbXlQKqh4g0Nd
         p7EQ==
X-Forwarded-Encrypted: i=1; AL+hErFNoLk02tg0MqxphXOIF2ZMJfNEmcDrohQGnMNv9LQagR2lGtQ8jJHFiFX2gwnZuDaQk4Uw7ip/CGiaTz2bOw7GfUyF@vger.kernel.org
X-Gm-Message-State: APuU4Z+EQtz4zSg7xEBfCTXEi8UdQwNUUtNlK28+uci9H4FYXvuLXdXw
	s0A5hEjLQmP+6fSepj+bXLlKSInoQvB/KIbJRr1+VnkhLjO+1aWn69c8
X-Gm-Gg: AZFdTZft8+LUi70HMlEAT+ad3XCLY1SGaZTfrROBCYxo5QJLvMv/TgpvGNwYUSK7KqI
	O/qBgpqOu26YZLKPIMKPn3th9RfH725ZGoqkdYH457DToJEesgpoT1+h4ympTsWcUa1Nk6boBfH
	GOwxMM8p3A+4tDBcdUbfWXdftla/NTyX6RP1RSEG9s/fRvrRVm7Kwph4UBoFjHq85ejWCtfwhlk
	9B03A/At4PQkp+FR7ju/rWg2zYq/fu7c6XzlRNsp/k73WhsUoSh32+0yc3Y4Ahj+WFI+yS1VT0I
	6WRkeBDEv3k4uZ7mlN5cX+ZRfQTMSBF9qwuTxKOY5HfpZXcXfyrO84n3dM1cNx2WFwZzu+LE3nC
	UIpxKBIGgegS6ZVwRWJFn8EhJkuQGmk0kdfFDujaQAF/kyR5TLvKU3JVa5LVeOCmZhF0x3lbinx
	PQsLlZK7zm1a74z9jqZyGpTiwyDkYZS8FmNiYF63ovizG23lL2185JiMZBWR+LIr83Ds7DXqwiv
	tiqjivvSDq+co3sPynjkNRtklSiFKuY15NMC+xSgcl8r3G3Aq8180KD1Qlal5lIvLuBXWv/2kVf
	wfMDcVCLr+iDcyrOLzhr6tlwp2/gNyHysYGXF5TT1P134sL2Pmg=
X-Received: by 2002:a05:701b:450d:20b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b5568e825emr5905692c88.21.1795245404775;
        Fri, 20 Nov 2026 23:16:44 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:2f:4d17:70ef:2f53:72ff:31c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm20880373c88.9.2026.11.20.23.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:16:44 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/2] platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx (8A3D)
Date: Sat, 21 Nov 2026 12:45:34 +0530
Message-ID: <20261121071534.28473-3-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121071534.28473-1-nonameblank007@gmail.com>
References: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
 <20261121071534.28473-1-nonameblank007@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at 0RPM,
So, assign a custom victus_s_ec_fan_profile_params for 8A3D,
introduce a 'if' statement with hp_wmi_fan_speed_auto_reapply to resolve it by
calling hp_wmi_fan_speed_max_set(0), and passing platform active again to reactive curves.

Test data:

auto/max:
hp-isa-0000
Adapter: ISA adapter
fan1: 5400 RPM
fan2: 5200 RPM

mannual[255]:
hp-isa-0000
Adapter: ISA adapter
fan1: 5800 RPM
fan2: 5800 RPM

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0166b9cc4d9e..583e1c0dda07 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -155,6 +155,7 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 
 struct hp_wmi_fan_profile_params {
 	int (*get_fan_speed)(int fan);
+	bool fan_speed_auto_reapply;
 	bool fan_table;
 };
 
@@ -170,6 +171,12 @@ static const struct hp_wmi_fan_profile_params victus_s_fan_profile_params = {
 	.fan_table	= true,
 };
 
+static const struct hp_wmi_fan_profile_params victus_s_ec_fan_profile_params = {
+	.get_fan_speed	= hp_wmi_get_fan_speed_victus_s,
+	.fan_speed_auto_reapply = true,
+	.fan_table	= true,
+};
+
 static const struct hp_wmi_board_params victus_s_board_params = {
 	.thermal_profile	= &victus_s_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -177,7 +184,7 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 
 static const struct hp_wmi_board_params victus_s_ec_board_params = {
 	.thermal_profile	= &victus_s_ec_thermal_params,
-	.fan_profile		= &victus_s_fan_profile_params,
+	.fan_profile		= &victus_s_ec_fan_profile_params,
 };
 
 static const struct hp_wmi_board_params omen_v1_board_params = {
@@ -2286,6 +2293,13 @@ static bool hp_wmi_fan_control_supported(void)
 	return params && params->get_fan_speed;
 }
 
+static bool hp_wmi_fan_speed_auto_reapply(void)
+{
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
+
+	return params && params->fan_speed_auto_reapply;
+}
+
 static bool hp_wmi_fan_table_supported(void)
 {
 	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
@@ -2945,7 +2959,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (hp_wmi_fan_control_supported()) {
+		/*
+		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
+		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
+		 * the active platform profile, so the EC firmware thermal curves regain control.
+		 */
+		if (hp_wmi_fan_speed_auto_reapply()) {
+			ret = hp_wmi_fan_speed_max_set(0);
+			if (ret < 0)
+				return ret;
+			ret = platform_profile_victus_s_set_ec(active_platform_profile);
+		} else if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
-- 
2.55.0

