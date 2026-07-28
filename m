Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD28F355048;
	Tue, 28 Jul 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261235; cv=none; b=S48M5/XyUmyM7GCKRKdAe5hH1vIRRKdi5tbqqtHmUJtAcvLGQjvRjHhRZLGsFyuHCVW2x+nPB2zuHHinOQbVhZdJdPU8AhYJW1ChCDiMrfy+5Q7cR1E6pq1Bygp+Ye6OOPe8jeaCuFwuDojwok/uBA6OwdrP9+1qpXti6pMWjVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261235; c=relaxed/simple;
	bh=TWdb7M1Upqn9UrehERBTUCkV0cLL1dhA1cXebKZ5Qro=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VpemE0G6Hq08Ky7jSQd8MNuIPpG2N4gnAp5nVrTzlMn5prvvhkNTydlmVBao7El3n/SwNzNZobPJX0wHPUwyHuS1/I2EjYVgQ0T2fpwss4l8m5MZPW5ULkwwU/RmZb959kDrIYz1s4fwQjUDqWoDWQEJALLOg9WeA12XHhKOFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=vYZlC6ZV; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="vYZlC6ZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1785261226;
	bh=jGk1hD3c3L6re9ew4aK9A96PMeKfpv2VXX1HXi5Xf+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vYZlC6ZVKPd2T8hCfnZt7ccKRaZfaI1BHVF8hllJsTm8b2oO2w9YK3G2B+BYwDGO9
	 BZ35BbpG4SbIvUG/xTr/G5FFUey46k/3DVdsDDKvdT02lT/F32eE/6yMdn/unzNZyf
	 kZG1PEtnxbxnmQaf8K2Sb6jgoUyKP83WLG8dcPwI=
Received: from max-laptop-cachy ([240e:3a1:20e0:1ea0:2fa7:34d4:60dc:c367])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D6A85AE0; Wed, 29 Jul 2026 01:53:42 +0800
X-QQ-mid: xmsmtpt1785261225t1z6ne510
Message-ID: <tencent_5C7132ABFCF9E9800C642850550B68FD1208@qq.com>
X-QQ-XMAILINFO: NdJjTjI40ejM5IPcljqHsXzbN6CiC5I0D2rjuPl8JSI6+kkhiZMcSwhplmPHn4
	 ZHwPLUOXHngZqdvmyohzwE0N6dqT6ktjAMeS/cQTFTuL0Yxy6X+xaqgQ7j8E/xKeHmQlnq3yUBOD
	 eBIxDkxybOMk/IpgnNTMI9QOY6O9UZdib73WJkWffC+7m5Hg9NIjwa+2kU/7gUTUneQnuJ/WTHrU
	 tKqU4BGsQPB3ZZFmxhgWFeryIFmQE8T53PWnWLQdiaMoWHGHgYJaBrLpjmCaO0QSdg8dcp3AT8cf
	 UDEFBCxqEfzBYwtYuGgdk46C1yEZRVB8ruA2sDyPd4FHRuxaZCEqxgpWHd+vE+FByUtG6nSmcK31
	 5jQn7reUYh15tMHNeLzNEpmen8FdESjJSDhwreq6gQLtRhQru6C7HaXsDSSdpcaQ+ZGGq5nxqQqx
	 bLYVqQrupU3oCxbmglAH3RKsEE4LwaHsoD5qmD+nIA+0zsot0ZGDlI/5K4XWnw2qHYyd/t1Wiqrd
	 zKZOnncLQMyqeQotMwxXjjcL9pWcjBlFycJzL1YJQIjIfGifprRiXGSOLCSuQe50S509GGYE+3Fh
	 hohtNhGYtXO8F40HdCG4HIEYIiwx1W/ARW+omRua0Wb9jbqsQN9nOYyW3frxhHtMiJmaT+5DjgbL
	 f/rqYMsbwaVhJZLHEiHDalFp7imGk2fQF54ccdDGM5pUmWHXNbFYDpsPFPNKPqWCNHpF/+bis+HY
	 L6vFazDeSRz8Tynwzz3ZwqM4pR2HvqBRlMj8I/kqfWicB3Pr7hjrm/dGnggtPLwHo4WcWbY/f18r
	 UwpYjOYGtYW4+7SD2989oeou2IFaJHow6OaZSU+i4t19bQWnW/NWtvzcsuTsDDEa/oZMHDlcs6TD
	 vENmQxvlibirxSy1q8vRGKAf7c/tDr3T8NFeTEebRbgF8hOMUwSz53/2GS7c6PwCT3pZHi/pMvOW
	 dl+VGnKk8wiOXnD+13L0pPT2wbBjc0q6VUW0LVpuItK9KUNhcndZZMa0y79QCJbtDDOZI0QxWWBp
	 HsJym1IGbqqSZHsL6eLI0pbEBJ1+UmEMeScYBWbab9cAFGIZr6bD/aUruaKi6E/kFYhzXCBQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: wolf109909 <wolf109909@foxmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Yuming Sun <wolf109909@foxmail.com>
