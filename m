Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265642;
	b=qI3TWabxo7IO6atjFakBO+sikCMcEu+Ja1hQcvpEGP6hmqWgunGUmothZzyEcLTMiy6R
	 OpFu9ePl6+44uCW1/iSFxUb309GOQE7Ec+3xzO07LHhPS8Z8hS7l/QFt9T1z8clIkJ5hO
	 qdvR/70jjjD+nhC5xDIw+bggUiIvKWCjr4XuiJT0IPmaOpFKRbBsLQeHwhOQe+bFQQQih
	 w2UrRfWUoO+5H5NflFL9bH98NJFkKz5Fv8muWQ8PS8xT7ad6jVNMVXrsnQn+CveXc81Mo
	 WKETEX9UKIjbpyy6DDo7aOy1COgJLKNUTQQHuyyD6ZS0riTlMnL3/XHNcTgRPzkMOkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FgvFBR0X911CFkft+m8BaNuu7kHa0PuRcgZI2MmyPWU=;
	b=3od7DNPyRrFtRsyO38x2a6O+ov47TVY9PVqUSxrhEmb8CPNx8sDHXZ2aaoq6EXo3iyWq
	 shWMTT6asGr47SwYjztCErziAoAf1wcKp+nxIG6dVErdNrdZKaMczaJA2nhMl7ga5Btps
	 WFyVsaVJpZmPUzy5UKqu+p1x7DCDiN1l+hDcK2SelFOomrVms8hZYnf2TcIFeX4sq6VOW
	 cCfROsERvdsO/UtcSFmYfgnu18ihGUsg5fUQG4rVXzWHpJ5YHkYevwozSwAGco/03fGb/
	 wlI+Grk/WCyayBHpg/HANOBrY+BOmiHFFypQwlKcWkTcplQBN/RKa8i8PrWHNLvb7dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z39VZU0d;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58E606A320
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 12:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E58E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z39VZU0d
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so6536875e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795265639; x=1795870439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgvFBR0X911CFkft+m8BaNuu7kHa0PuRcgZI2MmyPWU=;
        b=z39VZU0dqtn9kYyfaDyAKgib3xIksgKtBeCjirM1HX6p41OyYALNbz1anmDI2lV8LF
         Er9SMg2QxA8pNL0XSCDYLp50q/ehl6lm6xmPAjJyQVdMVw3nhODjnd5YFEKd93DV8cVE
         ewCsLFReMnfVYa2rT1INKMu+Deo0yNvgCIhpJXm/rZTvRfej8J0T8vX0EouyRm2xr25f
         35liin1vll/j4c0WcQh4FiACL0sU88kujT5RMucj+EsoG4i2oNdOpHZR+e33VkKqQNcA
         XxBDviTStAyGK3xU7B3UmZitisOjzCleyhmAGtXrx0Ekv9cHQECCED63DgpR8bQpurn5
         iutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795265639; x=1795870439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgvFBR0X911CFkft+m8BaNuu7kHa0PuRcgZI2MmyPWU=;
        b=Qch5AwXIjxCl86O3RrQRi1K6bsNVNyfObjHT+1P1xfTF2ZfIOar66ue7gWGweA4QVx
         3wkPjsFwFXFlHDglBLv7/RDbvqdG1jHi/vJq2ivz+hn8IqAXS/lrq1hAxVIM8hBLsG6o
         PbC8s7UEC6n6Tuoa43q+GBL8b8o+Oq1t7p9vqxgKgtfntHdTHma16oHvrsclUUHW5W78
         /CGUGeDDDlJKeHN5svR8RDXb/tPzV/2DIri3+N4l3qI7siKdHYBcTgZOphPvAQdw7J2d
         HZ1Y9AmT8z8FMP3ba1mbnGyFt/c/njgAZlozdSc2265jyDzpx1T44JmGqrOaHfJc1kzF
         q7zQ==
