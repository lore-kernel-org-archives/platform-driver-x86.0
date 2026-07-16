Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5512EEE84;
	Thu, 16 Jul 2026 05:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180041; cv=none; b=utwsM8M1lsL8lP6v1iDr7CgN3IpqH25VpoAPXE9Pre4SeUQ9jjZFJEF2y3t6D7zO6/JIqeQZcIKw0ZhfHvF2oJmgkUrGRPLjIDZwdg48h/9ka0YmjeXBXhrEdJkKlej5MifnbEjm4qRWNjlVNgj322cL7aI9FDa2fRzr0QtcOzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180041; c=relaxed/simple;
	bh=PcD5GOVFrreSDvQNdxstxSKCQllyOPEgtRP5Mbyet1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l/HG/CJB7YV46WJg/vIBblD6xZ0H6/OnQ17jNpp97NPA/gUqFfoLPVJ8CdcwoJKnpNjUIiY6oVGJSxkzYwDS1B8sqFmRDEhn0M9aaAa+UrJ++UhEZUVuhtHo6DP1FqESkP0t+5msizCu04vGJVJEfQ1Cto2mc3BmUu8PfOvduZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tgzY2nLA; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tgzY2nLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784180024; x=1784784824; i=w_armin@gmx.de;
	bh=Cx2YNdRfqX+5VIM205mVGj6LXrjPKi7S4B/J3LKKqjY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tgzY2nLAKqZ2tzZaHQKQACbPTWnHlk8x7Z8Nl7+U0zSsX2dSo8DkptALoiKYvV8z
	 qQCIeHhwJBiPWotqI+O4nfG/tif/llmWGKHXZV9fd7twH8EY6blJitu1Wq2eFs4GP
	 wJIIw4SD/v2BQ447Z9m0aukCqdJTEbi/YvHVKZrI9oJOZJgj7U17d4js1fT9LET3x
	 zukJ9LsNUbohaKxeGYSzXnQzLpMKnrZcq7/2TOIHoFBuI7mE8noDIEDT0PXOvvK8I
	 IAuUlI6B97SZeoHPi1brkt5igNM88bsIsXXqCCWYCZVS++I6MBifBG2rDVInPRu13
	 hyOdBBxsk5xNfidaMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b2T-1wf0zd0MaD-0045nf; Thu, 16
 Jul 2026 07:33:44 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH 2/3] platform/x86: dell-smbios: Pass device to callbacks
Date: Thu, 16 Jul 2026 07:33:36 +0200
Message-Id: <20260716053337.112533-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260716053337.112533-1-W_Armin@gmx.de>
References: <20260716053337.112533-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9KYAWdnuELub2POIusA8yIxHZbkZNxJ0DaZfo8X10BC6uzFsiV0
 53ReYmaZrncdK1AsAoOI+N103UwJYxvrR9KPsrMSWDvBXVNwvBQDZIHgSjmAaD/dQw9d1wd
 7jD61h3bggezDkST2JPrgXkXWyYWo7o43UBCTjPxvnAS0w7gUgpPgZ2wyJ3M9llpW5QzaSX
 QD3tMhqh1EdFqO5ZEQK4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZO2FczelPBg=;Yzgx9DlxGTaXE2h2bGe0btYJmnv
 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

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
index c8a6e711283d..552b80429688 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -82,19 +82,13 @@ static int run_smbios_call(struct wmi_device *wdev)
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

