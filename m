Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721210;
	b=Wbpq6uS7FfZo1kybNi46rHxpS7wsm96CXE8wxhZi/YNfeUwY0mrVsiz+7a4r95nJvaxC
	 wnPO9S1ugBekQhgAVnHbjLcqujeoLbMu5Lfsfu4KbVbEtACjPg0uFlF2fCGlM6UJ+x2qU
	 8lTiMLPgGVqsz9QCQtZ9FB3MpuCXh2E7ciwELPbkZi62t7Xg0iSj3428/FIu5wSOHLYLp
	 6mXppp9su4BdFWXv0oi4YMMP2g5TBiChaTgrqcLzWVwVyW5cO6QbKWdwZDlBBoncO1Oua
	 kSryAmrLiIiuSResA8EwDapgkx9HNGfuOiPgg5HHftf79QfNgnoZ2PSpvhigb9hXY2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QOWQN6KK00fNNA4WnFOnqK7uxhM/XkYooxesvFiwoQo=;
	b=Ckatuh61ROfT19q+M6XObDXJzVuVGTPd4ReqtGsAHqU+fUf+bNof+ntUH6lf1T0IVJfh
	 bKlhJwzWSFh/JeEyaVeoypytxUmmARGEMcl0t+HLdrf2i1knZBu357RJGQs424g4fpJPS
	 d4LYjmfXLZbdbSTpjgBASMUz+HEDwCYgwVQnUW/Wol5ImMx32tnS13D1uWQrZBku2Lcy/
	 Y6zdvnohqfee0rs1pfJSdUNLIFOF3sLXGRHKHSU0kTejHZXZ5WEc1nKFd1qDkheDl1VuI
	 3UXa3pzsfPTTx/Kb0qE7Av7KEktpQpa34YUExCZfQWmQ5JYjl7wmaCOwDV3UcCU54Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyGZzUlA;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08C606D81B
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 15:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE08C606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyGZzUlA
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1f80b7bf6so7457025e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 07:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721208; x=1794326008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOWQN6KK00fNNA4WnFOnqK7uxhM/XkYooxesvFiwoQo=;
        b=MyGZzUlAm7mGaAffU7lQ5/xQVxY15KLM+smR4NBoA3b9fUecWINdq5vcshpM6GfHDP
         HSgOoheRqoDZqlrDML6cFrQ/aitRqflHVURMNeo9ujCgKp1PLCh7DdE0FHB3ttnVHHnC
         aSt1h/PmOWmJ8KLDGlJgoZ3d9H+yG3OH9E0kLt/A/wB5dGqMUB5XYyVTvOjuXvc5lC5W
         mv6Fu5kXB8/IpGIh5Q4icplFOTnM4IK7b7F3gAdzH2SYJ0LqC9G3v7Cprox26CTBIH8d
         uz0vXwRe6EXzrSspMTf9yG/tEquga/zO6vVBUlnRo7aKv+0BBIpCfpJd4sIIWE6hVSim
         w+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721208; x=1794326008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOWQN6KK00fNNA4WnFOnqK7uxhM/XkYooxesvFiwoQo=;
        b=qEW/5MpCCrB1PMeV2M9JPIz+ywx6uTDtuN7nxVtl7Ctf1maWp308v+B+0Z7qIZr62v
         LQUZHxBvgC2fPs/YOx/yOex+sfwlua2zXse6hp+HFuZRL3Kaeub3seqmoW4ZBCXs6cMd
         KLixuvSZTbgDUbSXtnPAijVMg+X/EyD26AEdIwNg1zuW4rJX0UVU4r1ewQAzBe8r/QV7
         yrQ7p45SJ0AsyO0qfjr0ktxYM/Y7wKvl85k9P2lYoMwLteJ/ple6k8JtYewwqoz99faT
         lygcOVrscaFcSHPrHuYKuFbO/Ob1TDxyilgfZ0tbKtBhDurpENxlN1UULqHuTFnnsBpj
         5kdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQowo9wz5unjFPHqjyQ2sNeNDinnJtdD5ZpwfugzB/QX2alcxvy6rC7hnu8cJ0Te/7ZbqaVNN8huzn8TahYyV4cPlM@vger.kernel.org
