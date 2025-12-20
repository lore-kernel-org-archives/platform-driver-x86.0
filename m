Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C531355A;
	Sat, 20 Dec 2025 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263633; cv=none; b=C3SfQsniULukYKDORoVx42NZRcPkz4NqW9dKLWdh8NprGvyNv1DJL8ENHZjNd7Zcv72hBK2d40mH7MEyBfrb3WrYLZCyDFGx+X3qEkAcyY/IpVjSQj1RSlpFOquyzqyvTsXr50JefJvOn8uCW4PTy7EkT2FvCcrcSbZ4uFgTNWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263633; c=relaxed/simple;
	bh=+f95zJcvI0/rxUUgSjBFd7sMhiwQpEdJpxwQpZDWd/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOSNjy4Q99mZ0lTd9PjkbplMwIzNEs9uobWFX5i4xBcNNg34hLyR8aYUas7zm+GtoMAEaJqLbiPiIXsTPEK6tbIGMzGEVRPai2tO5aE1zYkVJH93Keg6Jk5nd/haSSMhoMzh2b/j2yiJh8XFZMSF0vQppSuWml2HjQJt1qjKBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=C4fVRCEL; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="C4fVRCEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263612; x=1766868412; i=w_armin@gmx.de;
	bh=t+vdb8PzR+iZbH2mF3hPHdKjMwT1fhwXg+m+xenSrQE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=C4fVRCEL5ZOKLWupF2BIgkFX5wTMUTHmxsZlb9ck8s5Gb9vIwzES9bDlhg06EWAX
	 AqLqvL/rk/N6uW/D/cZ28DgKII78j2H7F6IAlC/IvCKair1x6bEyv/LUFYk39e1wl
	 mq7KGdooS28L46tZOB1CyJ1K6NdAa1ugP+ME6TzCn7wDSTFoDWWLTv1Vuu2unDH14
	 Sa1ZKUiuMBCBzZb9KJBV4t+OgFKEaY3wVhIDrmwZowyNB1Ml+nfEZruagK8Odd7FH
	 wyjX3FKkMxsD8OLGIGbXDM1lPMFQy2KcEbBFUoTGy/uvQ6idRzrI/DV7DFI89xi++
	 kr6U+pwwSMYm2TSyPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N4Qwg-1vw3LO2Uxq-014Pm1; Sat, 20 Dec 2025 21:46:52 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/9] platform/wmi: Introduce marshalling support
