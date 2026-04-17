Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D836166F;
	Fri, 17 Apr 2026 05:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402568; cv=none; b=cZsaEYA7QeQMllDOEF9PD5TdZ7oDYC3WLYWZg8gLSPn9sciWLxaGhg8uz4ANgE7910MOBL/wWA/L/vO02xY+7vsMlvVLJzM/YyepmPtz/Ke0RIvTqVIB1KfZojjTJ9/49jAZztREuUmNWmUP+zcCWBnYTzvy9m0xvnV/U4wCPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402568; c=relaxed/simple;
	bh=9iElMnyTDA1HQ2mQi9Vgz/eyi5hn4di+8COSXstqYac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ns9AcminRtgS1fK7VUJ4s3iAXWBz9NmvQU/NModbO0fgnHajbz2lsBltm/KioRUSkt+7R7iGGVVOfjQOBNVzUYzIC3YewbgS+7LsbLsoQKLePnVaPVoPcrxzdMjVIaUp5dkSXJUKiKgp6Z/HfScQC4U65cSZZJU15RErTtcpmyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CDHkrinf; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CDHkrinf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402564; x=1777007364; i=w_armin@gmx.de;
	bh=MUsHJqZ6nDyjtc+Y8zkYlJar3rm+lY60Udg1hSdYzYQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CDHkrinfbi7ka3GD/wtKS8GyQSJLqcKcTrwAy1DK5J5j3Ky9lxnFHLv+XjREWgmr
	 /Mfjm7hAO50XQWPjNnIOZZDw7n4b3U7UkJ/bd+prXn8Kg5DnQG5294KvO1FQMplfk
	 8Sx7KVOzakfNUBhkTWuUy1MZF9yyQWZMnlRITFNgTDrP6pTsepHJTd6cBxOr4cpM0
	 EWxtfPAZW7v3/Sx3bZm2TVELA87kPk1gyt2W6RG+BvxkmwcN/eDc1mgLdTy6XUzIs
	 98kCuNqiGtfsMzI0O1aXiq1CwNoEWOret6Tpul+m5mlcGtXNyOEwvrb5Mw6YKtrwd
	 kAE3Pz3ypAnaRrXr7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1vNhiq2ofU-0188Vl; Fri, 17
 Apr 2026 07:09:24 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] platform/x86: uniwill-laptop: Do not enable the charging limit even when forced
Date: Fri, 17 Apr 2026 07:09:09 +0200
Message-Id: <20260417050912.5582-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260417050912.5582-1-W_Armin@gmx.de>
References: <20260417050912.5582-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eiFdKlUBv16tlBZyJREgaCatwwayabectOvY3KY0MUum7n5IQdr
 DI5pJ1tbcO+Hvr7ADrWFl6mYV5xKSVfIJvidMk+a671ZkKcwWj+5B0lnIpfNrBx5iskLyC8
 R3DK+NxSW/YM2kxc9s20BOsNyYZlUwrCXAOUCWijuzOmzSFihwFlyW2RwHFDPoyC89bp6kx
 QI5NOJE9O561UvpdNYrJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rDsAaoLYxS0=;SAMR4Gb3GG2rwBUz7TIS1wPGiqV
 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
 4yXV/Q==

It seems that on some older models (~2020) the battery charging limit
can permanently damage the battery. Prevent users from enabling this
feature thru the "force" module parameter to avoid causing permanent
hardware damage on such devices.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Link: https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidden=
_function_discovered_on/
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
index 7c7ea0e76966..dac80c78ca0b 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2499,8 +2499,8 @@ static int __init uniwill_init(void)
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

