Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794452067;
	b=fopBw2yomCS3NfnhrncK9AV4rb3kPcnhpn4PU+pdN5q4uVerkchfg1F219QsoAD+lLlP
	 vIm/CK8jfeYhQCdvGO/vNiKcqxsLjundgLC8sZc1PnQsRxKRhTRk6Q7betLaDaBmz0FiK
	 5N1eGD6Ab+oVA9ZNiujhMwOaVvE/eKw5Dq6kFJVX2a8b9BjPQdJqpo0O4SNILdK62XdBj
	 nYh+vBmFeNZ5OOkBzVSpaP6UXeJ/GncJzhxwYRC4WKfmAnEGW7WCSODazqytMpXyyWuEY
	 KOnj+3dI+qGaQaHE1UpOOusBquHVxKD7x6oHO5cj1o1N1TkDoU8O5rDxN5H58F7qUjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452067;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z1jAIYP+Wr2EW8xgLKHIaFDjAF0pmE7ONPONprFTvSY=;
	b=5H11U7fR5w6zEqTiBOSCxKxiwnDK2ydHgo5KNVze7yPKqQCq4YLuWq4b06fmSj3Nxkqy
	 3fhwv1lXT2sStqSRv6ZwQpCI/HCSZWKVvCehXXNTyznLqXJZt+KiM5FeYIIsVrh28jRyk
	 ZYpFNQ2D8MTJ90qarWRRNndoZ3qWpMH4Ju5DfZAxNs74JEZEHvwikYClAPLysa+RiHWzC
	 c4ooTMZi0QHoyulT2YHm8WsxlfTzv/tJ0LytKZO+aoUBEEqcSFhgYX1bnnWPwAYqiU6OR
	 B8EUSuoXAV30BR6om+3EZ+xaSjwsJLrNs4yXuAAV3VCkKwHYuVpRFBxfrCMs8Pau5rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSwy6s0d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAF606A32E;
	Thu, 12 Nov 2026 02:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSwy6s0d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794452067;
	b=t5A4yoTDr9t2/kVMyMgp91SM6Wlfa/zrvaN71laoIalKyDggGQSwNhPV8wrgfQzhvK4G
	 dOm9SXlUwXbc6yisYS3U6HMtaRC+cX6R/H9F0mWDwrzuSUoMiArJkektIVUDWW3u/TEG0
	 HkRpe15G5clfc4nmO4C5MdGdyN0wuqdv1z+NfuHmc34fjksa4gAPYr34pk5X4kHFUJ9iD
	 DWMzvEtZ0EAbZ/WkFf2W4KycZztjQ5vpTc6TyIE3HAZi82Q0sJhi2mriLpSE6nyIZzNHG
	 IgzeCCVx1hqgBq+F8djn8IcSVIdhP222LUYGUWIjLllU9cf0QGdu5L8H9C2Jkxgz7ew==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794452067;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z1jAIYP+Wr2EW8xgLKHIaFDjAF0pmE7ONPONprFTvSY=;
	b=dAwLlf6l61BhKyHxaVIRcng0r1a1tCGf6f7Gc7krD3NQZwRelnbk+KH8KIt8QYKNuh9g
	 k7y/zyUDS1TsP1FD+RvWJxn2RRvoJ7lBVPREYiAgV5oVJ+EJvNbAS9OWPUcQdh/kEIc73
	 lpRZwis2zol9BPCRoFAFUs8rERh33hhu3hGcl+3oBqYWVK0Q6zGk2vaK5/S/1fIzXDhpF
	 X00LbZDi8zmmuRfeXZJUpFPyPHCAyKBsuT5foauPpXdaLst1dLiEAbi7peY2H02F1HGA8
	 TNH33sBlI5GAv5PubnWORZkF1/XLq+XgmX8TfL8iVnMfEUtSS+AUBzHAg3CaXVeBalw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7C241F00A07;
	Thu, 12 Nov 2026 02:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794452067;
	bh=z1jAIYP+Wr2EW8xgLKHIaFDjAF0pmE7ONPONprFTvSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dSwy6s0dUeua5nl9RCL6DYPmIurRKwL0JexShboLr9U/kivqLgjt3HvjoEFRFLvQp
	 /O1YqU0c+PciVAKAYGAZKhxfeVB57psfxAwL2E1K1Rk1ko/tnwavRKMAg968m5h1eh
	 LG2t0q5arDt+1OtFblBdmsV+P3rZKmjDM7w3CRb4xNa5zXvT0K9vUSY5KtrSxxyLL+
	 U4YH4D/p0Q/PTHKr5HpPIM8iLYh4l1cSUyUlnzqnxZKfS8CebTsozbxoKzu0eSpw2N
	 5sGxUSMaXBFWAI2kY4eyfzZpyW0nD34VtQlnKxYP975cbTwV5dN2XImgdbBD89enLq
	 lp2KeeIurJdJA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 569F64923C;
	Thu, 12 Nov 2026 02:54:26 +0000 (UTC)