X-Gm-Message-State: APuU4Z94iybI/8ueyuVPWUFh0HZdY/OmubEv+JRJClidzgQPV3AkX6qt
	NiphlBImCXRJ27gDt2MelDV3oiGs7kwqXXwUAgEA6Vb5/ThDMAaDpxME
X-Gm-Gg: AYBFou0ECk59UMDa1jwoThZlpC0RAJHR2tQkbCUvgVXUaw+Ijj/dABdVB/I1Dbz41D6
	V7yTHpKDxNjDnHTIQnPC5u1WO1FMCUAnBjIWhJ7eqXOFNSipK0fxuxkA3SpgRWJvoJzGWoU5jTh
	DXwgTS2nmWbmNR+dDW7gR4zPF3Fp2xWSWVNh7+selL8rr9w8ljZAJ7e5JPEAFFPsHCmBH60+2h4
	CdcS/WJ76Angj144nI0s+rnYzDY8HmVRbRMUdEJ1g9yYFFwtECTdR/kcFgIeNHUlVXgVoijFzi6
	qoZJoQmrH7AiNBM7gWxr7gXpV7Qz6HH0fxXwwoTeU9V5FaHoxHP1YQJOGal3Adl9/sYElGg+YXs
	OgctQhaeQf3ZaSc2FOzqFVLCBkiWRk4G74POmqfXEtscfkMiKPW+HSfsdtN5Ku73yplSPiVhcjX
	t+1uRyy24iZFnfBoQq1P9xWFBaQJ/t8I1+XofIcaH/5U/rQ4Vc5iq1tI7O4lldv99LykYIlHlXT
	Un7nxI9ckoQwXJfP9G2mgOF1hkIHfGEaU8bLvDfCVLG/gDnQmzUAFMqF3M9g7KNMCh/gBITJKDb
	XbWGOMpRX95HSaP2blmMG3lhvyVBE8OMj/9WfmIQx6rQUf6KOIp/fyXr8ygqwOEQ9UTTEW6l
X-Received: by 2002:a05:600c:a010:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4ac166ee4d6mr304046925e9.1.1793721208244;
        Tue, 03 Nov 2026 07:53:28 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:27 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 2/3] platform/x86: amd_isp4: add the OV13B10 (OMNI13B1) board configuration
Date: Tue,  3 Nov 2026 18:53:12 +0300
Message-ID: <20261103155313.114347-3-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
References: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
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

The rear camera of the ASUS ROG Flow Z13 (GZ302EA) is an OmniVision
OV13B10 behind the AMD ISP 4.1.1, exposed in ACPI as \_SB.CAMB with
_HID "OMNI13B1". Like the OV05C10 reference platform, its ACPI device
has no resources and no endpoint graph, so add a platform
configuration with the software-node graph for it:

- I2C address 0x10, where the sensor answers on the ISP's I2C bus (the
  camera's _DSM also returns this value);
- a 24 MHz sensor clock, the rate declared for the OV05C10 reference
  platform;
- four CSI-2 lanes at 560 MHz, the link of the ov13b10 driver's
  full-resolution mode.

If the host ov13b10 driver binds to the sensor, it currently accepts
only a 19.2 MHz external clock, so it does not probe with this
configuration until it supports 24 MHz. The sensor's reset GPIO is
registered by amdgpu together with the other ISP GPIOs.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/platform/x86/amd/amd_isp4.c | 127 ++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
index 0d4948995..6b850e0fc 100644
--- a/drivers/platform/x86/amd/amd_isp4.c
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -19,10 +19,13 @@
 #define AMDISP_OV05C10_I2C_ADDR		0x10
 #define AMDISP_OV05C10_HID		"OMNI5C10"
 #define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
+#define AMDISP_OV13B10_I2C_ADDR		0x10
+#define AMDISP_OV13B10_HID		"OMNI13B1"
 #define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
 
 static const struct software_node isp4_mipi1_endpoint_node;
 static const struct software_node ov05c10_endpoint_node;
