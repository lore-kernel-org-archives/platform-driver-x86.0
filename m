Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792813824;
	b=FO695DnQDbSX9TLNpWtgn9vYDFpwnRzgRS9bwS10HknuskM751ETtIucr21Wowe3CquH
	 wGYcPo/h7VmkQabgHrERQJWlloZZKh4I77k27Xd2Qyx/FVdQZqOxYpYl/AtCbyfvv5GYQ
	 vSD9XvQ1V6sMHAOntL4S/sfBG1Zw9+36Nt+gP0Y1WzfWbP4GTeinRAcV5h7mJqohH/7f6
	 gxmkM86oj5sqn0CeqG+WcxNtFBRAE5EBt1XItHYq52Pvks/8BmIdBSYm7abkCi/VDobCT
	 zqYCeKAVpbRJVk76aiRRrnG2YLgH3KCPAaSfyzYfiplpSpeUpJ9p2AHWQ3WWCIJR2Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792813824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	b=PDEuSJlUkYmBWb+ReVg9axe15gpcaakVClcDQEyafkS2p4EW5vayROyH2l3P8zo+iegM
	 tDrEizgtP/ilfWlyInF1A9dtvv/4o/rlq7f5nqZIjimm2Uet5Fvt+x2ecXMwKVKvKgGWy
	 reU5MCqBaS8ofsHyARYR0X+TXEFHYuvdlSqP1DnDxU8y5htsbINGxQpAV9KvHh9winsI5
	 csB6gJAis5MlOVqGrWypfWV09BG49usmBHjInYKC0PMw8ooJZPr2gLS+bquBZzFMfxYpj
	 vTRVWJG70n/6EnBXLW/zCs2jbaZvlhvMBd2UbV9jHnvWcPdgFZPt1XgaSncaHY1CQRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=joXqts16;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF8606A31D
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 03:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19AF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=joXqts16
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A40D4013D
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792813821;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=joXqts16mhOeqke2vxiWmtKbs6h8xr+drNbAEFZvxAAQgztEtjPfkAUL/xkfOTDS2
	 UZL8mVyX1plEo1RV4//XUOsURpaHpvxzquuQ1TdH87S/WkbmGZMJ1+bTj7ozTFc7fV
	 uwJZ9gMDjkcAivCHCWuSGjPOzsVixpiViBP+s74QZ3PAK+AXxTvb9RZLbdqN4Ymfzr
	 fFC7e5WEIeTXyWJCRiM5y+s4rbre7kjI9gWK5G3HRIcGKl1afcFmFmXBGTSEpg+sdX
	 nFbpZuu000c2PK/4sU22HsqsDElaTAAXIIZ1qrhc7Q79jfKKoIVmC/g7K6z4LeEuq9
	 0APIZj+LyiREZVYPIQL5wEla2H7Pu5/zxolZljgncwKdIZJRSXqbF/qAUDhNCWcAGW
	 5cr709OJSgb/QOYczI9rvfSXwxaiRi2GAHdDiP+voqEyollF+DHMbcu8rf1ahU3kvc
	 qLC1LFa6zhg/ikBsTotTz+SB5qIFpiDTWwlBLZfonJ47P6V/4sigaq5lh1unXbkpua
	 X0Pdu3iYNd6PNaiE87t5s0sdHu14RzgipGi3jVUYODSDpi6rFbaxwmVOWdzYrOrMRI
	 wGlbkGIXUEJhs0m7hY0CoQX8Y+/0nxjA6JIlVFJmq7b/r5GN3TCTqN5mU/xutOSq8k
	 EewXhjogOQv/ji5gWd9F3E/8=
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea26178b32so5604945ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 20:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792813820; x=1793418620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
        b=NrJlleeDbpXC4pYdxprmq0J3vD1ysefIZdv5qeMp7ehYiq1BxrB1EKlDRH+UMSE4Cs
         Ahh2en3isO6n47oG79BIcUF3GuDOmI94wjFDJTwoDiNfdqrmLY5U9VdPrK+zXP7Ynms3
         K6gX3ZXg7N+GPYsjvGxkR4fYMvRA4XpM1d9VvbHUNG3zABf4gHXTld/vKxi+jWWvZG1s
         IFiucz6T8ELcbE+31k/EeMwzuCVnQkosWEMYPaQohsUJRUHJYZMu0gXLWwY7l0e3rnWi
         qPY8cYG6Z9NuX9Nr0n9sxw9qLvaEePX8TkVBgK1OEWiCvyV6Dz33+oT82Zbpty5zVqjQ
         lWow==
