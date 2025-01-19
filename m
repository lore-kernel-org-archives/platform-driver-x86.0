Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D020E1E25F7;
	Sun, 19 Jan 2025 22:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324387; cv=none; b=StlwEy22sVa4Xp4Sw+MZ2K3F4WbfIYRt2EJU3ysU1ApkUXBtPORllTZe0hMu+BFMiG4XegD5BkVJrVRUE4NJPo1VqLUN47RPbrtiU9LsebarWST46DbZRyUYKWtrb3VaGkjaJ79P1pJHWh+j3oSBrX4+fDM3gzlIEwZs/4UwXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324387; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkVR+eWG8Qa6n9Alscu04HDSna8SYHMk/hiQwRg6YGsioawbQEGP69/R0L4MiXYFso/2Dgdio9MEsIH/w2J+lwC3Q1IvL/UKNHLuIirnICYKvFxCJ/uCm11vWfY6h6SeaBD3V8lX1t4xDZ+MyqQXhvz/rTyD8Q/Z3sIusgenBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBo9DOU2; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBo9DOU2"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be3d681e74so354322385a.0;
        Sun, 19 Jan 2025 14:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324384; x=1737929184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=mBo9DOU21GomnibleHW/eCSlPoh+BN1HYcZIwAhzSOTt28nxlHxvP3/fBaqZ6lJcXq
         vrYuip2qWCry7bODW+exrapMf9PffLouXbIoLQ+x1S4yz+z+icz+UNXczgEm1YuTMz80
         jOQ+Uz4pMslAtgPxaueDUlZxv0j4l3m4cheyrNHKZnV4YXVSP+MhMuz9Kgq8IgRiuFjX
         1Cg8Y7OkEa9efaTvtPHLIyPVAQRzyHDh4Qpn2pAPxNCS8ttouDDlj36fR7V+5mzGwtBP
         c9x5IKCpptHiEGMtgvF3+esn6t+UtT5u1zXiXKcM5pLnG94FpUZ6W4fmvo69b512JT5E
         s46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324384; x=1737929184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=cw6pxtj4nNHz9Oxx3NRKy01T6wHxg9hH41fHkOWOmSVgdAbuVZ+Mq6FE41o7fup+I6
         DQSORHSHa2czN2ccIOhDixXhkI8XorCSnmIBDzq6Sjx12bccORgGWbWBN1ahPYOYBrNZ
         v3Hb+mwHkunNxW2e3+ZiB7YOrU7tHlZKtdNkObQ10dU5J74W7pUXLV03l+rl58mjPU67
         9L+dlyyy2dZvaYVDRrurYzLke4ih+quMjYcTXsKIQyS4FJTwJChcvsWz1X9nCrfcjMAz
         tT40VQKtNjbUUsgvKPfaZmiAyGrdS78i5WMOSjkdfYJBBtsMPoEBipHGWD6QioKW4BEJ
         rSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVki4d/3I9oGEIixpWC0lQGjGCSTJmcvTdS7vr4Pp6jtEAPa3l9bqBgXeDQoiCAwwlKMYf7Qrwtm3468i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKKLaEBrn/GN32bc0frJMHgKPS0TGLdwKs9r7CG9W5kNooHsOG
	bl+hTYE7jzYe3NOOH5WwTTrMGLQJxhkLmDGkibicY/s1rhrDQ8xBdRKRiw==
X-Gm-Gg: ASbGncvciPRLZ+NxyTWkfhhewHA0VcLUC53+QQvF6IMVqjx38V8E4uGRZrRCItrgSx4
	7L7cyYeLWiLz/MK+duTyi8GsEUowcJN12QCk932FRenR5t0tp43+a+l2al03h57cXawShkmPlqx
	vAEpmCBNikbJSnwosPScIJjhCdFPOPFZFVsfexoVCYwFH6gzBhqnbZ++s8JSjW0s93o1RhYPQcG
	qHQiv6RI7GsgpA98AvCMXbay3IqAaOGYt51c9w8s6frHOmV4x1Gryzy13zkjphlSs3GyO619wgj
	Aw==
X-Google-Smtp-Source: AGHT+IHgnbQnEUIaghXeJJIHIooY98sEMbnfcpYYcwYfqaEl4McDlWqDX0fV4SfBrSMhn5fHfDRhBw==
X-Received: by 2002:a05:620a:3712:b0:7b6:d998:4fcd with SMTP id af79cd13be357-7be6323cc04mr2247831085a.25.1737324384260;
        Sun, 19 Jan 2025 14:06:24 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:23 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 12/14] platform/x86: dell: Modify Makefile alignment
Date: Sun, 19 Jan 2025 17:05:40 -0500
Message-ID: <20250119220542.3136-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add one more TAB to each line to support upcoming changes.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile | 48 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index 03ba459f3d31..d5718ef34c48 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -4,27 +4,27 @@
 # Dell x86 Platform-Specific Drivers
 #
 
-obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
-alienware-wmi-objs			:= alienware-wmi-base.o
-alienware-wmi-y				+= alienware-wmi-legacy.o
-alienware-wmi-y				+= alienware-wmi-wmax.o
-obj-$(CONFIG_DCDBAS)			+= dcdbas.o
-obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
-obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
-obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
-obj-$(CONFIG_DELL_PC)			+= dell-pc.o
-obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
-dell-smbios-objs			:= dell-smbios-base.o
-dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
-dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
-obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
-obj-$(CONFIG_DELL_SMO8800)		+= dell-lis3lv02d.o
-obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
-obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
-dell-wmi-objs				:= dell-wmi-base.o
-dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
-obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
-obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
-obj-$(CONFIG_DELL_WMI_DDV)		+= dell-wmi-ddv.o
-obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
-obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
+obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
+alienware-wmi-objs				:= alienware-wmi-base.o
+alienware-wmi-y					+= alienware-wmi-legacy.o
+alienware-wmi-y					+= alienware-wmi-wmax.o
+obj-$(CONFIG_DCDBAS)				+= dcdbas.o
+obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
+obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
+obj-$(CONFIG_DELL_RBU)				+= dell_rbu.o
+obj-$(CONFIG_DELL_PC)				+= dell-pc.o
+obj-$(CONFIG_DELL_SMBIOS)			+= dell-smbios.o
+dell-smbios-objs				:= dell-smbios-base.o
+dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)		+= dell-smbios-wmi.o
+dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)		+= dell-smbios-smm.o
+obj-$(CONFIG_DELL_SMO8800)			+= dell-smo8800.o
+obj-$(CONFIG_DELL_SMO8800)			+= dell-lis3lv02d.o
+obj-$(CONFIG_DELL_UART_BACKLIGHT)		+= dell-uart-backlight.o
+obj-$(CONFIG_DELL_WMI)				+= dell-wmi.o
+dell-wmi-objs					:= dell-wmi-base.o
+dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)		+= dell-wmi-privacy.o
+obj-$(CONFIG_DELL_WMI_AIO)			+= dell-wmi-aio.o
+obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
+obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
+obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
+obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
-- 
2.48.1