+static const struct software_node ov13b10_endpoint_node;
 
 /*
  * AMD ISP platform info definition to initialize sensor
@@ -245,8 +248,132 @@ static const struct amdisp_platform_info ov05c10_platform_config = {
 	.swnodes = amd_isp4_nodes,
 };
 
+/*
+ * ASUS ROG Flow Z13 (GZ302EA) rear camera.  Its ACPI camera device has no
+ * resources or endpoint graph, so provide the same complete software-node
+ * graph used by the reference OV05C10 platform.  The ISP supplies the
+ * sensor clock at 24 MHz, as on that platform; four CSI-2 lanes at 560 MHz
+ * are the link of the ov13b10 driver's full-resolution mode.
+ */
+static const struct software_node ov13b10_amd_camera_node = {
+	.name = "amd_camera",
+};
+
+static const struct software_node ov13b10_isp4_node = {
+	.name = "isp4",
+	.parent = &ov13b10_amd_camera_node,
+};
+
+static const struct software_node ov13b10_isp4_ports = {
+	.name = "ports",
+	.parent = &ov13b10_isp4_node,
+};
+
+static const struct software_node ov13b10_isp4_port_node = {
+	.name = "port@0",
+	.parent = &ov13b10_isp4_ports,
+};
+
+static const struct software_node_ref_args ov13b10_isp4_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&ov13b10_endpoint_node),
+};
+
+static const struct property_entry ov13b10_isp4_endpoint_props[] = {
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov13b10_isp4_refs),
+	{ }
+};
+
+static const struct software_node ov13b10_isp4_endpoint_node = {
+	.name = "endpoint",
+	.parent = &ov13b10_isp4_port_node,
+	.properties = ov13b10_isp4_endpoint_props,
+};
+
+static const struct property_entry ov13b10_i2c1_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 1 * HZ_PER_MHZ),
+	{ }
+};
+
+static const struct software_node ov13b10_i2c1_node = {
+	.name = "i2c1",
+	.parent = &ov13b10_amd_camera_node,
+	.properties = ov13b10_i2c1_props,
+};
+
+static const struct property_entry ov13b10_camera_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
+	{ }
+};
+
+static const struct software_node ov13b10_camera_node = {
+	.name = AMDISP_OV13B10_HID,
+	.parent = &ov13b10_i2c1_node,
+	.properties = ov13b10_camera_props,
+};
+
+static const struct software_node ov13b10_ports = {
+	.name = "ports",
+	.parent = &ov13b10_camera_node,
+};
+
+static const struct software_node ov13b10_port_node = {
+	.name = "port@0",
+	.parent = &ov13b10_ports,
+};
+
+static const struct software_node_ref_args ov13b10_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&ov13b10_isp4_endpoint_node),
+};
+
+static const u64 ov13b10_link_freqs[] = {
+	560 * HZ_PER_MHZ,
+};
+
+static const u32 ov13b10_data_lanes[] = {
+	1, 2, 3, 4,
+};
+
+static const struct property_entry ov13b10_endpoint_props[] = {
+	PROPERTY_ENTRY_U32("bus-type", 4),
+	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov13b10_data_lanes,
+				     ARRAY_SIZE(ov13b10_data_lanes)),
+	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov13b10_link_freqs,
+				     ARRAY_SIZE(ov13b10_link_freqs)),
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov13b10_refs),
+	{ }
+};
+
+static const struct software_node ov13b10_endpoint_node = {
+	.name = "endpoint",
+	.parent = &ov13b10_port_node,
+	.properties = ov13b10_endpoint_props,
+};
+
+static const struct software_node *ov13b10_amd_isp4_nodes[] = {
+	&ov13b10_amd_camera_node,
+	&ov13b10_isp4_node,
+	&ov13b10_isp4_ports,
+	&ov13b10_isp4_port_node,
+	&ov13b10_isp4_endpoint_node,
+	&ov13b10_i2c1_node,
+	&ov13b10_camera_node,
+	&ov13b10_ports,
+	&ov13b10_port_node,
+	&ov13b10_endpoint_node,
+	NULL
+};
+
+static const struct amdisp_platform_info ov13b10_platform_config = {
+	.board_info = {
+		.dev_name = "ov13b10",
+		I2C_BOARD_INFO("ov13b10", AMDISP_OV13B10_I2C_ADDR),
+	},
+	.swnodes = ov13b10_amd_isp4_nodes,
+};
+
 static const struct acpi_device_id amdisp_sensor_ids[] = {
 	{ AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
+	{ AMDISP_OV13B10_HID, (kernel_ulong_t)&ov13b10_platform_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
-- 
2.56.0

