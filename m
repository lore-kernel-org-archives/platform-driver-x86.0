Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794082815;
	b=fstGkyZjjVjzYf0Mep+TG1G6indyveE+3PCSdAX7BGyEXzJMVCh8GCTdEQizCpxFQOJY
	 2D8lth6oKAqumYoG60GR6cj5pLL4bctmA13vpNAF0AJ3I7Bldt5qSqbqZ12j8DtUcm27d
	 uexme+sldgOGfZKjK2j9jbXHy6+nCyFNfrIvoInBJo+UCnlnbB6/G6RCV4zZqojwOU01i
	 XjWYNiRWAmS53STZDlz7/JvDhF06jReWXAcrwQWZPgapqUlQa7LE6ZalLNLSO5SqnLeUV
	 9zT85bam73nTK+vfnOA+hWbrJ5kFNH/SXf2YxuOCktFmMV2n6ieSR6FZYkWRKfBIdJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082815;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BsMmnTW5zQtmXUAz5wpSIXVWC8xQsapEEGYi9jYUJm8=;
	b=Z1wxva4zYnpPfrKIOFglbI87J05ATFsLm2kikcd0ytB7pXXzUsqMV4boaTHah4DAWGil
	 Y3JegyjDXA07QMVj588xqFiQtRhxeRVjFp2UVblaww658qsjAbz8DXjuFJgLOmlM4oQJr
	 OVOuyN9l+XyqH6nqaSYPnQpMKdIFcO3/O19rJSAUrpo/itzRcRWZgcWy98nhn5DGBXQ4j
	 kBnsL+3MC50tl91gphTNd8O6c3sPRv8pAq97UfMrNOr6gwWkLlGh+AYaizNIJtG5l0gYn
	 jZCsFGMxcv5+6v8+xWdCy3RzXw2jZMdIboatX8Dl/VCyNCfXqY/qNL5t2xK8fSw3I5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLmnUrdp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0687E606A33B;
	Sat,  7 Nov 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLmnUrdp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794082814;
	b=ASlZvMk5KrgAojeHeXUqC70potmqOsTsjqHcKWnlY2EAfedl+hGvJBTl9n7rnfISUcmY
	 3GLifYJLMMq9qyzabrzUbZ9u4FhiEGv8g9J2MHOG0GpOmMOwVnKSsp3Vg2sry1sHsf4D4
	 NzCapmgqVhZr96dvL8FbjNqDRannAj8XEPkbeg+P4VRTDUX9Sw/A0se2KuB+MPq12EyUg
	 /JiC5pBeyYbYGrrPS3PY31Gd5vg0G05JfGbsa4Pf5Tupp1YfpTUFepk3iVeF3kKjyN/0Z
	 kAxPQRk1DP+Z/978Xhtersz2ByLwUT4OeU8sz+sAHwzQMQvo8+hPvkj68dJVpyt+o/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794082814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BsMmnTW5zQtmXUAz5wpSIXVWC8xQsapEEGYi9jYUJm8=;
	b=Saff5V63edGXjD9Ieo2TXbUP3Q1aTfJ3Way8n1mf3NMXEbrvbZr0rwZ+7L4CIe0YBx0N
	 6uRuyaXz5YQqCJWJ65bHZooaevUoLhTAgbQ1Xvd7P6FQOXXuPdRgi4RW134n8nz6JONtP
	 SiFEJC16agCOd1fLfiJOt9pXnSAVPrZ0SM24AOGx9vZwyfB02SjBjCgmOYRQJlJX24FF1
	 owr2GAjCd8NlRjGfV+V02DkV1zTwYZClmlNOicJPr5meUPQt3RXL4npsiQt8WuYy0zKdP
	 37L1yJ+3G7zST1Jc4mEuYNeVI158FN7NAVpAE7f4ofWZ9iU01TQTPEftHiWwJG5H80Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 193341F0089F;
	Sat,  7 Nov 2026 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794082814;
	bh=BsMmnTW5zQtmXUAz5wpSIXVWC8xQsapEEGYi9jYUJm8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=QLmnUrdpFbqgABqoa4skKegumMkQzVfOe/UzRb/JD5FPmi5Eqvixw7L1p66Kw4tT6
	 9cDkN4dVpE3ZYiElA55i1NleMvr34GHir4liZ/WjLiEeuss/h6QnjSS7O0TlQAgd4x
	 3pJ0Z2W7E1SfY+dKd0Zhim8fb9Z/Kzi7LWzrUgHinkCXcaj6yJaKLul2tsnZg0bZa6
	 Dj/mqKpMPX/taAFAFhtZFP7eHr5Fmov7kuxAePE2RvRN9T0EjwPcT97DyO6uRK8yGq
	 jrGahdABJhSyIIQKzy+sseob1xJaCb6l7PQx5eGJrG5J7GIS3wN2MBIkCbP7+YFIRo
	 axj0YwwLBrabw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7836F47CEC;
	Sat,  7 Nov 2026 20:20:13 +0000 (UTC)