Subject: [PATCH 2/5] platform/x86: bitland-mifs-wmi: support MIFS v2 perf-mode mapping
Date: Wed, 29 Jul 2026 01:53:38 +0800
X-OQ-MSGID: <20260728175341.45927-3-wolf109909@foxmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728175341.45927-1-wolf109909@foxmail.com>
References: <20260728175341.45927-1-wolf109909@foxmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuming Sun <wolf109909@foxmail.com>

The MIFS v2 firmware found on e.g. the Xiaomi Book Pro 14 2026 (Intel
Panther Lake, SSDT device "WMID" with _UID "MIFS") implements only a
reduced WMAA command set and reports the performance mode as raw QFAN
embedded-controller codes { 2, 3, 4, 9, 10 } instead of the v1 0..3
enumeration. With the v1 mapping, profile_get() returns -EINVAL for
most firmware states ("platform_profile: Failed to get profile for
handler bitland-mifs-wmi", also reported on REDMI Book Pro 14 2025)
and profile_set() writes values the firmware treats as no-ops, so
power-profiles-daemon can neither read nor switch the profile;
selecting "performance" fails outright and wedges the daemon.

Detect the variant at probe time by querying the current mode: values
outside the v1 enumeration mean v2 firmware. Map the v2 codes to
platform profiles (2=quiet, 3=balanced, 4=speed, 9/10=extreme) and
skip the v1-only AC-type capability probe, which does not exist on v2
and now fails the call after the status-word check.

Values verified against the laptop's SSDT WMAA method and by observing
the EC QFAN register while switching modes.

Signed-off-by: Yuming Sun <wolf109909@foxmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 79 +++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 12426d11..342dd7e1 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -73,6 +73,21 @@ enum bitland_mifs_power_profile {
 	WMI_PP_FULL_SPEED	= 3,
 };
 
+/*
+ * MIFS v2 firmware (e.g. Xiaomi Book Pro 14 2026, SSDT "WMID" with UID
+ * "MIFS") implements a reduced WMAA command set (only function groups
+ * 0x0800/0x0a00/0x0c00/0x1000) and reports the performance mode as raw
+ * QFAN EC codes instead of the v1 0..3 enumeration. Codes 9 and 10 are
+ * the SMM-backed "extreme" modes.
+ */
+enum bitland_mifs_v2_power_profile {
+	WMI_V2_PP_QUIET		= 2,
+	WMI_V2_PP_BALANCED	= 3,
+	WMI_V2_PP_SPEED		= 4,
+	WMI_V2_PP_EXTREME	= 9,
+	WMI_V2_PP_EXTREME2	= 10,
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_RESERVED_1		= 1,
 	WMI_EVENT_RESERVED_2		= 2,
@@ -172,6 +187,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	enum platform_profile_option saved_profile;
 	bool profile_valid;
+	bool is_v2;	/* MIFS v2 firmware: QFAN perf-mode codes */
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -217,6 +233,27 @@ static int laptop_profile_get(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (data->is_v2) {
+		switch (result.data[0]) {
+		case WMI_V2_PP_QUIET:
+			*profile = PLATFORM_PROFILE_LOW_POWER;
+			break;
+		case WMI_V2_PP_BALANCED:
+			*profile = PLATFORM_PROFILE_BALANCED;
+			break;
+		case WMI_V2_PP_SPEED:
+			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+			break;
+		case WMI_V2_PP_EXTREME:
+		case WMI_V2_PP_EXTREME2:
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		default:
+			return -EINVAL;
+		}
+		return 0;
+	}
+
 	switch (result.data[0]) {
 	case WMI_PP_BALANCED:
 		*profile = PLATFORM_PROFILE_BALANCED;
@@ -272,6 +309,28 @@ static int laptop_profile_set(struct device *dev,
 	int ret;
 	u8 val;
 
+	if (data->is_v2) {
+		switch (profile) {
+		case PLATFORM_PROFILE_LOW_POWER:
+			val = WMI_V2_PP_QUIET;
+			break;
+		case PLATFORM_PROFILE_BALANCED:
+			val = WMI_V2_PP_BALANCED;
+			break;
+		case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+			val = WMI_V2_PP_SPEED;
+			break;
+		case PLATFORM_PROFILE_PERFORMANCE:
+			val = WMI_V2_PP_EXTREME;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		input.payload[0] = val;
+
+		return bitland_mifs_wmi_call(data, &input, NULL);
+	}
+
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
 		val = WMI_PP_QUIET;
@@ -705,6 +764,26 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	if (dev_type == BITLAND_WMI_CONTROL) {
+		/*
+		 * Firmware variant detection: v1 firmware reports the perf mode
+		 * as 0..3 (enum bitland_mifs_power_profile); anything else means
+		 * the reduced MIFS v2 command set with raw QFAN codes.
+		 */
+		struct bitland_mifs_input probe_in = {
+			.operation = WMI_METHOD_GET,
+			.function = WMI_FN_SYSTEM_PER_MODE,
+		};
+		struct bitland_mifs_output probe_out;
+
+		if (!bitland_mifs_wmi_call(drv_data, &probe_in, &probe_out) &&
+		    probe_out.data[0] > WMI_PP_FULL_SPEED) {
+			drv_data->is_v2 = true;
+			dev_info(&wdev->dev,
+				 "MIFS v2 firmware detected (QFAN mode codes)\n");
+		}
+	}
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
-- 
2.55.0

