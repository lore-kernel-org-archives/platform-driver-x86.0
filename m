Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4444430FC1F;
	Mon,  6 Apr 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510238; cv=none; b=EpRHRRSLIw9HyLW8MLU5kQlpPGbeZxEjKIx45YkDgUVuyIEi2DMe62BYZ2E6VrXm6A2/aACqeWI5NyFK4PyzSTrcXAHed61StvYINcMnjwSFCElgUTLl0oOJRaQd3R9Pn0smz5g9HXq4wxokfCNpytLkRNspH8NhMacYFLpioFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510238; c=relaxed/simple;
	bh=MxMv+Ci8TL3hNvNGArODu52ptFJu6mGX8Ex66cJ70Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0C32+xQu/DVot0RRK7r+UAXt60jOqwtPJYlEBoF+f2HRGy5Oc++iyZ4CcJL66EKFYcGD4umBXwv/fzqL26QtD/vs61Kf9KdtXwO2caYzPNAFBGvG92zSGz9Ff7P/5ND/H88b/cOwBPGeIVh50B1LkdvlyxqZn58wVBoqO8IbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=B97jLEhQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="B97jLEhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510234; x=1776115034; i=w_armin@gmx.de;
	bh=CBH3e+4VfJy2uBGyhXCt5dNYaJXizOez5K79ahupPkQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B97jLEhQdePpjAHKs2rTwtlqCWC2cWYk9mXNk+JQM+xyxrB1SUmYPHjTfd2spIZ4
	 LV68JCKl6uPJw7DebTFDjqL60CGPgLxebwLB3QpVYIZ5GDL+kSJ1aYGs7RADdvFPU
	 HEyrGvvSn7GYp0yYuFSpfov2tSa2C1nk1g1wiwQoG5IvWThIaTJfIPRb9sJIIsP7v
	 oeCN16QNBZ2oK8Aze4sceXr9XvTzy0LTOiYI1/R7W8tH/moOTQBGQiv5N44uMN8Ls
	 m6AJxC2SidlR3UmNTOtJO45V2xL4oh5BBMDrYEv+TXtXpXkH0QgOz3jdzofHJ3eb2
	 LDUEoM3ChVWyfzFvjg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1vkO4X1T51-00qcKv; Mon, 06
 Apr 2026 23:17:14 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] platform/wmi: Add wmidev_invoke_procedure()
Date: Mon,  6 Apr 2026 22:32:32 +0200
Message-Id: <20260406203237.2970-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406203237.2970-1-W_Armin@gmx.de>
References: <20260406203237.2970-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7KNe+H/gVXJF5V/t6uf6aDHYabaCxm/WpWQJmieeCNtJ+x7/DXP
 /GgZFHYr/4dVyf5Xp3JbQnNut/Zcc1chjxuopKNDnXZeILH4wlje9nSLbkmyvH00x5nwnNE
 bbPVDTNnMp7+ZlaFySOwfaCruka66N9ZBWVMQ3Nw8u6ohW4IQrdpkR8r24ireJNU9QBrQTJ
 8Jf9rO8JdBl13vsx0xWWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:81BPEAJ/gZM=;OPfyEnL5l0wXsroD4yp7R6xfRJC
 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

Some WMI methods return no values, so the whole postprocessing
of the result data is not needed for them. Add a special function
for calling such WMI methods to prepare for future changes of
the main wmidev_invoke_method() function.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../wmi/driver-development-guide.rst          |  3 +-
 drivers/platform/wmi/core.c                   | 44 +++++++++++++++++++
 include/linux/wmi.h                           |  3 ++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentatio=
n/wmi/driver-development-guide.rst
index fbc2d9b12fe9..5b94402874c4 100644
=2D-- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -106,7 +106,8 @@ WMI method drivers
=20
 WMI drivers can call WMI device methods using wmidev_invoke_method(). For=
 each WMI method
 invocation the WMI driver needs to provide the instance number and the me=
thod ID, as well as
-a buffer with the method arguments and optionally a buffer for the result=
s.
+a buffer with the method arguments and optionally a buffer for the result=
s. When calling WMI
+methods that do not return any values, wmidev_invoke_procedure() should b=
e used instead.
=20
 The layout of said buffers is device-specific and described by the Binary=
 MOF data associated
 with a given WMI device. Said Binary MOF data also describes the method I=
D of a given WMI method
diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index b8e6b9a421c6..7cc5ca11a60d 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -427,6 +427,50 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 =
instance, u32 method_id,
 }
 EXPORT_SYMBOL_GPL(wmidev_invoke_method);
=20
+/**
+ * wmidev_invoke_procedure - Invoke a WMI method that does not return val=
ues
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @method_id: Method ID to call
+ * @in: Mandatory WMI buffer containing input for the method call
+ *
+ * Invoke a WMI method that does not return any values. Use wmidev_invoke=
_method()
+ * for WMI methods that do return values.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int wmidev_invoke_procedure(struct wmi_device *wdev, u8 instance, u32 met=
hod_id,
+			    const struct wmi_buffer *in)
+{
+	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
+	struct acpi_buffer ain;
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
+	status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, NULL)=
;
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING)
+		kfree(ain.pointer);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wmidev_invoke_procedure);
+
 static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 				 struct acpi_buffer *out)
 {
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 75cb0c7cfe57..b00950dc1231 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -70,6 +70,9 @@ ssize_t wmi_string_from_utf8s(struct wmi_string *str, si=
ze_t max_chars, const u8
 int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
 			 const struct wmi_buffer *in, struct wmi_buffer *out);
=20
+int wmidev_invoke_procedure(struct wmi_device *wdev, u8 instance, u32 met=
hod_id,
+			    const struct wmi_buffer *in);
+
 int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out);
=20
 int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct w=
mi_buffer *in);
=2D-=20
2.39.5

