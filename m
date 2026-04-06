Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5A2F690F;
	Mon,  6 Apr 2026 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510248; cv=none; b=Tyzj52e/VYdZrn/lk5v3Gc/8HpAq9IvhMipLlqMfTpcK95MAsg8jxFBVaG2cJKDBe5aLQhxyIEQom01llaYecIJtmLER0u3wLVSzPEyNFfpSUSGZpicW5p63f6sp+ObTtxD1ej1zW8F7Si89m1QjvTkUpQ58EO4Z9oujc+oBg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510248; c=relaxed/simple;
	bh=vSibzr56ypU6JPFfPyrVsQbTRgM5MSEzvcPOKuH+Skw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B4esB/e1B3k+Gy+W9DHt74y0UZcdy4IILnQY1pDGzkTKQcXamRxKQ0en3JV0iOArUAhmiF1Flf37e3xrPtodRUdIMCKjU/OD4Kr3boLwh1obGUH4Gxk/u5u/8MN5gSq4Os/au7b6Qn2BA5vUCWRLE8cLnU0rosSeuYwSpDi3icI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Vbm56+BO; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Vbm56+BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510237; x=1776115037; i=w_armin@gmx.de;
	bh=/22BeHwumIqhoS7apAznSrxAm36X8fvAHGPgH+xOkWY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Vbm56+BOsE2wQmReHLGLoelfyK9UpFCjxBEZUfxMpSMG2RHa91K8EW0Y1jE0tdFi
	 V8h48LOhw3/sBsnU16HRKBb1Os2X2WgAh9TKkihYrp/OQNG7rI+HQw1Q53l517Yn6
	 pPJQl6yUVB0phEAX+tN+qpqTMPMYQgYd0XD+h5QUhWmmFzyICMLvisH/RAgAEwKRh
	 i6/hOxyDJ0/PXFLloocdmaFSpuuCknCsqdwtraLomuP7QIRdkgQaLFS2iA34lthry
	 nn4jcGDGt8dN5lcCHs9YjeMAkvObaAbcb0nYLCpOXulBMQFaAys5CTHhTnQAWeAFP
	 vzKwIgJfUwzc69WTNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1vwi9l1f7Y-00SPBj; Mon, 06
 Apr 2026 23:17:17 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] platform/wmi: Extend wmidev_query_block() to reject undersized data
Date: Mon,  6 Apr 2026 22:32:36 +0200
Message-Id: <20260406203237.2970-6-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:RR9EPgA3LqmH1j437OnVtwBXUQwejuP7eLHbuOVQB/QSobCnKxe
 s7Q+eDG3gGh/8WKPylja7/sGQ+0XT1KhDLvwQjfHdYwuRhluvQASvWF2fzSkW9eZFWwFrPu
 qbIn//ZdTTEJKZiNjJRcSRBKzKWFTdj6gQtOPT4ar0iGtxm8N6Q/jWACid233Q2leXB+ixI
 2bOBValgCwqFMM3hm9TpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N0ZDhJiJtmk=;zFByguUwW+xpoSGpOZhFI9CaU47
 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
 aU

WMI drivers using the buffer-based WMI API are expected to reject
undersized query results. Extend wmidev_query_block() to enable
the WMI driver core to perform this size check internally.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c                    | 10 ++++++----
 drivers/platform/x86/intel/wmi/sbl-fw-update.c |  7 +------
 drivers/platform/x86/wmi-bmof.c                |  2 +-
 include/linux/wmi.h                            |  3 ++-
 4 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index a1a612f33233..87b0e54dde5a 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -565,13 +565,15 @@ EXPORT_SYMBOL_GPL(wmidev_block_query);
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  * @out: WMI buffer to fill
+ * @min_size: Minimum size of the result data in bytes
  *
- * Query a WMI data block, the caller must free the resulting data inside=
 @out.
- * Said data is guaranteed to be aligned on a 8-byte boundary.
+ * Query a WMI data block, the caller must free the resulting data inside=
 @out
+ * using kfree(). Said data is guaranteed to be aligned on a 8-byte bound=
ary.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out)
+int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out,
+		       size_t min_size)
 {
 	union acpi_object *obj;
 	int ret;
@@ -580,7 +582,7 @@ int wmidev_query_block(struct wmi_device *wdev, u8 ins=
tance, struct wmi_buffer *
 	if (!obj)
 		return -EIO;
=20
-	ret =3D wmi_unmarshal_acpi_object(obj, out, 0);
+	ret =3D wmi_unmarshal_acpi_object(obj, out, min_size);
 	kfree(obj);
=20
 	return ret;
diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/plat=
form/x86/intel/wmi/sbl-fw-update.c
index 3716ccaaed6a..62c9c7f1842b 100644
=2D-- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -28,15 +28,10 @@ static int get_fwu_request(struct device *dev, u32 *ou=
t)
 	__le32 *result;
 	int ret;
=20
-	ret =3D wmidev_query_block(to_wmi_device(dev), 0, &buffer);
+	ret =3D wmidev_query_block(to_wmi_device(dev), 0, &buffer, sizeof(*resul=
t));
 	if (ret < 0)
 		return ret;
=20
-	if (buffer.length < sizeof(*result)) {
-		kfree(buffer.data);
-		return -ENODATA;
-	}
-
 	result =3D buffer.data;
 	*out =3D le32_to_cpu(*result);
 	kfree(result);
diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bm=
of.c
index e3a126de421b..6623cf60e4b4 100644
=2D-- a/drivers/platform/x86/wmi-bmof.c
+++ b/drivers/platform/x86/wmi-bmof.c
@@ -62,7 +62,7 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const=
 void *context)
 	if (!buffer)
 		return -ENOMEM;
=20
-	ret =3D wmidev_query_block(wdev, 0, buffer);
+	ret =3D wmidev_query_block(wdev, 0, buffer, 0);
 	if (ret < 0)
 		return ret;
=20
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 858398beb01a..da94580572a9 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -73,7 +73,8 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 ins=
tance, u32 method_id,
 int wmidev_invoke_procedure(struct wmi_device *wdev, u8 instance, u32 met=
hod_id,
 			    const struct wmi_buffer *in);
=20
-int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out);
+int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out,
+		       size_t min_size);
=20
 int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct w=
mi_buffer *in);
=20
=2D-=20
2.39.5

