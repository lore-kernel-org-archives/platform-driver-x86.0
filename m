Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC49239E6E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750396; cv=pass; b=o7uVRIEch9Hxtv5NdDrFBRtniWWrXWSY+PaAt5FqDbxSX84MQoXpoc94yxhKz66p5gqzjVRaceJLpFREYSoovPr21FzCEAh1vtt8NF3vX5cw6Iuajk2dtvLvtUKGetO4Cb2PDtwWTH3281WCRDBUMrxdbUN7nEbQA5mYQetpsDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750396; c=relaxed/simple;
	bh=KHUeOoI954bnelxUzah8MoZ4V43yTPyQyzpSAGFHEDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhb0ZphWl+/1B7vstbs/jNpMHIYpoLcX4FnOE/HL1GKPdh03CR8CbmSe55KNL+hcT6LVkUH35IiO4pFTegF6WmANLYVjNyMVcHDyLVi18ou+CzmwIZ/uid6rxDhRFyS+BcOg5hTz6cSmaGO9vW4lMlw6hWNG2wPvxTBKrVZZgEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=bREmFSGI; dkim=fail (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=kiDpSVZu reason="signature verification failed"; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="bREmFSGI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="kiDpSVZu"
ARC-Seal: i=1; a=rsa-sha256; t=1750750387; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SJjxtNsLdB8kWR2nXz+o/VCPG6R2zBGj1lezPEWYTCEVSdMyaEEQY42f2nOm6Bzs3zso1ehzF201YRckaSEMT5EvQXDOjOlfGg2Qd5p8Me0Y6cyL3GH7TB5sP6pb5v2YCK3PKfb6PG01Ggm3eiXtiW+oYIJgNLSE/d2tZ7AvWLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750750387; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KrffFLDF2toS33FmQJwTaAiXSKxYzz6NHPrVWnJSAhw=; 
	b=e/sBsnqG4Lkbzqu5KmXuKj+5ozUJlrZiJlq5fWH+L+8Kpoprls9KvsSz/VNUjzglM7qb8Tz7KTn1Ct3eonmJZ2r8rAS7WjWDJFe8IHM+tZ3DXXJnAjseif/WG22I9x4F7+xxcdvrZPaN4+i7YYI/2GUBTI4Zmc15HZ3SjdpSzoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750750387;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KrffFLDF2toS33FmQJwTaAiXSKxYzz6NHPrVWnJSAhw=;
	b=bREmFSGIvTyqyZHgpt3h2dmXTB9XOyRJfT/6faz8IccxCffpqfWpoGQLR+AvxF/P
	hxDqJt9EHdHA//ARrqx0uN2iJ56NLgxV0028UoDbSaGVGPYq386RP4YGhUGJv7M9T0f
	whLd6RCri0uVcfeE7Mv0pyUvXip/KFdHZ+suGg3k=
Received: by mx.zohomail.com with SMTPS id 1750750385700149.9075869911477;
	Tue, 24 Jun 2025 00:33:05 -0700 (PDT)
Received: from the-valkyrien-leopard.mynetworksettings.com (pool-108-5-102-140.nwrknj.fios.verizon.net [108.5.102.140])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 8CEF8EB546;
	Tue, 24 Jun 2025 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1750750384;
	bh=wZUZeaMvxNDAIH6f/ei5hWX2qtqhJuwkO4p78DaKTZI=;
	h=From:To:Cc:Subject:Date:From;
	b=kiDpSVZun0DPPS1/oG2dcZXSol0dimsd6xNgivZMGJ3JePlYesysXGqqIvKBZDweT
	 9L47RKLysPQ0XVXoi5EDV9v/JNVtMDo1Va7HrGdJLCotPikn8d6G/w/Z0UvmWyergb
	 BWFWxW/2E4VOFqeOHnAZua6LKWhMwTDtj6KsuXwS0GzAdMYrR2u7/ajEkcVbZaZ42P
	 b0IKttky9UwPn89vrGH1jVrqP6MmT/hZZAFNdFUtS1zggYald9CRP1yzBP3zFlCNLf
	 wsIo8naEu+HYWyKMZAii8qfKwTsvzbqBK9XB4AXJwIQlUdbjjYiso0XkNDP2epf9NW
	 +xoBIuYqnVCFw==
From: Rahul Chandra <rahul@chandra.net>
To: corentin.chary@gmail.com,
	luke@ljones.dev
Cc: platform-driver-x86@vger.kernel.org,
	rahul@chandra.net
Subject: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8406CA
Date: Tue, 24 Jun 2025 03:33:01 -0400
Message-ID: <20250624073301.602070-1-rahul@chandra.net>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Add a DMI quirk entry for the ASUS Zenbook Duo UX8406CA 2025 model to use=
=20
the existing zenbook duo keyboard quirk.

Signed-off-by: Rahul Chandra <rahul@chandra.net>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/as=
us-nb-wmi.c
index 3f8b2a324efd..f84c3d03c1de 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -530,6 +530,15 @@ static const struct dmi_system_id asus_quirks[] =3D =
{
 		},
 		.driver_data =3D &quirk_asus_zenbook_duo_kbd,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "ASUS Zenbook Duo UX8406CA",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX8406CA"),
+		},
+		.driver_data =3D &quirk_asus_zenbook_duo_kbd,
+	},
 	{},
 };
=20
--=20
2.50.0

