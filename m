Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE646D566;
	Wed,  7 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384081; cv=none; b=uc9jrAO8Xqt6RqkEx9UNjYNnBVsLxMv8gnFVbSj2TVb+Ol0qesrMqeSAM1MhKq0zcfCz+4H+La+SuXfXIdNnfYye18uuxjErAJ6yVs0jlbX81aECfcfjRzGyLxrF5+xrUsNC+sIt6Dhb/vq+UbWCyIBIANMTJzIZJD1z90NKC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384081; c=relaxed/simple;
	bh=Qy7Aykc0pSQHGPSu7cgM1BmRnbgm7cYSsRQKMJYN1SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uB/i7T/YyXv0Wy1Tl2sksAQ4HIsB9GAypi4MrR69z9wv5LOsliIlO+hkXJGT3bsUw9aWgRQggBNUqHK7IschZiQvym6doTA91ygZAJpl+DqqZXpIQpqvTahJy8reOK09qTYryfjYFQ/cmsrjJ7F5eQ7WlostxZ6aJkWUe5JSnfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bpEBhbtg; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bpEBhbtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791384070; x=1791988870; i=w_armin@gmx.de;
	bh=rcmynhchkba4Iku5cIdGVnPXWETpMg3VdmwIPppg1ig=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bpEBhbtgDh4HcGq52QbQGWo1ONHR0QAgL1b+SyMNhAsTxMKgfOWrpKh/S6NA+OB2
	 ziATypNCkyCUFf2lxV7HZ4tDlbj3zPrWWusBYaTrR4+x5Cwz46+NjAdJtStynGwDX
	 uMbwpBMe70iiH6ks0NIFZIVA4PgbIMjetEfyzVMo8dL3rSlmwWwbsaM3Q0uukPCFq
	 YqBST69xVWilnUYXwhqv/CwyYeZKsnCE+bmpzxR8n93/EqLWDx32DXiNfTcoPEnf3
	 +hDHDlA3hb0Xvj4ReDIbxbbSXo8ZGclb5eQFY9gy9KqHt7Q/1zGT2cCDk9vyG7BBs
	 AYsJiMaW8NutDUps/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1wXwV91CBR-00qu3y; Wed, 07
 Oct 2026 16:41:10 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x15
Date: Wed,  7 Oct 2026 16:38:58 +0200
Message-ID: <20261007144101.323289-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007144101.323289-1-W_Armin@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vvpX9qAKSjpMTYHs36BbT6MmZsO8ZpS1Gv0OT5yC+RDRMFqHS+6
 56Z+19A2VSzixtHrkBm9rV+Fa2Y2NAqPYp140h5jaU1CElQoRPOcaW5gAAasnFywBQWAJir
 x/6Rt8mmd8c9sUXtqOEqBqLmNOlL0tLOIyjc/TJzLjCOVB6AvDRnBLcJzZ2MHQ4meunzsq8
 ClQSKoCETbhLTqZFqEe1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ERh6RqBsoFg=;6tveh1aKKqoEWZJLHuDCe3u+9DH
 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
 44AsijIA==

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
index ff07bc33c6cc..61e71043e802 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2749,6 +2749,20 @@ static struct uniwill_device_descriptor lapac71h_de=
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
@@ -3113,6 +3127,14 @@ static const struct dmi_system_id uniwill_dmi_table=
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
2.55.0

