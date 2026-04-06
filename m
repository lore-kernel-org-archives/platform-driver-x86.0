Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F2F34DB4F;
	Mon,  6 Apr 2026 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510240; cv=none; b=TS+2B73ejGbcOlVyj71VGoLtRJo7gqciaSxEUwXtM+bdqGdRz3KEl7/mZ/zh70eimovDSk5r9GAFrY1ZS8dfwJqUxv6fdRNBKviA2ixfD2o+xnYmOvn7Jp8e22L/ZIbGZnm0ZiTDB8kF4SgTGx0AKDIwc+q3sqc9PzFFVmNe63w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510240; c=relaxed/simple;
	bh=qPmZtYwjduEtcMroMfYFNM3+lJC3c4kldY6jgXdnqPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OSBHrdIPSX03n5b+315/I3NEG0A1LhY1j1K91uvEeLFnvp/T9h4xQcIKzKU9twY5ZaLFNNnSrrzi1byzGmu0dM4v3eAfL9xM4dsc5vaEAYXHquU6seU0SY17jd1cQbX3mgNZUI3xSCSRa0wzyHS77UkmOZOuRAY1++BnMuqa6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=n3P3sUuq; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="n3P3sUuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510236; x=1776115036; i=w_armin@gmx.de;
	bh=cstJW3CMWIQc+GI8rhP4xPemPoJF7f7FN4mvNw3zLVo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n3P3sUuq30NwU/umZxnnGKarmPwo8XiMBpS8z2mpsXl8N3Mx961gsiK3fjNYhYjd
	 MxyAG2jZ73kTDD1cZDN/tePEk7OlkBFhG+0TXEIuAP/+SNMlID1eTVuh57eZUvkc/
	 J7EpN4V2IEGluwZQhOpgLNgUcQKI8DQ2HGS+ztNxJJF594trGZ+rvtGnnqbG9w83K
	 bZZUyqVa8a116WAHWOgoExetk6DghVvHsHe50sNEhJH+HiABhbRM0RoIgG90nPNzb
	 mhs27znPf31roKfVf3u10zDtRNxqS7J3b4SFpOugL+OmCBfp0dxU0Zi3YIyA/ICCW
	 5E94YJSA3ubAIRj+6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79yG-1vOlNY2OqK-00zbIo; Mon, 06
 Apr 2026 23:17:16 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] platform/wmi: Extend wmidev_invoke_method() to reject undersized data
Date: Mon,  6 Apr 2026 22:32:35 +0200
Message-Id: <20260406203237.2970-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:ly5zvO0/HLOuItso2Egkk7c/tgOYloU7hplBHBLVs23KCl67eyM
 sFmd0jplYWVcghkZ/0RtVX5ZWroKC9Yu0Ww7qWUKM4vKEx/UZqVGe/h2QNDyNJUMmSbchFr
 S/XtaoR4kAY8065nSv0wZQFbnhTvTa4pMcTXqQAdF7+3zg43MT9vvscTs8R5QfgJSchiDDw
 PRmVjM25dfEyxvVbqwtXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0T3hRuXqPF0=;BigCduxc55c8ewa3z6dF0TvXS58
 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

WMI drivers using the buffer-based WMI API are expected to reject
undersized method return values. Extend wmidev_invoke_method() to
enable the WMI driver core to perform this size check internally.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c             | 23 ++++++++++-------------
 drivers/platform/x86/bitland-mifs-wmi.c | 11 +++--------
 include/linux/wmi.h                     |  2 +-
 3 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 66ec885bffd7..a1a612f33233 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -364,20 +364,23 @@ acpi_status wmidev_evaluate_method(struct wmi_device=
 *wdev, u8 instance, u32 met
 EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
=20
 /**
- * wmidev_invoke_method - Invoke a WMI method
+ * wmidev_invoke_method - Invoke a WMI method that returns values
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  * @method_id: Method ID to call
  * @in: Mandatory WMI buffer containing input for the method call
- * @out: Optional WMI buffer to return the method results
+ * @out: Mandatory WMI buffer to return the method results
+ * @min_size: Minimum size of the method result data in bytes
  *
- * Invoke a WMI method, the caller must free the resulting data inside @o=
ut.
- * Said data is guaranteed to be aligned on a 8-byte boundary.
+ * Invoke a WMI method that returns values, the caller must free the resu=
lting
+ * data inside @out using kfree(). Said data is guaranteed to be aligned =
on a
+ * 8-byte boundary. Use wmidev_invoke_procedure() for WMI methods that
+ * return no values.
  *
  * Return: 0 on success or negative error code on failure.
  */
 int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
-			 const struct wmi_buffer *in, struct wmi_buffer *out)
+			 const struct wmi_buffer *in, struct wmi_buffer *out, size_t min_size)
 {
 	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
 	struct acpi_buffer aout =3D { ACPI_ALLOCATE_BUFFER, NULL };
@@ -398,10 +401,7 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 =
instance, u32 method_id,
 		ain.pointer =3D in->data;
 	}
=20
-	if (out)
-		status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, &aou=
t);
-	else
-		status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, NULL=
);
+	status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, &aout=
);
=20
 	if (wblock->gblock.flags & ACPI_WMI_STRING)
 		kfree(ain.pointer);
@@ -409,9 +409,6 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 i=
nstance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
=20
-	if (!out)
-		return 0;
-
 	obj =3D aout.pointer;
 	if (!obj) {
 		out->length =3D 0;
@@ -420,7 +417,7 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 i=
nstance, u32 method_id,
 		return 0;
 	}
=20
-	ret =3D wmi_unmarshal_acpi_object(obj, out, 0);
+	ret =3D wmi_unmarshal_acpi_object(obj, out, min_size);
 	kfree(obj);
=20
 	return ret;
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x8=
6/bitland-mifs-wmi.c
index cd3cdd087511..78639407d67e 100644
=2D-- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -10,7 +10,6 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bits.h>
-#include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
@@ -167,7 +166,6 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_w=
mi_data *data,
 				 struct bitland_mifs_output *output)
 {
 	struct wmi_buffer in_buf =3D { .length =3D sizeof(*input), .data =3D (vo=
id *)input };
-	void *out_data __free(kfree) =3D NULL;
 	struct wmi_buffer out_buf =3D { 0 };
 	int ret;
=20
@@ -176,15 +174,12 @@ static int bitland_mifs_wmi_call(struct bitland_mifs=
_wmi_data *data,
 	if (!output)
 		return wmidev_invoke_procedure(data->wdev, 0, 1, &in_buf);
=20
-	ret =3D wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf);
+	ret =3D wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf, sizeof=
(*output));
 	if (ret)
 		return ret;
=20
-	out_data =3D out_buf.data;
-	if (out_buf.length < sizeof(*output))
-		return -EIO;
-
-	memcpy(output, out_data, sizeof(*output));
+	memcpy(output, out_buf.data, sizeof(*output));
+	kfree(out_buf.data);
=20
 	return 0;
 }
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index b00950dc1231..858398beb01a 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -68,7 +68,7 @@ ssize_t wmi_string_from_utf8s(struct wmi_string *str, si=
ze_t max_chars, const u8
 			      size_t src_length);
=20
 int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
-			 const struct wmi_buffer *in, struct wmi_buffer *out);
+			 const struct wmi_buffer *in, struct wmi_buffer *out, size_t min_size)=
;
=20
 int wmidev_invoke_procedure(struct wmi_device *wdev, u8 instance, u32 met=
hod_id,
 			    const struct wmi_buffer *in);
=2D-=20
2.39.5

