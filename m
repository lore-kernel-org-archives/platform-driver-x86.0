Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844329;
	b=3y/k5mQ6Rarw3K6slbxAvckWtZ90o8q1EbKa8qR75CQ9VzTeaLND/Et4Vh880xcamMLv
	 K8utqjx8arWSkeYXdE3WI0XoFX10OnmD8IirqsPZmpfpm3rlIE3wGjvQzfUVxqdxbhKVA
	 /9DGMbN0dgv2qYwToIAmWPF2+f8IHTmUDDxUWFMt0SkAcE7/80wKt237JaOMSQDeNSAl3
	 RH0Yx1fs0obKHLluA9qVO6FEFRd/LjeandvxgMX096N8Aj/8WgaFnHZsoA4IL/AywAoZg
	 TT3xp+cYc5Ad2M5JxZqiBYD2DmbN7+Ocf+r/hxQWfeo9gryN15SWAilgwqj4EjpjeqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wNefO93l/fealyA3qHejzLvGBf5V2H9r362aNJ/SXso=;
	b=n6/rI//e+xFg5lc4QTiT0BPAj4i2Ok3E8/2M8WBUi0+H59Oj1CiN4m+Ye5gEPhUFcViD
	 LINVI5P8lzAHibsmX0QU6iGT9q228gqU1ueaDJya5KRZY14AgAunGbebm4UFobc5Fogsx
	 xmib/w+QGZF340AiJUr226FKqsVsZ2vH8hv9TV4htXdPsYL4SKQWx9cg+Ae5dACnV1k5q
	 NpzWo876z63eX0mwN5ijkotENm9/CMI6DIVzTemldVbyfZSqgmwEfYZB58mAikjb7zj9Y
	 Nfc5U6Z+g4MvWi4DEi+FZvbMrONxE/g4AHklM8fkEF7euS2iRTnLZi9Fb4XpmKnC0XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRY9tPmk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D1606A334
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33D1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRY9tPmk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so28716475e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844327; x=1795449127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNefO93l/fealyA3qHejzLvGBf5V2H9r362aNJ/SXso=;
        b=qRY9tPmkWyBFmSKUHBqRTrFslMT4yZErq0BtVjpzWCEbT3DrvW/Sq+eM1FeTGHl7Aq
         nylrHDFDAtHBYx4Sr42MS7bpgrWKu0e00J69RAJ4V/d2F2ktMypt+8z5WguCLUSpa2py
         aeqVDLumBGJLEHmGBNxQnaQOh0yL4JTH+J3ZCRZTfYW5RozSF8eTpfo9wEm+xOVKX+jH
         z+a6NjX1z3WXkWFa9ul0qucPXZCSFBGNUfVo/bdlfXzbm6oQ6Apv2XzU7fUDAu8aA/1Y
         XORos02nAB7cZmOpw2uOmEJjS4oji/coMP0GWpPkxRp10hTFtPXOjrEj+EOcRJbrTlOI
         VIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844327; x=1795449127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNefO93l/fealyA3qHejzLvGBf5V2H9r362aNJ/SXso=;
        b=CszwQfVbSOLRn34+tDoD5UIvygr3RvBYcpiZLXBhJFAsysUZbMtw5AjtEy6y1OgXiZ
         /C8x88VF6+2PHZlv31Bpy8OxA4F+D/HW+AmXAn9S0x7ZY2/IcG2xqf8vHQtQFjtDcFhS
         pQ6c19xB65wSEw04YH1tzCYywzrMSxKmujAglSlZx7ur7mirPjhNyDpPKOn71gcAmVpv
         /28zbYEocqYvk/L0cSoETeEYugkVynb1ZZEcm7JZBfKFR/vyDamvZ1JqnMbWCCq6sj/q
         5hA5Lbpl784p7oGVDhCSOTqRqfCBit8Ub+Jk+Jz5VsXMpGRBJs2lopCBWyHwKrqoBnp1
         NjRQ==
X-Forwarded-Encrypted: i=1; AL+hErEmoCsZ28MdaHc9UdKl3951i4JlrR9aDnQQRPuxErHgmMzduWVRCoK0WF5luOR+Ai7AX4WcbATKaJWSedSTPqPZRZy2@vger.kernel.org
X-Gm-Message-State: APuU4Z9lbkW9ms4TlANoSTsN29MNKEz4hxgxHrXpv27hTlX+RAAkySTE
	n89RRUw3s+Y2ZF5pY000yrcKxE+oIlCQdlYFA/xX+81aQYIeX9vFJfJe