From: Samuel Wheeler via B4 Relay <devnull+swheel33.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 21:54:27 -0500
Subject: [PATCH 2/2] platform/x86: hp-wmi: Add charge_behaviour quirk for
 OmniBook Ultra 14
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-omnibook-8eb4-v1-2-3127f45cc338@gmail.com>
References: <20261111-omnibook-8eb4-v1-0-3127f45cc338@gmail.com>
In-Reply-To: <20261111-omnibook-8eb4-v1-0-3127f45cc338@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shang En Sim <sim@shangen.org>, Samuel Wheeler <swheel33@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794452066; l=1792;
 i=swheel33@gmail.com; s=20261112; h=from:subject:message-id;
 bh=3rQb4zPlj81vHDH6Pp13jpcbbVrpCBIEniSdrYQoMtg=;
 b=PruIecKRs9hMdB5lPPcLRHS//QndOA5nh3ZOQuca7TklY/SWlW4q67BbEKQ23VkKn0OJMBMLK
 TDxpOa5VSJcB+ITfWLrSm0ok57jjCUkpJFmJKkkqeBpiLWF6F42kkj1
X-Developer-Key: i=swheel33@gmail.com; a=ed25519;
 pk=cokeT6B31W84o+Gc4wuP2okLF8wShbbGQ7pb5h5JPXg=
X-Endpoint-Received: by B4 Relay for swheel33@gmail.com/20261112 with
 auth_id=1494
X-Original-From: Samuel Wheeler <swheel33@gmail.com>
Reply-To: swheel33@gmail.com
Content-Transfer-Encoding: 7bit

From: Samuel Wheeler <swheel33@gmail.com>

The HP OmniBook Ultra Laptop 14-kd0xxx (board 8EB4) implements the same
battery charge mode interface as the Spectre x360 boards supported since
commit 929433336e0a ("platform/x86: hp-wmi: add charge_behaviour support
for Spectre 8C15/8C17").

Reading HPWMI_BATTERY_CHARGE_MODE returns the mode in byte 0
(00 ff 01 ff with automatic charging). The write handler (SBCC in the
SSDT that defines \_SB.WMID) takes the mode from byte 1, accepts values
0-7 and passes it to EC command 0xbb. That matches the layout the driver
already uses.

Add the board to hp_wmi_charge_control_quirks.

Tested on the OmniBook Ultra 14-kd0xxx (BIOS F.06) with AC connected:
writing inhibit-charge to charge_behaviour changes the battery status to
"Not charging" with zero current, and writing auto resumes charging.
force-discharge was not tested.

This patch was prepared with an AI coding assistant (Claude, by
Anthropic). It read the firmware's WMI methods, wrote the change and this
description, and ran the tests on my laptop under my direction. I
reviewed the change and the test results.

Signed-off-by: Samuel Wheeler <swheel33@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 46c9a5a532ba..bf68a1c46c03 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -634,6 +634,13 @@ static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "8C15"),
 		},
 	},
+	{
+		/* HP OmniBook Ultra Laptop 14-kd0xxx */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8EB4"),
+		},
+	},
 	{}
 };
 #endif

-- 
2.56.0


