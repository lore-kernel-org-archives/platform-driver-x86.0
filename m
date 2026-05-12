Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA343A63E1;
	Tue, 12 May 2026 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628121; cv=none; b=ZEd800e1JhQ26tc7HRYypR5IzbEmX0S0knoVe3hzua4jtUcMpjqNv9Z5it42AHMhQbbrx3KGXVyGjXJR6Urnqc/W8REg1UuLGNU9STGL/8IhcYhQFow3VOG7l6RAcfYcCZNTqoNI8Hw7X1MHXr0fDBjWRwd8LxkXFMSvwNNrPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628121; c=relaxed/simple;
	bh=rk5O/CMw7BNnxWUzO3RD/iMGFqaktUS/1bt25yd8o/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZ+Aah1bS3Q2O5ldLGEt6QhFjp4+tYu6t8chjl+g09bb2iJlRXKhgKEovFxM3pXAmUnleAjM5/LP+Dky+Sb3/EHPYruCLIskfO3fG9ssLGpVEoW/DY+rlpy03eNLoH1rAxU2FswvJz9CdUlhmwE3NT9ZtWUGr56wzTPgMY6x440=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=trnSztVw; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="trnSztVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628115; x=1779232915; i=w_armin@gmx.de;
	bh=eEC9gWugQxNClrbYg85LopIodWlPek2+IpMeQQK3uec=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=trnSztVwPMb3Zs97Zp5IjWTeiZxDJBPhg+5x39ErZWA8JY3BT1CpZ9ukNVuBiD4H
	 E4Y35zjMItvGX5aUG8mH9qrLmdAmKiHuG/ctwkd0Gco9Cp88NQ/G/YqGEbniYj/y0
	 5HhL3YagIRMoOscGnQPnS6EPshCxykrWzbV7GwBTJ6+b6sto2tEpPK36lYrbHRlPZ
	 hVPqyRxLy98Tnu6VmWqqm2IQgDpaNFk+gbJENECjAWYa6uP00z/su9KSHpURvjplj
	 345GCh3mJTzVEqVTgz65zXNQsFQ2uMmUW7+HOsW9XJOzomLX4ffqmG7uGtBA2YF1r
	 LbWH9lVApEEWPOzH0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnaof-1x5aa60xVt-00ZxWB; Wed, 13
 May 2026 01:21:55 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] platform/x86: uniwill-laptop: Fix behavior of "force" module param
Date: Wed, 13 May 2026 01:21:40 +0200
Message-Id: <20260512232145.329260-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:+n0KrsIAP063gCRP4Wx+/joJcLKdxGZUoilpnHVuexrRiDWe1jK
 Vpch0fra4WCeFJeZioG3AZbqnJAGicwon2WZXzsttS5EK5TggVj+IUN1a4eEqraDVgD+34z
 8jMhX5i7PMua66TyRjECWB398zKjlC2APclYNJfyfS51ZEkQXeQNBpgg+5qol5Ng/5vLYfn
 /zMZbCQrVUml6nVQROL1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1xWfCC4aDk8=;BawMSOOpbOVSVnrk2nB70kCZ0AO
 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
 qalVdoFnhIxjE7pDmfNzNZuOKT4=

Users might want to force-enable all possible features even on
machines with a valid device descriptor. Until now the "force"
module param was ignored on such machines. Fix this to make
it easier to test for support of new features.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 1f9e9f61d387..481c4cf46e63 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2489,8 +2489,6 @@ static int __init uniwill_init(void)
 		if (!force)
 			return -ENODEV;
=20
-		/* Assume that the device supports all features */
-		device_descriptor.features =3D UINT_MAX;
 		pr_warn("Loading on a potentially unsupported device\n");
 	} else {
 		/*
@@ -2508,6 +2506,12 @@ static int __init uniwill_init(void)
 		device_descriptor =3D *descriptor;
 	}
=20
+	if (force) {
+		/* Assume that the device supports all features */
+		device_descriptor.features =3D UINT_MAX;
+		pr_warn("Enabling potentially unsupported features\n");
+	}
+
 	ret =3D platform_driver_register(&uniwill_driver);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

