Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873712;
	b=YCWCHxlpOahp65ZwsXDtO6FufX7ypYoo9rCs49IYBHwd4tgP07FO/bo4ytllViiz/vy1
	 pkvmp8CagPifIqIZW7IaBusTpJKkbBs7TbeVK/PLrAogksGsZKTTkMt0ZyQbYpFqsq75z
	 fKjkg71HoGCgXpqBkk+4FSdYEBTRnKgSJBpzcESZmA67RfSSGiXfQ2sEd3E8NPE27CO2s
	 yh1csekDZmf4QocXqVwHiI4LvMjJWZseeQ07cwtOzUfQnhvB/AP5tjnII9zeSr8TtDOHh
	 ccmOE45ZngSAYXvzMnNz1rv4jy2255dIC33VHMEgP2XagI7MhpnuPr6gsPH4Ehvc3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kikhthoaQlWBu42au/eGBn/q99FtaNm9yiWtkx2cnsk=;
	b=hKtKWRVlgAZlZ+7dWd4ag3rjp6dP22EvFe/hDeNkNt9g6ppy9h2cxKr5hyqgzczJW2HY
	 TXEGjxbFMHxzsfCwJvOcJP5dwL2hWfaDOiBoeqS74UrDtQww6rBGmoStoupv0psIODjxi
	 39yk1Tfy91dNIBvin6DKVs6C53xWYaz5V6mVDqCz2nB/sTUfxPJzGNr6AEAc0YK0HHfC2
	 GaV6xNQnW1aa3EVr04C9QiG9Kdx6D7MHfiw2+q+CO+PTBirEu6t6bAnDXhwoUKs4QuvrC
	 0QUwy0LxGhqOgvxDw0S6V8NL2MLk3/bH4xSwr3ryqAoUmw4LdoARWw2/cMH3w7xz2qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Vnv/VXJ2";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DA3606A31B
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 20:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DA3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vnv/VXJ2
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so1974338c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873711; x=1793478511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kikhthoaQlWBu42au/eGBn/q99FtaNm9yiWtkx2cnsk=;
        b=Vnv/VXJ2lB58VILA6ioygffnws5UkzzQ/PjShVmAzAxAEzxAgS02Js0YebOFQQfFc7
         E9dX9uMAgb/fXkhlqqlWPlKDWPHx61QdAutGcV+CRgLCKYLoxOOBIEiy1Oj1IdA7uK+K
         HbZ/uXHwvXnjRK5XfoJ2YYTA2o1mO+M5i/uMDfP6G6oJOmgvhINsLHWkj+ooCz0jWg2w
         8CpVurbi5C+fGW3IwIYEg79rJjMqXGaHu8sy4Pe1ch9u82+Tt9tdFWzfov5UcNMrCDii
         GjY0AcJ6oWirhZVLCZr1wzcZXqUfYxcJQbTaBDClEQcVsu5vGZ0JBAE2ElZHg4yZ3Zft
         dvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873711; x=1793478511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kikhthoaQlWBu42au/eGBn/q99FtaNm9yiWtkx2cnsk=;
        b=xPwwFctvILcYBQVkPrwDfg9aDf9sNdSfhIR+gwFE77UF8DGI0G+rx6k/X66e5gNnYV
         1uOv0A45KmGAPEdYcGOOX2hQWgFJzMwRALTS3iK9oONig0HNSOaC58yYJiiuElh1nvvP
         ooCZ0xVEVsEUFO9GEU/EosrhovjfIllT1feHycD2ZDym5Ek7pI9xQHvnfnwILOx15jlf
         PV2APGEPIrysTv0IBQmyWuWl4zSeWIorhvblxrbS6f+VEXUzbGRiiD/Xu7vlsydizQ8I
         iQeVLcyDU5Enbj0/DjNs9MgJp2yhbbXfhcw3V26jnkVbnbD3df4Glbdvdm1HO2VTYGji
         JzgQ==
X-Gm-Message-State: AFq9FYIH8tlmQndB4P3Ln4MQuLOfOZmORBxBZBH1ZVMUMk/XbMC1ly32
	NPEm6PDsMGHSxbyey8K74An8VgA/v5rRccuI1/jd3dXA8DEaqg+cWC2q
