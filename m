Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B833CF
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgpX7Ewk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3368d1c7b23so6966041f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 02:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704019587; x=1704624387; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pL1jwdjxe7eUIDqo5H7VCkap05E9cyq8Rp3MQumBEPI=;
        b=BgpX7EwkkdvckK/zhgP4yKj13DF7L5XDtcT50KJLGu1/dLNqgs/He0pM2mPGDrr8a5
         K3ScpQ/Wiv8qJZ9zB7T3oJ/51UFJ0CpZakWtQmKBv5V5eLV1Zt0iN+xASFNXf6DGSVw/
         9P4LssGoBD9ye+5PhVlHmeE4d1RjxQTq7GfiGwVulOJiIO33oITQN71+PxbaA3KH0Pi/
         v3Aku+62TmvgtA2e4JuC0Fs+D8tCtp56OppJTw3pk5rh5rgFI2MTXqX+0E54DxNVDF6J
         YifQFdZrcyFacTzX24S42bxDiVLmfWXB0+UPriUt9V5cqOS98GtkvVfUBeewJ6gfermX
         aVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704019587; x=1704624387;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pL1jwdjxe7eUIDqo5H7VCkap05E9cyq8Rp3MQumBEPI=;
        b=bjpY8sJC2QZsQWH8lnzy0vZCLPzElOhChJCmP7j85QgUFYq57BA/PQsKMsItN3j4yL
         DeWqdxtkll3Z0l6dnOvnmAyE/oA0Fdip+GJzIvhugD0egBsT8j6rlLDvvS0MTFpNVe0O
         az7dh8QKiyLVbdfbKt730vNj/SP/clkq58ChCWqRA8aMkNHSgQVDbdRPwbFVepuuhxOO
         w6mGDzeXqIg8kB9jstAxBI9Lk0BgoiG7vtfgL1M2kI/i3ub63fluGfS8V4Lr87gha6IQ
         wWG9rCCnr2G9tDbpRKRjIKuOSBZjSQQdYFIL3LS+LRUhOgSlC4QuoiC/JUjgKdE6axl4
         FDxA==
X-Gm-Message-State: AOJu0Yy0uhVbMTiyxiY9B+QPap/l4xvjnrHS9ddjWAYnJBx3upd11aJK
	fSr0FNvZKh/iRmfK0hyRskoHBEWARDY=
X-Google-Smtp-Source: AGHT+IGKPx1sIosNJG31C2K+8R6x5/IwIavTeDmY+2MP6La+ji2w+MM8HgVpwmHW2Xus7JQ1k5Jauw==
X-Received: by 2002:adf:e2c2:0:b0:336:c010:bff4 with SMTP id d2-20020adfe2c2000000b00336c010bff4mr4366422wrj.11.1704019586958;
        Sun, 31 Dec 2023 02:46:26 -0800 (PST)
Received: from alexis-pc ([2a01:e0a:d77:ff0:7cfd:5b8b:bcda:7fa9])
        by smtp.gmail.com with ESMTPSA id e25-20020adfa459000000b003365951cef9sm23549332wra.55.2023.12.31.02.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 02:46:26 -0800 (PST)
Date: Sun, 31 Dec 2023 11:46:25 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support for
 8BAD boards
Message-ID: <ZZFGgfsfrU2vuQoI@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add 8BAD to the list of boards which have thermal profile selection
available. This allows the CPU to draw more power than the default TDP
barrier defined by the 'balanced' thermal profile (around 50W), hence
allowing it to perform better without being throttled by the embedded
controller (around 130W).

We first need to set the HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET to zero.
This prevents the timer countdown from reaching zero, making the embedded
controller "force-switch" the system's thermal profile back to 'balanced'
automatically.

We also need to put a number of specific flags in
HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET when we're switching to another
thermal profile:

   - for 'performance', we need to set both HP_OMEN_EC_FLAGS_TURBO and
     HP_OMEN_EC_FLAGS_NOTIMER;

   - for 'balanced' and 'powersave', we clear out the register to notify
     the system that we want to lower the TDP barrier as soon as possible.

