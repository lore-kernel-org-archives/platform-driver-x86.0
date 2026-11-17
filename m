Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951977;
	b=kP/sYsSEiyBTg5TnpDcyFp0/BdqauNuUNrNPedBI1INWoFhE/Hai9nwBkx24hygszcCG
	 G2VM72m68iC3JCZcvWN1iTZX3l4BtQHc3kLodL4UK0mhZjkG7lTlocDs6Ihtrsf3pT+KO
	 oQFkvrjAZljNzzv5phAXBf3x9IUjh0o56UenDncKxOJxBPQWna7CPh0TT0BnrIa0CNjmp
	 CaJ0xPbiYdWCV+6VdLjAOuAHT/VferqtW7OSFI7Vg/FrUVz+h4WNpLj6zF/ai3WHpzYVc
	 egi9jRdvcqRiEtIq88G+LQCe3jAMMWiXgmEHrYAti72w/ZxM7mr7UQdwFvGTrAxXTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951977;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=QWr9e7xwwzOIjycyXAYmQElox3Ri7OadYWSSx5O7eCw=;
	b=aEZSU2UMdLBUSKkEUAbf4bnq/dZzfigxWnXYskcHVfdel/eVbHvejURHE+UVzwelyzug
	 L+liZHkGjLOQ8xuCxsz9CoflyUU0EGJIpMH501e82AYfU2mKj2GQVSl/1GYqHzxPI89Dy
	 lPEw+CK/WbGChZhSDSSd1EusLxJ1txJXK8O+CmUF1lSTZwCzxlngNb8t00XenjfMWIGRy
	 LiiD/oEfu8vYQnE8LjTSTEe2FzEx9echc8bg6hsmEP4aAW7ijLPnvRsmS9An0A9mOiujw
	 t1pBF47DS9cP7FTzCaQFGu82o6PHnfwPulmKAIelVBK4slv5jwuvbJU/71OHex9jAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=kmI2zoOX;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB4606A338
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFB4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=kmI2zoOX
DKIM2-Signature:  i=1; m=1; t=1794951974;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:NnBZLtlOr1gIMtsjs7bmQbjOVZ+y
   JTiFFBAmvzITO1OCepmkcJ4VrDLc36I0eZ2f3FVtXEzsOA5w5l6FcFi/pKTVRXYJupHpTcsjLg6
   GNgl0SNJFidBlDPq5VQP4fbxVZ7BcVP4wgMUChv8ocTQUo6gcCHIRQkWQ0znCC6U2WkDXbHxXG1
   3alS/qX4NsQlsJyM465SV2hyvKYxBYrbGNv/u3LzG9avx2JbQJiaxD/71wz68RND0eBTrgeLvCi
   Nhr/CtPxG4qIYLDk3bjJn+UjBLznFZm9eZucDn+1lMp8EJs4lYqnvzY8eGg9Xow9AmLUoyK8kVv
   cLEFRQak+S0AAw==;
Message-Instance:  m=1;
 h=sha256:
   e3VNsNaZYZHVbH2cV1oxJkLljEIPoAyBCbNdKsXQFgE=:
   pNNNm+4ks2MQkvYQCnl8xkCMjyQbMmQ83V33sR5UGGY=,
  sha512:
   TmcrJkgGhc2aZ1Xmxlx4U7DAP4n2zFlFQdpAwQGPM44NlHEWCxDRPAtt03PqF04wGIOgPD7xHz4fFO7o78QhmA==:
   agGEZs7LBOgGhZPEP5qme7XLP0ri7W/A8Q/y4/h7Ma85+51e8vaa+W6qwTZFY0Udxeaoz6GCVuzMwNjGAYBL9A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794951970; x=1795556770; i=w_armin@gmx.de;
	bh=QWr9e7xwwzOIjycyXAYmQElox3Ri7OadYWSSx5O7eCw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kmI2zoOXgfoO4mgSukUqe4YYCgUXvm9wpH72zAwIHUDoCmUvAripaG8SVftQxsOc
	 KW/RL0Xwb2m4OWq8CQIahViQq5X1ZAA3thcBVAj2f2CAQBRa/FrRlM0P7d489wAIL
	 n3vaaqsNbjD2KBEDo9aPY7igstIbcPOFSeup0SGfURaP46odasuCLSwLOklRAx2Jm
	 4MoPOH4IBkTcglVMajarP5pxEhCm07WuVupoGpz/AKHPIHc7lNaH38Ks8i2FF8WPg
	 gs+xqsZN3Ew/vyTzKbu98P0d81/zGGmWt0OMnGl0hcbbs2p6G0hjvgwbbtDWIRaKY
	 IHpqAK8fW+Et7U9S4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1wRSVl3xjk-0151Zf; Tue, 17
 Nov 2026 22:46:10 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	teolyub@gmail.com
Subject: [PATCH 2/2] platform/x86: dell-wmi-aio: Ignore HDMI Input event
Date: Tue, 17 Nov 2026 22:45:04 +0100
Message-ID: <20261117214604.397131-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214604.397131-1-W_Armin@gmx.de>
References: <20261117214604.397131-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:qRzZa5CQVo3b5zntbaNoCVk/7aLMD2MyMo7jV8b5XlaFQbP8qWv
 tWKf4/6VDqTAsi8sFfdhvdYJXflOWoFdEYI8oohJrJDvVPEdmuR6Q6Ki8PBE1/oAk+1jNKO
 V+HPQ3MhWFcPKTSK26FbsQxMgHakhlCtpJzK3npQ3jFloBXImrt6pP1x18XaDKwAZUAeIrU
 5Lll5mZ8oE6+j3ICWhcUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2HbUMHCy8qs=;ez8UAj95V/Q/aERPvdzR35kK1b3
 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
 DRKoK0jue7Eu5JI7Fxk23BUQUAQ==

Event 0xDDF2 is used to signal that the HDMI input was enabled.
Ignore this event since the feature seems to work fine without
any userspace interaction required.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-aio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform/x=
86/dell/dell-wmi-aio.c
index cea50ccac7ea..277fccb0acca 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-aio.c
+++ b/drivers/platform/x86/dell/dell-wmi-aio.c
@@ -53,6 +53,7 @@ static const struct key_entry dell_wmi_aio_keymap[] =3D =
{
 	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
+	{ KE_IGNORE, 0xddf2, { KEY_UNKNOWN } }, /* HDMI Input enabled */
 	{ KE_END, 0 }
 };
=20
=2D-=20
2.56.1

