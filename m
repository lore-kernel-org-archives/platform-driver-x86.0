Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA82D6E7E;
	Sat, 22 Nov 2025 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843925; cv=none; b=VhAHapwvX+GGrGXbTvepW+2eB7wTobGXZePZ5VVyLXc+tLdgUj57yakva3oGVKC/C0WUyDal0HRWyrzATRW2jo8BsLhrIB58hsqePp/nfghVZgy1Fd+6eaZPFSY2tZuoFzpyYdz+wR3E+kRAvx1YHqagMkG0Ey9ccP2DfIUyTIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843925; c=relaxed/simple;
	bh=xLk9zIAKLFK5NSyVBhqid7P/VsmVLZ9C44myHTpz19A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IKDRKVSN/kWruK5h2Xspv8ffDwnXwIqYYMGAMjo39/132q1IGt90LBHy26pg1t9qtP6PmIbPVwbD9Z1igoOCp/L0Q6FTtwb5+G2lBpK7uTFtX5O2CD7e66Hsj0358SsyBvYHlw2PxE/05K52vcqbJC2zW/BflT4sLoFpSEMQy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RJ9TqktS; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RJ9TqktS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843910; x=1764448710; i=w_armin@gmx.de;
	bh=tg7w8vMJVMZ5N7O9lx3o1XoJ8SREmYXTOli9mx6j6t0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RJ9TqktSNqyAWeP0lVPvDoBhMUMOEHwbgN7kgjbLEbFlRFz+goYdkSCyaqpB+yPn
	 rDEkqrJISYSN1VZmuHUUym1kYSSfsATFVbwxPPACKGS+Qg9pw9x/f7vdf6t6Y1Or+
	 eqU69Uq1OMrNObaXuh1mtCQVtVCLXT6BPzugjGEaiGMORnUjwKlkmPLmkX+Q1TJiP
	 09WLrVQmN9Uvy9SMbeCBCeSEdtGpL5Sf52sqSRbx5XfSbboylSZ5ACFUcVm6+kVGY
	 6kHHof/VLl6HgXYDFUX254LVUCkit6AoMjVnpLI4ccRNHHns+cLoLp8onoD8Ng2h/
	 sxctTsYPAwxiERmtQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MJmKX-1vh2aq3feD-00HggI; Sat, 22 Nov 2025 21:38:30 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/9] platform/wmi: Add helper functions for WMI string conversions
Date: Sat, 22 Nov 2025 21:37:57 +0100
Message-Id: <20251122203803.6154-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GKK057yT1pOjQD6PTeuXWZPh1uru+eRQi7Oo3AJRMdcASYUpX6g
 Wdq7lj617CuUi3iANvN7INayA4Zd4w3X2Mi/s7BMIcRgDhwTYxGyYw495LxOkvWgVJnrZye
 vnJU5Zpr9zTec5SVISlyiudIGEuVv2VP0f165qzKAh2nhtwa1Baj3zGz89xRFt6i6lMo1h1
 N2BP/ssa51KELsqy2eShQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XOgDjSpHNpY=;uzElfC9jj9XihaGwvjGEDinBgTw
 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

WMI strings are encoded using UTF16-LE characters, forcing WMI drivers
to manually convert them to/from standard UTF8 strings. Add a two
helper functions for those tasks.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/driver-api/wmi.rst |  3 ++
 drivers/platform/wmi/Kconfig     |  1 +
 drivers/platform/wmi/Makefile    |  2 +-
 drivers/platform/wmi/string.c    | 92 ++++++++++++++++++++++++++++++++
 include/linux/wmi.h              |  5 ++
 5 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/wmi/string.c

diff --git a/Documentation/driver-api/wmi.rst b/Documentation/driver-api/w=
mi.rst
index db835b43c937..b847bcdcbb09 100644
=2D-- a/Documentation/driver-api/wmi.rst
+++ b/Documentation/driver-api/wmi.rst
@@ -16,5 +16,8 @@ which will be bound to compatible WMI devices by the dri=
ver core.
 .. kernel-doc:: include/linux/wmi.h
    :internal:
=20
+.. kernel-doc:: drivers/platform/wmi/string.c
+   :export:
+
 .. kernel-doc:: drivers/platform/wmi/core.c
    :export:
diff --git a/drivers/platform/wmi/Kconfig b/drivers/platform/wmi/Kconfig
index 21fa3e440042..d62f51ff3b7f 100644
=2D-- a/drivers/platform/wmi/Kconfig
+++ b/drivers/platform/wmi/Kconfig
@@ -6,6 +6,7 @@
 menuconfig ACPI_WMI
 	tristate "ACPI-WMI support"
 	depends on ACPI && X86