The third flag defined in the hp_thermal_profile_omen_flags enum,
HP_OMEN_EC_FLAGS_JUSTSET, is present for completeness.

To prevent potential behaviour breakage with other Omen models, a
separate omen_timed_thermal_profile_boards array has been added to list
which boards expose this behaviour.

Performance benchmarking was done with the help of silver.urih.com and
Google Chrome 120.0.6099.129, on Gnome 45.2, with the 'performance'
thermal profile set:

|                  | Performance |     Stress |   TDP |
|------------------|-------------|------------|-------|
|    with my patch |      P84549 |    S0.1891 |  131W | 
| without my patch |      P44084 |    S0.1359 |   47W |

The TDP measurements were done with the help of the s-tui utility,
during the load.

There is still work to be done:

   - tune the CPU and GPU fans to better cool down and enhance
     performance at the right time; right now, it seems that the fans are
     not properly reacting to thermal/performance events, which in turn
     either causes thermal throttling OR makes the fans spin way too long,
     even though the temperatures have lowered down

   - expose the CPU and GPU fan curves to user-land so that they can be
     controlled just like what the Omen Gaming Hub utility proposes to
     its users;

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 63 +++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 95282c3a02ed..79caf5d79e05 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -38,6 +38,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 
+#define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
+#define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
@@ -57,7 +59,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
 	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
 	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
-	"8917", "8918", "8949", "894A", "89EB"
+	"8917", "8918", "8949", "894A", "89EB", "8BAD"
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
@@ -68,6 +71,14 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
 	"8607", "8746", "8747", "8749", "874A", "8748"
 };
 
+/* DMI board names of Omen laptops that have a thermal profile timer which will
+ * cause the embedded controller to set the thermal profile back to
+ * "balanced" when reaching zero.
+ */
+static const char * const omen_timed_thermal_profile_boards[] = {
+	"8BAD"
+};
+
 /* DMI Board names of Victus laptops */
 static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
@@ -184,6 +194,12 @@ enum hp_thermal_profile_omen_v1 {
 	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
 };
 
+enum hp_thermal_profile_omen_flags {
+	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
+	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
+	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
+};
+
 enum hp_thermal_profile_victus {
 	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
 	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
@@ -451,7 +467,11 @@ static int hp_wmi_get_tablet_mode(void)
 
 static int omen_thermal_profile_set(int mode)
 {
-	char buffer[2] = {0, mode};
+	/* The Omen Control Center actively sets the first byte of the buffer to
+	 * 255, so let's mimic this behaviour to be as close as possible to
+	 * the original software.
+	 */
+	char buffer[2] = {-1, mode};
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
@@ -1203,6 +1221,28 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static bool has_omen_thermal_profile_ec_timer(void)
+{
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	return match_string(omen_timed_thermal_profile_boards,
+			    ARRAY_SIZE(omen_timed_thermal_profile_boards),
+			    board_name) >= 0;
+}
+
+inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
+{
+	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
+}
+
+inline int omen_thermal_profile_ec_timer_set(char value)
+{
+	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
+}
+
 static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 				     enum platform_profile_option profile)
 {
@@ -1240,6 +1280,24 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 	if (err < 0)
 		return err;
 
+	if (has_omen_thermal_profile_ec_timer()) {
+		err = omen_thermal_profile_ec_timer_set(0);
+		if (err < 0)
+			return err;
+
+		enum hp_thermal_profile_omen_flags flags;
+
+		if (profile == PLATFORM_PROFILE_PERFORMANCE)
+			flags = HP_OMEN_EC_FLAGS_NOTIMER |
+				HP_OMEN_EC_FLAGS_TURBO;
+		else
+			flags = 0;
+
+		err = omen_thermal_profile_ec_flags_set(flags);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