Date: Sat, 20 Dec 2025 21:46:14 +0100
Message-Id: <20251220204622.3541-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
References: <20251220204622.3541-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dtfVEATbDr4ufAj4l+ovw8fuFdjrrxZOSJzg+usLwb7EmGF0fjO
 s2ZZiA18nod3nKP9G/KcthVNZO6hy5M0cNMh2NzC+KYLlKczvGiGihDtpg4Hfa1cJDymlTD
 lsCAJr3LS02/u+N+oTXMlM9qgPZBrpv+I95nAc81+SrxQyVbUl/gBa2myU1UYPwZwgCKVEL
 hHve/v/fBbqb8h1DgAv+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o4vKaeffT7g=;GN/9s11aYnMHevzQgWO2Io3dcy6
 MjXQRwLnx2Fv+2IP7rhjxXVFIXwlhHzvNZOuA44zjYN2a9DVNYU2jBcncPuTioS+zQGZL+q2Z
 Ej3gfylphEHmNDy12qQ1aAkd1PS+wlA/iZq2hKdNicVzZISd6JyCYIlSr3iOZp8H4aQBO0Ptp
 mvAOuMD0/92RC7MX4V5R0Q+KN+oNtHGs3fzbo/33VHO/HjI1XO+bQ2sIRxxR3aVQlW11W5mUY
 hDKBkbtMEIepL1Ck00rwR+qX5odJs38HZjeVwIqQWSNzp7VF/S3qfurMDnP/UyFbXIaFx4P5w
 e/5HjTwKOgVIpw4VlYSsmnGnSxJRWFrlz0YcwBzik9f0gALdfsb3jAgvovJSgWhijfmmoTpIP
 ROlZj3KgMruotwbSh16zVFBNFh0Z1fcklZAYI2kUvn+UPNvbeTQwWIYC52QxxI7kdp8uRs1Nd
 VBmaMlu+FPbkCdbMbncenyP0AL/NzM3znu0plTxJEDpQ/GaQvUMszb5nDpEOzuImnkI7QQvHa
 S842U0DhTXF0CB2jf5Jm4tPNXK8t1683nXeU/czFywl1Q+BElPR8PqI18AeNPaBt6mC5TgYF5
 TAOoP++ctzwo8fUzrK984/GHC0OafXwCcpRYFBseeoyaNd5hep9zdJZduRlFyiK0v3qMCm4uc
 GDtUlo1R8HZZQ6gbR+RxSsi5FVSPTq6rHsWLi4pq7D9BBKgtUVjHoTo5WBQTjqWbNsfOonXbs
 dBahm+MWOHxlz+zMJP0jDeyneU6U/x3Mx3yRb9p7mNk0V5CsXLDbVKlCoE9p/kCTQGaIx2hsz
 ZwAsw29poKFp4YE027ai9lYBr8mTeszTf57aooyb50P244r31/gvWR3zctGrEmZG1tgwv7Ygz
 PXHB3a+dGGZ+9R7KVwL7xxVkw2U1vazdtZvEPgGLlVpnREildLiGpiQwIGJiRs0aEcB7CUsmR
 BrDJn+JsaGyYUs37Mppq1r3wwYQjMsdlw3tuDoH0lZfaXBdBJHNG5hTxC3L9F27uNHkliLOav
 LkvJSO3Afvm52tybeoRVKi3BqxD9R9w74TYc8LhcStibrzU5ikmIY8sFI55KTZB2pg99igGRL
 PGEOGsae01j8toNnramclQBJbX/fz3dKFlLBPLTQDM9MiKAsLDikdro/sN1PbIloaY+qFSUB6
 NUlhas6cLfYnNQsyxDhbc0/t5eAUCqUrr0NCEC5uLuY1qBatkXrKgOuFdAZfPl3AZOp1+QIlS
 4APa5rq+GXmMtH+bASs0iQ3VfKHwFhqOU9PSBkKvLpAdIBKWMzhS9HoXp6j38kX08PVYt6FcG
 yQU9D85jXcJ11XyyeFhngfniJ/vpRLCFBPUTDB9BmERgOtTYyKmFwHbOa8VFn0ghZJ9oPTzi2
 TuCAkpcsea5TNB9dTwkD39VyufrU62jPO0P69hNfbig/Cell4VOou6JLDQs6jjJgrWE3nVcaF
 7ukwMf+fD0Ln/AMUp5zzn3m1XaVWjlA/aulSNPG1paD9EQxgsY8RJt3VonYb2ZZXymMkD1ubV
 s9WumGPwwg6FPt6i5SXqp1SKvgJT72Y9I9//tc7D0yY3darkwM8HooPKsV7apHrCRJU01jQ0/
 +otsDNIvJgpLr3ts0eS9JG2me028hbsDYLK28sH0B02q+WB+/qBdVCtv6mlxTive9uNz3/VV0
 qtMCthpTWcWY9YjllQHoG2AVD/2RAGl1zs3igNRaSIU1fVJtC30z8EN8LfloCvanPUyZi6QmK
 ani7btxBmu31I3+ua1MrCWDptiYKe9sK+C8jctulM5qvzbCfmY6YrM+ROHt1+2DR8ptqpuxJ8
 F7hu68cfKcWIErYiSCuRldQIIg+b4uktf/V6KjAqI/IHZ7e5yRDTgm2gINLIsZRwlZU1uCyqv
 NMPLhkdRkmIEmCa5NmIcj+vx635rHXDqJf3YAU/H/o5xqwDor/bWJrNjB5Cgoi+4cDbKAfiPX
 rEHeFDwHCSMQCakZr9BEs+wY1yxN4Ro10LnWtMZ6s4Wgj50k5AvhskM/4PjauQKpApENzWOjx
 1f8Vl7WHc24G7ZHT/9nyhH2CJNC3NuVylapkiWs8cXhyP2ShmCaQSsqA3NxsmGlSV2DVXtMok
 wC+a0PyunWat2sGc/e2hHZzHD0kyzBNS/5d2ePLXh4pzFo1IxuvNuh+PPxuhPxFOfb9udjLy9
 Srm4ZZVojdODE/t8emkCjTFun3U7ByOzSg2BTP2MrBcEPrY/sKd2Ym4MJV/OG82+hwpxPL7Yg
 TE9KAXV9je/aSaBLS5pohi8mxBYRHa51YAv5tv197lvQjoOOCPw58S7fC84B+y+/SxCn5so2v
 XVR/wFrcXNvy49GiBmhmTjeFvlpvkBLsMF+2WZGBOknpE6VStx6TOmN3WglnzhOYT+2ewYeyp
 R52NanKnvJGj4qZpFfuWuuU9u1hk+Is9jq0r5qgQe8RHGjjatg26NclGCPKZzf/JdeBcY51/f
 5aOIEHrS5MOgRXaPwGkZdllciPMs1Rpem0Y1+CSVc1xZiKczcf8yFBxobVp2PXoWkd7UZYCTM
 JnNETHvc7i7czpachPbBbRC9blWoCpO6Z++MC+bzNpMYruJFwgWzyo24R+02TLOmfMuG9EN1A
 fForNu5jxcqCtIURDg9z9zhhdYo8JwG/ATwWf03qo9iR9469xLGPzzFHyr4hugDs+XWndQN7u
 2VQE2o0XBbuAYZuViunaJAXtDrpiBDsk2iWyYncIIbGqr6XOv/OkrTvAoPzyGSW0tdOHcssAj
 5WfBznjqEebwlmXYitwMq3FrYDzk8qasIZ/WePKLr6NMavB4SSVrcXj3lCyvJ0BfnBHdeH7J4
 YnfeF079SHgcQhRKgBxH9dDXqysTdtNKd0a+SKTN18yOK+aurAfx+/AedGO+RD6XRtqqFnxEa
 OwtnZ+VWOGWJm+a5FKr0BzxcAAWLtqLcH8+3bhiK6ljAc2QfEvCfdpQK9k7BZee81itOPOICF
 zCsi9xJYjNlMgd+NDXrzKLRzxeJYjdkYhMMacByfSv4ARNoDrq8s1BBuhLs9pnTdGwAgQRwh/
 HXamsr1EaC/VrEdMucLsvYpGXAdzh24gXoXrUvlKHSfsDw/fFHwivlIZboRpvmW94Y2gFPZhs
 iixb5vHdMcISlHAwHYIelnorko9faqgUQ/PU60ad0T/h2ZgAfhdoUsHNTRjYQXNI+Drkzi7uI
 Gb3C3SDaxEKvzx2T++Lm1kU2ZfCfJeFDT6ByPrG5FKD1zVYcipsDhn8ts2ySpjM1wXIfAHTz0
 PTDK/tiXENSFABd1j+zys0wS5dAKGGKMKazTR93fqxnY1YPapOVl/j/lY3Y3TrQJhPRumZ656
 s0WNA4Vxkcv5zpCVW8Mt5emPSg+xEZibc0a4b33j0fOnNptQ77IKI9JFcXaozrJhftmQo7hJ3
 /wl4zVsJ2E4tirGxA4f2WW/Tq2pVgPGnKDqM2MNofb7tDWoPaS4qntyO2Q79m+vmYDERO13Ub
 jRDznzM31vICQBB1t4B5y46amMbbGhtzoxtIFJUMeHhYHK2UGGJsFD7zOeGMJz05Y0wzJM+A/
 WWbv20qrIbV3vzRZrZ6dsd2AEOEhqOKmAFqOi9lhd5zNPIHJ6JKNJPdYZgPnVz4iPmR084kNe
 nADFxwHjeGHVVahpi1okZ0iAMpPeMpSkNQAMa0e2vz1i9GYxNo+3+G14oZlsdeVVewrBs5ecj
 xjXb5aQk3KbqKTWmbIjcjw7RFYbIQ0cJultOyvMkaNTdd1UQ+FOJ/y66zJnjWTYxQDBEaYEdn
 tntdflSFkSY8wNyG+cCN2L2Jzi2m8AVOtb/TxEOtvdTxxtOzKvCCmw+5go8YgtWvqXPO9NlTu
 F6ZR5/hU1iMqjEuiEV1W/DhNqTdTBAbqUFcnIoLdUhq15qkldieo1N5rh4chy8Yv9Sbce1CrZ
 38OnzlsSdJu/14RdHLO80qx06NIxJCzuPgZKckr7ikCUt3M5Vny1k0DmVDkcASZOkaZJyV5Fg
 b2YhcXriz3Aelm3TUGGkSOqxdw6DdQ2opHQoplSyUsaKGrYjiOfpqgixOjPgfAa7hwVBBtFOB
 qXT/JEVTJW+8aYpK1iYIpvByirNJ6UWi+kPu+niNisd9UoS2f55wHwmskC6TNCl0xYKQXgBtU
 iC4f2Wf+aGvZaSr2V39Q/x9PNaza0zaQesn6j3oGcIBxlLWeFSwpMUJTQUDVCuqVFDRhtsrpx
 0GjrL7NVG18YpojD0PguWVu7Zeh2KWtkvYxqlvrVmTBD+6G0pcsXzI/8h7QP9VIyEnOSDUPXW
 1VBULhT2O2EpL+Kr0HYdYkcyyCRcentcosRzYOX9HuuOJmIOVHITpDWWyhoZPsulKQFg1trAE
 B8HwQyZQ9FrOecAeAVeTrBGZQrBWgARVb1sdA8j9l2cbBYf/mjzet4oSIMu8YpxyVwpJXJSwt
 DRtp8/BzuVb6VpKciDG9aw8TiqkCzAYbXNGGllZKg+A0T7uj+J64GB474DYRdJxRpVSFAiu3B
 7dRegapmdsRlK3123GaEgVsW59KfCNsg/daoeT6wiqB/UUmKeafzSri2rLeDJjCWA0sq8ct1u
 bSNfeHvEVa4rUD6ZDQQIkOBNoibYtpf+HTsTVHl9bWc39nCY4kmWH1lCxdmNqfmb66GxPEBBY
 GMJENAVSSp119Ahdtv6b5Hma5X6cCWtYFzTwK7s8GySa/hUqkvc/YzMFMoSAv1B4hHUgrlZx0
 AqACPIl3WC0kRz8QU+wXWNET6nkf5vgMB+w/wUqey5P0TZv0TFbyl9+bg8w8CQWeTYF8RyAY8
 0PVXPbJ88L5IIZlxdzMKxXwTMzbt4xOiQGEjAnnC/7WyNHoFFMuM71JxtgTF1EHvmYCZ0m1wG
 EvKSKVsA5IkEI4+nIM0oiPDUokWo/3U3XCZdTLLoSsWYHTImCsikv5Xg5fgb/GFDeAYnnltYF
 fYpdRC4GPyXhXm7GN3Oo5yHzHNpHljFoZlc8Az8M+iHFylWfnIrsI5g6R4pVJXBnQ9PnatotA
 QFLChAbxQ/+WvkGkcz3w5icljl33zzDYaF4H7qhSHiqLNFov78bhbKJ5oY6Kq3Xvz3nc9qPHQ
 3fzu3zVyx2RgpbvSEUsv3NhXjE044Db40E82OsR3WOppVk9z0WJsRVzdqNxY2DLRAK1zE2MzV
 5TaengMKnCAUCrNam4yVHXS05/PPiG4Kfg8VEEHKwtfpefw/rCg380aRGt9lqnHLs6ka4mNyJ
 zSRCQbH1F7v9B2KxLgxXv1xUqy1jlRKLkP4fxz6rrwqQscfn3+4PL+kidhXZqK9b6SD6eDaNK
 W2Y3u5d9GJrFDy++ZJUW3bBgyH0XWZVW4dQeuZlj7lHlYoAo0WB1YUimr1nncxs=

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

