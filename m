Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3D8462;
	Fri,  9 Jan 2026 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995218; cv=none; b=G0pZJ3Rh4OoQLoB3zQD+hvBn8b7K0cSOo069U5HOJOMQ97wjJIlxBaa3nrb5cEM8YczJlYw6LfZ7hJ9OuhFJufCCA0dNOdvruQfnX3SXlLTZKsPp6rAXcKT3eM0zMNk845IIp0eo8F1g0ovtsrF071RxXDd+p+W9HC1NuvLVT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995218; c=relaxed/simple;
	bh=E0+UClZTKNFD+rOEMwUWuL+siCBjTPa2M63+5AWwdmU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W8TysimwzDLx86AtfYBudaT1h+5kz5FqGAKIjMCMkEChjTpmXXb+wxL/OvnMUeuCAZo1YCY2yzCNJhO25dNCFcilw3I4b+CzYuZDU3xA3/fm77U76b6MefiW14DxyJH9MS6315QD/L4FrT9ly+w7wE4qf1A81kjEgkkjfaO9gho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=clLyW0ON; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="clLyW0ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995202; x=1768600002; i=w_armin@gmx.de;
	bh=nCru25MMcaxm5j3/lo9WJAhRUlsBhv2miRhQx5ANaFE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=clLyW0ON5JLfZoSz8DAZO9vH4l+MnJM64cw5ixqX/+e1KMuR6KO9gPkwT11qZDte
	 ZaqrAtqQbwkMIORWoZQOLXCJz0HvBlA0mG5FTveY+BpwXjlb5sAf3aDjVWisMCcP2
	 31ztDLMnmFcEDdAx7NY375gyxa/3+nkH+HtYN7ybq8Ihz1TUxPFGJRxGZChneQO2V
	 H6zp0ZVEodcsuk7QwN7ro3p9nQQ/axEUxPV1Yd6FrXeIT29d+9IuFE23DxodsFGWp
	 uLi+rAVopwfKB7nzMIPSCzYoT3oQpYWD3Pwi3fIOv/eJSWVh8Dw99IwHrtY0CRVc/
	 XRtpVzGzaOiXo+HTIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M3lY1-1vebAH0X23-007NOc; Fri, 09 Jan 2026 22:46:42 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 3/9] platform/wmi: Add helper functions for WMI string conversions
Date: Fri,  9 Jan 2026 22:46:13 +0100
Message-Id: <20260109214619.7289-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SMBTD9afB4XbmuosnPnWOKTZak/DGEQkzOHVVXJbvyBEwLj5hoI
 rwbPem1zwFbeLfDV7329pga0RUTcwhHvJJrFpOnb6VigTaTD4mFu/3VA5wLNpw0pXTctJcY
 Zobll99NWv4C0jzopBgX+plZKSa0hp2NCpNg9/wHCWc9LHYsZcDBXJfPhh3xQkQq1JKH7p5
 mwA33ueLRIY/wiopw1EFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CdCV5juykc8=;LwnWEZacLiFN3AjJeEfYGjD8QM2
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