From: =?utf-8?q?Bekir_=C3=9Cn_via_B4_Relay?= <devnull+bekiirun.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 23:20:02 +0300
Subject: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro AN16-51
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
Message-Id: <20261107-acer-nitro-an16-51-v1-1-456278eb4cd0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz1jCFBLBVRBDSA2YISAHqkqIu
 zfQ8Q3/nxBZhSO02QnKH4myhgTKM/CzCxOjvJOhLEpDVFh0nhWD7LqiC2SwJmxMxdYM46uxFaR
 wUx7l+0y7/u94DAv7/T7Bdf0Aj1HNdXYAAAA=
X-Change-ID: 20261107-acer-nitro-an16-51-964e76bf3974
To: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bekir_=C3=9Cn?= <bekiirun@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794082812; l=2537;
 i=bekiirun@gmail.com; s=20261107; h=from:subject:message-id;
 bh=XbyK8OmmCdT09eWFW+p/K32iqIhSXoUAvUuuLGPFTsE=;
 b=gojpaeKoCAYDNWCaQNE0OspSdpAVSitkVKYPwY8SGeCEXT0VQYHUxMRQ7pdT46SYwViId1PtR
 rhEnvaqLsf/CKcDbVewLxh9/tbLl0Kd38rauB21QaCDbOBeBt2038xV
X-Developer-Key: i=bekiirun@gmail.com; a=ed25519;
 pk=ThEeR1k91IQjKK+VVDMEgjG0h0zzy2D+IV65oEuWzxI=
X-Endpoint-Received: by B4 Relay for bekiirun@gmail.com/20261107 with
 auth_id=1446
X-Original-From: =?utf-8?q?Bekir_=C3=9Cn?= <bekiirun@gmail.com>
Reply-To: bekiirun@gmail.com
Content-Transfer-Encoding: 8bit

From: Bekir Ün <bekiirun@gmail.com>

The Acer Nitro AN16-51 supports the same gaming WMI interface as the
Nitro AN515-58 and AN16-41. Its ACPI tables (WMBH method on GUID
7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56) handle the thermal profile misc
setting 0x0B with the values quiet (0x00), balanced (0x01), performance
(0x04), turbo (0x05) and eco (0x06), and report the supported sensors
as 0x0227 (CPU/GPU temperature, CPU/GPU fan speed, external
temperature 2).

Add a DMI entry so that platform profile, hwmon and fan control are
enabled without the predator_v4 module parameter.

Tested on an Acer Nitro AN16-51 (BIOS V1.12):
 - All five platform profiles can be selected through sysfs and
   power-profiles-daemon; the mode key cycles through them and the
   key LED changes accordingly.
 - fan1/fan2 and temp1/temp3 report plausible values; under full CPU
   load in the turbo profile both fans ramp up to ~5850 RPM. temp2
   (external temperature 2) always reads 0, the firmware advertises it
   but the EC field it reads is not populated.
 - pwm1/pwm2: pwm_enable 0 (max) gives ~6600 RPM, pwm_enable 1 with
   pwm 128 gives ~4000 RPM, pwm_enable 2 returns to automatic control.

Profiles and sensors were tested with predator_v4=1 on 7.2.14, fan
control with this DMI entry applied to the 7.2.11 acer-wmi driver.

The ACPI analysis, the change and this message were prepared with the
help of an AI coding assistant (Claude, Anthropic) and tested by me on
the hardware.

Signed-off-by: Bekir Ün <bekiirun@gmail.com>
---
Single DMI entry for the Acer Nitro AN16-51, reusing the AN515-58
quirk. Test details are in the commit message.
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf5..08f663fc6 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -690,6 +690,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_nitro_an515_58,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro AN16-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN16-51"),
+		},
+		.driver_data = &quirk_acer_nitro_an515_58,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Nitro AN515-58",

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261107-acer-nitro-an16-51-964e76bf3974

Best regards,
--  
Bekir Ün <bekiirun@gmail.com>


