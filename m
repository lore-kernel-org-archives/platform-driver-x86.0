Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74F13D539;
	Fri,  9 Jan 2026 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995203; cv=none; b=rnl3WekLnPLH/a0n7qMvG/ebAZhs0bA5OKCid1nPV4rHcVCFo8CNiWBMHLwfmJXLLNFn+zh0sippt4MYyOTM/r5ZdLECN+/byZ6xN2z2PdQ7skN6cG+0XI/RbNROZEPA6NDVqAMT1lcfc1Z8QVdif+hiF2Qr1Vee2LAqopeJfuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995203; c=relaxed/simple;
	bh=DcILVt9Wmi3JKHQ9pNORheqD6Q9Bs2V+E1fWnmUdMGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pYekMQOQ3CYxyMSqc62NqBOdkdquTccTy8tsXgIrIE9DHEkY3Gvw9dWqKkPZ8b4LJkg8E+3eha07Wwdd2BVMEw4JQWaC1LCaLkP7YH17rui8texBj/SXh/I/XpTEYq3vVW9or6/P3Uj8oXs+jG5dYNTvfFmoJ7rpJgtE4q3LCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rSs5CwTj; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rSs5CwTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995196; x=1768599996; i=w_armin@gmx.de;
	bh=/m7WXMJRKfu94at+SAU2dqbhC71HnUUW/qMc67OZ27A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rSs5CwTjo7w1F3fdZCRcefePGdBY5dxJfAO60KHFfV3eiW0/xmjtDRQSZ0B1Sh4J
	 AKFaBCsUzJjp77jdQUq01I2tMAL5eUjEAhlTdRYqjuOp8Kiu2bE4CF4dkuUMTV/on
	 MpIWoLjMxgaakOYUEh4BIQVYPSuALj4iyiV1vpIHbBLK5oPSk/MyvdG4UJ6lmA961
	 5hRZ0FH/+8LzWV1Dg/Au1jigh1N4AN81iSHrBfKNFPWhX1dYniZCRGUzfZaIFwwc5
	 thrMeMa+XR4h4d4Fn+zVWMsXYZ4xsy48PqlpS12d6DTDRicRcS8euhtJOHbsJsQPA
	 OrLIdzXIY1CVEnuSjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAOJV-1vXyNc3H8F-00E0cj; Fri, 09 Jan 2026 22:46:36 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/9] platform/wmi: Introduce marshalling support
