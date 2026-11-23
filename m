Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449400;
	b=HFMDBwg5Uug67mWO4LER2OjIORYbtT8hzqfos0rj58MTKejQwTsdmWG/O5zenGkgRB+L
	 /txfrHBMvizOs8wnWHkNFkS6tme54MT0EJAiTRhPAATNWt/YwmX50uWqIWUR9BFDQYrOf
	 l5CSjDfp7V6CGVv9LFkB3+drWgqwHqraJX2N/E1qH7h7yxGIolE78dm1BTy6LHy7OgRRM
	 f8COv2Ft11LoCoDNWMlzcrW5whhlmpdr8y3F5ENBI/ZBuF7JT8keXPw/tgYa7q4EzlJeG
	 Q2+mIn5G++0ebJhoVAXli5JwkHC8mgDikkpJAAKmzCdo1BBE0WS20x8x6gF8Kpx8ltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0adq+ONEx57ZnjGJpUn15eG9GXBluRIJ1TKsnKAxL6g=;
	b=wwgZ01Yl8rbwCM2TwGYfwRTX3i70Uhc+yn7ZybdeslbLHZ1p+OXFisDbwA2NCZd6nmPg
	 guUbVKcRWrD+47EQCc4viRie0f/F5EceyAINC9ZxDo8Mm+k3Z6T/9XBCjhQ/dl2W4XGDK
	 R+Xh3a9tPc0UQsoTyR7B9dO3uC5B1RN/rF9KgPq9NPLXXY/b4+jgMqIqPczE4Fj5aIREG
	 EMxNoP7VBXJLoV6oFOrJ1Eywdy2ofpHjwXWa2QoADPYZV2X0Yr7btnAH/fJn9uor9SCfU
	 41bvbzpZwVgw/MDHV1iIaVZ+8I8iPFQt4f4nVLNv6+W33IvNq8QX//fOmj2FMYbKtGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfaMmF+3;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6652606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 15:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6652606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfaMmF+3
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1535352b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449399; x=1796054199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0adq+ONEx57ZnjGJpUn15eG9GXBluRIJ1TKsnKAxL6g=;
        b=XfaMmF+3GczxEPxS5wyKLu2GejTMGopazkvZLfsBtlVuERhGb883LWYIRrL7dgwwE1
         o8SPrIaaDwDJVl8wjvRpSx4QBGpLmUEVtADGX0klz0qK/6cUyOaLENQePCjJFSQCRkv4
         NErIpQsBRH6OHbR96XvwLPgbdJaE369sYHf2TGE6QvfH0+3m0P/a/uXlnW7EVThiLxFY
         WYZ0zG4gTTUPClmUlKjrd4wa31Z3qXI+2iYilLhp3hbFvjj88lqfvnm84SWc4CYjBGOZ
         p9EDz5+XWqzd3b+j+sguM7wCmWuRghtyzE1As652BUg8RtM7Car+IHnxohuwdJKnCKnV
         L7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449399; x=1796054199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0adq+ONEx57ZnjGJpUn15eG9GXBluRIJ1TKsnKAxL6g=;
        b=BdydA87oYLlHZpLFa5aepDTfxYaS/p6JysW4ndBg+VJ58jSZ+iyuRtxIFYCrmzK+eq
         pAfb7bJ2eq7loL7t3R+8OAaQwgUAIrjAAV7altmB1Q/oetAk0TyN6EW3sucGmIdK9/ZK
         5zmBphPnd0NURRO+Qcb9pIEC/DjHAqReQ8VZ4WfY1Xm8mi/hCAy0bzVVvMiDPbMMxMVr
         /z3rQIzMckLQTCKnADIPRxSe6oQA09qQ22XJaIpP+0Z+all5MgIMFOXxh0c2Z+nRG7Hv
         buANcoW5FBxfEm8U0GCG0PnTtGKdA5VDQn8dBEv4ToRSp6/S2/H86t7xXaq4SY8HaD6C
         Jy4w==
