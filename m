Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32C3AD515
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250986; cv=none; b=SG8pVD5aBkZx8NO/bhzsI4xOGzIDIGi5LDh2QJnV1vWZj4tAwoA3YevHud5TfkCU7T5OMv4JS33lcW4fXJmDOn9dlrZd3DPVoUpasItgG/J3K4cRW+mlZDdORpK4xnnqIt6ydI0b3M5ka4VkTyIHNXNffsa48xBBk/UbZJWPcy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250986; c=relaxed/simple;
	bh=+Z8ZTpGEfHWM4q/zUbV7kqxbu5dhULZPNJ7diN0yJeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPcIhqtzvW3QAg610tEpti7CntUzMzXGGqxfc+k6ArBW0J9TD7VwoogSIsCmqmHOTqyLCbdqchckqYNva1U5O1Jw8Lkc5JqytEfpxPrGC2Uvu8a64liW1FkJICs1ZmpuOakqJbeQsS9A+fU+t6XEoXmmuMXwTxXwsVQGPRvuZB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5ZLCRs6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5ZLCRs6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1341961a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790250984; x=1790855784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rBh57CQ8oC/XCjJGNJlSdgV/jpJp4/g95+Pgh7fgMA=;
        b=h5ZLCRs6jcFxfdHs0UkadGQfBABZyDwEnK4TozYKXLU6/zW8U4asodHIcDM93ayRmh
         fOk+5W4D3u/hx0OSE7LRQso0yJbV1c2/lFGLAc4h8DlBmSOHNuAsei8P1Utx77azJApm
         0YsArrhXipVvZwFaSzBoMFjq0LqkKIXyMiPJg69tEzvYZGGmAqGLhISvpDPOzimYWVLY
         66lwsgjpJBXEGSBxjTfFWFKEwk61yMLJuCD/oOhSW3sULIGb5WJAdQW39Ym5aIje8UYN
         6bR4ubLQftFgfrVvkvf2hNklDctaWJHD7T3HFwt7L3Tt8EcV3ArPytWPXTChIeIHL1ea
         wBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250984; x=1790855784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rBh57CQ8oC/XCjJGNJlSdgV/jpJp4/g95+Pgh7fgMA=;
        b=0B2KPAfD7jkYWYbuG0QBIXnRFSbFJ2flW3Zk7Yr/2+mgY0mjHECD/YLRICUMpDYOwy
         j2v0HVSXRlEY7RAIk1DWz+RZe8UNZxFK98+/EaryD+MgHc9D6qAC+mEpD+kiFu+TM5Zr
         X10YBdw4eUqNPmpf4DQspxF6LVoZzJXmDaF6iJJ4mXxm5jaPOwg4YyHCQPz32gI3r15M
         5ZbsukaPh4p2dQ08xb0yy1ZjI0cF6T6Pw+mLGXKfXbDDV1aiqlA94Y2GQyDpUcjy3tp/
         6Se45C83MmyC9D1FzSG0NNnsDhCVNYesiTE7F+tSPmc4pkdMPMwKFTzFfghcAsQlDumG
         YS6g==
X-Forwarded-Encrypted: i=1; AKwUvBygF4AjJVhd+gL+FI8AUyEd0Jri+QTQiSO1zTgfF5d1YJ/NiJPNCW1OALStwX32r0QB1f4ejmfKNKh7N7/uTpC6gtjP@vger.kernel.org
X-Gm-Message-State: AFuF++nX7SxAmqWK1KmT25mrW3XLcojAPdSCdLVacsCzZ9eyAX5dh5Vh
	x1nsCtyGhmBRmodj4CF7qL5mPupnod4wn3dVYS3+nR6B9Qy25+Pf+HfDMh8T/BruYNftHQ==
