Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BED1547D5;
	Sun,  5 Jan 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091112; cv=none; b=DoK0/OTTD5G9rSpXQxApFUCEdbaha/jE93V60yiLacY6/ADnVDlgEc19GyDeRpZyEYAGmI3wTPh+m4Zk03gvAMNEbAp2B8+qNvzZ3djAvMSb8EB/MUQpbaiYoFQyZ0mcLRH1bzTMOQ5Rh8glfoTUvr24AECmpwhpjRfFZ9l8k0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091112; c=relaxed/simple;
	bh=fYOgJwgKTd4DHoTXBUjVryZrq6+FTwe5bLkfajCUcZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzNz8X93NSTtQoKF+9355UdyVG5G+k2/vsKfGVmXI933v2yc40sBFXOmsvkGGYrHVQmUe3rp5PSZcbEjvY7nRhTyFzUMXxuA9Rfb6ideeE1nGlVCBGi8219wNMSMHD8267tgFIlEUqZLQVKCYUDesU+GT0v16rU8DSFbuC9U55U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmNfPLqW; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmNfPLqW"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c559ed230so2350810241.0;
        Sun, 05 Jan 2025 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091107; x=1736695907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzql+0NbG6E8T/ZwGnUcjMqpNG9BOV0R9Dxh4H3SXlM=;
        b=KmNfPLqWSE+96axR9a+0k53SzLEdXoaJBjHfSSnwX6jVt6zYDPnGkpm6KsrcGnUyTb
         m01sRR6aZ1gmItXn9raVfeVtVF4LsEYHJlLfGcksS+C07tkjFjT8NVPrmaNO33X7Ya8j
         1wXNg2vEI8zog+2HINKO7xs5OIp6EEgt1uokorvtO1oPNajq96LsOReC2EB0ATPvqs5h
         k2EuHeeUmhK+4SrF9TCRyTb37ZM0CrZeVykKXR/64Lgc9wy3AKx0X/qy5S2xbubVC/Uc
         EvMEBrmdVkVdFxD0ibIRhAFzt3aimGra0g+TOvsKddSTM5PZQKvD9PoYbsRgRHtuKesl
         b/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091107; x=1736695907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzql+0NbG6E8T/ZwGnUcjMqpNG9BOV0R9Dxh4H3SXlM=;
        b=k0RqrTmjlJkTbQXUm/yl+BpQVyvk0taEGAvotpVUTutYiWn6aUdl/oWJOh7UkSsCBC
         zfkj4Es5pt4YwSiLu+xskNw4aEzRIoTjqvkGT8HplYC++pGzYnUfvJ+O853H8eEG+FVG
         DmWbuqlSsvonrV0evuYWgF0d3xumPzfLay+HuhhMKxx8mh+xcf3ec7rBXPkMo3mV5CMV
         VGr9XHXuTa0KhxN1RFuDHVwHEcJag5Nx8AEqnMqka2BrjZ1xlodMjztG+xKMJhWot5r2
         PSO5hg26XeMiyBquWNLx8/9gerZUSSS1X31Mfd+cpDbreEdusHUzI5Vn+hXqSU72U5ec
         tGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV17HTm3MGMa2i4vOiBgwC1pDe0PskLziwlUu9uSrtZjQqgmp0nuwFPIl1VwZESKrQLsJGj/ta3QQHanHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9a5iBA4taeQ2zZRnLSjQ8nAkMK/nIZx42M6J8lvwjgyNKjcZ
	/fWrdtE3PkZLzdR17EmlsK7lsGkGTsc4ZWv3JZ5K6QqrXb84e2j3lZXwgw==
X-Gm-Gg: ASbGncuO4WWhKhRJIFcKqPLqmIbJ8rlCr3rD2s2Jt6ziWJ94E9SG0/qXLgUpmcNervD
	YMTPSBK9yxlUNh9N2YdtME3B194i8EjCyKLFN22iy//524DYk00qPeEFBfjsdE6oxt2nyFYJ20N
	kK4yqrVtOBxe4hZVtJvnDLnGzEnd1isN7lFgtJ5PdefFbEs+O4venCTktBlLyjFv7n+3I7TqyCl
	f/GPnhfrxhoG+cXgeb4hAjsticYHPZrUO/XOPI3AT9I3l+lU194LmTXIh9ekFyx
X-Google-Smtp-Source: AGHT+IEZprA3yFTSzTgbSndK7IxZvnAk4N6fmNSFvl/ydA+DdDmb0rtekZmobaf8UY93Mldix1EZ9A==
X-Received: by 2002:a05:6102:e0e:b0:4b2:9e8b:54c with SMTP id ada2fe7eead31-4b2cc488c39mr39705561137.24.1736091107577;
        Sun, 05 Jan 2025 07:31:47 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:46 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 18/20] platform/x86: dell: Modify Makefile alignment
Date: Sun,  5 Jan 2025 10:30:18 -0500
Message-ID: <20250105153019.19206-20-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add one more TAB to each line to support upcoming changes.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
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
2.47.1

