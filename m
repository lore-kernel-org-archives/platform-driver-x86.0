Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB32C1A0AF1;
	Sun, 29 Dec 2024 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501662; cv=none; b=UwLYNEbKhvXtIS+zt5qjMQSvQcjXVQmdCfOIDgDylackLtgBZ6ndPJsi4WslqHaWophHW0lYhFcdnGOgL5UlrCJ6FTMl5RsOq+3wH0xpoPPp16eg1G2yGxpBblnde3WTtpN+ea2HMOkgjaEIBC84wWHkplXSLhumEfy4VCCmxhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501662; c=relaxed/simple;
	bh=fYOgJwgKTd4DHoTXBUjVryZrq6+FTwe5bLkfajCUcZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5jIJT6651/RJBEhaYJFtJtlz+QUVbqENkylcJZzBoJB9YOC0nP5sVmzcnD94P8YKogsnFt3ZcIKBx0SpyE7548Ev/Ai/z4mOlZg55RhqkaNuOGrgJswwjV+HVdeP52KT4I8VRXAnEf6sGEwFyotvxYw+zFwtyxo4lrFexsAXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkqHIM/P; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkqHIM/P"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4affab62589so2159125137.1;
        Sun, 29 Dec 2024 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501659; x=1736106459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzql+0NbG6E8T/ZwGnUcjMqpNG9BOV0R9Dxh4H3SXlM=;
        b=mkqHIM/PDcEZEHYgzncZvboGDBhk6e8BgIw1PeYEv7F99KkvGn7M1t7Li5yykMbM2u
         TDoZQnsxl/6wXWePPSP9YkZg79p8NFB1Dr6yCAPyqEEeV0E5/I1Wi8vuFP+qHZZ44sgU
         KHEbhWMCqgeCCdHVO9kmNssgSufROUrkC2EzRfQ2BPa+l/XqAni1qDtZeKSJ/Is7R/of
         CLm0I4uOOQoi1sINsquaU2uDjCG1gkEnTy4HBHVRSZqviEHYb2RewFiTm7cP7Lh9WMyK
         8Ba/10/Ton2u3CEYLL4NgbcKwyjsLhrECG35HzKMMFlxdqHIXryt+XD49KlM0V0Dnwys
         gGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501659; x=1736106459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzql+0NbG6E8T/ZwGnUcjMqpNG9BOV0R9Dxh4H3SXlM=;
        b=IYYcrBmrAJ4rIt/w8z454PSVe68ZgzBdZagv7PMLISw6MErTy/KHCoxEZe0gn9+a1O
         m3iLedj1WzIBAg5hQd23M0RP+4d8m7e8OMFwZfvshzQ6WaCkt5BC8PeTktA2u8/EKy9h
         Uz9fMJUzk5g0pD0r8AGAf4ywQrwX+Sc2DdVO4cw6E/fBKitVkCsyQ3D/Fr5CUcM5dKh1
         +Lxh3XRWhROvdCNzkqBkl7cpQUtkglb0cCrUv7cMrtPD64mZZk0fy/wjuR/EoxoCJpqA
         G1LeenJeLB+DV6zy4Bx+JpLy25fcqx/VDpyWhU7EvDzBzbF28iuYCAJGA1YthUdiSMX5
         dpAA==
X-Forwarded-Encrypted: i=1; AJvYcCX32258WfKUGmL6VxM79GkzOItv/R7VqQFdBXCWaj1LrIJrGiFz1b6VwPqgl1ZstpFbaaLOgabPKDQTszw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQ/i3OyzOsRSARzs2wiYWVLqR6HFdnzgEilK4H+RT3S23BVQd
	WNd1cTZ7kvH7bU99haHelR7YQ/q0eCmmDZRufV841zpZyKhmkixVQpt1OQ==
X-Gm-Gg: ASbGncv4qyh+fS0ApJO3/izNTcQo2/Jd6zRblFHPWcOcMrjc1NBdqHBgug9VzXhEXQ3
	hGa5Q/onz0TvrQS/uPtv/gGU/UQEWz7mkCY6D6qdm6KNF8REvzmewSBUZy2G3uY7Ss+fjAGdtcf
	sGp+DjKQiJS/7EISps69lxgth3TmBdPqler3hLATEJcNQbMHYZ+QP1drKUHX0H439LwvdtIRj2G
	6Pue681IQA2pGFtIqnIofB5604PAkQrz3ZMDxm1fYeooZY9+i0+N/8HIiB2mmQM
X-Google-Smtp-Source: AGHT+IGA6IViA5xdPlyOTns4/34lWCP4dO1hh+fWmrtBPqFsdmDlbsZ0dK/TOFwFqfzPq3GIxH/SFA==
X-Received: by 2002:a05:6102:15a4:b0:4b1:1a3b:a62a with SMTP id ada2fe7eead31-4b2cc499d76mr29776273137.26.1735501659050;
        Sun, 29 Dec 2024 11:47:39 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:38 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 18/20] platform/x86: dell: Modify Makefile alignment
Date: Sun, 29 Dec 2024 14:45:05 -0500
Message-ID: <20241229194506.8268-20-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
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

