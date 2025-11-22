Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4F62D193C;
	Sat, 22 Nov 2025 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843917; cv=none; b=KLud+IfO5xVlFiOmB4XeyrFaq9AlrQETkXIoMf2LMayLHFWIoXxRtVPWN3Uy68I4nxgmUxTItQl6YqUeezFTWlov8pxMy/KE+wxDOmUA0aLxQp8gjXPitMhyJGxo8SQue6N10GaR3YI11NBwrvm5/Kk7PBbB13/CwGvNg2YaNJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843917; c=relaxed/simple;
	bh=rrx1tEL4+VeYUCGg3Bz1exROLhQkBdOLMU5saj1HS1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sCnZaQn0EbqS0VfuWE12zlpT6gox3+PKo8YjcTVhtICJN2AIikTYOfohABy2jav9PzYQMIBTFQnqZ6Q8ld2EYaFbSJjnCKguKvw0cwBC4Fqg0fTNQJM6vui3TCbBlOK/mt3LdWLY+eBaubIBAJK5K0f9HZnh9c0eWCD7dfvQPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Iu51gDh+; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Iu51gDh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843902; x=1764448702; i=w_armin@gmx.de;
	bh=iZJUpZ94YKDtkO+LgOmTX7j1HVzfaUT/dKLXry3Ryu0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Iu51gDh+euLBbosiF5XoNQVCd0DMB4V5K2Z03yUn9/pYAiX0dOa5HetT0YId0n8K
	 GkrChi9DkAFEHg8Y8kAptAzb/YmrWa8Ig48gZsy8ALYoDDQJ3KhEcpryGdzZ3U0x6
	 lBAonspRwuUS/jRU/GALBfWtuJfh+UuTrapohy0ktLfoczv6o2VBbpHKkszfXrj2j
	 4JP9F+n6vwaChBcPnaFSEtNZ3l0izuSuVUKpjOqE0BRgJ3PsI9qpVUS5EneSGooBZ
	 fwcl/Ij8pCiZNP5bvUTS7ClCs9exo3RqsFghTMycOF6Rod3G8os3uZCbOWH1g5nP5
	 iC+7+egx+/bg9DTWyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYvcG-1vaC3J2rJI-00RRif; Sat, 22 Nov 2025 21:38:21 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/9] platform/wmi: Introduce marshalling support
Date: Sat, 22 Nov 2025 21:37:54 +0100
Message-Id: <20251122203803.6154-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Vnnao4bAdREKcn7MmmHY3BF8YoxHv69VCWhEAKC80TXLDu92nXr
 1ZiQQ+F5lY0tWFGCsyjLVuxtCbhfQ4ZQWGpBmT6x8HF9O+icXfgqG1Z5mKAh9nqRnhW1JpT
 6QdMFtbbh4KsGPP47PbZAfvRi2KQDBY2gNQA+umeh+ModCNTj+l+jTECvVsXkYsBW6xSHwr
 ESFaSteOq6vLK/rjMckKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BpWeRyx5vIo=;+r5F9aE+0nkNTsQnyxbL1DdaHXw
 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

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

