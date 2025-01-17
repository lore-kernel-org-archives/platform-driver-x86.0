Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDD1F9EA5;
	Fri, 17 Jan 2025 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101702; cv=none; b=rXzcgt9JhSkK4xUIpd1yGQ6Z2kNzld+YxfbAB4yDGll+ArxrbhlpeeulRT/vmpF70l+DIsuBR9idqL6wpm3nyhBKEu/6BgFtWINjLk6XrFLi+RvhyHG3gnazahQLTKfzMnB2imUydEVvXXd05PSkugsp0zDE4kXACGvO5kGMa6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101702; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvHECiXOFz+vhFhLV6KUT2D+1pnrPtd3BIY977P47Pl3jPhzNv6xoCcTSuLUmM3bzGLdnyKEw5/E08/ssviwMmVg/Ohf6pFTe7G1Lyr9g8LhqVicjND1FPICX6f0Cu7/T9TZhnvCpp+1IZnPn3lAUr+2ywfmar1xDbPYez9SMG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UC3e24NT; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UC3e24NT"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so489122137.3;
        Fri, 17 Jan 2025 00:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101699; x=1737706499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=UC3e24NTe5TsvsbKD3vLLcqTDQwIMAyWNVrjN2f/qEKaZt7MeGyQ3xBgU9N0QdyiIM
         gxXVx0aadA303u3hsI7548hHe3NcIjvgZmBCW3ZIZy66jr7UGTe5VHwUEmLmIjYAIql/
         fbp6UgcJBXIKJa+62g7xJKU3Orl3a7vZitbHDX3rRBzz6D/vbKUUwJUkDgx9lnDe68I4
         tZFoDKXfRSCDpbourOwJwRRN3W7YDDgsnIG181HgX+5L4+HFMWDdP4T6cDOLsCUWICwt
         7HzQVmQ3sLlWK9z2NUQP7wgL9CKpBRq1ZjsXDlZTJzL9OpGdG22wah9SuPYzP5dqSvRD
         5WmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101699; x=1737706499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=JYgmDr/5XKdF4kRDu5nChDXY3oTQ3Oea14QUU2UPNU5DnSzP+dHolMyOja76gD2Pq6
         vQMhGy2/WBB+XnBSw+tvx46UStOLNeczqk/NZQHHbmQoQFFEhXZG1qrRUO8OS9xB1CVY
         IePeEG35k5qksRchFNCjxWh+WQ9hdYT7+TDlKOJxK420POBqQPAmoa+0KiqdbPrXcawk
         tyuI0ITk43itwU0QC633Gc1RXLUQMWSonwLGLji5oTHLckjkRFw/bxMwMUBhInT1/nM6
         dpjG92oUZh5qdNcWl1XM6JLplyKCB/iHxip/+K+KDuDvwSjCtJ7bLLmsmwOQKiqgiRyQ
         Riqw==
X-Forwarded-Encrypted: i=1; AJvYcCVlM0B87zzu5zu+PFO/UlgGDIcgubShEOU0LC5WLGfMhE9q8a0m0OeftF7sDDNgR2mfMeFOOvluj1N+q0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7PKarEU1OV4ZkRc95D+gsYppVQFq9i3QLUD6PpAUMoTgc6Bj
	Ox8yghrvNmVp6rJA/Z/E39q6SYrsKSgnYMEnVpMpBM7Q1FOnO33FD4YuJQ==
X-Gm-Gg: ASbGnct0et/eGvFudMPiWmDzF5tdkggSEzuh8hMS4ScsW5OACBF9HWB8rZxz/nrqbo0
	tAuEVl4d7zdM1so8Dr9N9M25KQgQ/BvAPNwpnifyJDAADu38gTTxDnAlwJ6IaWFdgS+jf3GKCOX
	I9A/JtUcAVuj9A/0ZwtPBrzVWIERWMRxaAIgG0BYZMUuel/OZClSe4OFW7isF3k4yWILOOjlKr9
	EsbeyvPLcvmg+yMmtbwBJiJMYpiLxl29cKeYs2SCOXIbv9ulcxohfMywhyJfmaC
X-Google-Smtp-Source: AGHT+IFD1wsRr7KY8kBAJobLq8HfINh/l6c75joRmgVDHQooLbLmbhI8Agep4AHDPhIMFByPz2J3Sw==
X-Received: by 2002:a05:6102:e14:b0:4af:ba51:a25f with SMTP id ada2fe7eead31-4b690cddfeemr876564137.20.1737101698772;
        Fri, 17 Jan 2025 00:14:58 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:58 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 12/14] platform/x86: dell: Modify Makefile alignment
Date: Fri, 17 Jan 2025 03:13:45 -0500
Message-ID: <20250117081347.8573-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
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

