Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A8481DD;
	Sat, 30 May 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160915; cv=none; b=CtzhC/faR6zSQcPZBVf4XzmqB3y4l/TVM/6rN9ZijXO7pNuEYgaxjNSUMs2l/g9fzxhR+KKzigCSVUUDEDSFQ6aaYqSYZWM6+1hmhKNeUCSr3g+aSVJi2NcLP1SMFnjQS7cw2/Gjge3A70FIq4bvK2pjFon7GkLXnSHKlL1vZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160915; c=relaxed/simple;
	bh=ZmL9aM6VNaYtoBKwGpzezAr/GjXi+fkYzrKOOICALZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tlc2uIU39Rs5eXsFMZfxaHGNniIUE9CGjP9vSZZJeBcuH7w4BjWmTtTKASFziGwr2k5yseBpSOnO+lc7ABegcPEDBwMJ+EYXhJf5ZJowdKJxXmp7ISd1n22+7+eoTHZW6sp5hgWLMyysGhgGFyQcEom1bYX+JXz3Jx3VnAf9uoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rD08OnbQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rD08OnbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160906; x=1780765706; i=w_armin@gmx.de;
	bh=v65804IrD7e7xvpj0IlSC2MZpoI7NJH5z0viT8sxyx4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rD08OnbQeE/t+QNIFbAdmTyxo5a2aNXL0Ntkgj+jR1BPlnSPiwiMIy8IlybVKUEN
	 82aLAunZO0PCcvyr11/9xZhqe2PWgUUYuZJLHzeegm92OvASusVEVIDhIeyM7VHiS
	 jf37lCEbs0u0UCn4e3a5/FdZAGQiyf47UpYiGTTtfWZ043pXd+v+2MhmNvc+darWu
	 TQQc9sAPRDfuKZjXCBw38oR0KTebyckWOQ1e6FJI8cAVQLM8sC/R1VfOcy5k1tO1I
	 84U04DKTPe02M/aEqMkgy0BOkV67K9LjX7h75kwzCmDZbgfeTRUWT6VZjdo96BAzu
	 b+oPR6KFvE69BWFi5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbG2-1xKvpX3rGg-00zSEh; Sat, 30
 May 2026 19:08:25 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 5/7] platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pro
Date: Sat, 30 May 2026 19:08:11 +0200
Message-Id: <20260530170813.10166-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1JHJ6c7fCkbAFMmzg2yGI6kRSM2J5lWbK+uqniJk6EFCS3HrCc8
 NRsEE/SHtxdvBp0sbll8t2mtRRnMXONUuMdP/NmtrMrWW6ov1Xe7MaIAG1DTYWB6Z0EinbO
 HRRT9RHnymHFkXtWQdeR6oQozKYoTs8QCpnf3PIto5pjZB/Az+CFvsaV32dsMvGrUBHmp3h
 WFKuEuS5dNmdBbvSJ1XPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ooXe5gnDyBM=;3xGeFigetuEL+2pPAVuF5oynXNY
 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
 skPNNzsdV3gX1sdmmg=

A user has reported that the driver works on the MACHENIKE L16 Pro.
Add the necessary device descriptor and DMI entry to allow the driver
to automatically load on this device.

Reported-by: zatrit <zatrit@gmail.com>
Closes: https://github.com/Wer-Wolf/uniwill-laptop/pull/11
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 00140c0a67a0..0011c553c2cb 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2657,6 +2657,20 @@ static struct platform_driver uniwill_driver =3D {
 	.shutdown =3D uniwill_shutdown,
 };
=20
+static struct uniwill_device_descriptor machenike_l16p_descriptor __initd=
ata =3D {
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_max_brightness =3D 4,
+};
+
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __in=
itdata =3D {
 	.features =3D UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
@@ -2809,6 +2823,14 @@ static struct uniwill_device_descriptor pf5pu1g_des=
criptor __initdata =3D {
 };
=20
 static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
+	{
+		.ident =3D "MACHENIKE L16 Pro",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "MACHENIKE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "L16P"),
+		},
+		.driver_data =3D &machenike_l16p_descriptor,
+	},
 	{
 		.ident =3D "XMG FUSION 15 (L19)",
 		.matches =3D {
=2D-=20
2.39.5

