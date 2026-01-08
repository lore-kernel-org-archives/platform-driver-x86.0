Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474527510B;
	Thu,  8 Jan 2026 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890853; cv=none; b=PpHMIAQEs/Mwap6FY5S1nsMvdr6+4i7tTFDQnbK0vJ6IbC8AcGaBznMF/W7ZjtrrFjEb38OU5fm2pN8gGCrzSEwno/ebiVKke4ePMeq6ueb31BN04VPCQ7fzO8PucXPSpwLURKptPXpwiLZ3jQU4MkBvvPBF18mAcvE0nnm1R0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890853; c=relaxed/simple;
	bh=EGllEtj18xkkXle41hY/+cTdaPEvy2KfAlwd5cx8+oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b80erL7oC8F4plF/nhsqP97PoldB6PyEo7jpR635FwWQ5gB/UJJ7E9pur2UWYXKdFjn4SVlfHWKPYu1Le2nf030J/TJMvJXkZVsOob1WYYl5lifs2i2Ugc/Ai0B62YHMe750QcfRRAEByZ0PQ6sZq2ixS9drsIhrMvtcs2gGvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GUAaK4nz; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GUAaK4nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767890841; x=1768495641; i=w_armin@gmx.de;
	bh=5EkqncSq6JRBnSGGbpGefprI3R5cOGQDXmbl0zzWrZs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GUAaK4nzL+8rjeMSZxwnjs5fjrXmXjCBXUZmwZXSgWTHJ2eHqY8uZoeqVh2pzewj
	 04x0eVGVIWTuQyCDovKfMu4fhTfJddtkU9KrMW1sx/iFTHz6PWyXjW0DgA7JwsyEe
	 p2iEPuWwWiVhvXiRYXB80Go0w4vxehvYjC0bUEuI3ztSFtucw7qm5seqZvWzWtVxL
	 p3IF3pgREoU8uP6NSKzv5/UmW/tA76f+n+LMKSSydCBWMQyUBAuGdDoFdh9yiH8cd
	 Oz2X9EKzmc6lEDOeaiE1aDW8vZRiTLs2J9Iv9STMAD1YEaFujlatLp9YbeoNTBAZV
	 BDMdb3fqe770H7KGxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from edr23265.dip.tu-dresden.de ([141.76.8.161]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mg6Zw-1w4fOo3uWM-00bi8u; Thu, 08 Jan 2026 17:47:21 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: pranaypawarofficial@gmail.com,
	jlee@suse.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: acer-wmi: Extend support for Acer Nitro AN515-58
Date: Thu,  8 Jan 2026 17:45:26 +0100
Message-ID: <20260108164716.14376-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:byeBL43HA3OotIp4u8bPvu9I0hQ/0wnTgOly7cvhtN3PROW7D2M
 f+DfwHKGqe8FsPx7oGJAGyHaJcT1CqMeSxjP0TAJjJKccT9fIfqg/CQzu2PCQVIpJwkdf2k
 jWp+5yKcw+kLu7dz3xURq1oSId9HlyIw6Czhtb3EV5vRFdmXj/mKcK4YG8WDz3CrAIRNhQs
 NHKyMTv3tYLI/gOI+Haaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ogJJm22NLv8=;9hoQ57fAgJKe56O/V8WB1SO5iv5
 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
 6DM/VC7OEg6gwVL5IB8h

The Acer Nitro AN515-58 additionally supports fan control. Modify
the quirk list to enable said feature on this machine.

Reported-by: Pranay Pawar <pranaypawarofficial@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/CACy5qBaFv_L5y_nGJU_3p=
d3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com/
Tested-by: Pranay Pawar <pranaypawarofficial@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/acer-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index bf97381faf58..54ca3edf532a 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -455,6 +455,11 @@ static struct quirk_entry quirk_acer_travelmate_2490 =
=3D {
 	.mailled =3D 1,
 };
=20
+static struct quirk_entry quirk_acer_nitro_an515_58 =3D {
+	.predator_v4 =3D 1,
+	.pwm =3D 1,
+};
+
 static struct quirk_entry quirk_acer_predator_ph315_53 =3D {
 	.turbo =3D 1,
 	.cpu_fans =3D 1,
@@ -655,7 +660,7 @@ static const struct dmi_system_id acer_quirks[] __init=
const =3D {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
 		},
-		.driver_data =3D &quirk_acer_predator_v4,
+		.driver_data =3D &quirk_acer_nitro_an515_58,
 	},
 	{
 		.callback =3D dmi_matched,
=2D-=20
2.52.0

