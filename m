Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844371;
	b=iek/ZobibIJ4wRJjgHrstE4mNdeVSxJyWyqvj+LrBrbHr/0pkfvugRXTrr6vnn8T3c9B
	 KkQTCeXgIeXnJx1OFqs2Blcj8ooTYHFWqlmLxWxwOyjG5oT9HKj5u6jmTXbmnNBJ9+XG8
	 G/rN0PVtCZeC7y3432lNZii+dknnHCuNzSf9MkwhbwBSpFXOBABMGuKJ19EihhD78eMGT
	 MegrzRGb9cyw7/so9OuILuhje807kQFRh2/PvvNnnIO/wF+k7DWBGLwSd/bAWmSqb5k6b
	 fGSWIG/xBrpoiwSz90dIsYgig+Kmk4OFLoBOA6ubYVlN0E27d8BByTauFxckBJqJeuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fVIxw3KdjaFwPWNVyNJpp091xF6vEmNQsw9KKoomNs0=;
	b=YDO2+jzrzSHUmwDSDrCmq6Ux4+r+rz6aYexjRVDpCq0DE7KiW+m+O37WgebQ90sfn/aU
	 ozJ5/qLugHYXcUcYOuob6TWlfn1x+lhp8+DGFthBrGxfUfxLeE120ZozjFEDy8HYWGw2G
	 4E71lZDWRxeA776PVFfiH0x3xvkRP+0xMpNSK9d8NJhV41eTfJ2MHRBbTthlouI+dPwvh
	 Hg+ycS4RZeeddYTtudS3gfsEZMDEox18ideWv3b8pS+/0W/a5zcwW3ArvxdxhfOtWuTGn
	 RW0B7Y2BtOG/3cIKPxUPmkWXI/bz4x50y4yT19j1L+pRpSBDxwOJsbMOozU3GguqwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytUYfLC7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424E606A33A
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1424E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytUYfLC7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so18088685e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 07:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844368; x=1795449168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVIxw3KdjaFwPWNVyNJpp091xF6vEmNQsw9KKoomNs0=;
        b=ytUYfLC7AuCNwrjsVln9ZSKNSpkWPyvqf6elPKHS5kiK/eAqYsy2O7sUJYQ5x1ctE0
         Iri+d4ML4aCpHUbdcJviqyB3zu2/sxvJf17kxvlJ0NIRpF70deVM9ifON1zVK0h57h25
         qybHbBCFwtmJzuhwh6EkNOXYsgTRWlDp/ZAZKZek9yJZtHZicJ8M1i8Tw0dC9xJpgSEd
         C8m3ynVp0r41rc1tKT2Xo1IPNFR3eRT8R7Lwk1GcCzyuCuas/Gt7jSmG3LN0vbpfmDJe
         BWyQo2H6SxUuuXkRO4483aToPRWcW0oEkdzmkA3IuugZzd6VwKGfNOfpJVGBcvN7mkgI
         Cscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844368; x=1795449168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVIxw3KdjaFwPWNVyNJpp091xF6vEmNQsw9KKoomNs0=;
        b=dUK7tnS6IXCS23q0upiTM+7HMoTYO8xf/mOCOEXamM0qIXncgtNn7C4E4UMg4+PYPY
         ub/lj3z/GpQ/AgIWsaX4HLORdOwzjuCscwISaqUjVCMHQ7NU3T0413SD7jsKf9CEL5Qu
         yCbZkzEN83kS5x2qWNm6o+VZRqo1ex/E+eKcenxjUPsM9zt6YH4LJIoZm9v+fwICeVBM
         CGbeDGg1pblMCfDkofSFUxczb5oX0J14cGtmbMSh5LNyaZDmwmWE1HaLpLykrUIFDgX+
         UgwrVWactqcH36JWcUVM6Fgo/ecRwqV9ubbzfYRMo2u/1WhqpTa4OaJROkVR+VBQ1/S2
         dXXg==
