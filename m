Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630254;
	b=I0HyUy/px2DkIMbKM/lrYZfqkLLjdnbgx1lzFvjK626oOmgYXU3sCi3Vrua1tSGzvJap
	 +AmdQbTHbcyU4jJKWMseCb63hovXVoPyb5b2GpU/TvMxMtdqCuUcGpqdAKHIkVDyjxoeR
	 Atcl+O5fCDKjadJPgL4rtoOQRbvOqMCsDJIVzAoP7hxGOlFuPOVDre9xSxKYBSu6/kGxl
	 4bjbVtiSoPPRCQXF1Yvxh839yn/UhuA1w9YSDYbOX7bf975wA0GQc1m2Br28pcGsZHQH+
	 wNSNNyMgwk5uB4+D8rdmMo1THb1tRtmQ7QT/qOUQt9/hCkPFyn+2ymCGSvbaKEa0GPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630254;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=t+lLzmKzrIMqeEPBsBkvriUe8bpF1/8zOpYpQi5Ys64=;
	b=rxFYWxgEMSh42O/9FxK+6k9uGPZFsqWd5n96fXz4evJUa/EPSwNKqRnnCrf7Jev8IXO6
	 n2wMe+b25kzfnVI3GAkqIzQ7tATQZqsH+2AdZr2xDYxAlpUWm8dr+h4dSH6rKxfneJSAG
	 T3m5QdzVsYAPnGVx7l+BRNXPzj4k7/kdBrmm2zZbC7/S8vPlikpqintcn9T7pucEVk2jK
	 zSotRgEKpVZx9GqAtlF4haHs5WMS4etfxJ+lMUfZzoePQW9kIh3BnL36a01ttYztmMluP
	 P74ZIoQXOkIE5tOeMm0byNgQXC8GPPe/aw6MYpLy6F8XO86RP+JEaPUPv+q7icXuMIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=K5pi+VFm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DC606A683;
	Wed, 25 Nov 2026 18:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621DC606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=K5pi+VFm
ARC-Seal: i=1; a=rsa-sha256; t=1795630145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aaAC0wpp5DqBGVyl4JZOTsAW6Xjo4uQFaPl1kUl/7K9OfR+mNgaVoiYcZOGJAU5A5qJ16S7Lelj8K3KaW9ECO9rA6IESuP/Bi8Dg+frEov+Rkc4cPP7aFySJZLVAsr3i4Eb5R2MhUj0rWaPreG4qXs6jcx12boRdGaqoZDfPiQ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795630145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t+lLzmKzrIMqeEPBsBkvriUe8bpF1/8zOpYpQi5Ys64=; 
	b=mGLblOUmsOGLWrHO8NVDtQxCezmGarhbi0VOBn7Kqp/7QtfKf2VPnsjcc8Fr5O0opNC4mrd0qf9YDdPtr57bgLFTj6HVlhiJ+pR8TCOuM4V5+ow/rZEttKFE192yWv0LLDz+3hwT4rgiXamAmFLaURYcC3DZYDOTdlwZ0SfIbLY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=K5pi+VFmCWcsU+pROAv64Dpx2dx55ivfcyJZBIdMgGgcr2YJMmDTj7be3uT87ai20ellZvqheS8kTJJNeHGtwNDmPsxdOHA9PQfOvP1qdwoEsJd2clibo++OXP6SoXnYLAEKRQv3z4Uwf2C31kbOpUy/I9z9zaClKVDchi2VdcPYVPaZ7hFMwU5RC8UdHSjsB8ii1ba6i8h0rAn0m3zVo6ujRetxbeciWgWg6fApfGVmtYjSDQDDlsNkTyGqZBT4c2wSodl+VV8Yl+9pkwUj4R5Mp8F8mQFflnblI3ZZHv9GYIkrPnxOrXVk8CBMXlVs2+CG0VFFpXdOlTmPAeJtnA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=t+lLzmKzrIMqeEPBsBkvriUe8bpF1/8zOpYpQi5Ys64=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795630143522343.0298093347674;
	Wed, 25 Nov 2026 10:09:03 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 26 Nov 2026 02:08:25 +0800
Subject: [PATCH v3 7/8] platform/x86: ideapad-laptop: Enable ymc_ec_trigger
 for Lenovo Yoga 7 14IRL8
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ymc-82yl-v3-7-e30842671ec3@rong.moe>
References: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
In-Reply-To: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

The Lenovo Yoga 7 14IRL8's EC must be triggered by software on YMC
events, or else the enable states of touchpad, keyboard, and keyboard
backlight become out of sync.

Add a DMI quirk table entry for the said device.

Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index f3467cd8df36..ec060bcb5c88 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1873,6 +1873,13 @@ static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
 		},
 	},
+	{
+		/* Lenovo Yoga 7 14IRL8 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82YL"),
+		},
+	},
 	{ }
 };
 

-- 
2.55.0

