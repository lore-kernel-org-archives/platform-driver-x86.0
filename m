Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F4E37B02B
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611591; cv=none; b=XEL8sRmkS1JXa/j48XDyDJHf3lz7ivPWpwvgTJjQSsKr6L4sl933+RlaVGqGHJC8N6ieZeYhgFbQlJGyJlc5D3MaaR+VUMnvUAf4Z/m5+WMOI45rqgZ9N2GoiaHw2GX8XKOVIjxqmT3KKrFO48tUBZqjvFbMfNNb/mlzpDK2NsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611591; c=relaxed/simple;
	bh=p8ZMDL0ATelD+YMbWy5VJVld5YBBFVddDlr5bIuy8jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKXCDRfeoNZhd2XusBJIeJg9RX/IbHOJq20/oiWH/96KrBr+JmfuowF0XhHvnXOaeXfkhfv8kBZEXgdZyxMDc26tobFDjst6v7N4yzHPfboEyiOCS6wC0ZAqtyZX2xG+xv0aH3vrsDCCkhWxR8dntzSU6a7ugIS1kcGXpf/YNtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTmb3jm0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTmb3jm0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35a1f549e7eso1746927a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611590; x=1774216390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShhDALn1OVXt830iNpmwt2NWXRAroThv+VhHPtCxAKY=;
        b=UTmb3jm0wtNM2hMgYHM8sRB5QxTjtm+tIQxjVuNLZh6EdRcKA34X4xS3R3b9PjQoxE
         qsVJJ8OMSJ5leZmqvgbHRIgKTr6DDnjlJVX/DZ8tkQT75NrzMR6pk7CY0WhqonPzBBJ5
         DZXjKwHIk+762BHhMGwzstdxddevwP/qdG/HSXJ7fYtJerf89+6sSRcqS+GKsw5YOXl4
         Pgt9gM0kHcDwzOI2L92iy4drr6QXK+LUnf/X9OpJ6Wia2j6VXPxFq8IFOoOQB5E7B48i
         mg7a7W5pZgUvIHYHXfgfbmovixd/iVQhfvvoKY/0hxova2FtUwxe6GpvZtfpmAj/9VRH
         WdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611590; x=1774216390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShhDALn1OVXt830iNpmwt2NWXRAroThv+VhHPtCxAKY=;
        b=LubiJ62d+EiwExr3LcGSq6M8aj/GoUN32TXCB8sOu8pNFdduOEPRAXryo6M+xZuXnp
         4bo5EY5JL/nWNI5Jmut3brQQaXiOnOyy8pH/WU8kOqarmGQHoHTX/01LnRUZz3ymZP8g
         kLrH33Wbw+Avk3ecBqp4X5LpHbGxDAyRaFy4t4WlBwh9B8YkH/R3UjksxxzkJr9kdiOX
         ut9npH/0OeXIjbNdtvXP5aIMm48bzPmbC+dJ/AmyIvf+T849INeE2FkcFmX0G7p+WI3N
         gku8KfVOgp+1xW+lgtywsO6RHZP57U4UdXtwRLeAt32PT8yS6PjuvwZB7H+dvOCRHdDf
         56Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVRYMwhDqVS0VOWSwBVDGwU1v+cVCVH4kxVE+lMeER1SRPemf1CXf2tPCpef6gIKG3fNkZQ3nthLC7LKZU+VukyUlqc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6pVoSIxPCgqR9szm/sVJ66n86XB4SRYnfeq86M7wcKrnVdpF
	hm2Tih2A2K36LzKbTA3ePyttLb7tbu3UiL22k5DYQK6NyioNt5oU6ZSnubo0
X-Gm-Gg: ATEYQzyPyxPDrLFAwWbJ3VY2JTK9A7yUzkNNLx0pNPboYIootBMBVruzh0DG9iX5Hr9
	3FyfP/czxByzVPD1ZynaLcpXS+46By8A2SsAwuXH7ea7rZ8nRxg1my5QohbD4W6cW42pRH6r7Ou
	uvSWmcW7O19KL6W5k5KoNmeahNaNKkxXHSP394Ujq9znWkA9gc/f5HG8zV8315k8eTeQsEuVfNz
	9sdo7ZtFu9Dxpflsgy+/FgN5qj3+qmCdOyj4WCAbuiAV4BPInMfyqCRXQSUHTTLvdZR7t9RCCEg
	0YDaT0nfPA+ETH9a8V0R0OjdQfdPjCwusJA0wbjpEdMZMO9mNZKO8l/UK9N/RSFGDzUbNwLNMPX
	w2oA4osiHoonUdS2mgxBLrvE65C+04C1JNu2CDX+yHl43u3xokW4bXcEXZDTlWmFAuh18XzhDPB
	InxdJNk8ff2oRi83lJplxvNZIGyJcV5pTpOieV2wC6YZDo8y6jocXk1+pYPxC9l1w=
X-Received: by 2002:a17:90b:39cd:b0:35b:9a95:dfb0 with SMTP id 98e67ed59e1d1-35b9a95e3afmr1981652a91.25.1773611589949;
        Sun, 15 Mar 2026 14:53:09 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm3074980a91.8.2026.03.15.14.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:53:09 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] Save Brightness on Macs
Date: Mon, 16 Mar 2026 03:22:40 +0530
Message-ID: <20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when a Mac is rebooted, the display brightness does not reflect
the level used during the previous boot. Instead, the brightness is
reset to the value last stored by macOS, causing the system to
ignore any changes made since that time.

We fix this by writing the brightness value to efivar 'backlight-level'
at shutdown only, when it is changed since the last boot.

Changes in v2:
- Saved the brightness only when it is different than the previous boot.

Link to v1:
https://lore.kernel.org/all/20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  efi: Save Brightness using EFI on Macs
  platform/apple-gmux: use apple_brightness to save brightness to EFI

 drivers/firmware/efi/Kconfig                  | 10 +++
 drivers/firmware/efi/Makefile                 |  1 +
 drivers/firmware/efi/apple-brightness.c       | 67 +++++++++++++++++++
 drivers/platform/x86/apple-gmux.c             | 21 ++++++
 .../linux/platform_data/apple-brightness.h    | 20 ++++++
 5 files changed, 119 insertions(+)
 create mode 100644 drivers/firmware/efi/apple-brightness.c
 create mode 100644 include/linux/platform_data/apple-brightness.h

-- 
2.43.0

