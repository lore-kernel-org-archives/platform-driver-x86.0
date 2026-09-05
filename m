Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD16224AF2;
	Sat,  5 Sep 2026 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613309; cv=none; b=occ2f/m3TFuCt/F/47j0Ir0+Wp89eZMTvWSm00mylLU1SNUXEFplUFw4uEQ4+0P41M2UJhLpDU6U4CqV6VB9pSvIJVq+B9cPunKd1ZuuGCHWcvbKY2+a+jARUnEBoOdmkEJiJ3H4dBZ+GcVd/GRLtPPcz43dhcNRWpXyWOJExzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613309; c=relaxed/simple;
	bh=G5jzq1Doh54ldkY1Bcnq5bZ8K6lVYalfQ11Aq9WEHSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YuKteVnUimTUpaOCHmmFuckWJKNXDZOv476NXNCHrvmrzKRFszJxmHTCTSFyBQlyzd2OmMT04YEyDfXLDxngj5EuJ7HKrRm2APmP0JnLz5UFSjyCEzuo2ppcIQn9JG/XGhmXXvaoVcR4gHLxLygu26yQKeKmWehcniJdxWCWW+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aKm+fbwc; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aKm+fbwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788613305; x=1789218105; i=w_armin@gmx.de;
	bh=+YNVNktWBBzePC4aJmJQezyQ0sDZ/JUJ1/SLrnwkA4I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aKm+fbwcMrMHM/+EtdEF0EZXq3SYbYtvRigKP6ndqLP4X5QzraedXLYRKkIgJRJs
	 lYMeMWXySLXoZgzNgas7MktPoR1jNeLPjxjGAcek83nKVZ14XbrY0lAM7LxeNEXo1
	 w0xoWBxkvZaX0eREeNCv3Lzu0zgzzRpaZJINQKfQOJhL/Zu3i6VbftI6W73KrgNPv
	 sAXrPvZl1VdFbPFLw/GpbYUETPxat9PHVemZsghlPx3TFpzAC5Xe/0J+LffiAUHpv
	 rQ5M5k2UgYSL1hlv7PZrxrTEz1X+zGjDCo0T+Xiti3M9y0jbp1inkE9wstr5aKJsz
	 VlrGjlE+PQOGS9UHNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dwd-1wp2gn3ggv-014Fyc; Sat, 05
 Sep 2026 15:01:44 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x15
Date: Sat,  5 Sep 2026 15:01:38 +0200
Message-Id: <20260905130138.6814-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260905130138.6814-1-W_Armin@gmx.de>
References: <20260905130138.6814-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CCwrNnhoXQKoXqgjp0n+bbj0oZq1eQ9l099v3Umg5YPvRiu7Fes
 1xNGYNgYUiTSjwunaxrOOx+HzRjEfCtAXw6yddNuD9923pzBufRW0cEHt8LoxJDL+3zIkaf
 +N+edacPn4RFi/h1o6kRDABlplQlv/vCw+fS1BLsO/uoo/zMuPn15xoR7xCSvF5Kx+/Jxt8
 c+NYBuZw8RYOa4TrRRYBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D7PQ1Tqq6t4=;Yy3ARS3mW/C1s3LyS/uDe99VFTq
 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
 GZ24jmf1WNxSUxvcMxMYw87qoyr2qeDyX8A==

A user has reported that the LAPKC71E variant of the Intel NUC x15
also works with the uniwill-laptop driver. The difference between the
LAPKC71E and the LAPKC71F seems to be the dedicated NVidia GPU module.

Add support for this device as well. It is suspected that the LAPKC71F
also supports the new UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL feature, but
this would need to be verified on real hardware.

Link: https://github.com/Wer-Wolf/uniwill-laptop/issues/17
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 27d5e54f0e1c..433a7a0eeba6 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2721,6 +2721,20 @@ static struct uniwill_device_descriptor lapac71h_de=
scriptor __initdata =3D {
 		    UNIWILL_FEATURE_SECONDARY_FAN,
 };
=20
+static struct uniwill_device_descriptor lapkc71e_descriptor __initdata =
=3D {
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+		    UNIWILL_FEATURE_LIGHTBAR |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+	.lightbar_max_intensity =3D 200,
+};
+
 static struct uniwill_device_descriptor lapkc71f_descriptor __initdata =
=3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -2946,6 +2960,14 @@ static const struct dmi_system_id uniwill_dmi_table=
[] __initconst =3D {
 		},
 		.driver_data =3D &lapac71h_descriptor,
 	},
+	{
+		.ident =3D "Intel NUC x15",
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71E"),
+		},
+		.driver_data =3D &lapkc71e_descriptor,
+	},
 	{
 		.ident =3D "Intel NUC x15",
 		.matches =3D {
=2D-=20
2.39.5