Extend the ACPI-WMI driver to also perform this kind of marshalling
for WMI data blocks, methods and events. During so gives us a number
of benefits:

- WMI drivers are not restricted to a fixed set of supported ACPI data
  types anymore, see dell-wmi-aio (integer vs buffer) and
  hp-wmi-sensors (string vs buffer)

- correct marshalling of WMI strings when data blocks are marked
  as requiring ACPI strings instead of ACPI buffers

- development of WMI drivers without having to understand ACPI

This eventually should result in better compatibility with some
ACPI firmware implementations and in simpler WMI drivers. There are
however some differences between the original Windows driver and
the ACPI-WMI driver when it comes to ACPI object conversions:

- the Windows driver copies internal _ACPI_METHOD_ARGUMENT_V1 data
  structures into the output buffer when encountering nested ACPI
  packages. This is very likely an error inside the driver itself, so
  we do not support nested ACPI packages.

- when converting WMI strings (UTF-16LE) into ACPI strings (ASCII),
  the Windows driver replaces non-ascii characters (=C3=A4 -> a, & -> ?)
  instead of returning an error. This behavior is not documented
  anywhere and might lead to severe errors in some cases (like
  setting BIOS passwords over WMI), so we simply return an error.

As the current bus-based WMI API is based on ACPI buffers, a new
API is necessary. The legacy GUID-based WMI API is not extended to
support marshalling, as WMI drivers using said API are expected to
move to the bus-based WMI API in the future.

