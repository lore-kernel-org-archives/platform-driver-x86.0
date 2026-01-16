Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88776FC5;
	Fri, 16 Jan 2026 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596099; cv=none; b=JB7iGX8mrFyiJLUKajAe+rmtlzxWBh6L22XxivB3bm8ii/KWSn3OM8F1dho0eETJvZf4zpvTLoZfhwVdcjeyVfTkwkFcRf9G1YL+1we/yEnuX27qslqb7IggbkRkt3JtqTb97ZAF5C0jGR1Rig9Wq4ujA/ox5iP0XRQs7+NIo78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596099; c=relaxed/simple;
	bh=qT+2sjf30wZ5UC8+y4lY3vfWzM/sOEocts0u7zir5z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYnrwvL/zsAIZlZL/EHqL9SXzwSHc5QMj892T/fHm2bBpWFWDwFdAqfMjwb09GfKT9JwWAw8byuP0q1V/dKmUaSFZwYpHIlK30iu4Im3inlaK6yR8FGxTo10Yl+plVLyXlC3RyLnV1K3qmhNnI9uFxGpwWOEE9mqxrMnvtJ2YDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aBk9e5Nb; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aBk9e5Nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596092; x=1769200892; i=w_armin@gmx.de;
	bh=ukB6cf3vC4mjh9KvbRYIgdauBC3uUHGtcJJ++dTUbtc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aBk9e5NbYd0xPfcu67Yf64Fv/KSAdGmeD6EBRv+nJ08RcQ0SMdiLDfSgRBpn887m
	 T3GLMJqhazyq28ScAN+wQuzTZmmHlYF8BjQ7QPCgy+pOcKyUiYMa8wdRkFqipm0pW
	 erefZnVTvNky/ChbG8/GAcQCfZn3XJag6ZrvJkWbpFS9zyhOIe6LDmKkOYWe6cEkB
	 eOW3x6LcZrX0q2w2WO/FuEPRgT1uf7rMlSsjxmTujZTyqHVC6ZaDyNgN2MV/f2rk3
	 VNzx00WBh4hzNILUxt70UGB4U+0at8kjpw/N9kjjmckEVcSLQFjuEROq6Yz2MCZjg
	 XLbdsR3lEbCh0/YrxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MJE2D-1vMqm03O8J-00NxWr; Fri, 16 Jan 2026 21:41:31 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/9] platform/wmi: Introduce marshalling support