X-Forwarded-Encrypted: i=1; AL+hErHG+Pdem6YcxvdZKLRhptf+7pGGjCCgJyFSQUYLGFaY9jBA4Uqg4L/Nqfj1zW5z5w8ebLQLs1WDkx6gsKk5Xh1rGB8L@vger.kernel.org
X-Gm-Message-State: APuU4Z+tj/3kI9UE4Nw7stWXqWZ53YXOUvavQHVkIbd0aQreFC7MPgqh
	ARjPUj8UKeN5gvMSaYvGNn6uwnc/yfAqq5e2af78Jrf5eh18RGJ/i2Kc
X-Gm-Gg: AYBFou1lQfnrpsk7c05tPU5HbPDIb8tpcpZMvwz7Zxp4gc8tt2VBJQtsegoIKAc3St8
	FUkLvCm/DhnYYN8jTojC2vE1MV9EE8bvEnX2bKRVywIxcff5haB/7yB4j7ScLWuJH/9fc/CBzD2
	iNzA40SsenUBwRYYmolSFGPyIuNXZOkZUKmkKgI8U1HlXotLqpld3WJrgAUiV4RQ2GyJU0J4iW1
	paNJ7L0iSLvyuEdibT6ZEBc1QWoSz7NFUtNsHMlJiRuXmTi9Ckr+M9vfK5LyTe/BQu2dFn8W+SG
	MYloKsPf8yPrFI1CO/Q/yfiNlsgbtcCd7UfNkkbONsxrI6GSKanZoXMC+VlsujYWMfMv6Rvc+vu
	GNRJemyU92MrIRwfN6j0zcQmmYEt8MHIbDBZkjVvaQeyP0ApT4JqSKrTZ6i157Hsj2+s7bAg6NT
	eilt/H9qWQGOcmwzgteDHzXRZhBrj/Ai4a75GkMkqnlCVPnpNlpj8R0YQ1Zou0/rwTSywRB2WfO
	anjlAmdfuvhBS9y4CjaiuwBYhGjw9yy5KA5u3bcKb1wSsTJdnV8IfelRPp0tCuozGwbzcZLECWD
	4EWUrA6P/IO7yUnf2PW0Pjpmy+PVDcwplXMfuKvMcI77Tn6sbb4aYSdjbGNtZOFR7rNSayGQ0qV
	19VxTeLCOXpG9BYOq6u0C7JWCS5I4xr0wMo/Z/SEX
X-Received: by 2002:a05:600c:1389:b0:4b7:dc0:89c with SMTP id 5b1f17b1804b1-4bb55ae7737mr228579805e9.32.1794844368269;
        Mon, 16 Nov 2026 07:52:48 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:46 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>,
	Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH v2 5/5] Documentation/ABI: Add sysfs-class-amd_hsmp
Date: Mon, 16 Nov 2026 16:51:47 +0100
Message-ID: <20261116155147.769630-6-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
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

From: Erwan Velu <e.velu@criteo.com>

The per-socket HSMP attributes are only described in
Documentation/arch/x86/amd_hsmp.rst, and have no entry in
Documentation/ABI/.

Document /sys/class/amd_hsmp/socketX/ and its attributes as the
interface for userspace, whichever driver probed. The historical
/sys/devices/platform/AMDI0097:0X/ and
/sys/devices/platform/amd_hsmp/socketX/ locations keep working.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 .../ABI/testing/sysfs-class-amd_hsmp          | 120 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-amd_hsmp