X-Gm-Message-State: APuU4Z9FOJ+EaXkrSNLOCeI6At3tIevzcSjB9S+itMn/yySGPI6oas7c
	2thz+2EPDLePcGn8NNqQY5dMR+cDodvhPGzWPqEN1cWuJCJfu6GY9RzSWbMHer/LBEVNEw==
X-Gm-Gg: AZFdTZeTnWDs0Mo54tfyuNHxTFYYSi99kqyK5Lw83ljxPWwX8lbOaOEw1Q9O0kcomyg
	fgR9eNgOnx4k7f8PRyhoFZSEhKJzPBvs/Unj8sh5MPHV+PLV8FXe/qCPnNSs1TLnKUddmDCM46d
	ZGevnK3ToKbNXgzJ821XeprXnP4ZHoOI/j6UegWtwAIk6wOgAd5sB63nGPw5NG87tfDvpWrdsbt
	NhdqGvd28B3be3lsw2ykBUWXLT0Ytld73tFWT1gket52cOEn1OMXZLYoP2cdv0c4whpOICOEu1w
	CuxhH8rfx7dB90Uq0F1I97Q7f4eLveQsBb8zTes/OYNf1UKHyPBVdzmK+Q+NVvLt3pIE1zNsG9Z
	fPbSLN6n/RNOnve30PDO6FC+2JImkPVyZlNKqD05vXgKcvhm4Inqr99pg1k9iIwUWRbgo4gf8G6
	bua5KNQZMkdL4+5F1dwnfmEIzQ4zvQoEfDBvYGCFw3Km4+9JB+GY7TKrPx9bWOWt39PmZf83Ibf
	qlHCqypuf9c4xC+5HPRmh9MsdsKECglDLLakXHcvB/meerT5WeJ6o1w5kUyGUoqgIcjQXOU+GIi
	TDTjXcH93YAhS6GQO+AgUhIdIPGG6xWrVkhSKPesnzCHdw==
X-Received: by 2002:a05:600c:674d:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb88808263mr145949025e9.14.1795265639269;
        Sat, 21 Nov 2026 04:53:59 -0800 (PST)
Received: from bullo-XPS.home ([2a01:e11:1020:c3f0:892:8c82:19f1:6d0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm40009215e9.3.2026.11.21.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:53:58 -0800 (PST)
From: Bullo27 <matteo.bulloni.27@gmail.com>
X-Google-Original-From: Bullo27 <matteo.bulloni@mail.polimi.it>
To: platform-driver-x86@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matteo Bulloni <matteo.bulloni.27@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmc: Add T14s Gen2 AMD (20XG) to s2idle quirk list
Date: Sat, 21 Nov 2026 13:52:07 +0100
Message-ID: <20261121125207.12284-1-matteo.bulloni@mail.polimi.it>
X-Mailer: git-send-email 2.43.0
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

From: Matteo Bulloni <matteo.bulloni.27@gmail.com>

The ThinkPad T14s Gen 2 AMD is sold under two machine types, 20XF and
20XG, but only 20XF is in the s2idle quirk list. On 20XG machines the
Lenovo BIOS SMI handler runs during the NVMe D3->D0 transition, so every
resume from s2idle stalls for about 10 seconds with a black screen.

Measured on a 20XGS08D00 (BIOS R1NET68W 1.38, Ryzen 7 PRO 5850U) with
pm_print_times: every PCI endpoint's pci_pm_resume_noirq returned after
~10.32 s, all finishing at the same moment. With the s2idle_bug_mmio
workaround applied for 20XG, the same callbacks take 38-82 ms and the
stall is gone.

Cc: stable@vger.kernel.org
Signed-off-by: Matteo Bulloni <matteo.bulloni.27@gmail.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -56,6 +56,14 @@
 		}
 	},
 	{
+		.ident = "T14s Gen2 AMD",
+		.driver_data = &quirk_s2idle_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "20XG"),
+		}
+	},
+	{
 		.ident = "X13 Gen2 AMD",
 		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
-- 
2.43.0

