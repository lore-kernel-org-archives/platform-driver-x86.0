Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370E426431;
	Mon, 20 Jul 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553589; cv=none; b=iO5DDrPFglqWanzJVwPLzWrgOPPGTGE44fpuFKr+Wzs3x2vfXGc1kz91S1udp6wIIuSFVgMck34Avcg0jfpNDORhKaMUbM3VXbx6NAuQaq6zxz+/roxMhZ4mjjwi9sxU/xyKGEHkpKTybJorzOWuiYu/iPbbN5xOOQEbIY7lAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553589; c=relaxed/simple;
	bh=5gVAz4DzcYeXBoM1lxf4AP7ynJ/CwmWo7YI3I2MVxsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gXw3WTnXc/6rZDLGbJirx+WepCOGTWTzF1yE4Zd/yh7rwyVRaryPe8m0t7B32XEIK8CSZJBhebvSZN448ru/pt4UOzbw+y4Mf0MHDZb37h/t78FRwUKlXawhtSWg5IFrWBx3pb1Xfh+fT/5/HK3A1imqPrBDzvZcZseWY/VNpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=k2mu4Us8; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="k2mu4Us8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553575; x=1785158375; i=w_armin@gmx.de;
	bh=yc+Lxd9v4DwyhtkeE+fr8dWX1DjbeDZxIuWcI5iSzAU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k2mu4Us8Pe1bkv15jm7rQVb7ExoolNCoOOFFR8TU+k+dzMX5545OfVqEGHQOJfbn
	 adRQxUWY/2rnxmrf7sk+ZgSrv9emO+txREQGu9+bTFLzg9a0wsGNgynhbcrNl9O8k
	 47j69Ni44UOoEPjJ1XMVj1JLj5U3rtS5LN6pI8//lBC++P30e2xGwfc+Tgg6Hct9Y
	 MjkBQf2x4s2t2HS+Inm/TDrQA306pIZgT/E9TnRPZXOByh45JSdprmX/J/MZqEggX
	 a4+ZNPTttEW8yBWZdHhgk4qSgWjcJNU0m6lOojnOT1TciUgqnuwZUvf+K/2LCyZaO
	 HlfFLofLxJrABvXOiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1x8XVp19Fm-00xdPb; Mon, 20
 Jul 2026 15:19:35 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH v2 2/3] platform/x86: dell-smbios: Pass device to callbacks
Date: Mon, 20 Jul 2026 15:19:20 +0200
Message-Id: <20260720131921.368000-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720131921.368000-1-W_Armin@gmx.de>
References: <20260720131921.368000-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sfrTnx/40UoE0mI2nlr6qCQaREutyfmHEXMtqs7Q3PqIA1OnvLT
 ctn7cMgUdsEpHyTGj3RJUP/FbNRUWD+XNOtnbvwIl/Gx7WPLvkkiAD9GX7hMSRgg7AGk9+Z
 Nh9Ic+53+IHkrxNv9poCg3MTm7qV3ON1gz3x3PCH0g79icZBUcXFG+iUIP9JXzDHgPP0DUL
 sOdRFdU4BUM2p9n0Y8UMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dMQ/nA4Fi3E=;fFXlay96jEw//FTN8IcMiouekqq
 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
 zn/tRfHdyh7aIXX7f+TC8

The WMI SMBIOS backend needs to access the its driver state container
when performing SMBIOS calls. Pass the device associated with a given
backend to the callback function to allow the WMI backend to retrieve
said state container in a more straightforward manner.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-base.c |  6 +++---
 drivers/platform/x86/dell/dell-smbios-smm.c  |  8 ++++----
 drivers/platform/x86/dell/dell-smbios-wmi.c  | 10 ++--------
 drivers/platform/x86/dell/dell-smbios.h      |  4 +++-
 4 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platfo=
rm/x86/dell/dell-smbios-base.c
index 4b7c54b76228..d8c55ec6acd4 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -40,7 +40,7 @@ struct smbios_device {
 	struct list_head list;
 	struct device *device;
 	int priority;
-	int (*call_fn)(struct calling_interface_buffer *arg);
+	smbios_callback_fn_t call_fn;
 };
