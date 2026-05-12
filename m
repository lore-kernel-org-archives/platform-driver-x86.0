Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE403A8759;
	Tue, 12 May 2026 23:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628125; cv=none; b=maT087wpnjLfVxu/IMfg7RrvuoQP53Q/QWzqs8zyK0hluiAyL7sEuQUwddHO4Bn+eLfsRJWNOv6JKM4kg5LWkAW3UUUt+qf4y35SnHUirvapt0W5NmRRTgYwto8uZHevpRIgCUFw2OPDGydz5rC74jbsTF+oON4uVN8EhbEDjA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628125; c=relaxed/simple;
	bh=6PV5mQWjOgH9CsK/3wKmyzANg7RvhXANujK3cgKcwWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7WMw+PblUz6dwl1304WUk/QuIsZbpapkCsalFObVhUOpMBKgEQ65tKj15yQ9SM+VtNINuxZvWCip+Oh6VmkFepLL3QW0bbOj2CVzuStiwfn259MfhfjuFslkaBKU59NQ+NywhUHBB9jlwTg1Xp+DlIUFZMEQy8Kj6nWmlF4YlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=p33KMaaw; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="p33KMaaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628116; x=1779232916; i=w_armin@gmx.de;
	bh=wZZOuBsI2MqZ5pp2vS5sZHg9Xe+oq4OXZ3rl1pE+/vA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p33KMaaw3sefHVzIZByrlyc1GJ+Lh7uuf3bIlRk7JjUUhsmbbBoPktvidAolp/JR
	 IWG8YcJEUgzULJbviZIISLiD7nBIVxXdcPISmBL1zUVQi7NRNFSqtyTtBaLuoMP87
	 2r3ZBHUJXUO/miP/3IBSFb/O3sfFv4YPAbZJHXBsiGfuA0D353EpbGCkgt/fIKf/6
	 4eK7hXDg8RgQpyAoqSEH/x+NNXqq5MJlanIIY59xf2H2x7MGVvjZyQXkspzVEnLnP
	 YJ4sHEwiSqtnnM6S4e8SnKGa7y32aaYC+wQF4UuU+4/2w4wswQmVATvbDcJe8esW4
	 1YtECFfIiWR1+VaMFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9QC-1xElWx3VUS-010arM; Wed, 13
 May 2026 01:21:55 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] platform/x86: uniwill-laptop: Do not enable the charging limit even when forced
Date: Wed, 13 May 2026 01:21:41 +0200
Message-Id: <20260512232145.329260-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ibuU8ZphqtPZ+paD710BfS+ZYczQI1ldgibIYzxnBDqagD4fb8V
 x/Fb2B61mfXQ/+KKi5JtKT2D6FaUYNajsmqayTJ8g1jN2u684MUiYib1AT44SCGkIWZazaY
 crp6Lazwk+VzzI/egFNG97dvJrO7VvlUmm1dWWelaIycelNhuqVQXPtEStLDuthSawM2p+m
 ITnN/F6DQsz8rx2B0vvmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zuBWU3fr2XA=;pshgam8MU75HQoEeC3cOE2OZle+
 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
 H4jnni0A4x4NnDr7/9xZlw4znAA=

It seems that on some older models (~2020) the battery charging limit
can permanently damage the battery. Prevent users from enabling this
feature thru the "force" module parameter to avoid causing permanent
hardware damage on such devices.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Link: https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidden=
_function_discovered_on/
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/uniwill-laptop.rst | 10 ++++++++++
 drivers/platform/x86/uniwill/uniwill-acpi.c          |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index 561334865feb..1f3ca84c7d88 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -43,6 +43,11 @@ Support for changing the platform performance mode is c=
urrently not implemented.
 Battery Charging Control
 ------------------------
=20
+.. warning:: Some devices do not properly implement the charging threshol=
d interface. Forcing
+             the driver to enable access to said interface on such device=
s might damage the
+             battery [1]_. Because of this the driver will not enable sai=
d feature even when
+             using the ``force`` module parameter.
+
 The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
 the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
 between 1 and 100 percent are supported.
@@ -70,3 +75,8 @@ The ``uniwill-laptop`` driver allows to set the configur=
able TGP for devices wit
 allow it.
=20
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
+References
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. [1] https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidd=
en_function_discovered_on/
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 481c4cf46e63..8cc01bec77b9 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2507,8 +2507,8 @@ static int __init uniwill_init(void)
 	}
=20
 	if (force) {
-		/* Assume that the device supports all features */
-		device_descriptor.features =3D UINT_MAX;
+		/* Assume that the device supports all features except the charge limit=
 */
+		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
=2D-=20
2.39.5