+	select NLS
 	help
 	  This option enables support for the ACPI-WMI driver core.
=20
diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefile
index 93f37ce519ae..2feff94a5594 100644
=2D-- a/drivers/platform/wmi/Makefile
+++ b/drivers/platform/wmi/Makefile
@@ -4,7 +4,7 @@
 # ACPI WMI core
 #
=20
-wmi-y			:=3D core.o marshalling.o
+wmi-y			:=3D core.o marshalling.o string.o
 obj-$(CONFIG_ACPI_WMI)	+=3D wmi.o
=20
 # Unit tests
diff --git a/drivers/platform/wmi/string.c b/drivers/platform/wmi/string.c
new file mode 100644
index 000000000000..0fc43218aa5b
=2D-- /dev/null
+++ b/drivers/platform/wmi/string.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * WMI string utility functions.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/build_bug.h>
+#include <linux/compiler_types.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/nls.h>
+#include <linux/limits.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include <asm/byteorder.h>
+
+static_assert(sizeof(__le16) =3D=3D sizeof(wchar_t));
+
+/**
+ * wmi_string_to_utf8s - Convert a WMI string into a UTF8 string.
+ * @str: WMI string representation
+ * @dst: Buffer to fill with UTF8 characters
+ * @length: Length of the destination buffer
+ *
+ * Convert as WMI string into a standard UTF8 string. The conversion will=
 stop
+ * once a NUL character is detected or when the buffer is full. Any inval=
id UTF16
+ * characters will be ignored. The resulting UTF8 string will always be N=
UL-terminated
+ * when this function returns successfully.
+ *
+ * Return: Length of the resulting UTF8 string or negative errno code on =
failure.
+ */
+ssize_t wmi_string_to_utf8s(const struct wmi_string *str, u8 *dst, size_t=
 length)
+{
+	/* Contains the maximum number of UTF16 code points to read */
+	int inlen =3D le16_to_cpu(str->length) / 2;
+	int ret;
+
+	if (length < 1)
+		return -EINVAL;
+
+	/* We must leave room for the NUL character at the end of the destinatio=
n buffer */
+	ret =3D utf16s_to_utf8s((__force const wchar_t *)str->chars, inlen, UTF1=
6_LITTLE_ENDIAN, dst,
+			      length - 1);
+	if (ret < 0)
+		return ret;
+
+	dst[ret] =3D '\0';
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wmi_string_to_utf8s);
+
+/**
+ * wmi_string_from_utf8s - Convert a UTF8 string into a WMI string.
+ * @str: WMI string representation
+ * @max_chars: Maximum number of UTF16 code points to store inside the WM=
I string
+ * @src: UTF8 string to convert
+ * @src_length: Length of the source string without any trailing NUL-char=
acters
+ *
+ * Convert a UTF8 string into a WMI string. The conversion will stop when=
 the WMI string is
+ * full. The resulting WMI string will always be NUL-terminated and have =
its length field set
+ * to and appropriate value when this function returns successfully.
+ *
+ * Return: Number of UTF16 code points inside the WMI string or negative =
errno code on failure.
+ */
+ssize_t wmi_string_from_utf8s(struct wmi_string *str, size_t max_chars, c=
onst u8 *src,
+			      size_t src_length)
+{
+	size_t str_length;
+	int ret;
+
+	if (max_chars < 1)
+		return -EINVAL;
+
+	/* We must leave room for the NUL character at the end of the WMI string=
 */
+	ret =3D utf8s_to_utf16s(src, src_length, UTF16_LITTLE_ENDIAN, (__force w=
char_t *)str->chars,
+			      max_chars - 1);
+	if (ret < 0)
+		return ret;
+
+	str_length =3D (ret + 1) * sizeof(u16);
+	if (str_length > U16_MAX)
+		return -EOVERFLOW;
+
+	str->length =3D cpu_to_le16(str_length);
+	str->chars[ret] =3D '\0';
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wmi_string_from_utf8s);
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 4c2fc3c1f0de..fbb794951388 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -61,6 +61,11 @@ struct wmi_string {
 	__le16 chars[];
 } __packed;
=20
+ssize_t wmi_string_to_utf8s(const struct wmi_string *str, u8 *dst, size_t=
 length);
+
+ssize_t wmi_string_from_utf8s(struct wmi_string *str, size_t max_chars, c=
onst u8 *src,
+			      size_t src_length);
+
 int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
 			 const struct wmi_buffer *in, struct wmi_buffer *out);
=20
=2D-=20
2.39.5