diff --git a/Documentation/ABI/testing/sysfs-class-amd_hsmp b/Documentation/ABI/testing/sysfs-class-amd_hsmp
new file mode 100644
index 000000000000..32da798dd2ad
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-amd_hsmp
@@ -0,0 +1,120 @@
+What:		/sys/class/amd_hsmp/socketX/
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	One directory per CPU socket exposing the AMD Host System
+		Management Port (HSMP) per-socket attributes. X is the socket
+		index, starting at 0.
+
+		The directory is a link to a device whose parent is the device
+		of the driver that probed the socket, so the attributes below
+		are the same whichever driver is in use:
+
+		- ACPI driver:
+		  /sys/devices/platform/AMDI0097:0X/amd_hsmp/socketX/
+		- plat driver:
+		  /sys/devices/platform/amd_hsmp/amd_hsmp/socketX/
+
+		The historical /sys/devices/platform/AMDI0097:0X/ attributes
+		and /sys/devices/platform/amd_hsmp/socketX/ (now a symlink to
+		the socket device) keep working.
+
+		On client platforms, only smu_fw_version and protocol_version
+		are visible.
+
+What:		/sys/class/amd_hsmp/socketX/metrics_bin
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Binary HSMP metrics table of the socket, as defined by
+		struct hsmp_metric_table in arch/x86/include/uapi/asm/amd_hsmp.h.
+
+		Only supported with HSMP protocol version 6. On protocol version
+		7 and later, a read returns -EOPNOTSUPP and the table must be
+		read with the HSMP_IOCTL_GET_TELEMETRY_DATA ioctl on /dev/hsmp.
+		lseek() is not supported, the whole table is read at once.
+
+What:		/sys/class/amd_hsmp/socketX/smu_fw_version
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) SMU firmware version, as "major.minor.debug".
+
+What:		/sys/class/amd_hsmp/socketX/protocol_version
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) HSMP interface version.
+
+What:		/sys/class/amd_hsmp/socketX/c0_residency_input
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Percentage of cores in C0 state.
+
+What:		/sys/class/amd_hsmp/socketX/prochot_status
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) 1 if the processor is at its thermal threshold value
+		(PROCHOT asserted), 0 otherwise.
+
+What:		/sys/class/amd_hsmp/socketX/ddr_max_bw
+What:		/sys/class/amd_hsmp/socketX/ddr_utilised_bw_input
+What:		/sys/class/amd_hsmp/socketX/ddr_utilised_bw_perc_input
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) DDR bandwidth of the socket:
+
+		==========================	=================================
+		ddr_max_bw			Theoretical maximum, in GB/s
+		ddr_utilised_bw_input		Currently utilized, in GB/s
+		ddr_utilised_bw_perc_input	Currently utilized, in percent
+		==========================	=================================
+
+What:		/sys/class/amd_hsmp/socketX/mclk_input
+What:		/sys/class/amd_hsmp/socketX/fclk_input
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Memory clock (mclk_input) and fabric clock (fclk_input),
+		in MHz.
+
+What:		/sys/class/amd_hsmp/socketX/clk_fmax
+What:		/sys/class/amd_hsmp/socketX/clk_fmin
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Maximum (clk_fmax) and minimum (clk_fmin) frequency of
+		the socket, in MHz.
+
+What:		/sys/class/amd_hsmp/socketX/cclk_freq_limit_input
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Core clock frequency limit of the socket, in MHz.
+
+What:		/sys/class/amd_hsmp/socketX/pwr_current_active_freq_limit
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Current active frequency limit of the socket, in MHz.
+
+What:		/sys/class/amd_hsmp/socketX/pwr_current_active_freq_limit_source
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Sources of the current active frequency limit, one name
+		per line, among: cHTC-Active, PROCHOT, TDC limit, PPT Limit,
+		OPN Max, Reliability Limit, APML Agent, HSMP Agent.
+
+What:		/sys/class/amd_hsmp/socketX/pwr_current_active_freq_limit_source_raw
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:	(RO) Sources of the current active frequency limit, as a
+		hexadecimal bitmask (e.g. "0x0003"). Bits 0 to 7 are, in order:
+		cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability
+		Limit, APML Agent, HSMP Agent. The bit assignment comes from the
+		HSMP specification: new sources are only appended.
diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..1e23f4e5c902 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1193,6 +1193,7 @@ M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
 R:	Carlos Bilbao <carlos.bilbao@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-amd_hsmp
 F:	Documentation/arch/x86/amd_hsmp.rst
 F:	arch/x86/include/asm/amd/hsmp.h
 F:	arch/x86/include/uapi/asm/amd_hsmp.h
-- 
2.53.0

