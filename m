Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721207;
	b=NmLImnNsSgd1/vcwbpAIqca/kWWC3L7WpDKFaSoFYL44yU26kCdVSlwwqeyJyLQe/qRV
	 lWWmQZeFie3FqWiUv1zFxACBKijyNQyWlTP/r2PW/1DmHHcNwnSXXi7wOGel0VFXuU1ZI
	 NYAqEMIAZWxL7qw4ppEvttm0uuaHH71EjLMuREKq/bVPfs9UBV6jc/JocEtycPscpNJmv
	 n76f5I986Vj8KSVLGbF9GivyHoU6+yghBEIsMWop+AXytJ8DvOa8CAKWvUYJij/Er2vK+
	 lIHa7nSwxWbKdQL9+1xTgki8RJD05los9/5kslIhGmDWGXHPP6Z2h7jkExSgt2JD5WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
	b=rL5yKrYH4SMuiW6MzI3ntVzuf1bgCOB6qSbRoHMEKGy9Rws15nlkttFCv6RJyOmJ4XEl
	 MH8dUnKCjEvzh/m5xAo/jA4zI44l2P3UvUWymjQIViUUjOfHHDlRBT0xZ8o32S6F8ckWX
	 oGz7S7ot1p+86bSdQqcizeIl3khLMEleGG3CdQ9LYij1wFHosjyHNqFyxoYtFF+sg6J1Z
	 DqxWSoRPiu3L8pmfRJpJb42zfUQXGSf/HYVd2cbIDDf8Y4YLGP2oc+vtit/kLbbyb03IK
	 hhRiNvpdMhrIW7Zn3FqZuQ0/DrqKDLpTxOFeuIroZzTH95ZLK1VxXTyUN8W13DZERaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yecahwDX;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31B606D809
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 15:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C31B606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yecahwDX
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso9966055e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721205; x=1794326005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
        b=yecahwDXyL4ixwjwAtwXtbzFW4oCartcs77hkEkNndr/+1B9/2ER+Goy8hgElFvZcp
         4PANlbS+T5MWn9GWy1sLu/scTX+ZuZsledXUZo4y+t4NQmFj+umbmxqoXieVvWXPC6JU
         kajMYHvs72ea8bvnsPsYipzb//43xDBUPNWjBH8vwMHfzTYNiC84PTbnWcF5/mPc1Ozo
         3fcrzoniWqx7iUdoVWz68jjQn8ILPVp4+b59gw60wG1NwDvWybW9x3BSTCZzthBA2/HP
         xrrkG2zyPVLK2SYxovLADOzd5fP31/EDWT1OHTOMgF/RG1QuZVcIaKCLl4hK2PsXb4kO
         Swbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721205; x=1794326005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
        b=nmeUqfbZpCYcjIIWQLozP7bOXXQJcFpGsnP26YJwVmzi5jEyMs2FDKxlnk5YeMbWmN
         6t/QG2Ydx+OaoetRWkxLgs3axtbLzbdGztzBdyedhYvHG15YIogLfR3yJUpeJHNGllns
         /muizNmJNvvto0Ap4cJ+1ZeuV1ZcBJ+0yYDnkpPyNjAq7puAo8ZUlaCghZIMpdyyhNna
         AK9Vm354UCMLlbscsi+6mMv4/WKwWe/9YOpjme7CKjjo5wIfAeAMpYg+3TJQjNd8T73M
         N2JiBZQixl4wJ6CKlMa9zzXxXrNg2K5z2a0J5szdR0mxyoxyR4eCoNqqqSi9AhJaxEah
         69LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS6bTre6TNFVfaOQFzM24ulUkKUBMMOydzY41pTitIk0Ey1hRpX5Rg2vB2XNpKqqbl1qvvwMJUkhIuqvHXTx317zdW@vger.kernel.org
X-Gm-Message-State: APuU4Z8cwjX7tz1Egb/ZSNjzV97seEqD2gN/rqN604r8IWyuJV/fzYJ5
	LvKM6sG+CPxjBBKvCtsxxkmwQeibcAh6uOhMtlurzSf2fyBqqGnc4cuR
X-Gm-Gg: AYBFou0w34gyfldYW4feZskKRwwDcq6fKSG27sfDGAio9EhUBFkBxB7AIJ+CFI5HoUP
	1l5YQKFDWiMG/4CwBNfoMdRfYQ3ymkoIa7z/azIwyN6hLiuDj0f3/UvOSmmim5G9THsBupwzzO0
	Eodg2wlUO3RXboy/+wf9LMb61QPmYri7KxluvOHUFUieAKKl5uTJEv3xC+UmOqLz0nXRgtqBBsp
	Hi5wGBssKqcy/483OaX9hMF2+0hplFNTHWIAlipW4oFSxxdhnFoC82T/t5CdJAVz5EGslrQFNGA
	RVdB6yVBYb+pt0XIxz+6UBW2lbxx/gIlCx/3XK+r0ctS7aFRN1SM8DOqSFxoTkjVqYFyb2Aaaq4
	STsFCpD/RtvfpoXNu/NjfRXil5xt6ftJJOTP8ISOUipf0pcvnEb3NsY2+Wuq10Y6QQWyKLv8sSF
	25F10TpCjyXXPU0/ylBnpu2046GQRiQnJn1w3W9oJKDAzEpXr9+slxtQKK0ye7sX3z0Vukv6ctR
	wRyj2QnTdnD+3yIXJ/f9QKFHCJPovyY+Gxv2SxFQnFz6j03rWChGJnANrZEXAyWfzB9N75KD0Rq
	VPtxeVmBL0gW4BFr/Tfl4w6tUUUHRIEW0QptFmwLgWmugtk62pY=
X-Received: by 2002:a05:600c:4897:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ad5ec2d3e4mr152905945e9.1.1793721205339;
        Tue, 03 Nov 2026 07:53:25 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:24 -0800 (PST)
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
Subject: [RFC PATCH 1/3] media: i2c: ov13b10: add an I2C device ID table
Date: Tue,  3 Nov 2026 18:53:11 +0300
Message-ID: <20261103155313.114347-2-saif.elden.hatim@gmail.com>
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

On AMD ISP4 platforms the amd_isp4 platform driver creates the sensor's
I2C client by name ("ov13b10"), with a software node and no ACPI
companion. The driver only has an ACPI match table, so the I2C core
does not bind it to that client.

Add an I2C device ID table so the driver can bind to clients created
by name. Nothing changes for ACPI-enumerated sensors.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 242a95834..d33fb7032 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1706,6 +1706,12 @@ static const struct acpi_device_id ov13b10_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
 #endif
 
+static const struct i2c_device_id ov13b10_i2c_ids[] = {
+	{ "ov13b10" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ov13b10_i2c_ids);
+
 static struct i2c_driver ov13b10_i2c_driver = {
 	.driver = {
 		.name = "ov13b10",
@@ -1715,6 +1721,7 @@ static struct i2c_driver ov13b10_i2c_driver = {
 	.probe = ov13b10_probe,
 	.remove = ov13b10_remove,
 	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
+	.id_table = ov13b10_i2c_ids,
 };
 
 module_i2c_driver(ov13b10_i2c_driver);
-- 
2.56.0

