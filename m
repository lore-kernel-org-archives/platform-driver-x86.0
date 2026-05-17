Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A877262B;
	Sun, 17 May 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779022302; cv=none; b=MkPnj3iW8JSM32/u24cBAWnBYLR3lna1D4NlDSzhHKS6l3yO93DcfSRJ9SyDdy+XL0e8AZmmBg7Ed1z0eWu+iiChuflcyywopHJmYsFCuVir9RyH6HtgUtcVshaGi8xNxwY6aO3N0r6/IHCKsuEXW4CGHUTzk88mp0SqhsRroLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779022302; c=relaxed/simple;
	bh=nXYWW5Q1A3sV3zjqe/h9sACLPx+YmeEirIWWLGy8RaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5XbFyUq8rHwskAF8YbK7W9fqsEsAxLqm9kDDS9RfM6AJdSl2OivfYTHKsdVVvaV2xZU4/OTlqxZRsUDFQnAetEuVvjUxPj0/yfNdsUMe3wDkcqfdPaM2jnPdpFRXrYvzAiZOIFPfHyGEkryNLtFGJbXmT0C5CLfmv2B4xiOtWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pablofraile.net; spf=pass smtp.mailfrom=pablofraile.net; dkim=pass (2048-bit key) header.d=pablofraile.net header.i=@pablofraile.net header.b=hLDie8Ur; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pablofraile.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pablofraile.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pablofraile.net header.i=@pablofraile.net header.b="hLDie8Ur"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gJLRB3s2Jz9vSB;
	Sun, 17 May 2026 14:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pablofraile.net;
	s=MBO0001; t=1779022294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yxh1pR94ma69CjyV6FMZG/XPD1sAHJf89IYUR4mVuwk=;
	b=hLDie8UrMPZADtafzM+b0ApMHEDhDdG8U7SYzzrT3HHk2pbQaX7dUhGOlPCd0eNTAodJuR
	ps8Ooa7xxEA5pT0AMQYPdndFeFPzHjIQRg0DJILsOlCMKpcIcbH7yZYGBu0LrL4whg77Kh
	opAnSCZWsIZJjbgjd/ICKstGluHhhs+aTpZKwvY1tB5JNxY52qj7TB4emEFwawuplYrmBF
	CYNxqOjaI5KLT6D/v2sDac+keicO9H8f3qRDrGG+CV16P7vrpdwpvKRxX6/FRIaBQ11pns
	+rUBqFmKmR1aggpKW4y4d1kRy39743n5WCBW/7BT+wMf1l+g4u2hp9Rh0eE/8Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of pablo@pablofraile.net designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=pablo@pablofraile.net
From: Pablo Fraile Alonso <pablo@pablofraile.net>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	emreleno@gmail.com,
	edip@medip.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pablo Fraile Alonso <pablo@pablofraile.net>
Subject: [PATCH] platform/x86: hp-wmi: Do not warn when probing zero insize support
Date: Sun, 17 May 2026 14:50:49 +0200
Message-ID: <20260517125049.8060-1-pablo@pablofraile.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4gJLRB3s2Jz9vSB

Some HP BIOS versions return an error for the query used to determine
whether zero input size must be used. This error is expected in that
case and is used as the indication that zero_insize_support should be
enabled.

Do not log a warning for this expected error path.

Signed-off-by: Pablo Fraile Alonso <pablo@pablofraile.net>
---
 drivers/platform/x86/hp/hp-wmi.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d176c..20756251d8e5 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -59,8 +59,6 @@ enum hp_ec_offsets {
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
 
-#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
-
 enum hp_thermal_profile_omen_v0 {
 	HP_OMEN_V0_THERMAL_PROFILE_DEFAULT		= 0x00,
 	HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE		= 0x01,
@@ -439,7 +437,6 @@ static struct device *platform_profile_device;
 static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
-static bool zero_insize_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -454,6 +451,28 @@ struct rfkill2_device {
 static int rfkill2_count;
 static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
 
+/*
+ * Before zero_insize_support is known, HPWMI_RET_INVALID_PARAMETERS
+ * indicates that the firmware expects zero input size.
+ */
+
+enum zero_insize_status {
+	ZERO_INSIZE_UNSUPPORTED,
+	ZERO_INSIZE_SUPPORTED,
+	ZERO_INSIZE_UNKNOWN,
+};
+
+static enum zero_insize_status zero_insize_status = ZERO_INSIZE_UNKNOWN;
+
+#define zero_if_sup(tmp) \
+	(zero_insize_status == ZERO_INSIZE_SUPPORTED ? 0 : sizeof(tmp))
+
+static inline bool hp_wmi_is_zero_insize_probe_error(int return_value)
+{
+	return zero_insize_status == ZERO_INSIZE_UNKNOWN &&
+	       return_value == HPWMI_RET_INVALID_PARAMETERS;
+}
+
 /*
  * Chassis Types values were obtained from SMBIOS reference
  * specification version 3.00. A complete list of system enclosures
@@ -607,7 +626,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	if (ret) {
 		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
-		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
+		    ret != HPWMI_RET_UNKNOWN_CMDTYPE &&
+		    !hp_wmi_is_zero_insize_probe_error(ret))
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
 		goto out_free;
 	}
@@ -2708,7 +2728,9 @@ static int __init hp_wmi_init(void)
 
 	if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
 				 sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
-		zero_insize_support = true;
+		zero_insize_status = ZERO_INSIZE_SUPPORTED;
+	else
+		zero_insize_status = ZERO_INSIZE_UNSUPPORTED;
 
 	if (event_capable) {
 		err = hp_wmi_input_setup();
-- 
2.53.0