Date: Fri,  9 Jan 2026 22:46:10 +0100
Message-Id: <20260109214619.7289-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OldgGeOsOcBs5Cg4okbc3i7HOyzZ2HwriUMnVgBeCQKeByB275G
 TEBln5cET4aHCfHmsakDhMTxf/OCiZU/MbTSYzLCtIZ61XbUvCI7FL2tO0u7W/oN3kN803h
 IX2Js/ZpPiurg+dTQPXcIHHUK9hT4hlqowGH9vVkykkj3oLXY4dTXF4KDbNvrVArAOS7Zot
 v+J0wZZtAX5iDtOpljKJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:00PRGfGm8wI=;Q4v0zSNPce5WEpUZvvynjFkyJ0G
 KhR6PDfaaqbjNv2dJyIRCpfeTXCq5pZgIVz8ML6IIh8pOdBPl4D2ggGR/CWijn5g3TocaeiSE
 wADtfKjdsIfu52DYUKpE/eL9hi6BxWy5K/b+V56YyZptN0egbjW/iE1Gu+HEMBPmliuJNJTv1
 e7K3NLknsz5eOAN8V8xVCFGV/T6UtQ2aIDaY7dQPlTm1bz9yj+9AGof4U6CmtanVl02P/ho0w
 k7NK4fjDfjykZKhPnr2Dyll08aljGJowJRWV6RH6mTKHQ9C83Hlk7wbxFfQyYDz/MSm4j6tUq
 cXv7eUkdglf/G4kd80yH1xSJEBRbE8v3qdgzvumXdSA+v8N7rGTP/SJtlU5Nip7y4qql3y+5b
 oJQeaeFNqFZWvKR7JD1ild47PsdjcOPlzPxp0zKbOeQV/jiXHpmJqxdUHVCDMIx2RLVggUGsY
 XAqUmp+k4UXWOhIaqObkqdch7KPNPGzSWC97W9KG/v6QExxil0zhYK7+VI5VVE2ibw6GGRKb5
 6TWB26YpsapX1s+f36pdVDljiX5ncGm9C4b55WbGCX+4xPz/5kuu1hzf5AoaDdP1St1By+lR/
 O0MkXdvUvmrFXTWqUkPUxrblKxwIafrGWtdlv2bCoNWf6J+MIcQx6pC4U5ML/1MXJVb5Ml12x
 Om2jFcYeHso6fR8mzmefRjqszhW0pkqrJGQJhz7IrRZNPpBZ5gRKLEJgTlY9w8qPLUgY7yaia
 syvCOFND9ahQ2KCw9GSk7ZCfxCCBqJRF1eoSRnU0HDRWdLV4PK2HA398Z/58EYiY6ETv8d3D7
 6F4rzo0TDIMdpoiiCq9ThJqQ3li903g5Jhv6TR1n/vHGaj8MzEc30FoyDZ1bwJGFxXGmTFSIw
 7iFmvX1Wx4uYqqT4PLb0uUX2nbZWii1bDLYkR8+FOeCQnbTwqmynJRE+7bObpxV0hfjafa8wW
 AzrTol3yZqbonqTa2Vh8X2fZkJ1ggnRFq7Tqfh8nFzBMAqHLB/rHJqceWP2tnZ7VarwaiPIJD
 /+YxCQGi9br7387E5yRYA5uSD/1SXVQ+oVAT9xdyWottKXkNPIQ0MDEmeCxovyY+FsHj/0k//
 X6t/kZK42C96coaZMhFCkbBnPm+3FMHe494IhVq3TDkEtps5Yz/46LsIKehkmHRf2Ex0Azwwl
 /ElTa0Rp9RTxj9y/0rS63+/1MqGhA2l2DdFt58jN9iPrJYxuNgNH+5Vsbejp5AHZhHHNJC5xG
 KmWDlLzXS9AKj/1ZJ5xM/QbMOpz7GY/D9C4N1c7KK/Y6xuyOzijmb+xdVKISCUGiEa3Yj0OXp
 rycDVfAwDx1ywL8v/AFGM8LGAt6DambIzgAHwPl7Nzd9xo8zj9Xjx4+29PNs6VISNV+mrX71B
 I35m5hDiKRgkwSgXpgcByCwv7gGy1kUMLg9Fur/zPTiD7X9I/nnoiWX20azcrS6pyL7+DoTO+
 gfWz21rJKDpD37ZypZYf0yBkHY8sJ2OcDwTWG9r0512gLEwuHAulKeuvRhdv44bOHB+3ptQxI
 ZxcCFu+LE2cEsddADIZXI1RzSFFNBbBRkyJv4XwqSk8Tw/H6/fF3KjLgVER3eEnJGnTWaDCRl
 3/F9PRTwryBZn68D4ut4b50Pshtc00zKCkhHbMlBYnXeaVy43KFzxiVqbSp4LYQfz5zy53smR
 FLeb500CPlythp4da5px1vKFEVcRgzwdE4HNh6S0yuviQC0BzRdGbp3KMZgjjv9KtyEIpLz8F
 qhVdP2dwFhvT5e9BtE6z42wqeWqFrDAewHnwoz+aeEu5MPT+hFDkqiFz1AyakUScWNtaBvp9f
 bUQtiWbmlUKULMx6rI6/PWURe+sfhaTZennCTACZ+e/GAPjApm2mvEi+AnBVc0IJypz65kfpl
 u/qTUtzdBgwzqjwW0+KL79VgCGMuz5R7oQ6Noz1RYEOjjwvfxPwraN9CzPa7U+yuM7N7RmgvV
 TtZvaiPb6yJH8KYe7OAf9PecibpKsHdZKx4EgghuTtFKEhTTqeB9KWQvFZv0majWp0tthkYYM
 zGr9rCfr+HJ+vCeI4K15ObrAKrtN8Sofvk6kZXe0wY7Abybkz4viFk60licy+VUo8in9B2gO+
 80F0s6egLJRGH6vviKpLpdHKdbI2HStpxnXNB3/VfB0pTks7yQJF1je6gD0VhRYK7vVZQE0FL
 iNaTqMzRMzXHFCV3Af0WItAdAYy7hoAm6bBDTQIK/uD6ecb/oGPYVavHcDwwutG/oGLrQEhsf
 cQ8ukxyGedikP5q48PpcKP5udIqgKSdb/gC0Le5J+DFZ5i3U++r4Odz3XwMQQWexmZtkoPlzM
 Jyvd985IJ6fc2IABlD3ueK8Vlyb+5a6mJMhxxd754k//fBY59udQvi8d6l47hBc044I4S+RrU
 qIuFztxT6JXQd019QgYPAn38bNFBajF8R/pTZzZ9YGWEQ69sQ2IbZDAJXYnkt/nyPQRHVbjGp
 1hyx6JQm6cqn4oFSGpaubRfCT+jbk7UuWBJA/j5kSorCmgRpPDmyZkPClWwXUxRSTEMJW3ofa
 DCoMFGQZ6prYooZmY1ErHV8oHSOqy2FinE3vb3CTLuQw8z0wQAW6RY8VvIkzOY8Nbgv/3Qbkt
 0e0SBks80xhBdB/ONNF/rYhrC79hWeD9KLsjStPmk+eNjww3uTHhP+JjzusiTDtWsNFOIcxr+
 VTnIT/LPUbr5hnSF42m+x/A7CiEbf/C5T4SK32P4+V+3dcRiGhNh9IQcl3k6m11D8bcgU6BXY
 z4SIDLkmcBwAxAo5aF2RSVL9R7IHBjU8+ChT4BhTqH46Wf1QAKGiaYNm9XRJRQqZr+ojfrdBU
 uDvUkO6+cDgYemohAqAHk+/U0ei6Y+gfa0qR1SoCQrLbI996ozovdNJkDH9JQWw/3RZKBMm1A
 /rruAsJ9A0ZJMeaPD7ktCD3Du39mDzeCN4vjhmvPNIyGAmKEPnlauXdynFTPgi9gCxQ++++mg
 j265STafdiKt2ngiKsDsSFHcH6mg3L3c5TpWQtLC7H3ZBDii4KnWluVBNwOPQ53pAs2IZVQi8
 wn/D3uNX34HHSdk+7BInA5q7EOFTPxg87Z9zZo1b3u3s6IjVS/RonMKlUuB8+iwwDyg6OMHV2
 bI2y529txRdq2+fhEi9t9dmRXRWyoAfM287c5HhGbIlg4VN+zXx01AJeGFE0gjgNJFJmX+LhZ
 9l3DdNwEpVYUgGiLybMuKnbgqhy2nSW/dzxtn05ubzJ0Z8a8+HYKZrqYDJ/eAfJn8LHVQbu4E
 uz7r0FPfFK9dSNjemGMQDOh4p6GK9ZJe/9qjHhumyq/qmaWQc/v1QbjE2nhy07RZCr0XN66ot
 CW19YUWOFV7gLvZ1sp+2WLhaQpfmwtv+Jd0uejXJI6wLgAUGFG+1nUbclQo4TyjS1cteHEUW2
 X6m9BIuPEQjt9P4zL7i91O4TQlraSllfhAfoLmIWeOgncVIYhBVzNdfo3lA4smFz5MxKMKuR+
 CelfHtroUJ5erZN/vktUedEBvVKP01YX0vmka87iU93cOoJY9llt/e62YMd6dDrqdTEKPArfc
 5o+EXnNo047jC6w65ulF8l88Q16bUWVeVRpTjTAxiXkppqeXqQ7ShF26A99dlERcuKEzh83Gt
 vh/CzBfen0cqmm3Q156OiC3hPuB2WL6oWInhPkAKfovqqm3mQASIQRJfhNC3x0NkqI2TknVET
 gWzTqMB5wEJVMiqxK+1nWEtzU1z10JdJcCiej35xVkFVeh3QBrMFK2riV+GkBR4XiLv/TUJbD
 rNGeA9d1+0RR/BQiSI5Ssi54+0ZlCE2hjYX1OlUWdd+3krKFxJ6GXsNRLBHxXFf/wjoyjzSFl
 IY/0xX2O6c4BOzNg3wcbiN6Zz1xNaS7wm49bkO5ItKNRHM+B2N0YkJkGtKlUUeq8SMt6gltE9
 0sJoD66+U8kRfJ7ZbMPRjKhkt3vqXX0CLpeu29L/ugtA/uCXI7g0IyjixcJeMqe7wrSbjfgHb
 AX487fn/vCar/C/tekgmM33fM9D84rs9tRc+PHztFbr5ivWD9eBFeTPQtrgyMTGcYNPcYjrEn
 I9MWwb9AGswaelgtOr2/GIET6zSFVe1bg70AQoRvQItMupF/x66orXDf1iusf6w1qOP5JENGx
 lY4AAtWTMBPtujLL5RYUF3X49X7+fmD+liNMLsXQgdhGp+VzLTKaNu4QBGfT2eVLj1GBuV0WE
 H9geoj4sKKOglHhR6WdXQyR4szLAXsP2lKeVtNog8pwEAp2DsMur/pQqOmtgC1Sm8IUINVuDz
 oGDXvhmQqVdThs/2QoORjocUYUyIwP4mrJktI1MTytNNelFlOb8jwLEYEhuunEyLOf6GPB7vr
 n954OK1/K7KJ+ADMsw3vC4x6PF+sqKhAJ4kx7EStM5HnZ/+aRVmmQ64mksE15RQiy6Rg1R7pl
 /fxN2Ojoc7HJGGi4zHpCqO0rT1g4OZ00vml0fH1kJiVXGbQWRXldl6aBwQv5B3vmbXmePkBsC
 epKOnVT6ATjLbpLOHaxEuQZAv0CoGjpdpnlEz4MQBKALvJOLyVaLeCoYjOkOB7vIGTu53F8mc
 gkz37TOqE9f2QFd+hzgUsquPBCCjpEoRHvbwQhTEc+PAwNYXqycUbBORemGFooYkbpGYCVG5A
 jQ3XXg1wYRl8RCME+3aqCdfb6ICwxFngRWV4lj+GaHbTH56xd+kudUKp4NfVQ57OF6Vc96733
 6lQQDwvsSaTfW78k/lmwdpZdmT1edgaV9QbCj47jXxvROKFjaGI/Ulco5cswzOfhj18OmUG2z
 k16WB1vUKiAMVBXhATnpU4O4dt+HLQK+zY/ZcpALq3jwdb64yR2/JCgHNrd5V+a0CBIXirCcJ
 MG3F8VE8Bc7mBcSyvrEcTaVSvXJYt4vqX40cFjhjsiPns9KdNXQfZm3LaAoudzAbPDGm4WN/J
 sgPQTL1wGo9BYGroYi7bb9CgUiueiL5qTCc5D5cWA3g+Tb+f5hwPTO+QMDYb0+RsD2UBe7Let
 WfOauUskec24uPdtPDIh04AsMBavueUFJrbwQOxMci7NgQRobxKUQp6bka8IHGNaWP69I+Fwt
 UUKJFEbQokUQpjd0gbm881pw7R4f88pB+frVCKTE+QVFOXxIkz8ooPZWjqf0Cyvv9Ob7ZXIO+
 oR/O3Hq5DkVOAH+MbQRxUZ4f4AWtZOyuZMUmw2/o5W2s2qLUPHPZYC6PXv/FCwlmoe8o+p/y+
 3aXTiRCk=

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
 drivers/platform/wmi/marshalling.c            | 241 ++++++++++
 drivers/platform/wmi/string.c                 |  92 ++++
 drivers/platform/wmi/tests/Kconfig            |  27 ++
 drivers/platform/wmi/tests/Makefile           |  11 +
 .../platform/wmi/tests/marshalling_kunit.c    | 449 ++++++++++++++++++
 drivers/platform/wmi/tests/string_kunit.c     | 278 +++++++++++
 .../platform/x86/intel/wmi/sbl-fw-update.c    |  43 +-
 drivers/platform/x86/intel/wmi/thunderbolt.c  |  26 +-
 drivers/platform/x86/wmi-bmof.c               |  34 +-
 drivers/platform/x86/xiaomi-wmi.c             |   5 +-
 include/linux/wmi.h                           |  45 +-
 18 files changed, 1491 insertions(+), 92 deletions(-)
 create mode 100644 drivers/platform/wmi/internal.h
 create mode 100644 drivers/platform/wmi/marshalling.c
 create mode 100644 drivers/platform/wmi/string.c
 create mode 100644 drivers/platform/wmi/tests/Kconfig
 create mode 100644 drivers/platform/wmi/tests/Makefile
 create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c
 create mode 100644 drivers/platform/wmi/tests/string_kunit.c

=2D-=20
2.39.5

