Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AF51FDE0E;
	Mon, 27 Jan 2025 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950688; cv=none; b=ktrL5uqrUfDzNuGsNTC1O3aXti0bafm41zMBz1ZqXveUMmLj6znDYC0uLSn4lFrvpuoWeay4HMXK0Bv+AK6EUZtfIaU0IePE+Z9GEXvOxAQxZCjjoQ8Omk7kNEP8n3Au8hDVyVJEpPRIB6r+KKEo9TYhEJyVd8A3eOESlAgdbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950688; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGoUJ+qkYioSFI5ILKi23fnOCj3KYOksdwl6IZzut2lhfoKD3PJw0khFaCiWK6CwSpt99Nv2PBlb7g1r6WtwDiyQHHriccFWZLaPf5hiU5IIZIqxxPj96+BV2GA/a8Wf548xa+rkTr6TmDhJezfSr5K7dnw2e+fS8vx6SSRvhzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqj58KhG; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqj58KhG"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so782624241.3;
        Sun, 26 Jan 2025 20:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950685; x=1738555485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=eqj58KhG8OrIWai6ZNQvydaduikMlxKCaepkWnd6MGC2qa4HjFM1B4Nf6nstAMhqhL
         Y2QuuEq2aMpRNaEYB/obiRjTfWA83ITgI05XlLY1ZyGO/sQjg2KmgeKUrzBI8c1wT/g+
         ZgcMvy66Z6FjyYG8oNRaPzyOW5HqksR1Fgga1OnCusang1X1RdrYsbDsCri7Nhu6qkrk
         9rYtDLqWNjRHdJ9AprsT6epO/MLEWc0quvJEfnmt/tO/S3mBJn11ffRRlh1ZARugRsCO
         jHKfLR03d11WjwGlARNG/gyfoN9jUCwQUGHMfbb/Ud8ezWLE31CohTzXkCWHHgFo1ZFh
         v2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950685; x=1738555485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=GysVHuZk4rC5FRYl8zaKth6r7hOUFIYKnwdgci9CaF7KrLFqt/12kGYaH/ByKgGoYU
         PNRe+3yb1D7Ib/TeTrgRGQ6zNQ9O2Evp7oE4/50c/Yk8l7nUkqmZ093RBoTmTaCE+tL3
         wTTLaEfB3phSWKDroS7tZawgcMKRiltKwD3xOZX23oNaFeqNh9k7OehVW0YY00my+SY0
         9DvINzHaJ3moz+U3XITet2xvVFP9GVeHMPORWt3PEMTaQGNqM4o6FBXMvfJ7l3B+aaIy
         DEkTUDZQtv+huCTY2Vekstag7O88Z2Of61FYKMlY8+FiDYvQsiW4X9vfLpSzF7Lj9Cky
         ZEYA==
X-Forwarded-Encrypted: i=1; AJvYcCWGj34tkTaRikEQiST/TJu6qthY8OccRpZ4OWX6S4edQ9kgdOpRpfwIZAzBnJUeRrnA8u7pnZwxi1+N0uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPWZ2NEkcL4yWifdWDJf2jhQIUYJpKofXUTSU4HNicQiFsVnl
	wbfK9vMamWFJU7KpaUoLx5ziL5gL8CP59crda8wt8i5h288FnYcOxF/eaQ==
X-Gm-Gg: ASbGncsLoHUeR2vjEVYeyX5m/+DAQxCIoDLye+W4AQfYIUGhLRNiNbG2VZpfz2R8wOy
	kd6nIryNNbzEb20dbRXxcrzfHYDxXTnEzGVVgPBTdxcYJdiOhxO7oyqeUubstqdH6rbIJPas58/
	iLt2X0rftC6BBVz/SQyFF/gx3Dq3yCl5AZiotNXQQF9e/IkV9dFpOZtHAT9UCdFDNpkeaI3/CVi
	FPEymuxsmAgBPvi2/FD60iP9MBiJs0V/IOMbmNEQEvtOOP5VcAsb6MsekJEgZQCQZb5Zs5lbdYN
	cmXs0MY48015iOYmiNv7v4o=
X-Google-Smtp-Source: AGHT+IHZdZb4Arnl9TZwe5WofRLdizcG8qJBa3Nr8k+/SoKgIymG+72aRa1mfgBp03CHgHzL4tjBdQ==
X-Received: by 2002:a05:6102:374e:b0:4b6:d773:afca with SMTP id ada2fe7eead31-4b6d773b459mr19821214137.16.1737950685257;
        Sun, 26 Jan 2025 20:04:45 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:44 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 12/14] platform/x86: dell: Modify Makefile alignment
Date: Sun, 26 Jan 2025 23:04:04 -0500
Message-ID: <20250127040406.17112-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
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