=20
 struct smbios_call {
@@ -146,7 +146,7 @@ int dell_smbios_error(int value)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_error);
=20
-int dell_smbios_register_device(struct device *d, int priority, void *cal=
l_fn)
+int dell_smbios_register_device(struct device *d, int priority, smbios_ca=
llback_fn_t call_fn)
 {
 	struct smbios_device *priv;
=20
@@ -312,7 +312,7 @@ int dell_smbios_call(struct calling_interface_buffer *=
buffer)
 		goto out_smbios_call;
 	}
=20
-	ret =3D selected->call_fn(buffer);
+	ret =3D selected->call_fn(selected->device, buffer);
=20
 out_smbios_call:
 	mutex_unlock(&smbios_mutex);
diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platfor=
m/x86/dell/dell-smbios-smm.c
index 7055e2c40f34..fc4a674c692e 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -49,7 +49,7 @@ static void find_cmd_address(const struct dmi_header *dm=
, void *dummy)
 	}
 }
=20
-static int dell_smbios_smm_call(struct calling_interface_buffer *input)
+static int dell_smbios_smm_call(struct device *dev, struct calling_interf=
ace_buffer *input)
 {
 	struct smi_cmd command;
 	size_t size;
@@ -70,7 +70,7 @@ static int dell_smbios_smm_call(struct calling_interface=
_buffer *input)
 }
=20
 /* When enabled this indicates that SMM won't work */
-static bool test_wsmt_enabled(void)
+static bool test_wsmt_enabled(struct device *dev)
 {
 	struct calling_interface_token *wsmt;
=20
@@ -88,7 +88,7 @@ static bool test_wsmt_enabled(void)
 	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->input[0] =3D wsmt->location;
 	buffer->output[0] =3D 99;
-	dell_smbios_smm_call(buffer);
+	dell_smbios_smm_call(dev, buffer);
 	if (buffer->output[0] =3D=3D 99)
 		return true;
=20
@@ -109,7 +109,7 @@ int init_dell_smbios_smm(void)
=20
 	dmi_walk(find_cmd_address, NULL);
=20
-	if (test_wsmt_enabled()) {
+	if (test_wsmt_enabled(&platform_device->dev)) {
 		pr_debug("Disabling due to WSMT enabled\n");
 		ret =3D -ENODEV;
 		goto fail_wsmt;
diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index 231fc90878bc..2108de4e48a3 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -83,19 +83,13 @@ static int run_smbios_call(struct wmi_device *wdev)
 	return 0;
 }
=20
-static int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
+static int dell_smbios_wmi_call(struct device *dev, struct calling_interf=
ace_buffer *buffer)
 {
-	struct wmi_smbios_priv *priv;
+	struct wmi_smbios_priv *priv =3D dev_get_drvdata(dev);
 	size_t difference;
 	size_t size;
 	int ret;
=20
-	guard(rwsem_read)(&list_lock);
-
-	priv =3D get_first_smbios_priv();
-	if (!priv)
-		return -ENODEV;
-
 	size =3D sizeof(struct calling_interface_buffer);
 	difference =3D priv->req_buf_size - sizeof(u64) - size;
=20
diff --git a/drivers/platform/x86/dell/dell-smbios.h b/drivers/platform/x8=
6/dell/dell-smbios.h
index f421b8533a9e..1e64803bc00d 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios.h
+++ b/drivers/platform/x86/dell/dell-smbios.h
@@ -47,6 +47,8 @@
=20
 struct notifier_block;
=20
+typedef int (*smbios_callback_fn_t)(struct device *dev, struct calling_in=
terface_buffer *buffer);
+
 struct calling_interface_token {
 	u16 tokenID;
 	u16 location;
@@ -64,7 +66,7 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
=20
-int dell_smbios_register_device(struct device *d, int priority, void *cal=
l_fn);
+int dell_smbios_register_device(struct device *d, int priority, smbios_ca=
llback_fn_t call_fn);
 void dell_smbios_unregister_device(struct device *d);
=20
 int dell_smbios_error(int value);
=2D-=20
2.39.5

