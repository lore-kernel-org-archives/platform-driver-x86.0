Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389643;
	b=c7eEewVR2kT2DAxDTHS1h3SFgJdLibe6VdCWN13Kwoq8UBkZZjx9T3FBQNSFXDInFqB4
	 7jyVHz9uB79WNHz2f2KARt3F2k3IN1JZXjN5OI4lhFq3m4hnww2wzw8qTyCeHlmh1Odp/
	 tuGCXvm6dW7wvGK4D3Fw5sBv4stJ1+gMYqgFA0BCl/rjPL5G/p7lF4aC3MG0sju3+XiUH
	 egh9BizH4/GUO9qFugAFu43zr/iwHuVCtcTvTZ3fkv/Wtt6hs26Llyds2ttMy6H5G8gzw
	 uO8JYKuWmyNSDv3nGVenRpeHMzyB8pMVRvsPdvP/pJWHrGcOnQn2IM1R7n48ERlN9tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389643;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=QnGpi+m5ZXQmEGAh5lG9Kh9AKDqKXDJEqDQHTQ+mAYo=;
	b=LmDSZLhItHI0n543Drp77soGKJMWdgdJFnPPI3u0iCuUR2xHm0n4LHLSunkPvEFOcZOf
	 66CeCHhgLVg4UREzKsTcanUbyUXTIrM0Tl4TlCamAvRP6wJ60mhpSm+4JztOTE48Sc2Jj
	 tmuMGTJ4J4TPs7RvLYTxKXPrT0RsroDjou10rsEE+f1jwOfYy00oKAxEBPpiSedW8/SuY
	 I53SClb2p93ruMoPGLHk+GVAeP3MIMSvhbbxU1eQxNibzPJ5eLB4TONa08WM34e35xnTC
	 /KtBk9aj6P1gGQTBiF0DyjE4DK5XYayTyclDUSyifWlLK7nOcD/iNkplN4WecGQI4WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=r19JhHA3;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48490606A31A;
	Fri, 30 Oct 2026 19:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48490606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=r19JhHA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793389632; x=1793994432; i=w_armin@gmx.de;
	bh=QnGpi+m5ZXQmEGAh5lG9Kh9AKDqKXDJEqDQHTQ+mAYo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r19JhHA3yobRR0TAulUld8NTz8stOSt73J6u/JFZOD92NOYny17WhYnuWxXWcfnp
	 LauD7Jp1Ihisq5/7g6Ij3l+lpSO67nLagzuyAr7mSG1s8FtTKO2CRfsnW4NXQ+4f0
	 5F3l6nTCjpOkasFXEolWQAz3glyFrxfb1D58eFXwmnTWugWq3LG22SsggafgUDhqP
	 FY29eG+IB86GlxoXFXrQFiNZdfm2SRED72CLT9BAP7E5j1KmzVdI50BCh2yKiu4nI
	 XfaR8/FibHYCldwk3kfHzbAg91vzuVDlw+fozwt1Sz8KAZR0w/+Pfn8CI3xsDo1a3
	 FyD5vAmGCPUYJV6W4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1xIQbI1bRQ-00D1Yb; Fri, 30
 Oct 2026 20:47:12 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: uniwill-laptop: Implement .hw_offloaded trigger callback
Date: Fri, 30 Oct 2026 20:46:44 +0100
Message-ID: <20261030194704.424388-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9AViw4txoWvNzNoJR+Ma4eGDPVHLPzJ7NXE/9IZZH55NYnCI6de
 iRa1+GvsGo1an3MHQQsrqklfZDff/o+cfiRkVYmrn+GexE01oGx1uTq0zb96KtoPUyMPG1X
 D3E08r9sQoSZ3DsZOWGhjStyZ6/2HUpR7/Gm7HcOzhhnUw3FYyMbTkBZKecP65Yj1mWWZQh
 D6gKW/O2pJruyIqykSu9w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uvlB1rvrD00=;KWXEkeXBXacToo0GMtNXya1SKYv
 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
 /20=

Since commit 8e04e5382aa9 ("leds: trigger: Add hw_offloaded() callback
and provide trigger_may_offload_to_hw attribute") the LED subsystem
allows triggers to report if they are being offloaded to the underlying
hardware. Implement the necessary callback so that the LED subsystem
knows that the lightbar trigger is always offloaded to hardware.

Fixes: d1c0c8996977 ("platform/x86: uniwill-laptop: Implement rainbow anim=
ation as trigger")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index f62d59f29676..ee444577e691 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1543,12 +1543,18 @@ static void uniwill_lightbar_trigger_deactivate(st=
ruct led_classdev *led_cdev)
 		dev_err(led_cdev->dev, "Failed to stop rainbow animation: %d\n", ret);
 }
=20
+static bool uniwill_lightbar_trigger_hw_offloaded(struct led_classdev *le=
d_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type uniwill_lightbar_trigger_type;
=20
 static struct led_trigger uniwill_lightbar_trigger =3D {
 	.name =3D "uniwill-rainbow",
 	.activate =3D uniwill_lightbar_trigger_activate,
 	.deactivate =3D uniwill_lightbar_trigger_deactivate,
+	.hw_offloaded =3D uniwill_lightbar_trigger_hw_offloaded,
 	.trigger_type =3D &uniwill_lightbar_trigger_type,
 };
=20
=2D-=20
2.56.0

