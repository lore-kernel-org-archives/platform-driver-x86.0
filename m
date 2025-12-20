Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B5279794;
	Sat, 20 Dec 2025 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263624; cv=none; b=h8Y9rsboNDF0Opjk5qJpYTqxgnXdkb9oeeEVl6Nzuy144cHfNqrxssPBor0AjW5FZ3U/kytpD8zqt1NQlwqy9i8ZDKK93quo9GWSIUaHZ7TIBeA6eleqd4APrHbWl+NjWi67kXqe2u0Oayl5FltvJVdyKGUcrX1NvJJ9ZENPrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263624; c=relaxed/simple;
	bh=xLk9zIAKLFK5NSyVBhqid7P/VsmVLZ9C44myHTpz19A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O3FvrvzVIJNm1+JmWviBd4PNg/BipNmz2WLjKxhqQKVLueNHOX3u0JgYfyHdBtzZLaN2ZnRI9wZFzUjOHoLCkjcMkcHHmreNrLdiqkKnZspeuy294/U2f5pkU8XTLCHgKTgwFYxkV3qEaWloZKS3kDdLEbDoriiMOuAxhBApjyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FlnG2uFh; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FlnG2uFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263616; x=1766868416; i=w_armin@gmx.de;
	bh=tg7w8vMJVMZ5N7O9lx3o1XoJ8SREmYXTOli9mx6j6t0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FlnG2uFh4oti5fHjY5p+312KVt8pAaaaOrPGWi4P0paT4WxdtxMBhIGpH9oHP2Gk
	 TdX9gho3TQDC+pmo0U6kGdbtHhowmvWgXh6LCx7kdvx4yFfTLJigTXZV05LuymKRY
	 5r7jcLRUBskLpDiICrP5OR2OLw6ccjo+FWgwE5x43ziSzateor9n7EaPTdmEXzhn0
	 GT7VMVV3XHB4USAxs8PccpNUW5TGVYe45l4uP98x6iZXZHnOkaXrefFRhBPNn5/2n
	 jMfq0jjFFXR9WyA4rky+irSt+wNbvJNyw5Hzcwdn18xwfz37ZQYWraIWShgpc3ZRC
	 NkqVaEO2asBYy7hUtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MkYbu-1wFm4k1sFy-00p5tF; Sat, 20 Dec 2025 21:46:56 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/9] platform/wmi: Add helper functions for WMI string conversions
Date: Sat, 20 Dec 2025 21:46:16 +0100
Message-Id: <20251220204622.3541-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
References: <20251220204622.3541-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gVyIe0xa8LmSmgUynD65Fqtd19+pWMQo8QJemIrhtx73pniHxkC
 jSfOZD2HLrEGfsCQDnq52acXaGJ7dud8TSXkWOv8RpxzEb2TRyU1WRKJjkGnE+savEd+NNm
 LgPs3gpEf6Iggnd2GadlJrjhUkZ7ffSunyWWIbdYRb85HC3Skw4NmViwaWr1QncltRhZF1+
 Vpt2/X7IYkg9UDw55OZjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cDDlheaz52c=;DH9Lp6umvjDz47cJ44PT6JpbXGh
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

