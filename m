Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C0C221FD4
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346541; cv=none; b=p+Otzpa8n7BrDEUHafmpAjbKvNZ1muqMv2q6oIH+SUJyF8WUxy5sJhtzwbBx+k9c8ZgcyENkptPyndqbpDfy9o0aUGc4TN1KcWZkyCtbcA0r6SeyerrBSzRUkc11pzMmz8jZoriQ1pcvBq0bTKtCW40DQ0jPed4PUEP64TydY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346541; c=relaxed/simple;
	bh=xWFlsXDf/xpXKOeWlHUCjaMjjPvxgHTyp10RV1R/WeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gmlw/w/SE2EQ17EeQB2rt1KiMQeBU7MBge0daD2PwShwkHzBd6VcT+nfVf8dJCbqpFAQATH4IF/MjUy9q0WPkbUH59/3+IRrIWvVpimm/zJ44KCRYYlMFkaX+M6pjvUPGViGI8mYNW4rp4MnLt+N+3IfTYVrpYLvE6lcOP+MgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbj1Wn7E; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbj1Wn7E"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso3975204a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 08:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764346538; x=1764951338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odl31mGbDmVEyuI0j4gGtb5lJEQC4lMYBE5HdZuvZD8=;
        b=dbj1Wn7EFwzcdK1ucE1Eb+Wibfh1nK3MQh+DqZRGLbHMwXsBz7J0BigLPYHMDxqO2X
         wTv2grR6c7Z4PYqJ8ZXYoDrsjxldxO01B6ot4/Fq/Sly3vGPTRtLkD5ytXSZsSWjFISp
         LLj8jrvhHOneR44DuzQFyPExvOXsrkdDhAAuGXbWX3QkSisV/WlxAP3lh0IJsTxSIvp2
         /qA4haZKHy4AEgFGAkQjVIX3X5ohGyWPbo0JhEuhHpxkeugALeX2z0dW60fQ5nTNrq0e
         2VRcc8Dr7fPUcRrKKM8hHh6ecNbG/xXb3yKGrggsC49a4txrTNi215Jx2AwMclTKbPay
         UiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346538; x=1764951338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odl31mGbDmVEyuI0j4gGtb5lJEQC4lMYBE5HdZuvZD8=;
        b=Mz8ET7/DczRB7aC4Dikp8Lk4qyE9k7Tat3Sx3f/mOaBRiI/kQVfcVOuEqe8XOfSjPT
         M8edemj7iaHr6FuWHFR8gkJMc3IB/eDpluujUxN9DZWr9rWEjh9ICVkbqV2ZV9ON31cY
         aFBNFRevbPaFER3Zb6fNNCTN64y/2KNCbCAR+ivTWttNsgBrMiY6+C/DLR5NzaWfAQIW
         +CrtZ6Cj3+Yll86IZySHaHKJhb0tB/DEgHGg3U7sQpmNvnuBiAm5KGl+k5Ol2p+N+wco
         LNCwf3VoIHLuWlKPK6OIkY6lE1pqRSEJjBA89H8pag0Tidxh6Ag8CohixSXcYAQ6mAVC
         dUXQ==
X-Gm-Message-State: AOJu0YzFzRH/is2MP15OMlQG4nnPDOPVsROnjlQNCu0MNmjQezgoDMp9
	ZWIwUIOlCMxn5gbY7S6mxwraLMe1UEs9but+7toRg6cco9VmX9BxHkLRaGW1xxJ3
X-Gm-Gg: ASbGncsrA6BlaHtMQkVraHu/LSjEe0M6acWDypyBCCYQEkqTjSeoVPHyHaIqfzVovB5
	PaSXVGtWMnwSsar+ALsZea8BJ9jTJx+Bdfe9xQ4Sy7hdUWcannyAO1gYBYtow18cF0qVgXZxJvM
	CLyQFRqLTrPbWK7iSFrJm+o2MGCFYEI1Mr3Up8VVzx29jtxqYhJDAJjwOJiIxzR2bLaC69WGW2U
	8tglsXjf4vzuRRj+MXMUjtHNya6YbWCU1meiEABaRzlsBs29AnZPmu7PsjU+zhNZi+r6kLlLGru
	FBtLbvPM4PWml+Cm6ut+qoWkFPthDS9bXOMlzj69aKmwsgTElSLsMdXYrr7QVGlhPl/980T058I
	P91Zl8QOKmko2N1BRBNCeapwTpgdUMx8JiC8zu7YmTgC/L35K+u9sepHiRMKcbGBhpNPlTgpyrK
	DwqQBa+uhrrVoA3I4=
X-Google-Smtp-Source: AGHT+IFFMWjQoT1GmAiCOcr21nm/QWzU0iUaCkkeOGkGRvX45ZSJL14D75tUx/mZq02sVhowIoljMg==
X-Received: by 2002:a05:6402:3482:b0:640:c394:5a4 with SMTP id 4fb4d7f45d1cf-64554674c1cmr26891695a12.16.1764346537676;
        Fri, 28 Nov 2025 08:15:37 -0800 (PST)
Received: from ua-dbagrii.home ([78.137.12.90])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-647510508d4sm4576682a12.26.2025.11.28.08.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:15:37 -0800 (PST)
From: Dmytro Bagrii <dimich.dmb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dmytro Bagrii <dimich.dmb@gmail.com>
Subject: [PATCH] platform/x86: dell-lis3lv02d: Add Latitude 5400
Date: Fri, 28 Nov 2025 18:15:23 +0200
Message-ID: <20251128161523.6224-1-dimich.dmb@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add accelerometer address 0x29 for Dell Latitude 5400.

The address is verified as below:

    $ cat /sys/class/dmi/id/product_name
    Latitude 5400

    $ grep -H '' /sys/bus/pci/drivers/i801_smbus/0000\:00*/i2c-*/name
    /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4/i2c-10/name:SMBus I801 adapter at 0000:00:1f.4

    $ i2cdetect 10
    WARNING! This program can confuse your I2C bus, cause data loss and worse!
    I will probe file /dev/i2c-10.
    I will probe address range 0x08-0x77.
    Continue? [Y/n] Y
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         08 -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    20: -- -- -- -- -- -- -- -- -- UU -- -- -- -- -- --
    30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
    40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
    50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --

    $ xargs -n1 -a /proc/cmdline | grep ^dell_lis3lv02d
    dell_lis3lv02d.probe_i2c_addr=1

    $ dmesg | grep lis3lv02d
    ...
    [  206.012411] i2c i2c-10: Probing for lis3lv02d on address 0x29
    [  206.013727] i2c i2c-10: Detected lis3lv02d on address 0x29, please report this upstream to platform-driver-x86@vger.kernel.org so that a quirk can be added
    [  206.240841] lis3lv02d_i2c 10-0029: supply Vdd not found, using dummy regulator
    [  206.240868] lis3lv02d_i2c 10-0029: supply Vdd_IO not found, using dummy regulator
    [  206.261258] lis3lv02d: 8 bits 3DC sensor found
    [  206.346722] input: ST LIS3LV02DL Accelerometer as /devices/faux/lis3lv02d/input/input17

    $ cat /sys/class/input/input17/name
    ST LIS3LV02DL Accelerometer

Signed-off-by: Dmytro Bagrii <dimich.dmb@gmail.com>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index 77905a9ddde9..fe52bcd896f7 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -44,6 +44,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
 	/*
 	 * Additional individual entries were added after verification.
 	 */
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5400",      0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5500",      0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
-- 
2.52.0