X-Gm-Gg: AYBFou2jd6Xy7mBSevTULzbF6vzCUCNUsJtf5QyVXeai1/JDMUzdret2x6EukUfte+x
	ho3HyTWmxtj06Uv2pxY4pqDnElsum3EmJp0bO97Fz6HXFD4ldmvEz3+CQNXd3DWYEWqrzM8eTIg
	ZJ5z/ZxKRD0y43QeTOmOECBcCcYaPq13Q+mk6Z6ZltNeGloqJnV8GtcFUhIS5XpHfhgA0+73WgN
	GnOTKu7juGWOZLb0kecXbbdfMxd9zb03gJnemp9IWRzKIDn4W43fKcxhRnJNQ2IdGNVxXevUJqs
	rUFjkFHh7dnGVOH9ohW6kvEpw/2SHTvDOhWcxKz/RSoQ3QjshRZF7aHpk/CD4wT0Hw/KJNO8/AA
	Kv1xb5MdbgdccVT0CjQ9QMFKUb9DQYTaVKSg6dM72Y5QN90I+ptaJltkoFFR5dewhaXJh3fKfyx
	LagpZ/vcVhufkP3qqMEgfEoMoCAjqUuEemG/YHdi48ufcVkZ5n7f6SsQ==
X-Received: by 2002:a17:90b:5807:b0:3a0:8050:2ec5 with SMTP id 98e67ed59e1d1-3a0985be2fcmr1751949a91.12.1790250984098;
        Thu, 24 Sep 2026 04:56:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm4598745a91.9.2026.09.24.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:56:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bao Cheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henning Schild <henning.schild@siemens.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: simatic-ipc: fix platform device leak on registration failure
Date: Thu, 24 Sep 2026 19:56:17 +0800
Message-ID: <20260924115617.1578309-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_platform_devices() registers the battery, LED, and watchdog
platform devices in sequence. If LED registration fails, the battery
device remains registered. If watchdog registration fails, the LED and
battery devices remain registered.

These failure paths leave successful platform_device_register_data()
calls without the matching platform_device_unregister() calls.

Add an unwind ladder to unregister previously registered platform
devices in reverse order before returning the registration error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: dd123e62bded ("platform/x86: simatic-ipc: add main driver for Siemens devices")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use an unwind ladder to unregister previously registered platform
    devices in reverse order, as suggested by Dan Carpenter.

 drivers/platform/x86/siemens/simatic-ipc.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
index 7039874d8f11..4a4509fc9263 100644
--- a/drivers/platform/x86/siemens/simatic-ipc.c
+++ b/drivers/platform/x86/siemens/simatic-ipc.c
@@ -92,6 +92,7 @@ static int register_platform_devices(u32 station_id)
 	u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
 	u8 battmode = SIMATIC_IPC_DEVICE_NONE;
 	char *pdevname;
+	int ret;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
@@ -139,8 +140,10 @@ static int register_platform_devices(u32 station_id)
 				pdevname, PLATFORM_DEVID_NONE,
 				&platform_data,
 				sizeof(struct simatic_ipc_platform));
-		if (IS_ERR(ipc_led_platform_device))
-			return PTR_ERR(ipc_led_platform_device);
+		if (IS_ERR(ipc_led_platform_device)) {
+			ret = PTR_ERR(ipc_led_platform_device);
+			goto err_unregister_batt;
+		}
 
 		pr_debug("device=%s created\n",
 			 ipc_led_platform_device->name);
@@ -153,8 +156,10 @@ static int register_platform_devices(u32 station_id)
 				KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
 				&platform_data,
 				sizeof(struct simatic_ipc_platform));
-		if (IS_ERR(ipc_wdt_platform_device))
-			return PTR_ERR(ipc_wdt_platform_device);
+		if (IS_ERR(ipc_wdt_platform_device)) {
+			ret = PTR_ERR(ipc_wdt_platform_device);
+			goto err_unregister_led;
+		}
 
 		pr_debug("device=%s created\n",
 			 ipc_wdt_platform_device->name);
@@ -169,6 +174,14 @@ static int register_platform_devices(u32 station_id)
 	}
 
 	return 0;
+
+err_unregister_led:
+	if (ledmode != SIMATIC_IPC_DEVICE_NONE)
+		platform_device_unregister(ipc_led_platform_device);
+err_unregister_batt:
+	if (battmode != SIMATIC_IPC_DEVICE_NONE)
+		platform_device_unregister(ipc_batt_platform_device);
+	return ret;
 }
 
 static void request_additional_modules(u32 station_id)
-- 
2.43.0

