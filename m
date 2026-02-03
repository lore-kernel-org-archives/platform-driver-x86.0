Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845C39A7EF
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113228; cv=none; b=AeyQcM1EzQSY9hTM21njyHuxP4uOt42+3Vu1Zu/ZC5eYgwDz82gRxxpFADBBVAzJrYArJbvVDkj98Wq6lTJ2H/Y5kYn9wwdMn6Dwuh/3ooF+TJTG/xLmq/BCBh3imxfwb/c0LzwWmreSkfAMJg6q68UC9n6KEeYYg5aRI4S71Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113228; c=relaxed/simple;
	bh=riJvnc+Unu3IXdR4AYqpnasGE/IHX7nt/XAtS81ytzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCl/VV4SpsBU2WcRiI04DMfeusNCiVo+6HeqatTcUiO5h1x/3KeIDqZavdfd4x2ju2TPWuvw1aO7eAcRQeaKw7HWTejcHHZa+jZUUHt+6AEglurhFxnM9U6kPpKpDf6dr16PsFkbW1v8DuETDwvWj76cblloP7AVoUUcqdjva6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfs4ucb+; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfs4ucb+"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso2112633a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Feb 2026 02:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113226; x=1770718026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytu8gh/aYEOZ6u1ee0366c19xW+ZKOkFx/f9DalfebM=;
        b=Zfs4ucb+6jfbhkytTRf/beXOQvUOucf3D85VojngF4qF7zIRZ+AxoTeJH3KP4TRpEd
         5p5cIycM308zUIzYTPtcJdCM2OFAZ80Keo136FpWVKH+MNeBf29wUaDKZH+8KKtMmd7V
         R2xesC2ooRykVb6DqmVQmkuTcLxQqeh4h3wP9X+5LyKwhwZFppu689QerPnGWO7GAv1+
         gE1nbHV/1IPUwIE2cTPNyi7M31Rwb6MTeIcgERfw2uEsfjOBKLCtn6cRcIANeeOaWFPv
         DkKhTCBeqd3h5cnRmlRmZQz4y18CnqD0zjBZGjHWZM5Q8i40FZOiQRv4MegtRRUcWjJs
         avQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113226; x=1770718026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytu8gh/aYEOZ6u1ee0366c19xW+ZKOkFx/f9DalfebM=;
        b=BTIpwMXZnn0UVSp5ICSkXq3JC1LKcJcoVwVTerB/HNeC//Ka8K5jZt9y9VuUlF240W
         yb/6//ECG06X4P9CKSImSTRahxGHz1tor0aYAFMN5DxtgzgQ0vvAYyBs/1OhLqSGgD4a
         Et57I8Cht0wkymbJkPC7L++u2hXFPc8uJ5I/u2Am+y1ao4CUx/XIm8sc5IPlRhdUrwlI
         ClJkhMZ509e6pItKajaacqXWoJ+MiTfUr8MrWWak0QawS7D2XKirl5yOwmGyAeFnkfv4
         M+/1/dCAMBFdqliKSNQGf6IyAKLkb3KbfhFELvdQ2aa2Xty0OEXlHu95PgrorotYDYHp
         oMow==
X-Forwarded-Encrypted: i=1; AJvYcCUXu/9ws9bC8bamrH15PgssjNHBzT23IIohwXqswpwDUWfZ1i0B8FfpGCnV5JVsxMQwnHIphaiHYf7vAr66CJgQN8m6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGUYZdr+D4wIcpPO6R/TSkHNJcHp6K0T+130a8jU+E9tnYGneI
	uSRkawvMV2fH86neEWh8tMsWVqdPbl/tWfedTjx2BUHJSkLYUT1Y090=
X-Gm-Gg: AZuq6aKItcyg2OufKU0hxwU7+EaJY+bbS1gBMqCxvQkPj/JzvVOYeaxEcm2UFpyph4o
	P3e2sDGb2GP0QDcuszZ2UwnZN8rk82j8xdl600QhdpakD4z8ub4cexhmFQSiPubMLJzCmp7bqN4
	LDVQWsq04HSMihR0Vz/goDXdIvxf4Y2+zxsNjdL3krTLti4M6TuJKdk30bVmkCUpbXdw3gS4VxQ
	6wOSqKLYjDdqbN9lYyBrC1zHR1dLp/f25E9dbuMJKVwwNXqa9aormg7Xl5cf64XWwT1G9xYi1wS
	OEyWCIkyicmsdY9rJuazAoUoMnC2w38QUIPKTI5OhZblGUwsDcIgBcYhe0BmvDh5cfqRPeb8nYX
	erHbhu+OIGWl82rvFnFfTMxy3i1+eJN/I8BOEJf1xzSBT5WuJMID0Nhrc6VSrb92LBz/VcaQnqt
	jx9o5YsqPShvdN64E=
X-Received: by 2002:a05:6a20:72a2:b0:361:63eb:d024 with SMTP id adf61e73a8af0-392e003b230mr14730514637.23.1770113226424;
        Tue, 03 Feb 2026 02:07:06 -0800 (PST)
Received: from at.. ([171.61.162.208])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642add5199sm15814180a12.31.2026.02.03.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:07:06 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] apple-gmux: preserve brightness using EFI
Date: Tue,  3 Feb 2026 10:06:58 +0000
Message-ID: <20260203100700.2223-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make apple-gmux save the current backlight brightness to EFI on shutdown,
so the brightness level is preserved across reboots.

EFI Code inspired from drivers/input/keyboard/applespi.c:1589

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
v2:
- Used correct size for efi_data

 drivers/platform/x86/apple-gmux.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..20fdebdf3c58 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/efi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -107,6 +108,9 @@ struct apple_gmux_config {
 
 # define MMIO_GMUX_MAX_BRIGHTNESS	0xffff
 
+#define EFI_BRIGHTNESS_NAME		L"backlight-level"
+#define EFI_BRIGHTNESS_GUID		EFI_GUID(0x7c436110, 0xab2a, 0x4bbb, 0xa8, 0x80, 0xfe, 0x41, 0x99, 0x5c, 0x9f, 0x82)
+
 static u8 gmux_pio_read8(struct apple_gmux_data *gmux_data, int port)
 {
 	return inb(gmux_data->iostart + port);
@@ -1012,6 +1016,27 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+	efi_status_t status = EFI_UNSUPPORTED;
+	u32 efi_attr;
+	u16 efi_data;
+
+	gmux_remove(pnp);
+
+	efi_data = (u16)gmux_get_brightness(gmux_data->bdev);
+	efi_attr = EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
+		EFI_VARIABLE_RUNTIME_ACCESS;
+
+	if (efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		status = efi.set_variable(EFI_BRIGHTNESS_NAME, &EFI_BRIGHTNESS_GUID,
+				efi_attr, sizeof(efi_data), &efi_data);
+
+	if (status != EFI_SUCCESS)
+		pr_warn("Unable to save brightness to EFI: 0x%lx\n", status);
+
+}
 static const struct pnp_device_id gmux_device_ids[] = {
 	{GMUX_ACPI_HID, 0},
 	{"", 0}
@@ -1026,6 +1051,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
-- 
2.43.0