[1] https://learn.microsoft.com/de-de/windows-hardware/drivers/ddi/wmilib/
[2] https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/
    driver-defined-wmi-data-items

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/Makefile      |   2 +-
 drivers/platform/wmi/core.c        | 160 +++++++++++++++++++-
 drivers/platform/wmi/internal.h    |  14 ++
 drivers/platform/wmi/marshalling.c | 233 +++++++++++++++++++++++++++++
 include/linux/wmi.h                |  39 ++++-
 5 files changed, 441 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/wmi/internal.h
 create mode 100644 drivers/platform/wmi/marshalling.c

diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefile
index 98393d7391ec..6f2bf8cc709e 100644
=2D-- a/drivers/platform/wmi/Makefile
+++ b/drivers/platform/wmi/Makefile
@@ -4,5 +4,5 @@
 # ACPI WMI core
 #
=20
-wmi-y			:=3D core.o
+wmi-y			:=3D core.o marshalling.o
 obj-$(CONFIG_ACPI_WMI)	+=3D wmi.o
diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 6878c4fcb0b5..1601bf9fe135 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -23,6 +23,7 @@
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/rwsem.h>
@@ -33,6 +34,8 @@
 #include <linux/wmi.h>
 #include <linux/fs.h>
=20
+#include "internal.h"
+
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("ACPI-WMI Mapping Driver");
 MODULE_LICENSE("GPL");