X-Gm-Gg: AYBFou1yOiHzSKCXn7isAAp70JereSUf73LuXs9WGRgGH6JP06lDMXeKcDRNpqnYhZ5
	pgGwRG2xkxdDI9BAMWaLZKlZhHhoWoixS8aWKLRYz9eauuU9kFRbaZn+x2kgqixQRkZLLyGMcrW
	km18qFDg+B3dqbTeiUC1K0AEThnziYZ+ICMhEYAD95qiUE+NuEIFkurBgG9yu59DwswfR846NLR
	+LOcVnIqrBEg9d0czTxVdr5K9KwwApSFSK23vOkw6ph3lsFETfedbtPx4/2le2GthK90CE8XOlb
	btU2b4iLv4Iy6sKL1RXnO3mM8kIUwlKoKO0eqhj2iL7qLaIFiErYtgI0w87NJaQCsVMXG9OOFxa
	/Mm4uKjRPDjGP9zEXLuG33M2fZift3vyplKlpyasYnx+ZIFp3JHpi7RuyAb8/hwGg7Pla+xPFDW
	x1Of5WToQWKk0xle4lDEPKusaWtOJqTNSTlKKfUbSuiX+sDvGTFIV30hMH+IM8j4xXgyz5B9570
	lVMuxt+T9+ARNS5WUi31LgYR9+lqvlrdHM9g1QB1La7V8YgAf8DLxAUsrBquViH5yQWOu2aLXTn
	xep5hj62ESOD08S0p4ilCRFvIOkDaPM4NxIukXYgrzOOGO0rXFD8MtNyILiwXZEtNPsdADYFDor
	fTXnrSsbrBuqtU9yE6zKtGwnz1Qmzy3nIvg/+wnQ7
X-Received: by 2002:a05:600c:1547:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb6a5a7a3cmr114761965e9.34.1794844326803;
        Mon, 16 Nov 2026 07:52:06 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:04 -0800 (PST)
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
Subject: [PATCH v2 0/5] platform/x86/amd/hsmp: Unify per-socket sysfs metrics
Date: Mon, 16 Nov 2026 16:51:42 +0100
Message-ID: <20261116155147.769630-1-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The goal of this series is to ease server monitoring, by exposing the
HSMP metrics the same way whatever the driver, in a format that is
straightforward to integrate in metrics exporters.

The per-socket HSMP telemetry attributes (c0_residency_input,
ddr_max_bw, pwr_current_active_freq_limit, ...) are only implemented by
the ACPI driver, although they are plain HSMP messages the platform
driver can send as well. Systems probed by the platform driver therefore
only get metrics_bin.

Their location also depends on the driver: AMDI0097:0X with the ACPI
driver, amd_hsmp/socketN with the platform one. "modprobe amd_hsmp"
picks the right driver, but userspace cannot know in advance which tree
it has to read.

This series moves the attributes to common code and adds an amd_hsmp
class with one socketN device per socket, registered by both drivers.
/sys/class/amd_hsmp/socketN/ is then the same path whichever driver
probed. The existing ACPI and platform sysfs paths keep working.

Patch 1 is a pure code move. Patch 2 adds the class and wires it in the
ACPI driver, patch 3 does the same for the platform driver. Patch 4
exposes the pwr_current_active_freq_limit_source bitmask as a single
hexadecimal value, whose interpretation can be centralized in the
monitoring stack (e.g. Grafana value mappings). Patch 5 documents
/sys/class/amd_hsmp in Documentation/ABI/testing.

This v2 reworks patches 2 and 3 following Carlos' review of v1, and is
meant as a basis for discussion: I would rather know early whether this
is heading in the right direction, in particular for the class approach
and the AMDI0097:0X ABI question raised in the v1 thread, before
polishing it further.

Changes in v2:
- Replace the separate /sys/devices/amd_hsmp tree, its root device and
  its hand-rolled refcount by an amd_hsmp class, as suggested by Carlos.
  The kref.h remark from Ilpo no longer applies, as there is no shared
  object to refcount anymore.
- Platform driver: the socket devices replace the bare socketN
  attribute groups. As class devices land in an amd_hsmp glue directory
  below their parent, a socketN symlink keeps the existing
  /sys/devices/platform/amd_hsmp/socketN/metrics_bin path working.
- New patch 5: Documentation/ABI/testing/sysfs-class-amd_hsmp.
  Its content depends on the AMDI0097:0X ABI discussion with Carlos in
  the v1 thread, and can be dropped or reworked accordingly.
- Collected Acked-by from Carlos on patches 1 and 4.
- Rebased on v7.4-rc3.

Tested on a Zen4 (Family 19h, HSMP protocol 5) server with the platform
driver, and on a dual socket Zen5 (Family 1Ah) server with the ACPI
driver: attributes read through /sys/class/amd_hsmp, legacy paths
still working, and 20 unload/reload cycles of the driver while reading
the attributes in a loop.

v1: https://lore.kernel.org/platform-driver-x86/20261007125908.321186-1-erwanaliasr1@gmail.com/

Erwan Velu (5):
  platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
  platform/x86/amd/hsmp: Add amd_hsmp class with per-socket devices
  platform/x86/amd/hsmp: Expose socket attributes from the platform
    driver
  platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
  Documentation/ABI: Add sysfs-class-amd_hsmp

 .../ABI/testing/sysfs-class-amd_hsmp          | 120 +++++
 Documentation/arch/x86/amd_hsmp.rst           |  24 +-
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/amd/hsmp/Makefile        |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c          | 345 +-------------
 drivers/platform/x86/amd/hsmp/hsmp.c          |  19 +
 drivers/platform/x86/amd/hsmp/hsmp.h          |   8 +
 drivers/platform/x86/amd/hsmp/plat.c          | 155 +++----
 drivers/platform/x86/amd/hsmp/sysfs.c         | 435 ++++++++++++++++++
 9 files changed, 681 insertions(+), 428 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-amd_hsmp
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