X-Forwarded-Encrypted: i=1; AL+hErFGYhn5phgIRvwSWK87vVe4cA10kwGgYB/+uVM7jLs6HfaRGww+p3X9/FlRHaWKpmq8tDoDmZL7R7FDiDTGahfPvfVz@vger.kernel.org
X-Gm-Message-State: APuU4Z9h3zmj8uzwl7USATazKZzLdeeAoEQ/SLi3jFwsHh/CcA0G6smr
	xV1TxIkcMySzxCB5c/vqXFILLn3xWi0AUG/PYSb+xdcq+UVsSXb9qMd7pIRt8w==
X-Gm-Gg: AZFdTZcadktkQR/oukke9fgpbdNxrN57XK/b5lx+1eDfJUFk6DG8KRz2QLvnkbxzvKK
	hJ0hKurspSssI6MGLwucOiVq65cp9usR9aGCqw+Ks0DP9WzgWXkQqAhRIj6SLKjtNYDD0DHbXla
	ECtOIsFmeiluiVSUoyeORhcZM+KdPaf+wmJz/6ufrzhCRktIVekzOcrMxRhwLasytdeo6DObkuQ
	TeAKSzXruYY2kFLeA73BwiFV8T3iYSEbPdA1Egr2obsPCIGL/0nptb02ckrq01YQ0Oi1Sr965jq
	Mjvns8e7QqdHd/NzThL3N/miqRfSumMxBZXSGKe9AXxSjPzMMpHD6S9CE6o2/r9ug0D/z38hvLI
	04AGSzeeli18aAMb73XnBnkCMLQFS28aV1hHStfpxpi550OKfxofiX2TazRPabJt6t7hEeXyofJ
	hHFyxK6gIN9F9tabng52+xJGBrxCGhoF9bXlX0l4WbHHBQUhCfT3uMcYH4bpgQO8SfT+Vw/1yRL
	qTfBEzvZwNBrYp0tIgouwCHRqpRrzuG3qhWOSi1kLn6yc+mDnzpdIfxR4xPBOmm6DAnQYbNGHyG
	Y3+tFcJhJ6b51eyv+Cw2
X-Received: by 2002:a05:6a00:4207:b0:88d:8074:1a7f with SMTP id d2e1a72fcca58-8c87bac53d5mr8984694b3a.12.1795449398967;
        Mon, 23 Nov 2026 07:56:38 -0800 (PST)
Received: from fedora ([103.156.164.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5851960b3a.29.2026.11.23.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:56:38 -0800 (PST)
From: Mulky Fauzan <qapkyy3@gmail.com>
To: jlee@suse.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mulky Fauzan <qapkyy3@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro ANV16-71
Date: Mon, 23 Nov 2026 22:55:20 +0700
Message-ID: <20261123155520.121595-1-qapkyy3@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add a DMI quirk for the Acer Nitro ANV16-71.

The existing acer-wmi driver supports hardware monitoring, fan
control and platform profile management on this laptop.

Enable CPU and GPU fan monitoring, PWM control, hardware
monitoring and platform profile support for this model.

Fan control testing on Acer Nitro ANV16-71:
 - Automatic mode: CPU 1796 RPM, GPU 2255 RPM.
 - Manual GPU fan test: CPU 1807 RPM, GPU 5555 RPM.
 - Manual CPU fan test: CPU 4838 RPM, GPU 2238 RPM.
Both CPU and GPU fan control channels were tested independently.

The following platform profile choices are exposed:
 - low-power, quiet, balanced, balanced-performance, and performance.
Platform profile switching was also tested successfully.

Tested on Acer Nitro ANV16-71 with Linux 7.4-rc4.

Signed-off-by: Mulky Fauzan <qapkyy3@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 60028fe9f..f9d92395e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -493,6 +493,14 @@ static struct quirk_entry quirk_acer_nitro_anv15_51 = {
 	.pwm = true,
 };
 
+static struct quirk_entry quirk_acer_nitro_anv16_71 = {
+	.cpu_fans = 1,
+	.gpu_fans = 1,
+	.hwmon = true,
+	.platform_profile = true,
+	.pwm = true,
+};
+
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
 	.turbo = true,
 	.cpu_fans = 1,
@@ -728,6 +736,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_nitro_anv15_51,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro ANV16-71",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV16-71"),
+		},
+		.driver_data = &quirk_acer_nitro_anv16_71,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",
-- 
2.56.1