Date: Fri, 16 Jan 2026 21:41:08 +0100
Message-Id: <20260116204116.4030-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FfK+MWLddMEUYl5FtxzYU1kjoS1yN5c5FwGJr0wO4bjM6tVpZ6D
 JIkHOeVoKgPib+MXpkag215Arnx/jIwc7sr4abHvhJm/r/92Mhq3n0wuj14qgTI+DNWVC7V
 Nu0z2ycvlZHQ3T0kO5PWxjpnyoA69BkiF3QHgdF5BYPRr860DhiIU/LDbwoU1mkYajpo8Ma
 JmLgwE/NFW8lc2FBVkZaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5IEmMkENxIc=;g5rIqPuExY99mTT2dMkxzdBh3bx
 jZ+mj/t8XhPI9wCdLnZj0MkQmN9J7zpInYecDAj3wmM6ntBzqSyuMgIcD4zJR78sqrhxWYaeU
 gFDpm0pzjBQLgJ3hVs6/pBYKLrikXdDNcs1FFxAsEkvRmXsZlFZ3TAVRm48Bq6eoF15wc4f6k
 vk9/MCkOMxJ2YOwzyaaaUOrKhGYB6IvkcN0bibaU1KLQHbFCFiglv4XyQRKJZWe4ET8m5tS0C
 iEDBEhpGlf7Cx7D20cXRZKhHrvoK4RwG5RjrRs8l9TzubMrATvqTGejjx8zS0o0710vU0wgbY
 YUX0foiiKI15N73pZZuwNhFfDZZRjT9Yf5uPebzwQ0/AyHbsKGNQiaRV7L6r3QiWnlY6hhWEo
 IpRJW+/wVxQ8lKm+CViNznx6tv+sSQyDQxEsCCKFa3JVTMeBX4chwGcLrIXKHwGCGw31kRxyV
 JmMPkRypuW6iWg8D8FbS7EruPtgvpCou9R38SfgirjrHuSvcqHtlbbRLEla+yjEk/+9HRrlLs
 sIoqQLzPUd4Mp8hW/ygPu1afx6rN7mx66ao6bBqPr7WCL8ZhQo1/dJnBHzovnhzYuRIWZOqH9
 evifqosBi4m/8tmOZzrVq8YgQU9i8+Mwxt8iJeG4CsdKcYnkFwEbcGpWhS+PYkwjdg6Ylcsmr
 XtEqnMgYREZTR3ld3bep9GNwdho4Ve73xysaWuzgBuJrKz0DRKlZBoTghvyLtYRDExW41GMHd
 oJykspzoyPCHRxyiUC4DOO/FswdgWxt2PpgRjUCMNaFlE7iqom0R/vDwcePWYgVpMNVmAZ1v1
 cDlvRwp+VbjC2z/LN4EAuxhGoeLKF3aDbxh/YkqW6vpcCjFucr/Dxmx0W1Tq+I6+jwtH5HYin
 MuIJPa0wrKScKICrYJrCm/4ib8H48vNgS2XV68B42qCNTqvrWoNjCzlXnZWyEN5tVstIYYmpG
 cpr7fNPEKb9TaH70fyH6fgbOs+CUkT4Ji66PlO2wAgt57HrrThXqUQirwi4AYrfFeueX8x0O6
 lQUD3YFRDGBEonLgKEE1J4TlivI7Emw18eJuOy/M8vw0+bMiNeqPbgRwIEn60dxCYXuodEjwy
 Av2c8RZ7bMD/ADjvbQJ/nCwFSPALsRhUAt4jPjQl3dQU4UzqMpqvb+mbnX8IbJnPF1H0ey/Zx
 O5wtL7AbGYVkCvQf3ohxC1Hk9BlKWJWNKfQlkLW6N5XKuVGB569t+Y4UFDNqVVj34ne75ZXJP
 ys0+GraiuISvniDIWer1UZcVKsaCH+sDEoLDZK+/tI7MUQsq2cHQRNFk5h/RKZCS5Yd/AcEXI
 gEvHRnjDK6xTW8bXrbcEQQpVT5os9CFD9R5mXW/emcol0nuHTIOvDjn64xFwKkGpONpNZaSQp
 YAwfkgY1R6QeSqSEftdzSXTAPBHmGNUjEpKZq+vDFeu+eVUXi7KV9CQbrvYMtR9adbkGvs41Y
 Vtw7qfNbbcUzZoItuUKYGzzlBIEHxbNRD6L1rbrJD4QA7gf4nBBIxnjO377CFViEArImXBhY9
 jWmFpTWSBeI+0JO+Ft+YMP/2sVVr906oAUmx7Bdnzux9hwaXgCP8C64pDDZ0HOqVcOJS5xitD
 bEXRd9bH2my0mktilDoZQbhIj5n/7J5lmawg7mL1/3uhFEyPSHVkpZzyOJXDGFlR+3oqFB41W
 NWSsWYRhpebI9cOcse/ueS+5wcyvgmSoJUn5wvUGV1UP2Ru1W0asuujZjpYfLOC5wiWP0h/+y
 00o61kvaY0NP4SMU+stz7uLi2aOSNnIpeWKYEUtRRzUGF7gs2Hh0U5RSgavfUA9SeSLw2N45b
 xe5o+3cmhpw3UAYrMiFrnQVN0y9vPZmQ0Wx5gnjEMpho+bfjc+OsL3Yc+rpkmJfp1SQP/0Dc3
 S2C5fEx9EtJjzv5MpG9eOEZyBhuz5nKWbkKMivqm/NL4O/QQAtuUKR3u/AvuSI8vIyNAqVVNn
 ua/M8QPcKbw1SMSpdt94T5qYvIJrcJje3bBXK7t8I4l496xIQnPg7+vgKktsraMJsYyg5CjTJ
 zNg3l0McKSuiMA7zt1X4vtXcxTjYkVS88hEqRx4eyObFrw08ECjYjXCRALmVYhmTE19SjDJD3
 NcPkMerwL07Fwf1NrMdO6d/TU/jASCUIB9AtD/RutwV77KEI4AGYTq4rYICZEIQAziP8Lh2dD
 sbeGjHXRnK6eueWj2udhnyJ1uu6gvJlhu0rZXZOSSofLl5Mc9RHb2pYRKkY8eDdnY6WXWeqKh
 ZcKo4gWwTOVDjcie6q0dtAXcNc93xjWZNUvUpV9B3kPo6rYR3Jyi/ew4LG64LoFpJ3LD/NC/2
 Cur8eXuETEC2gPrkU3UGaNBLwwl2tzN+UjmAZ9VvRhGxVkjAlpabpA4mAPj5NVK3QSLrgzLUi
 i9VEwhxRb5dqf2hr9WwuljtmATA09FtwjqSI2ZTK+piMcRM7m/y1FHcLbWJarQcxtjEqBEHVk
 Dd804hh4La7WlLl6pI34RZ3sZu6JPd6tD5N4UTYGnVTUVAb2iy7L+zgnS/3+1aa2f6c/L2H11
 xZTF1VGnC+IE/4+ILRaFhaoCarsWBoe+ciEcEAQHkwy1XZPW1KSs9lOXjA/n8me/nv+ywfZpa
 /6UdDjOdXjOW19oxnBN31hxqIFJ2A9+DPFe+j1vE60a/d7aTmTejG03hj+wbODvcFZi49wjEV
 aFzxBriFjVRBQipXbReVXwb33co9INLc+332Go5/j6PXkUIGSP4G5JW3x62SBu8V0cs1VuEb0
 Zr3G+WRByXEVLDiTporVqYCuuORF6ZBfPnYXzrGtAs8og6+pSY7aKtz+0n/Ndbcfo8kSxW+wu
 dB7tc72FI1/SEEjUHXwvPgVGT4WAHBuK1AZoiADw9Q1FG9UZk6QGsvVXjVflAxZSH8QKpFpI/
 lU9+mD6TldYaK20KIdtATo2shAE1e/IcxabyfEqV8Q/ruHES7xemxr/WfT58EPwCbjlN/TZ76
 UxFwa5k1ROCFN0pNJGeOewkZOR69HFikjHEQLWn0+cMsJesUdlv6o2cPaHdg/5mfFKEhDVWgC
 7pjbmd362b6++XW3xAMEsQrwFLVGWBdA7UZmRA0KjfzPb4ZTxgROu29WCq+3bYPyhnfbuCTOI
 U4+MHfV1PlEC5MKYFb6rdUXJx8f1nr0m/2QuU9Z2+wKQZA0cu8Om5ETbYvCKCApSiGwx7jkJ/
 OHaCAGi6/vqCSV2ERfJidfWWBAtayF4+bu1w6i9Mv/d9SitArwcSnSiciFEWTeoSgkXT68bfU
 7cM1/pZVo3+yvCHrmA0POB1XJyOXo1q0EuS84UKjPD4wiNjAc+e4DBdEqAUzSJnvXES9TeG6R
 lCiT0WRJDteZ4exf7XIPDmaEnJmfObAQIXrZGdjFvEZjRTUL0GVaK9qqiENYNRaT+U1zbNjyq
 W9NNUUFilAxI/RTGHxAl9H4RUVsiQ4REWqvo+XK54uEJJX+LoYIIpkBrMF/ko0/7ufSHgE9Cl
 EKM5QUjKLjRNkRnW3qarGrjOMv6IKUeYS+OL0QPZuJIRm45BpuHoDnN/YrGVc3rmO7k21KKl/
 mrsZh48NIN6vGFUun38X4xy9eRhFm8dN5iK61559k/AB61bO9YriVG9E0sAU5SmIA18BQBPsU
 i3rULMSnFf7usOLCYwcQpDa75E/fpvpEj9+zh0210VQfvViHpUtCyXWhQS4WTc9XKqrHdz8ks
 v8NWL2OWuymtuNbBPfi7Aycv0DKpyOGGGKcCqnho8k//0ytb8abnGr7ugV9PknV+wQIWg5LJt
 dXDnAYUWbiGmm/E6e1ifaMOmvk/faV8se54j6/9NG75bxwy4E5Qkcah/IBxiuPC69jw9SYSXY
 4LNyPJu7Xc63W/WUGND4wEaVbNn8ZNA1aV4LYlSHo4xCN+o4a/a1bT+Y545EXwg1krT8DFxqM
 pobFZIj5abbESD+f1bqRjvC4HyScE3i4CMcsBbhho7COzYhT/kuL6wEvodPa21876m1SlYVQO
 Pz6NTRzKcJJMOtEM/q/6OuZnxsyiGAGzJr3iIJJw5bMAF00jlabafPAjf1rXwyOeTjOQj0ULG
 P+ClbyF+orCUkpClS1t5WzxQvAtLFsPckhEudbqjGBf2y4zGXZAxGFHnZvXKeHHIsHgnzuogC
 qDgMoOr83hkalM+9i9oHY9UqJn9BJjwbjujD1E/DRfEJYdfxvuSI32CuEMP6anuKQM1Bzl5/h
 xNa7LASt3/6gkiVlutAVCm3mCJQe4mQ/3nCyf4KxQ1C+kAYnZXw2aZ/tdP5BgFG2AqWxAKN+R
 RTVwjENBFcMNr3JN564rJSwiYU6/0h/wBSN/t7SdHygBfYMgoUjZkpsuDFc4Bb2k2RtvTzCYZ
 IKWEIJB8N7P9FdMyAR7CzsDLggbV44koqoNQFq7YSK+Vc8PBYAOBFL6tz3yp07GCRUPkGwgBG
 TyzzsfTqJ2H7OeGCnCJiEJG+j548oV/utYQEEkMiKK6MQBwM8Wlo7NN9IFoT0Vhm3Xl98MvKk
 fIQPTYXGqz7+yTgUKXg4IOyJOjMLrsRp8ImwC+8v76hAX7Ywx+qAqOkXcfj5c20+py0Lro1ig
 civZ2BG+S2Ie2QjnF/OroJKKTCKDsqcmpgTht75Dg+Pr65akum3cB0VEgcsHqKBg+ApyyVnTL
 GvmxOxEhRfOSGLcuyrfeWXbZnFPyD66uZ9z+b+/d7PSwM7xwkSNvzdZoSUSmEM7jx6Pa0DJQ1
 cERhM+eVb4VRMnvumsWB1OgeNlxXwug8fA/sm75g4xsNxu3/q+7dDbfx44fnL9gh69GeQq0Dl
 LJOlGvxrKuGcjUNbeAPiFMrpPNDQkAi199JWbkCLRkvYS3m9lGdXU+pEht17zhoV2eAgMVVth
 oC1NyOssbIi7NnXdfIuc7MPsuVxOvugg+Kb32lHMuXWMZaBbcpgYHGiT4/PquuL8SsSL4Dk6j
 nWiqDoNIHNqqTEz7AsSuHF9wsrmlS5wMfM2yyZI6rmY9cNh3JrdbzmlFO0B4ZXgtgWSK5OEsB
 5abA48T4CBN9rSksEuiW9vk4IQy24LW3erTyhLaDwpkRumm+m8dSKgQyHR43iue8VSGGtdMqE
 sO/ljyfeSoVfwNRQEO2KULZOJSqsxJX64/Y2mzK5KvKoZs/yxX/4x7EpHlDHQKKX+yum9Q/Aq
 CyPnA7+JOV6NlTvR9ioeGSt3T7j6oU+dcnjs1aAl8xebEOk5huIJRKVLokR2AxDefqSCK479a
 apmSO3cfDJJNveIpyG/KQL2QyMVAaKXUJz3AzmUDImgyTnyR+3xcZhHC7ASjcv3zmxdE6dpOi
 HrwVIGRNEh4vPVZsO43rJJJ3LDJGxl6X+ykszkT2ti4Hxf34d8Jl8ERwNIJ4b3w=

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
for WMI data blocks, methods and events. Doing so gives us a number
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
 drivers/platform/wmi/core.c        | 160 ++++++++++++++++++-
 drivers/platform/wmi/internal.h    |  17 ++
 drivers/platform/wmi/marshalling.c | 247 +++++++++++++++++++++++++++++
 include/linux/wmi.h                |  40 ++++-
 5 files changed, 459 insertions(+), 7 deletions(-)
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
index 000000000000..9a39ffa31ad1
=2D-- /dev/null
+++ b/drivers/platform/wmi/internal.h
@@ -0,0 +1,17 @@
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
+union acpi_object;
+struct wmi_buffer;
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
index 000000000000..63a92c4ebab5
=2D-- /dev/null
+++ b/drivers/platform/wmi/marshalling.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ACPI-WMI buffer marshalling.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/align.h>
+#include <linux/math.h>
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
+	size_t length, alloc_length;
+	u8 *data;
+	int ret;
+
+	ret =3D wmi_obj_get_buffer_length(obj, &length);
+	if (ret < 0)
+		return ret;
+
+	if (ARCH_KMALLOC_MINALIGN < 8) {
+		/*
+		 * kmalloc() guarantees that the alignment of the resulting memory allo=
cation is at
+		 * least the largest power-of-two divisor of the allocation size. The W=
MI buffer
+		 * data needs to be aligned on a 8 byte boundary to properly support 64=
-bit WMI
+		 * integers, so we have to round the allocation size to the next multip=
le of 8.
+		 */
+		alloc_length =3D round_up(length, 8);
+	} else {
+		alloc_length =3D length;
+	}
+
+	data =3D kzalloc(alloc_length, GFP_KERNEL);
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
index 665ea7dc8a92..81f24d238a2c 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -8,9 +8,11 @@
 #ifndef _LINUX_WMI_H
 #define _LINUX_WMI_H
=20
+#include <linux/compiler_attributes.h>
 #include <linux/device.h>
 #include <linux/acpi.h>
 #include <linux/mod_devicetable.h>
+#include <linux/types.h>
=20
 /**
  * struct wmi_device - WMI device structure
@@ -36,6 +38,37 @@ struct wmi_device {
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
@@ -54,9 +87,11 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
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
@@ -68,6 +103,7 @@ struct wmi_driver {
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