@@ -302,7 +305,7 @@ acpi_status wmi_evaluate_method(const char *guid_strin=
g, u8 instance, u32 method
 EXPORT_SYMBOL_GPL(wmi_evaluate_method);
=20
 /**
- * wmidev_evaluate_method - Evaluate a WMI method
+ * wmidev_evaluate_method - Evaluate a WMI method (deprecated)
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  * @method_id: Method ID to call
@@ -360,6 +363,70 @@ acpi_status wmidev_evaluate_method(struct wmi_device =
*wdev, u8 instance, u32 met
 }
 EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
=20
+/**
+ * wmidev_invoke_method - Invoke a WMI method
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @method_id: Method ID to call
+ * @in: Mandatory WMI buffer containing input for the method call
+ * @out: Optional WMI buffer to return the method results
+ *
+ * Invoke a WMI method, the caller must free the resulting data inside @o=
ut.
+ * Said data is guaranteed to be aligned on a 8-byte boundary.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
+			 const struct wmi_buffer *in, struct wmi_buffer *out)
+{
+	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
+	struct acpi_buffer aout =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer ain;
+	union acpi_object *obj;
+	acpi_status status;
+	int ret;
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING) {
+		ret =3D wmi_marshal_string(in, &ain);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (in->length > U32_MAX)
+			return -E2BIG;
+
+		ain.length =3D in->length;
+		ain.pointer =3D in->data;
+	}
+
+	if (out)
+		status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, &aou=
t);
+	else
+		status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, NULL=
);
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING)
+		kfree(ain.pointer);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (!out)
+		return 0;
+
+	obj =3D aout.pointer;
+	if (!obj) {
+		out->length =3D 0;
+		out->data =3D ZERO_SIZE_PTR;
+
+		return 0;
+	}
+
+	ret =3D wmi_unmarshal_acpi_object(obj, out);
+	kfree(obj);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wmidev_invoke_method);
+
 static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 				 struct acpi_buffer *out)
 {
@@ -432,7 +499,7 @@ acpi_status wmi_query_block(const char *guid_string, u=
8 instance,
 EXPORT_SYMBOL_GPL(wmi_query_block);
=20
 /**
- * wmidev_block_query - Return contents of a WMI block
+ * wmidev_block_query - Return contents of a WMI block (deprectated)
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  *
@@ -452,6 +519,33 @@ union acpi_object *wmidev_block_query(struct wmi_devi=
ce *wdev, u8 instance)
 }
 EXPORT_SYMBOL_GPL(wmidev_block_query);
=20
+/**
+ * wmidev_query_block - Return contents of a WMI data block
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @out: WMI buffer to fill
+ *
+ * Query a WMI data block, the caller must free the resulting data inside=
 @out.
+ * Said data is guaranteed to be aligned on a 8-byte boundary.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out)
+{
+	union acpi_object *obj;
+	int ret;
+
+	obj =3D wmidev_block_query(wdev, instance);
+	if (!obj)
+		return -EIO;
+
+	ret =3D wmi_unmarshal_acpi_object(obj, out);
+	kfree(obj);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wmidev_query_block);
+
 /**
  * wmi_set_block - Write to a WMI block (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417=
f2f49ba
@@ -486,7 +580,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 =
instance, const struct acp
 EXPORT_SYMBOL_GPL(wmi_set_block);
=20
 /**
- * wmidev_block_set - Write to a WMI block
+ * wmidev_block_set - Write to a WMI block (deprecated)
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  * @in: Buffer containing new values for the data block
@@ -535,6 +629,46 @@ acpi_status wmidev_block_set(struct wmi_device *wdev,=
 u8 instance, const struct
 }
 EXPORT_SYMBOL_GPL(wmidev_block_set);
=20
+/**
+ * wmidev_set_block - Write to a WMI data block
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @in: WMI buffer containing new values for the data block
+ *
+ * Write the content of @in into a WMI data block.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct w=
mi_buffer *in)
+{
+	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
+	struct acpi_buffer buffer;
+	acpi_status status;
+	int ret;
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING) {
+		ret =3D wmi_marshal_string(in, &buffer);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (in->length > U32_MAX)
+			return -E2BIG;
+
+		buffer.length =3D in->length;
+		buffer.pointer =3D in->data;
+	}
+
+	status =3D wmidev_block_set(wdev, instance, &buffer);
+	if (wblock->gblock.flags & ACPI_WMI_STRING)
+		kfree(buffer.pointer);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wmidev_set_block);
+
 /**
  * wmi_install_notify_handler - Register handler for WMI events (deprecat=
ed)
  * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
@@ -862,7 +996,7 @@ static int wmi_dev_probe(struct device *dev)
 		return -ENODEV;
 	}
=20
-	if (wdriver->notify) {
+	if (wdriver->notify || wdriver->notify_new) {
 		if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && !wdriver->no_notify_=
data)
 			return -ENODEV;
 	}
@@ -1221,6 +1355,8 @@ static int wmi_get_notify_data(struct wmi_block *wbl=
ock, union acpi_object **obj
 static void wmi_notify_driver(struct wmi_block *wblock, union acpi_object=
 *obj)
 {
 	struct wmi_driver *driver =3D to_wmi_driver(wblock->dev.dev.driver);
+	struct wmi_buffer buffer;
+	int ret;
=20
 	if (!obj && !driver->no_notify_data) {
 		dev_warn(&wblock->dev.dev, "Event contains no event data\n");
@@ -1229,6 +1365,22 @@ static void wmi_notify_driver(struct wmi_block *wbl=
ock, union acpi_object *obj)
=20
 	if (driver->notify)
 		driver->notify(&wblock->dev, obj);
+
+	if (driver->notify_new) {
+		if (!obj) {
+			driver->notify_new(&wblock->dev, NULL);
+			return;
+		}
+
+		ret =3D wmi_unmarshal_acpi_object(obj, &buffer);
+		if (ret < 0) {
+			dev_warn(&wblock->dev.dev, "Failed to unmarshal event data: %d\n", ret=
);
+			return;
+		}
+
+		driver->notify_new(&wblock->dev, &buffer);
+		kfree(buffer.data);
+	}
 }
=20
 static int wmi_notify_device(struct device *dev, void *data)
diff --git a/drivers/platform/wmi/internal.h b/drivers/platform/wmi/intern=
al.h
new file mode 100644
index 000000000000..707d1a4711e0
=2D-- /dev/null
+++ b/drivers/platform/wmi/internal.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Internal interfaces used by the WMI core.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#ifndef _WMI_INTERNAL_H_
+#define _WMI_INTERNAL_H_
+
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer);
+int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buffe=
r *out);
+
+#endif /* _WMI_INTERNAL_H_ */
diff --git a/drivers/platform/wmi/marshalling.c b/drivers/platform/wmi/mar=
shalling.c
new file mode 100644
index 000000000000..476b87b145e3
=2D-- /dev/null
+++ b/drivers/platform/wmi/marshalling.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ACPI-WMI buffer marshalling.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/wmi.h>
+
+#include <kunit/visibility.h>
+
+#include "internal.h"
+
+static int wmi_adjust_buffer_length(size_t *length, const union acpi_obje=
ct *obj)
+{
+	size_t alignment, size;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		/*
+		 * Integers are threated as 32 bit even if the ACPI DSDT
+		 * declares 64 bit integer width.
+		 */
+		alignment =3D 4;
+		size =3D sizeof(u32);
+		break;
+	case ACPI_TYPE_STRING:
+		/*
+		 * Strings begin with a single little-endian 16-bit field containing
+		 * the string length in bytes and are encoded as UTF-16LE with a termin=
ating
+		 * nul character.
+		 */
+		if (obj->string.length + 1 > U16_MAX / 2)
+			return -EOVERFLOW;
+
+		alignment =3D 2;
+		size =3D struct_size_t(struct wmi_string, chars, obj->string.length + 1=
);
+		break;
+	case ACPI_TYPE_BUFFER:
+		/*
+		 * Buffers are copied as-is.
+		 */
+		alignment =3D 1;
+		size =3D obj->buffer.length;
+		break;
+	default:
+		return -EPROTO;
+	}
+
+	*length =3D size_add(ALIGN(*length, alignment), size);
+
+	return 0;
+}
+
+static int wmi_obj_get_buffer_length(const union acpi_object *obj, size_t=
 *length)
