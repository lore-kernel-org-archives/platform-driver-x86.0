Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733252;
	b=IvhwBth9UIwbrP8nl+FnevUtQlLAWoXe2P5vZ3spbyxI7iUtL2RZUSrzRBPC5oQ010qr
	 Vox9DXYxsCMGKR1tSOdm+fyamkcuzh8qEZHV+JH42p2LHs5u+RfLsScLEn05m6ECLTPF3
	 7ATWIx3DalPbtyX9dKc4QV2RzptI8m8b5MtpS/CabB8+3F+OAn+GrJDYXLqxNrnELrC17
	 naoNvo/zvJ56VdpSZMu2qYg8OgZDvvyNPzpklul1S2BmMsjDQk4cKruxTWMCmIkO4M87n
	 zCDz7ndxWZUE6NywtHWzhHr3h40dlfjAjXvHiQTOmqHqh8RUTt3U4EziLd9AcMQyTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HY73xKggEzfIdIfNeMh50oTUfXwZiTldS1Pkgz9mLq8=;
	b=ENduflWCvX9jzAUhSqJaN6bb0YULBwh+uO7cQ9uIJe5Vbks8QQVVnhmg2Xug/2hd5rr+
	 ifkcJfVBOdIZ2oKhiiqzz7OSWKZfE2PqaK97530yR0IWCzrvWhPeZ0bD1J8QiHrdcbkzu
	 dxv9+ZjOaKtY5uDAOZTk8wwWZ8e52JcaBs8F2+xgrFSdqNbUaA7CJ2cbOUhlMM0FPiMFu
	 CnE5Mta4ACPjwUAi/LpBHWn6pdgXUl/CozzmFonBeqGP5wwN1yDXOs/MiP+l5xdF16hiG
	 cQm4tbf0JxKbLMyXgVqRsyCG9LaDvjtthJbrCH0X2gVQ/PlCQcVuyNFNKOlK9iWaFYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VIh7nUx+;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF95606A31B
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 05:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF95606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VIh7nUx+
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4FFC40290
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 05:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792733248;
	bh=HY73xKggEzfIdIfNeMh50oTUfXwZiTldS1Pkgz9mLq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VIh7nUx+JRehjUimnHmLeWrKIsxe2VIhNKw4tQ2ktK7i7q30f9uFSvy+eZwpAAvwG
	 sMTpAvxIymhawyl9XSc3uX7odUD9pviFLswdr9EqWoUTe309F1V9v9dUZJbTgnSdQz
	 4xzS+elw+aPneNGFtqWsbAtOyDXbyz1HyhaPr8nh4RJXICOBk+ICJBXgEXzHx9IHns
	 ooNXtEsMt39m1CxIuG+lTISX3s7Vx/bsMwuMqjGMIUANJON65H5Gl246g6XsLs1ixc
	 z42h9EBrQzEvafT1ljSZt6Q32pCDxMbkbbY+FpJEk4IwrZhKM00iYJd7L6uj3XXg79
	 cAUMa9IGFr2EybBlp5MUbedr22ORWbcVnOHBjCoPI9hsVNCrU4hNvCLpeJV14lkJVY
	 YcSICQZwFiZFUHwueGr0lFNb25XZNvR6hiSoPt5n+iqHfp09pcjqcc5sM7ZZp35QsI
	 3Kcss2nNb4I74xyyYcH8PjRo2uLicEEOBrTZqSGItkv9e8+YU2US5LqxT3EXzCxdNf
	 xpU+vJ3z3cdFASx7CNQ6z7QtldwQIVa2ZgCsMlwi8hdcSC5GTQP7edgtda1sR4GJ8t
	 dVd6VPAFDiSvMs4pvVG/PX8a/BLDTeKYV+HaumDC8fG7yiDfWidNujhlY8tjt//dsD
	 QIWiUlftosM8Y8iZCjCgaVwc=
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35935fae332so66222eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 22:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733247; x=1793338047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY73xKggEzfIdIfNeMh50oTUfXwZiTldS1Pkgz9mLq8=;
        b=mSkD271UL1ZeKQ/QzAY4uhRoIbM/OvN+28YqjyWoGrOI0rvzjEibYzvmgI7Y9kRM/R
         pj7l9Uo2BpUw/kgR3hzp9fvGeNiyiJ1Ch8meNjgRG/ZGI1SaoSAm34JhqX3dhXuISp2F
         A81mJ/RCEVS2Hl7jfhMwKhF3iNyWh2BZUm+ctfZbk9tmbsnwK/sBx7Wk88NJT2/0F47G
         nCItgy/pYZzrl5ZjS5PVlpoQrx4nwnoiry5SD8F/0pfYgyJ0IiF9TeLTM6BUVwF1iexa
         abOWIliG6/SOIUnCRu3J2UkysC/RWGVX2haphx0KPZDmAOqoyluEOdALmj+VeQBHCKkm
         039w==
