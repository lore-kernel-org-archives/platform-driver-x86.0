Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447992;
	b=VDr5YNYW9ZzJN8vFQpzLdipxkyGEaWDEMWbHl0hnseEj6j4pNL6v/ud+GO1ucI6Li3Dt
	 BMWTJabPs1VEE4pRGP/9H0apvxl/PuJNOjYoebdQcRlfm9bIfHK9gwHizxc/+VHl3FPjH
	 oDHH3EsdJyK1wUN2THc0uQW2ko26TgoEMAonYA8XXn5IiOUqBG1UQV+smo+vNyVpBxmFS
	 lLin0u1Kfsg2F9pdOqE+VG59/eyiTuxGdSK/CbwwCGI+lbFD0a3qzOJI12Sgt59OHgGB2
	 y07aRSrWpFkDlnJgdiUpVZe1i07sdAR/WlkbTO0Z5hXsBgABYEqNmoIh177lyaAtw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipIK7sVjw5HFO+rITfLdlmyImTHYjd1/xZQ8o7M7p5g=;
	b=UJQ5z+D5mQT47fwmmdVoGrVYqhw1YvZwHXaCTo+CjhifluJznJryGtUS6Nw1Zu5axaoD
	 OWjS2fbZDPsYSfNI+jRWrnXsyieIfdJX/syuB8sHHCL8Quv7qhH3rxuksySbAg/3q1kdL
	 UutjAACmU8imfAvr7GP2/ilM8US3BLsgvbXRqPJUgCzH9TEmvxXDcr6a/UEhuU+JP1868
	 VNdmpKmENhTLqprZnAILr30eaJCgEi9uVqaO1dOkovS9PK9iP00vuy2Lo1DEOM1DCqLwS
	 b1bzFO6WHqjLDowpuGsWFs5vWVknCvRqEn9HX06X5ESZ8txpAnIYBA8b1i9CP8Rqb0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXtVyhUO;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB049606A32A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 15:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB049606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXtVyhUO
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b546061d58so7588906c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447991; x=1796052791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipIK7sVjw5HFO+rITfLdlmyImTHYjd1/xZQ8o7M7p5g=;
        b=RXtVyhUOdOo9t65ynoQFDJgTSUThZ5zeGSC5PI/g5g+aRMOLtSX1WpNLxOMyvkmAD3
         ZkM2iTmg9jY3Ug5GT6BYez4T5UKvRnIQXm5fQ+gZIRbm6ZtLtzRW3WLBabv39PnmJ3rt
         CTaXr2QIykD3A7e/VoifJgbVOn0ENaFSMa6SIsBGE/kNUpq6O0Kk0XySAbGhehQCQfRL
         VsIjfd/1PQ3MCbGcDNV/n/Em9TsPTEnQY1C7nbCMhTj1k24W+PVKNyZaxjIOVPWl++ew
         jjetNn5/3Is8ByxMJOX1jEuRET8QypyVoBGWgdC1Wv20hPX9WdbmASP9c6Aik7/eJMIG
         guTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447991; x=1796052791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipIK7sVjw5HFO+rITfLdlmyImTHYjd1/xZQ8o7M7p5g=;
        b=Pyx/2oqUOh+EmfwpQH8IoJ7YZrQr5pZZ5/s03A1NJBAmmofhiEsTGT35DHlg5PE4zm
         jcYuvOVgVkzHxsMsv5f+DuKjeuHMD6tEURTl2kQBlVe6OGXK3EcvXcVQEPLVJ411dh7R
         VtGkDtZA2b15nEUIGcouolIFqUhORiBZnjd30e9KMIgxlvtGX1WL1LOrS3Geb2OLQEP0
         M8iikU/C/nQy5ZSgBGUkva+/Olnu/p3xg5DENf9doky7qsua89jTc4l8DemR1u0ZhC6v
         iZtlLoC89lGkze5RYgYPc9nXNe5eLS5gCQxOvBUrn8wWsR7rViF226qmQBKLtix9A+wO
         P2HQ==
X-Forwarded-Encrypted: i=1; AL+hErEWraPgmZg+O04LM8JMM4km/7C1N8xwGPrcL8I0kgLZZXwQkgjXzzMJdOsNyAgQZQ68lyhcjeDSM6yfmShQgHmVu6Uw@vger.kernel.org
X-Gm-Message-State: APuU4Z+LkdwT9G61+Mr3meMW/hPY/V7xR3cmhRBKsvlN6AdJQCec8IhN
	w9wV5pLEzjKn4dTGm+O1laGK1zZCB/V1dbKzByFNJXg8v1rWWHurMyDa
X-Gm-Gg: AZFdTZcnPDlEDoI7ExaeZMEXDSHod0wfYEXpGCkyiC5a7XjPvm0aSLquivCInqHZUdK
	BwINC8FKDLp3DhLhOqdyppXiDnE18sZ+qssT2tc5kBUKNF5F9Kj0In/+92E41EPaTy60i4T8FN+
	zAovadb2Gda0CJLB6fhls1qc5DNx88QFooXWN9Hq3c9/Eq3NXTR1sFL4xM1/FNGwjGFSG8ddskq
	spFJrAYAlfe7vnME9qr1V/jSWodQKEa+qjA0xm/UIwIyu9JGOFcAwoOnqdJXYt2+USvv0rVTHwJ
	MJ7FTVtXpkuOYUPcbVuDXTRSm4WC3VSOISrFTSpHJGDl8gkzIrEx4/4xvDs2JdQ/7Ii15BGjuds
	2/yp6CrIIEfdrMWGKHrUgiKi11QjQt8V8Oq5Hruk9Zhwp49wfRdaVEWZbvqY6wmiy0xLLyCxC9C
	piHCsjtY081C2gT9eS7wzWj6laqCPuBbgHPXLN8uOr3WPD629rR7nVJR7C4LbBjxPvuS3Iq4PkF
	okLSRCndGfsFwxznYue5lWt3bNDdY+AslKlp58qSLtq4j5tqnrLyN5B35C/AB+3Ddw1RTj6OhTJ
	Ql4H9aachoSuE7nUk14pVWIGJeElogsFP3IERRyQds/yvSZdFrmbdw==
X-Received: by 2002:a05:701b:4308:b0:165:aced:1fde with SMTP id a92af1059eb24-1b56f87a910mr4332174c88.0.1795447990101;
        Mon, 23 Nov 2026 07:33:10 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:122d:3887:9ee5:1e78:760d:3a39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34587395eec.16.2026.11.23.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:09 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/2] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Mon, 23 Nov 2026 20:59:16 +0530
Message-ID: <20261123152917.14260-2-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123152917.14260-1-nonameblank007@gmail.com>
References: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
 <20261123152917.14260-1-nonameblank007@gmail.com>
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

Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af86800e..0166b9cc4d9e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -125,6 +125,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_ec_thermal_params = {
+	.performance	= HP_VICTUS_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_THERMAL_PROFILE_QUIET,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -168,6 +175,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
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
@@ -251,7 +263,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
@@ -2395,10 +2407,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * but logically it should have tp == 0x30 || tp == 0x31, as
 	 * corrected by the Omen Gaming Hub on windows. Hence accept both
 	 * of these values.
+	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
+	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == victus_s_ec_thermal_params.low_power) {
+		*profile = PLATFORM_PROFILE_LOW_POWER;
 	} else if (tp == victus_s_thermal_params.balanced ||
 		   tp == omen_v1_thermal_params.balanced) {
 		/*
-- 
2.55.0

