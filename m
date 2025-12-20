Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852D2E7167;
	Sat, 20 Dec 2025 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263613; cv=none; b=iSS7i0bOJ9h1H4JKCyv7/OOHUjMASpq4snneyKE/M4dtlsxKDdlhFX0iiIlZT9H+pwjMn9PRhQBSd15enoHrFctk5Z5MU1HPRQRThhibvYrto3SpiyFUjGcjorX9FG/V0MqL+VTWOr1+sTHs+mG/vd3DqCRPK8f+AFVeROIq2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263613; c=relaxed/simple;
	bh=HKz8g5yZZcNTu+LdsVCZh9CP6Ghht8xsBLHXcU3zdw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Gk9kEgFP8T0eSL6AyhilsnIYgsg1xy+oHY/MfvElgpUe9oJxF/uuunj7+jcWE/6iTIbNz4LTudGFqAlnkggzGJqYgNi2CeanpOOW3qnw555kV8mNngqySbkxnDKEzk64MfTCb9JxKeEo4SyaRTY2mniHauwI/kRRUmvjFfeYhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZyPJHO6C; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZyPJHO6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263609; x=1766868409; i=w_armin@gmx.de;
	bh=YlYqOtgktHx3cxI1KqZgJb44mASiyDQZeZoXzlyCQq0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZyPJHO6CU2Zq9Quwq59F/LMQ8moiZx1kfUGZ+9tEimKngmmPkLmjUFb2Dbppej1g
	 zMnXEfA9dg5KfFR7hdt9LazlAWVTmvLPv7cP+oWbiZ5Mjjn2upg6LpIM9t8Nnrj0Z
	 S7QJgOZvvcawikDjyurnT1iGl7ESfDWXPiNEWHa8MF6cQgvCX4Cg7YcVOLta3fFbw
	 Y/8rXq8sDlUdOIQ1fiVu5PfvByf9Rq3W8G2sB0YRJJxAZZCnTozzGp6VNf1Smtl1h
	 KvOr6KS/iQtrU5ggmaOpGPPK8CXwtIqm+PQqzxjmfNb7p3ZxjKxORn0SESokyjE7q
	 MmEx7G8tA5V+A/Qzig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M8ygY-1vZpXC3jQk-006grm; Sat, 20 Dec 2025 21:46:49 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/9] platform/wmi: Introduce marshalling support
Date: Sat, 20 Dec 2025 21:46:13 +0100
Message-Id: <20251220204622.3541-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VbEdHJX/eqN+LVSa+EQwY//C05AHOr8qdLe7U65NdYDrfgeYg1c
 7Eu+7WyEeG2NHCpOB3gqRnpNceVv5swdy0bdZzYCaqNGXQIuPUcQKA6Sfewxp9dFY2UEXLe
 3kyhaF6ODx+yAH3qLH9XkdBbjLzk8hdBbokpTjEu3+KiJflo1djEZgsSTeEkZ3eHliZMUBj
 jHMqxb7Ak4wK0F/TGlNqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mOSEZq9MaeI=;tFzNIycffBgMd1mVC7ThT4ciAQs
 +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
 tovP48ko=

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
 drivers/platform/wmi/internal.h               |  14 +
 drivers/platform/wmi/marshalling.c            | 233 +++++++++
 drivers/platform/wmi/string.c                 |  92 ++++
 drivers/platform/wmi/tests/Kconfig            |  27 ++
 drivers/platform/wmi/tests/Makefile           |  11 +
 .../platform/wmi/tests/marshalling_kunit.c    | 448 ++++++++++++++++++
 drivers/platform/wmi/tests/string_kunit.c     | 277 +++++++++++
 .../platform/x86/intel/wmi/sbl-fw-update.c    |  43 +-
 drivers/platform/x86/intel/wmi/thunderbolt.c  |  26 +-
 drivers/platform/x86/wmi-bmof.c               |  34 +-
 drivers/platform/x86/xiaomi-wmi.c             |   5 +-
 include/linux/wmi.h                           |  44 +-
 18 files changed, 1477 insertions(+), 92 deletions(-)
 create mode 100644 drivers/platform/wmi/internal.h
 create mode 100644 drivers/platform/wmi/marshalling.c
 create mode 100644 drivers/platform/wmi/string.c
 create mode 100644 drivers/platform/wmi/tests/Kconfig
 create mode 100644 drivers/platform/wmi/tests/Makefile
 create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c
 create mode 100644 drivers/platform/wmi/tests/string_kunit.c

=2D-=20
2.39.5