+{
+	size_t total =3D 0;
+	int ret;
+
+	if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
+		for (int i =3D 0; i < obj->package.count; i++) {
+			ret =3D wmi_adjust_buffer_length(&total, &obj->package.elements[i]);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		ret =3D wmi_adjust_buffer_length(&total, obj);
+		if (ret < 0)
+			return ret;
+	}
+
+	*length =3D total;
+
+	return 0;
+}
+
+static int wmi_obj_transform_simple(const union acpi_object *obj, u8 *buf=
fer, size_t *consumed)
+{
+	struct wmi_string *string;
+	size_t length;
+	__le32 value;
+	u8 *aligned;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		aligned =3D PTR_ALIGN(buffer, 4);
+		length =3D sizeof(value);
+
+		value =3D cpu_to_le32(obj->integer.value);
+		memcpy(aligned, &value, length);
+		break;
+	case ACPI_TYPE_STRING:
+		aligned =3D PTR_ALIGN(buffer, 2);
+		string =3D (struct wmi_string *)aligned;
+		length =3D struct_size(string, chars, obj->string.length + 1);
+
+		/* We do not have to worry about unaligned accesses here as the WMI
+		 * string will already be aligned on a two-byte boundary.
+		 */
+		string->length =3D cpu_to_le16((obj->string.length + 1) * 2);
+		for (int i =3D 0; i < obj->string.length; i++)
+			string->chars[i] =3D cpu_to_le16(obj->string.pointer[i]);
+
+		/*
+		 * The Windows WMI-ACPI driver always emits a terminating nul character=
,
+		 * so we emulate this behavior here as well.
+		 */
+		string->chars[obj->string.length] =3D '\0';
+		break;
+	case ACPI_TYPE_BUFFER:
+		aligned =3D buffer;
+		length =3D obj->buffer.length;
+
+		memcpy(aligned, obj->buffer.pointer, length);
+		break;
+	default:
+		return -EPROTO;
+	}
+
+	*consumed =3D (aligned - buffer) + length;
+
+	return 0;
+}
+
+static int wmi_obj_transform(const union acpi_object *obj, u8 *buffer)
+{
+	size_t consumed;
+	int ret;
+
+	if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
+		for (int i =3D 0; i < obj->package.count; i++) {
+			ret =3D wmi_obj_transform_simple(&obj->package.elements[i], buffer,
+						       &consumed);
+			if (ret < 0)
+				return ret;
+
+			buffer +=3D consumed;
+		}
+	} else {
+		ret =3D wmi_obj_transform_simple(obj, buffer, &consumed);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer)
+{
+	ssize_t length;
+	u8 *data;
+	int ret;
+
+	ret =3D wmi_obj_get_buffer_length(obj, &length);
+	if (ret < 0)
+		return ret;
+
+	data =3D kzalloc(length, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret =3D wmi_obj_transform(obj, data);
+	if (ret < 0) {
+		kfree(data);
+		return ret;
+	}
+
+	buffer->length =3D length;
+	buffer->data =3D data;
+
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(wmi_unmarshal_acpi_object);
+
+int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buffe=
r *out)
+{
+	const struct wmi_string *string;
+	u16 length, value;
+	size_t chars;
+	char *str;
+
+	if (buffer->length < sizeof(*string))
+		return -ENODATA;
+
+	string =3D buffer->data;
+	length =3D get_unaligned_le16(&string->length);
+	if (buffer->length < sizeof(*string) + length)
+		return -ENODATA;
+
+	/* Each character needs to be 16 bits long */
+	if (length % 2)
+		return -EINVAL;
+
+	chars =3D length / 2;
+	str =3D kmalloc(chars + 1, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+
+	for (int i =3D 0; i < chars; i++) {
+		value =3D get_unaligned_le16(&string->chars[i]);
+
+		/* ACPI only accepts ASCII strings */
+		if (value > 0x7F) {
+			kfree(str);
+			return -EINVAL;
+		}
+
+		str[i] =3D value & 0xFF;
+
+		/*
+		 * ACPI strings should only contain a single nul character at the end.
+		 * Because of this we must not copy any padding from the WMI string.
+		 */
+		if (!value) {
+			/* ACPICA wants the length of the string without the nul character */
+			out->length =3D i;
+			out->pointer =3D str;
+			return 0;
+		}
+	}
+
+	str[chars] =3D '\0';
+
+	out->length =3D chars;
+	out->pointer =3D str;
+
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(wmi_marshal_string);
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 665ea7dc8a92..4c2fc3c1f0de 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/acpi.h>
 #include <linux/mod_devicetable.h>
+#include <linux/types.h>
=20
 /**
  * struct wmi_device - WMI device structure
@@ -36,6 +37,37 @@ struct wmi_device {
  */
 #define to_wmi_device(device)	container_of_const(device, struct wmi_devic=
e, dev)
=20
+/**
+ * struct wmi_buffer - WMI data buffer
+ * @length: Buffer length in bytes
+ * @data: Pointer to the buffer content
+ *
+ * This structure is used to exchange data with the WMI driver core.
+ */
+struct wmi_buffer {
+	size_t length;
+	void *data;
+};
+
+/**
+ * struct wmi_string - WMI string representation
+ * @length: Size of @chars in bytes
+ * @chars: UTF16-LE characters with optional nul termination and padding
+ *
+ * This structure is used when exchanging string data over the WMI interf=
ace.
+ */
+struct wmi_string {
+	__le16 length;
+	__le16 chars[];
+} __packed;
+
+int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
+			 const struct wmi_buffer *in, struct wmi_buffer *out);
+
+int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out);
+
+int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct w=
mi_buffer *in);
+
 acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance, =
u32 method_id,
 				   const struct acpi_buffer *in, struct acpi_buffer *out);
=20
@@ -54,9 +86,11 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
  * @probe: Callback for device binding
  * @remove: Callback for device unbinding
  * @shutdown: Callback for device shutdown
- * @notify: Callback for receiving WMI events
+ * @notify: Callback for receiving WMI events (deprecated)
+ * @notify_new: Callback for receiving WMI events
  *
- * This represents WMI drivers which handle WMI devices.
+ * This represents WMI drivers which handle WMI devices. The data inside =
the buffer
+ * passed to the @notify_new callback is guaranteed to be aligned on a 8-=
byte boundary.
  */
 struct wmi_driver {
 	struct device_driver driver;
@@ -68,6 +102,7 @@ struct wmi_driver {
 	void (*remove)(struct wmi_device *wdev);
 	void (*shutdown)(struct wmi_device *wdev);
 	void (*notify)(struct wmi_device *device, union acpi_object *data);
+	void (*notify_new)(struct wmi_device *device, const struct wmi_buffer *d=
ata);
 };
=20
 /**
=2D-=20
2.39.5

