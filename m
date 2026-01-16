Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5D2F0C49;
	Fri, 16 Jan 2026 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596108; cv=none; b=txUt0SwF0byTStjsCJeENqjmnMjMifuYAspojGvqMMbYNGxUN1Yi+pMBi6cLdkZIdzE+rTt2jJZfPear1i7ZLBkT+iTWP1mMdm8OD18KDY26fnFkIuIOWHd0h/8jgNQLkGlYsrYfhopbN6V4AGdTQwStJWlntJNScRmdB4bmFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596108; c=relaxed/simple;
	bh=E0+UClZTKNFD+rOEMwUWuL+siCBjTPa2M63+5AWwdmU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dvpm1WZVd/cqy4Wy8sNUVPuJuK/PQztTLDv6wFZXpfJnctoEN80xcWYSZ6u2QRkBjSbNmGNWb26opxVh2RCtmPz9drylq2y7Z4qrqLjuc2QTyyUTecamkNY1n51qZXR8gW575zf1WvbFW2dn7yut8ECB7RPfee7lTNop0UTlITE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QyFMTYqg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QyFMTYqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596097; x=1769200897; i=w_armin@gmx.de;
	bh=nCru25MMcaxm5j3/lo9WJAhRUlsBhv2miRhQx5ANaFE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QyFMTYqge/Z07YztXVlCf2ePQjxFqKq3wTrgf8EH1whpKsjdeJrUxgmB5b0uXw1I
	 a3oIxfU8y+CsZRtkEZuN+IW0LwMBZnL18/szRTsiYnA/Jg+ofme0njRXTDgSuZrSa
	 l/WplsViqAkkeIzoO/LSt8PrQ8506URxKYysIRaU6ZPG0+Oll/l+wN6HJ9YxE6Q93
	 HTOxrOM6RcfC0E5Dg8hvxopZ3QjEduW2WxowOi7Mt9w6UJUSWsbs0BoTHj7/+ZpyI
	 MZChbTk8vR1UeyDLYMG78a54XFxsBG3YWLk9dr/+ROcQJMvVozmNqgDXfgRFm6npL
	 p8oGNCNxN15fPsOo7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mof9P-1w9ZlJ3sfB-00ineU; Fri, 16 Jan 2026 21:41:37 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 3/9] platform/wmi: Add helper functions for WMI string conversions
Date: Fri, 16 Jan 2026 21:41:10 +0100
Message-Id: <20260116204116.4030-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VQ198Jnj3FKgd1JkX9wF+DErYtI2KX9LeAiHXXWoQPaXnMJVw6q
 Rk0wDAw+OGPMdugCw61/rhRk65HSvfGwJIYha8Q4iJxovY637VYeYf+yQFAqHEGTLe6yYLe
 /gBFoeWTQPQlAzLLXpIqHbGcG716hB0G6eQtIsl/ZYbUbtYP6gzS6wP+9DaTgRzm5RG3J+0
 fLNtzW8Z+e5lfIlvkKrrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hjV09Xlug9E=;DMdfLvY+KlSJWTZNjcUwUxZYsnn
 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
 eUGcKB0/Qz2qKzGIFZhb

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
index 81f24d238a2c..75cb0c7cfe57 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -62,6 +62,11 @@ struct wmi_string {
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

