Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715C1FC10E;
	Sat, 21 Dec 2024 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760847; cv=none; b=bQ6BBLyp7O2+PovuJruS0iR7+BSU1Bzf+wIB+l3FlKhwDWtIqevR7PeefWKdueGdKP0eN14jc6MtkweenoCRojdvwk3049Z+cb/nUcHKyLPeYmYb3HR6V2K2zsaRZVtdH4xWtba6fiEq4+rHF5oEbjE5tUUiOmwooHQjyg6CB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760847; c=relaxed/simple;
	bh=0Ol98yanXeWX9fyvOuEG32Z+T7TEskXKvNHu+TZpsdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQ3/LrDB0vJd5y33I+MjG7EYkQspJuVsXd/4lxydLZVyNVu4Vx8AnQn7lH+4KHM4DxvEKq+y/SWFT/irq6vKULzfNSqql3aWdtgqLa5tfP0+a/+93a48nlzlT/hJP8EWSKZNi/+yLqhgN2LFTTbbf1YfFw/xC6k/YMNuEKr2a3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX1ssSyp; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX1ssSyp"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f26c517979so18946087b3.2;
        Fri, 20 Dec 2024 22:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760844; x=1735365644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pE/mHc4880U3TEq+abwprJmPUuj7m7Y8jQWGzsnApFs=;
        b=kX1ssSypY0DCUQT/9w/wB6t7wrmtCLuhH1jwimHhH1uLEsxO3Ul8XrTZUDTq50DCKD
         21opWm2Ha+NbM068tcc2oiHBEdWWquZi1rcN+cfEbILN4TiD3o8PIupl9/QJuB50wMWb
         Lq+i4wmRAzGMkr3EYeNyCBnY0gPBhkbiSBw7NajHeVqRb4ANX++bZd5Q4ttJyJ40kMv4
         PGjmMFRnzVDe7TmbPtEMTnWi+Gk9+q2+VXYm3hjmM78wYehiRemigUEQgaPgGc6TfU/u
         sCHXky+wfyC2seX5iGnu3VglZF4Jx0Sl2LUKLr6GTLFJbHbusbivVQX0PJJH36PBavC9
         hG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760844; x=1735365644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pE/mHc4880U3TEq+abwprJmPUuj7m7Y8jQWGzsnApFs=;
        b=dWLg1pzIhFB8MOcfMsXUKkavlE0s6Ks04Pi9xL5ZOHWvURAiHwfNSqlihswRsDXcub
         Nwg3d5wvagIHMZ5+0Ps8vHKntYuupY9NUs6KEXyTSFRes16pMUOPSleC3F0pGZVQpYuK
         c5bjGO2CEQ15xS+m9Yq/CIa6dmWgthGGVswGN/24LJagDfF7OwitSgGWkPmcptM1H/d+
         fFhzbNkUckDxjzXeIt/AQsNPMpQ2kInznoCH9wg88BGg6lBCsScQl0/dVsjMCZo7eIA+
         eJ7IFTUdi9SariyhKQByaZ+DaicioyzKeMdi5C97SswAwVzIQd73YUKh2TOKPPlpgg2E
         rk6A==
X-Forwarded-Encrypted: i=1; AJvYcCU3DH6Ow62xS1mTynkRfzMCNKuO5KCj8UDitv4JbS+k+Lk1EWkUZyis/boiO08B9iXkbDPzyP8tMJmw0eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvrzYhn9UtmVlqGdcPKCe/njV9lIHUxcgBLY1wyVBL6nrqbfK
	Pc1ChbcTnZvyQT3xqQUnUf2u5QFpN5yaBY46HyWqdvAxODrShciE/Y4RTw==
X-Gm-Gg: ASbGncv+DEFDemuNPHE+5GdzOODmjjeIoIqTJSj95ub6RQFk5TFbWqQVeUdPI/9nMvd
	nbjUwOHHRLkLegIWOUffehWrarrsG0/7X/E6NHqW0Ke/f4463y89lhriKtIF1fJ1YZ3qtKG7wlO
	6+TdHzlJb6fzkQLebQqfeK7uScgmfmJbkz6zTS/uAU3+/9G7mFiYCO3DPl2j+EFxDbHHu/TKlmi
	VyAYPm0Cf6/kUYz5icUth8nHEJ962ApiiYOvk0nDxUbfm89I2P6uVv6HsdoFGXU
X-Google-Smtp-Source: AGHT+IGfzR/Es13SIC6hbrczZh+5y1AapA4IwSz3o8FxxDX/AGInVgaBFzoY2a67Vzu69MSibluXcQ==
X-Received: by 2002:a05:690c:4983:b0:6ef:4fba:8158 with SMTP id 00721157ae682-6f3f7f45af0mr42053377b3.0.1734760844194;
        Fri, 20 Dec 2024 22:00:44 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:43 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 18/20] platform/x86: dell: Modify Makefile alignment
Date: Sat, 21 Dec 2024 00:59:15 -0500
Message-ID: <20241221055917.10555-19-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add one more TAB to each line to support upcoming changes.

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

