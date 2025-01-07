Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933301E47C8;
	Tue,  7 Jan 2025 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272738; cv=none; b=JrPlMQD0MrLy10zRtz6gRh9La2kazK3tVN6wgQ17YBpq22ABASO8gAOtWq1O3NZQxKUgcLbZfgNDPMSpJW9NdFXfXBIDsaaMfp0vooZneldJjyfQ1xPNyUy8s4MpiR3WHZxVVx5uNluGjnoatTS8k7a4oPQ0ZFG5TtE4pjtO0mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272738; c=relaxed/simple;
	bh=qJWeUU+73VHTE1pSgVoO3WDMBwO0Ubisw29xlxSq4vA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvAV6NaYx1zbvzNe9gyQLKmLOtCfcskmsVO2wznMQlmXVjB/b+rYLDeohiZNB758w/C4a3QaoBZCcYtdJgn4H0n11o1iMtGggQI9utuH3/pHPH9bzUcU1PTotbi49BivfymPo3XagghLwE2N/Bv/40fIHgWcDs6plhLPv5V6alI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mRlBCYBx; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mRlBCYBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736272619; x=1736877419; i=w_armin@gmx.de;
	bh=TtiDa1KnMr3evyQh7y+y524gCipq49be15RnUho0jF4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mRlBCYBxKa9JzVgkBHwBA78CO64gE0oYh8hXhsGmKILDhso68duSWFyKhDGNvPW2
	 PvacNxuf6hPtk0wJI8mCnkDg7H2ceM8NAQcQxOa5gmdV/7Lh5JVCEb9vt8n9+6XrR
	 BwzSTWX70I3ymS+HEuZ1nuE7JDzgEsYK1tTmPRMl2//EIsfGWarvV8dRaH3HkvzA4
	 uQB0/Qma53owSIyBbseBewZi/urUYn9M6j3c3SEgNxUgXmwm3YbByDFVnFiNJ74vm
	 6IR4YrVWjG+IOIRddzRPkyzMCRUC8n1Sz/+IfdYNsQx2vE4p628CFe2wLLnXeYRX7
	 a8qn34z2y1y5tP6/0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-inspiron.fritz.box ([91.14.230.110]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MTRMs-1t1Pr43DcS-00LyjD; Tue, 07 Jan 2025 18:56:58 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: jlee@suse.com,
	ejohnsten@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Add support for Acer Predator PH16-72
Date: Tue,  7 Jan 2025 18:56:52 +0100
Message-Id: <20250107175652.3171-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5ottUGwjMNtdsqDf1anWZEtZ/Y5R9ko/g61XdHjmFaCsWiGGg2E
 jeNxVCWJGTxqHebzRY/v50RG4TGsMWzztes7z0et4HCyQCIwmj0TmTPZIgb2SZ9dFHX0sKu
 e3SVrLA7eI0G2FnA3dUlQLFPpZ0DKLkVGOc60TgXjk1yxAr0sFwn6EbAqEYo1d6+01vG+wB
 MYspPVFsVMchgralvxoAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iLooj6uJ3Mg=;8Oc7rvFUJaKwjqA1ZOATWmLVJPY
 Hf3anbnBzaaPBgh1AcwpSBEnVQwwAyVz+4tT4q4BDjs7jUWTDfTNOEpo6uXNQJfL0vUxInTbG
 ULmVQeGBWnkWj7DXdqmxS7uu9e5fOIAV7Y9b2kDD8d6YlvChP0kUYuHG8ZiZm/Q+dduuQ4Tfs
 skENsHs9EizjKPBAIZ35aisCPxgmNvQoBETpOOu23TxcfRowmDRzfsBNRQnlyFv9nr6cqRh7C
 Cy1p3DgPFyhjC1mKk16NqZCtIDIi2jrNZhvKuGEAiAPaWjzdI5nKpIuD64PzBJuAsd2nzR3GK
 0LGNGN+U6eeOLkEvwSRglNanGmMlHQzb/WHslrNqyNu10l7PGxA9/Cw0ySZVptBxiGux67rDa
 wwfiDsP/O5FHkzOaLlKu87VzTDrOmCEGt2QCSRES7aVBD5m2jx1TeONzszCiwo+llriOScLwi
 p6lYdjPWmrq7TtDr7GwEMnC6WRueYb+dkgUWKgXj0qjpoXPy22r73rdD5ARtIrdEGgvpjQNWn
 GR9D19u86ybapk7M9HhSjMYJVmdnLSX4TDJ/qYxJf0CeIwZkmcAQDvC0eU136XMSA+rLygDyZ
 kRLu+Khty03WPehbqWh0LAw2WHCKjkv9hGW5uX+zblvdBvGonBKBH6/B8tD4LuKIIHhV+7R4W
 asYGDOjE1HVopI1vAN7yLRI3ALFx0YzYGxRQ8JLWgBt8oqCNOAUaqpNWEgKB3NOxPN6Qmf4me
 ed7u/Vz6ndn+BwKO3SxTDX2AohD8rl2+qcJnO0ue1oEYV3QRJ343FC/WGG+omW4QzL6Fp+/ei
 inevwluPmaBrJidjTe5o4T9r2MTzEFpNKOag+RV7IQvu6pcTuutSSl+wlFRyIroJz2rL9Ogtj
 h26tW/bbX6Qe0x2YrONQWnmONu30hMoPlzrOQGOhjFqgM3QNoOAyRGDspNGaQL22WjxpwCX0m
 0R+rf0O4xLrpVm/ZE/dKeawagWeFlHv+UtKYdLyyfS3w65aBsLbv4x/ur+K/8WKEHusx/mFj/
 lQvqSM4tLfxKJAbDEkNMGcE2zE/CQUz907R8eNxm/mGfgcNBs6pKyEaazX3l5gpRrEqkMH40q
 EG6UcpaWNDJNRurhwc7fD9IqixwH9o

Add the Acer Predator PT16-72 to acer_quirks to provide support
for the turbo button and predator_v4 interfaces.

Tested-by: Eric Johnsten <ejohnsten@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/acer-wmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index b3043d78a7b3..57d6b680f5b9 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -406,6 +406,13 @@ static struct quirk_entry quirk_acer_predator_ph315_5=
3 =3D {
 	.gpu_fans =3D 1,
 };

+static struct quirk_entry quirk_acer_predator_ph16_72 =3D {
+	.turbo =3D 1,
+	.cpu_fans =3D 1,
+	.gpu_fans =3D 1,
+	.predator_v4 =3D 1,
+};
+
 static struct quirk_entry quirk_acer_predator_pt14_51 =3D {
 	.turbo =3D 1,
 	.cpu_fans =3D 1,
@@ -611,6 +618,15 @@ static const struct dmi_system_id acer_quirks[] __ini=
tconst =3D {
 		},
 		.driver_data =3D &quirk_acer_predator_v4,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "Acer Predator PH16-72",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PH16-72"),
+		},
+		.driver_data =3D &quirk_acer_predator_ph16_72,
+	},
 	{
 		.callback =3D dmi_matched,
 		.ident =3D "Acer Predator PH18-71",
=2D-
2.39.5

