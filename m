Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721213;
	b=evxgxZBEQcT05Xd79HepXQFob5NO0WKNQGwJb74whv8aX51zC+XoNrCB2/Bgonn3scnN
	 akBSwCQJhktpBsW30m4qXBqas+RJ/Sx2R+FVsF8XB/ySl0rEU9t2ex2omtM3+BmnlJcZE
	 +tOtD/cD0abKrwYCOPLOl/g0zp/hYZp+xWG0XVOHC5a/sBd92UYDZjCeNpyWUzzhGoS+f
	 hOObgobxQuGQnAZmzQ8tc8dKU8kZxJbsd/K1Tz7fgaFODY2paumL05E5yKphfTaDkGpTg
	 Av614kFwrRew5ObCzcjoFvUq/YJCJ5QRdNwDKfjXAHpU5k/kwPFC+d+GgPtPSev2xNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
	b=aEgyWEMondTCd7OVrjCJChJP4WciOKzx4w+1zpWlqvF2h+wn1ykSRSD266ZNYbxHM0Qa
	 7PlAMy8hKHwWzSE7pLSWWIJ6E94ecCdAJZb8p37d+55A+UhEe7tViEKW2bWwKyZuLILKe
	 gD9HF1hgNZLaSAMn41ymzRMCXs4k2aNNyEz4OfpcD4Zek3byuRz9I5c3GsGMIC2hioprd
	 2krJOsrp/IEmLF4ZEIdtx1Yi+nUAp1pp15PPnNpwAqBnQ3yPVInl5JH9UX61WOSSJlpVY
	 2JaWgggoxQXNTZNFjjmqOG11ykF9k8g/X0kPmJQS6kjEwND1J2krJTjw56PNLC8chbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cV1rfcaP;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E596606D830
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E596606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cV1rfcaP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4af520023fdso13025795e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721211; x=1794326011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
        b=cV1rfcaPqw5g4hra3OliVPaZNo6ZdIE9kz5vixcXtW8Tfcy1T3Fd1n3Qomk8mTQtoI
         CpwV91/ivTc7kQ83ItiGXYNE8ylwa+AsAircAYdQm6ZwwjB7P4XiRmfKM+vE4jEG34Ky
         o/4C6yfjE8hT44bQiK0txjwN9GJYfYPlJfGGvoMJUrQGGYAtowQYH6GIoGokPjSUvtmv
         rEBoIKAbNy+l49cfORY/Y7SbiazcTqcB67q8IBSAIrSy73fTqo4/KjNSTFKw43puoHE1
         aiWcFLDFiEkTGYTmfDSKA0vUw3dHJP67zgI+JsxiYKWsnckfO8ZbUN7mHtN9DDpUFG4w
         IniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721211; x=1794326011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
        b=i+rICbcYUIN9+5sheD7MI028MxBWCyZO9il3/D3afeZmdGQx8eCw2l/U7vzlhHqLaW
         sVp4nznEcBebG8fsT0CxaY7Xld2a6Q85fqAVUW2nxoTYPZJ3OBJhKXXKbYnj842mgH0C
         a4dNmViokJNF5SnWvCo/fZV4rrvNMRA9Rr1dej5IO5Lt4iYTXqnUtbu4P7beUMXKeQAJ
         R0CeQU3jnvvhwnGXfmIxPyxtGl1bnWHBC+YsZHNn/+VjLlrhp7IHuMjw2IqmR5fhEx7X
         Q58xthno+wEOpoDiEdmm1OZUINz/Km9zwqavLniUWui7U64mcCq+knrtRjbJARHqlsU5
         PPlw==
X-Forwarded-Encrypted: i=1; AKwUvByS9TjoIznpIq53B2x7V9aAY5/YZr4auxyNH3FoKJC5ZucPxdL6uIFyiz/cZJ9rzcPdC75Xz46V0Ucmw0A4HD2mNGh9@vger.kernel.org
X-Gm-Message-State: APuU4Z+eo8bOVKDgj1YiFPimcQBXrF4W2GO8AlwCSuA41wVHlLhij6SY
	ImFEVZYIty5G4g6z0bF0d3+Jlb+e4LAj8sA9Qw1zDBUATJ0hBAU4VNLl