X-Forwarded-Encrypted: i=1; AKwUvByzwVSbW7Y3UsFjmGrdr//EgYhdRUfbomMn2aeK+BHQ6OZMeebTWEA87G/oY57u0uuci260pZ05KDgnmI748nOTjl1i@vger.kernel.org
X-Gm-Message-State: AFq9FYLLVhRFnlFZjl8qik4JRMCEYTNPBWagFp6RqLlYA5sj7rMW7McR
	ZxsGz7kHe/XrvG5ri1m5pBmDSJuoMDI0am1sCBwI/4BDlaG/Pa2t+6poiCVG0XCDHEDvKjfdIPr
	kmZddNiJEB6FusbdP/ZTAE4ErjZWUweaDGsEQ5jsCyiYIc0515evT5VHrwHmUatQAeVhci/mreS
	nCpgqQSFb1pS6LYsQ=
X-Gm-Gg: AYBFou2flHZH1bxZH4Axa2x9Vqbk4/RTsDZk0gXxRUXjjOpvS4i5DPKmQ4foxN3cgoR
	1TIzqXCwbCHNPJobxsakDVxXsft/q4CMc395VqkhdUhbHz4iOmh7FJt2DKWtNRP8HwLfbk/tDk8
	4TWJiGAYTdewphHl/VFXBgHMJglpFCz+vzlWD6xk4lAZyyKh+yYU/Gc40d4qpKXYS+zZ/WopIYZ
	1plG6s+LnyLkRaDnqbaNi/t2Hhbn+bpui2Dj92smHXD2SEPs8bQMFahhqRwWzg/A1fRDGOf2eyz
	0STFxKPagRPx3so0x8sVmMh9h0OS5QcayDf8Drg4hGUwHTTJXpSy+lQwEK2wZvavUc9hcI9OHKr
	p6n0BPBtY8W3HUB74zibb9czsQdZJl4sxHadyqCHQKQASYsN4IOsVrfDSTHlm/nX87KWHYMx9k9
	oMR6p0EeJ3V1GNGt5yPUUhSboutQ844M4EUyQu0/iPZfYMtxkgXURZTcx6pTZZh4Fr5bXRlL/5O
	4deBL1ZuRnPfNhVWsXyrqRSDB540orGGOP7/SfekGY=
X-Received: by 2002:a05:693c:83dc:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-369d9721136mr2912007eec.1.1792733247163;
        Thu, 22 Oct 2026 22:27:27 -0700 (PDT)
X-Received: by 2002:a05:693c:83dc:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-369d9721136mr2911955eec.1.1792733246659;
        Thu, 22 Oct 2026 22:27:26 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-b47a-213f-cf99-45b4.dynamic-ip6.hinet.net. [2001:b011:2008:445c:b47a:213f:cf99:45b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm3590098eec.29.2026.10.22.22.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:27:26 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v3 0/3] serdev: handle devices without an ACPI or device tree
Date: Fri, 23 Oct 2026 13:27:14 +0800
Message-Id: <20261023052717.2577234-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
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

Driver-created serdev clients without an ACPI companion or device tree
node currently have no modalias and cannot be matched to a driver:
their modalias sysfs read returns -ENODEV and their creators force a
bind with device_driver_attach().

Backlight function on dell-uart-backlight is not affected: that class
device is registered independently and gets its own add uevent. The
user-visible breakage is the failing modalias read on an existing
serdev child -- Checkbox dkms_info_attachment aborts with
"OSError: [Errno 19] No such device".

Resolve the two long-standing serdev-core TODOs by adding a creator-set
modalias and an id_table, modelled on the SPI bus. ACPI and OF match
first and are unchanged. Convert dell-uart-backlight and the Lenovo
Yoga Tab 2 Pro fastcharger to this path and drop their force-attach
workarounds.

ChunAn Wu (3):
  serdev: handle devices without an ACPI or device tree node
  platform/x86: dell-uart-backlight: Bind through normal serdev matching
  platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through
    normal serdev matching

 MAINTAINERS                                   |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 18 +++----
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 27 +++++-----
 drivers/tty/serdev/core.c                     | 54 ++++++++++++++++---
 include/linux/device-id/serdev.h              | 16 ++++++
 include/linux/serdev.h                        | 34 ++++++++++++
 6 files changed, 119 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h


base-commit: 9e947d96915af63e28896caae85a81b74855621b
-- 
2.34.1