X-Forwarded-Encrypted: i=1; AKwUvByGK/Qt+rtXYcW5gU6mXjrz79W40dxsKzkemCm7XfhdpkwnMuPs13wRL3o5a7QTOdVYCmNuR5XG/nH7NSQVqjWM8sPb@vger.kernel.org
X-Gm-Message-State: AFq9FYKtnHLaHrJ6+ztHnPXYeMjPxW3DDjYx4hwfLhPR8oY9O86tTsQm
	VSet9K8E1F+GaEDuVnwHbsrTrkc9bler5lU1PMRoT8TYNseJ0KgvFYxpE1YxIQ+5ICBLd72L79g
	ckh7ncCrJJemYMr02Lur2ZtE4APYihiam/73Wgq0p2IDwkVs9ZZVURo7jZ//dAPef5pqbxORsBk
	GzFCZmSr8G3xvf6R0=
X-Gm-Gg: AYBFou12ubCOKAkhKxU1QBueHP+186tY+hlcR+i4iBghJTHQQCJ9lNeLzqzHqCr9OuL
	xXk9rpw/9DEHGsR4NCBQ2wlnhtQF/WvExy10E4c4/CEWCOqkfeb+a4K5orOMaGgjN+6LI204U7P
	dXxZu5A2AZweNzzWJNwTDkfW610h0IKtdUD4L69Dg0fIV/PgfZXnDcMwikq0OZ3yTByOht24tr/
	D5dlmcpWoIoxiMt18cF9H7NhJCeLWA9WTyXllUHArPI8z8dYjh0EvRQyOcKKJ/gITTZoMxVgc37
	l1eczZS6lNIhd8S2dYP2rt288KeR/toMEmXFKG2AjnCPgegRRdoCz/aP5T3xFaHupEdcRjm7lve
	sP+c1veMxJ1Qtfzt9cGB7K/o3pOaKs5lJrl9LfIEW+2Qi2Uq8Z+tbXL00LxQYCbZV2/lhdKYxj8
	p7qxeZsSPbkaLzcqUgSvumfgxg/xfnbbAb46J5eWHGTsJnlsudtwMoSPpquLj/6A5KG1hmINt+W
	8FxCTKyFDouvZlb+jFY+Y2lTSEsVNjhu+ufrVV0EqA=
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1658963a91.5.1792813819845;
        Fri, 23 Oct 2026 20:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1658949a91.5.1792813819479;
        Fri, 23 Oct 2026 20:50:19 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm1320191a91.7.2026.10.23.20.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:50:19 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: an.wu@canonical.com
Cc: derekjohn.clark@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	markus.probst@posteo.de,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 11:50:11 +0800
Message-Id: <20261024035011.2712103-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024022930.2704030-1-an.wu@canonical.com>
References: <20261024022930.2704030-1-an.wu@canonical.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver creates a serdev client without firmware metadata and
force-attaches its driver to it.

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching, then drop the manual attachment.

The client now also reports a "serial:dell_uart_backlight" modalias to
userspace instead of failing with -ENODEV. A failing serdev probe no
longer propagates out of the platform probe; as for any other bus, the
client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 .../platform/x86/dell/dell-uart-backlight.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..9b8ef91bb0a2 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -325,11 +325,17 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static const struct serdev_device_id dell_uart_bl_serdev_id[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = dell_uart_bl_serdev_id,
 };
 
 static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
@@ -354,7 +360,7 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
-	ret = serdev_device_add(serdev);
+	ret = serdev_device_add(serdev, KBUILD_MODNAME);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
 		serdev_device_put(serdev);
@@ -365,20 +371,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_remove_serdev;
 
-	/*
-	 * serdev device <-> driver matching relies on OF or ACPI matches and
-	 * neither is available here, manually bind the driver.
-	 */
-	ret = device_driver_attach(&dell_uart_bl_serdev_driver.driver, &serdev->dev);
-	if (ret)
-		goto err_unregister_serdev_driver;
-
 	/* So that dell_uart_bl_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
 
-err_unregister_serdev_driver:
-	serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
 err_remove_serdev:
 	serdev_device_remove(serdev);
 	return ret;
-- 
2.34.1