X-Gm-Gg: AYBFou1daes7SqHRiBCpyCDwGXTod1D0wUW3Ko/U3/0/s7h3uQzC8PgG27cwXhKwcuP
	KkNLuStDA0hHeOaJPSMDUwC438NU7JoSsG/qDwqPoK25+of6HcD/VI1b6nG6T0+Rb0G4q7x2b3g
	TG3iOyV+ajgHJ0xB1fo2ZBROTpweATeJNSgGAqQUy2wTUsRXTzHR7+hEYtU7IGkF7xrEy7mdvrt
	dh4IsO3mlxDHzVtbdunkJeGSsJdPVq4fsovaWccN+P8Vmbam5AOvoXnIA9suZ+nB6GuJbzs1163
	N53HMfjhGgwiSF+yGfxS64SE7v52NvaiIFQJRP+yjdOnuw2WkDNhmkT/4E9YkzyQ/Jjvz03iAQy
	3ho6N5VB7x2c5bv0CHsfYMsPBvEah1FwRs60O9Q+16w9zatZpK3DS5Zi9yTT/Irh3KbGeZopAyj
	uLShtN/Dfr8If5fFyiISMlL+4SIuvAqAXw75ff0EhJIzBWOfwXAN+w2oj1u95wlbymvyiJWcduz
	RWSx1H9AZWEcRTB05p9EB0DHw/FX6pqloVkQo9PkfHyYXa7s5udipCxoc6RVKlMtLN0lR7AzVjB
	Oik5DOrRuJL5myw7V6HHPc1voTEnc0Cnt74nBk25B/G0f87UoMo=
X-Received: by 2002:a05:600d:6505:20b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4b23c8106abmr73912745e9.2.1793721211351;
        Tue, 03 Nov 2026 07:53:31 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:30 -0800 (PST)
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
Subject: [RFC PATCH 3/3] drm/amdgpu: add the OMNI13B1 (OV13B10) ISP sensor
Date: Tue,  3 Nov 2026 18:53:13 +0300
Message-ID: <20261103155313.114347-4-saif.elden.hatim@gmail.com>
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

amdgpu creates the ISP 4.1.1 devices only when it finds a sensor from
isp_sensor_ids, which lists only OMNI5C10. The ASUS ROG Flow Z13
(GZ302EA) has an OmniVision OV13B10 with _HID "OMNI13B1" on the same
ISP, so its camera is never set up.

Add OMNI13B1 and register its GPIO lookups:

- enable_isp on AMDI0030:00 pin 85, as for OMNI5C10. The ISP4 capture
  driver requests this GPIO and fails to probe without it. On the
  GZ302 no ACPI device claims the pin, and the ISP also boots with it
  left undriven, so its function on this board is not confirmed.
- the sensor reset line on amdisp-pinctrl GPIO 0, active low, under the
  "reset" name the ov13b10 driver requests. This is the same ISP GPIO
  as the OV05C10 enable line.

Like the OMNI5C10 tables, they are registered once and stay registered.
The ISP setup uses the software node that amd_isp4 attaches to the
ACPI device, so this needs the amd_isp4 board configuration for
OMNI13B1 to be in place.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |  1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c  | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 63088c072..412d3992c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1726,6 +1726,7 @@ bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
 #if IS_ENABLED(CONFIG_DRM_AMD_ISP)
 static const struct acpi_device_id isp_sensor_ids[] = {
 	{ "OMNI5C10" },
+	{ "OMNI13B1" },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
index 363266f3e..7d6072e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
@@ -65,6 +65,14 @@ static struct gpiod_lookup_table isp_sensor_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table isp_ov13b10_gpio_table = {
+	.dev_id = "i2c-ov13b10",
+	.table = {
+		GPIO_LOOKUP("amdisp-pinctrl", 0, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static int isp_poweroff(struct generic_pm_domain *genpd)
 {
 	struct amdgpu_isp *isp = container_of(genpd, struct amdgpu_isp, ispgpd);
@@ -240,10 +248,13 @@ static int isp_v4_1_1_hw_init(struct amdgpu_isp *isp)
 		return 0;
 	}
 
-	/* add GPIO resources required for OMNI5C10 sensor */
+	/* add GPIO resources required for the sensor */
 	if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev))) {
 		gpiod_add_lookup_table(&isp_gpio_table);
 		gpiod_add_lookup_table(&isp_sensor_gpio_table);
+	} else if (!strcmp("OMNI13B1", acpi_device_hid(acpi_dev))) {
+		gpiod_add_lookup_table(&isp_gpio_table);
+		gpiod_add_lookup_table(&isp_ov13b10_gpio_table);
 	}
 
 	isp_base = adev->rmmio_base;
-- 
2.56.0