X-Gm-Gg: AYBFou1DVKFZ5X44rNnymskgYSjuN93oug7rD8HoWaSINF1edB6/vaeH6EZ0jubHHw9
	/wj6++DyJe/jWuG79+8Q8mtXDgstuqzjtr6jEU2wnxAX1blU8+qfmAY5w6O4o0EVncnUF6P5jCm
	9bBra47HXyTlc+nUfTclbxeg+MkVckpU2qrbfm4vOo47TJkYbbwQG3kBmHjf6FkDlFxzv+RHLHa
	3miiLVxU/9k5ENJ76SkR7ii6Y4haUZWTW5wsSmX1gnN0JrtANf7iJXVJIZRKf9sticIN/LaeRzy
	lZe3WxmzLApKF1Q3v4LwSxQyn51uKMo5k1MvJslNP/pLWL/0NFZ1l8WvYv088A2WUlI5YBzSvVm
	lBTpmBglTSCDTq6s+2roh4RlF0WUdPyfaBQziQ79wH4O+SEacPbEVzHtC5oU60ozcTzDHMzBlxt
	TbG1jT1dkRnfDBb8zxJoiEGR83rGa+U44QWT8YqM/1+6PTQKKL49ACX82Zk7uPkQz3rWqyjJF8H
	HB7gadCVvut5hZDnKDykktE9+UtIF1SiBGSk3yC/LuO2Uep/VtfwuCVLJUfUO8d3dBAp+LoMe08
	Lkg=
X-Received: by 2002:a05:7022:438e:b0:195:e4b9:d326 with SMTP id a92af1059eb24-19936a5e5e9mr6393651c88.12.1792873711407;
        Sat, 24 Oct 2026 13:28:31 -0700 (PDT)
Received: from localhost.localdomain ([49.42.181.238])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm13495358c88.4.2026.10.24.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:28:30 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sourav Nayak <nonameblank007@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Sun, 25 Oct 2026 01:56:58 +0530
Message-ID: <20261024202658.13149-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Currently Victus 15-fb0xxx (8A3D) takes victus_s_thermal_params,
which causes it to register as incorrect EC layout while cold boot.

- On other hand windows Omen Gaming Hub registers EC offset as 0x95,
- which is set in driver as HP_OMEN_EC_THERMAL_PROFILE_OFFSET.
- So, address it by adding victus_s_ec_thermal_params.

- Also perfcontrol modes as performance (0x1), default (0x0), quiet
(0x3) registers. So, add support for quiet mode.

Also, hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at
0RPM, introduce a 'if' statement to resolve it by calling hp_wmi_fan_speed_max_set(0),
and passing platform active again to reactive curves. Test data:

auto/max:
hp-isa-0000
Adapter: ISA adapter
fan1:        5400 RPM
fan2:        5200 RPM

mannual[255]:
hp-isa-0000
Adapter: ISA adapter
fan1:        5800 RPM
fan2:        5800 RPM

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc45..c35bbe1427e3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_ec_thermal_params = {
+	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_ec_board_params = {
+	.thermal_profile	= &victus_s_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -245,7 +257,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
@@ -2121,10 +2133,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * but logically it should have tp == 0x30 || tp == 0x31, as
 	 * corrected by the Omen Gaming Hub on windows. Hence accept both
 	 * of these values.
+	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
+	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == HP_VICTUS_THERMAL_PROFILE_QUIET) {
+		*profile = PLATFORM_PROFILE_LOW_POWER;
 	} else if (tp == victus_s_thermal_params.balanced ||
 		   tp == omen_v1_thermal_params.balanced) {
 		/*
@@ -2657,7 +2673,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (hp_wmi_fan_control_supported()) {
+		/*
+		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
+		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
+		 * the active platform profile, so the EC firmware thermal curves regain control.
+		 */
+		if (hp_wmi_thermal_profile() == &victus_s_ec_thermal_params) {
+			ret = hp_wmi_fan_speed_max_set(0);
+			if (ret < 0)
+				return ret;
+			ret = platform_profile_victus_s_set_ec(active_platform_profile);
+		} else if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.55.0

