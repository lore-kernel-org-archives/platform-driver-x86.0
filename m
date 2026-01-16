Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F292EB860;
	Fri, 16 Jan 2026 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596111; cv=none; b=Ryo586kuAHHlHj/g+uBlCiF2PivEkk9G/3K7Dir4N4dRgkSEGwyJsR22OgQG9ku0gVkXVwMarTHc3kZkDEBQH0YYyrJODW/mop7gaqlzd5rvKaNDem0nw7eUYoS/FZbsvjb6JS5fw4lo3IRyOVWyWXrJUKAHGWKSqSN4xiGUacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596111; c=relaxed/simple;
	bh=OnVh0BSFgBbNamf8fpjf4RYa7o1bhVF18uMT1t0xH18=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=O9TGbVAttqckNbcfKKUvP7RgnmqOLM3Wge3JJnptHLf7xn4O/OhcQq2hA+WUVn72bxPQYNN50lEPlr8ugOgEVn8NKkONRBJx0yrdOYTqf2YpPcHePJHtXWCFR8z4qWew1JrfhM11mLYsldzFib+363p2861NC+l4MSejdMhkLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fkS9NmTz; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fkS9NmTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596090; x=1769200890; i=w_armin@gmx.de;
	bh=INgcUvU/v6Ae9pI4HU/lcmqnyvz6+oACV6Y0N7lO0Tg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fkS9NmTzkAszKPEOZ2QCHCjNJKLJitL5mh1gTurt9C6Q57NiTlGNK8mliwL0xs2U
	 f+7KyXUw+gswi6hl8xgRZ/pSY5kgaxn5sixRCOnmG7rN6cd03zaEqi9+ENElAFswT
	 GGVTUKAUx304p9YxFSJhethZs048jEdkyCY5eJwHuzxPYae8gONOHdi9ZBt2q61sk
	 i4mlymVlcz0YLJVBCvel1W/Gra41E+UStc2soCxUyUuTsoX8OU5q/5efNS5LILmK3
	 YpUDtODG2l8A0bzjs+89h2+Ff+aiJYSYA86LqxLZ1+52GGY4QQkpCruttjth4anwF
	 wLgLBY32dNAwplIVVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mkpav-1w5iBa2krn-00nRHI; Fri, 16 Jan 2026 21:41:29 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/9] [PATCH v3 0/9] platform/wmi: Introduce marshalling support
Date: Fri, 16 Jan 2026 21:41:07 +0100
Message-Id: <20260116204116.4030-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DZeg9lywfJZslcgmm8mCo4BTd+3LnV8WvKAG6ubxf55KRNRm1VQ
 QmVfLRjlsyt8Rsu1nEVcJZ13nSV9YxipLiIQq7wuzulz4n30nkoNyChx44J2GAwDZ8UjM1o
 Gmm4ENBwlQnE+YI3kqJduT462sns2LWsVWDMg0/ggGLrTwNAjGq4gbHkgGkA3LspoUu/rTG
 hhHynmPefIgqpKvDczeGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s/dIvEJaKwY=;wfa8Om0QqQ2OKfhwSOnQcrBx3Hx
 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
 6L8rLRNRpgNoBJ5kMq1gwS/ejjNJW

The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
the WMI service in userspace. Said library uses plain byte buffers
for exchanging data, so the WMI-ACPI driver has to convert between
those byte buffers and ACPI objects returned by the ACPI firmware.

The format of the byte buffer is publicly documented [2], and after
some reverse eingineering of the WMI-ACPI driver using a set of custom
ACPI tables, the following conversion rules have been discovered:

- ACPI integers are always converted into a uint32
- ACPI strings are converted into special WMI strings
- ACPI buffers are copied as-is
- ACPI packages are unpacked

Extending the ACPI-WMI to perform this kind of marshalling for WMI
data blocks, methods and events would give us a number of benefits:

- WMI drivers are not restricted to a fixed set of supported ACPI data
  types anymore, see dell-wmi-aio (integer vs buffer) and
  hp-wmi-sensors (string vs buffer)

- correct marshalling of WMI strings when data blocks are marked
  as requiring ACPI strings instead of ACPI buffers

- development of WMI drivers without having to understand ACPI

This eventually should result in better compatibility with some
ACPI firmware implementations and in simpler WMI drivers.=20

The first patch extends the WMI driver core to perform said
marshalling as well as a new API not based on ACPI objects. The next
patch adds a KUnit test for testing the marshalling code. The
following two patches then add a set of helper functions for dealing
with WMI string data together with another KUnit test.

The remaining patches then convert some simple WMI drivers to use the
new WMI API and update the driver development guide so that new WMI
drivers stop using the ACPI-based API.

The series has been tested on multiple machines, with the xiaomi-wmi
and intel-wmi-sbl-fw-update being tested using a set of custom ACPI
tables loaded over configFS.

[1] https://learn.microsoft.com/de-de/windows-hardware/drivers/ddi/wmilib/

Changes since v3:
- correctly handle WMI buffer alignment on 32-bit architectures
- verify alignment of WMI buffers in marshalling kunit test

Changes since v2:
- assert that kmallloc aligns buffer on a 8 byte boundary
- add missing includes
- fix some code style issues

Changes since v1:
- fix spelling issues inside the documentation
- add Reviewed-by tag for the documentation

Armin Wolf (9):
  platform/wmi: Introduce marshalling support
  platform/wmi: Add kunit test for the marshalling code
  platform/wmi: Add helper functions for WMI string conversions
  platform/wmi: Add kunit test for the string conversion code
  platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
  platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
  platform/x86: xiaomi-wmi: Use new buffer-based WMI API
  platform/x86: wmi-bmof: Use new buffer-based WMI API
  platform/wmi: Update driver development guide

 Documentation/driver-api/wmi.rst              |   3 +
 Documentation/wmi/acpi-interface.rst          |  68 +++
 .../wmi/driver-development-guide.rst          |  76 ++-
 drivers/platform/wmi/Kconfig                  |   3 +
 drivers/platform/wmi/Makefile                 |   5 +-
 drivers/platform/wmi/core.c                   | 160 ++++++-
 drivers/platform/wmi/internal.h               |  17 +
 drivers/platform/wmi/marshalling.c            | 247 ++++++++++
 drivers/platform/wmi/string.c                 |  92 ++++
 drivers/platform/wmi/tests/Kconfig            |  27 ++
 drivers/platform/wmi/tests/Makefile           |  11 +
 .../platform/wmi/tests/marshalling_kunit.c    | 452 ++++++++++++++++++
 drivers/platform/wmi/tests/string_kunit.c     | 278 +++++++++++
 .../platform/x86/intel/wmi/sbl-fw-update.c    |  43 +-
 drivers/platform/x86/intel/wmi/thunderbolt.c  |  26 +-
 drivers/platform/x86/wmi-bmof.c               |  34 +-
 drivers/platform/x86/xiaomi-wmi.c             |   5 +-
 include/linux/wmi.h                           |  45 +-
 18 files changed, 1500 insertions(+), 92 deletions(-)
 create mode 100644 drivers/platform/wmi/internal.h
 create mode 100644 drivers/platform/wmi/marshalling.c
 create mode 100644 drivers/platform/wmi/string.c
 create mode 100644 drivers/platform/wmi/tests/Kconfig
 create mode 100644 drivers/platform/wmi/tests/Makefile
 create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c
 create mode 100644 drivers/platform/wmi/tests/string_kunit.c

=2D-=20
2.39.5

