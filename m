Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544438;
	b=2X+jNq5TFscNaqJmpPXfyup5fpPscS/90fVw6uhx7FMaJ1tDi3RDi/IdD4hYxrypkoVq
	 JvDB6LM6EAGliT1lf4N0rFR+Ikw7O6uO4hzH0bdaPh019sAQ4GcsdhbG6WOdTRSo086+q
	 iubrtTl8g06PEpCgBLjG/9t3PpFiloGI6frRrDrwMOEUYqrA2lDooZsn1zcU7Tf4eqKOQ
	 YFK+at0zzAMBfuRiYWELCdeCFfheMxRY28McURY8HASSHEbdvcMXBllhQhfZTOOld6/Jh
	 3mhHY/aw38XNHNuc6T8YRACAxVsy/ClVV+XYegdxtnHF9qeq14vL+A2NMLv+SFp1R7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544438;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=ELtphjr+DUQvE0cavmN1fqbzSfP2pfSWNeP+KWNKicw=;
	b=h+S/w7tQgRWlq/Y8CJBrTwJR/2U1Fn9Ogdm87/vBLjJHUKY09CsSqoA6LKopyVp61Vnw
	 PtH8O/Zk/MrTC9qnZ6xYt3qfmMgM1sOFqDRyHHUFMWWZexIkS9wP/iOiZmF1gOyFM8eWH
	 /II3zCooEg4kVIp66ZJGOlqA7JUNlf5ZXQNAqn/GzBH0NUudZ0l7V4+VEmTfD5Q1wr4U9
	 rZihzif7M/TnZOikd/s5Ulh2mRXlDqZipwR6TCkNIQkX6ljd2RL3HTg1wKgAYQoVDb093
	 V08cRULfgAhaiIMzPPDtYoeZ14k16/U13u7al/LT7T3NTXwAE6oY8LzDGZkaoZUvSdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=EC5slpNm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD9606A333;
	Tue, 24 Nov 2026 18:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FD9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=EC5slpNm
ARC-Seal: i=1; a=rsa-sha256; t=1795544288; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L39ZnSMBqcmkWYnTRZJmwJlxlw2OC7Kze7LZhxEGFWlLjLvjT0oWxvszMbuRFM6sVoTKBmZ4QP2DArPnP8MXUHpaO3Wu9HRB/hWlhQBtd5S6IY/uyjbBl5qmf5Jk8RnMmA6vdlUzST4Q/9DyfyeTUBLbJO29H9IgmCWkix8Ydsk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795544288; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ELtphjr+DUQvE0cavmN1fqbzSfP2pfSWNeP+KWNKicw=; 
	b=Pip0DEYx+OnkS/CTcaRJSlXVgjq5Labguyvxj57gRUH2sFvi1iXfRiq3guGbnwYlCR4fTwbHI7kRnfZjhKHkkTViM5ij92OQ86p/wVL8ML/6V8JBJc/R3W3QDYYIHa6zyrAkUHg9d+Umw++tMaBFo7Jay7WtEa4ioTovmkJtV/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=EC5slpNmln3oVwA/qaVYZUBkJ/+1h3UzEi0YA2A3QYNyYX0T0pWFuYxP9yQ2+3bf/C0isK/JbOborUUWw614ssa7KDca8DchhaRBoaZG84kFuD1MaXu1UpoxIjtp+kdJCGawHZ+A6i+OYENaSKIBHGay1Nm2NYlfzFFGEylBrAPwQVjyQa2661UGXE71qVq6orBxG+KBwsSD/+x8B+yAg6Bb5xiRyuURf1gg2u59ytDReWGEwGtepHRhsrriBCe6j3bOkqmBa2i+bAFucRv6n5PFJ7PDkBQ61v3nxID6bjwf6tlVk1wtuHrgKKcGZTsZPG14E8Ols2tKFloWdjNS3g==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=ELtphjr+DUQvE0cavmN1fqbzSfP2pfSWNeP+KWNKicw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795544287026756.0312791299377;
	Tue, 24 Nov 2026 10:18:07 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:17:03 +0800
Subject: [PATCH v2 7/7] platform/x86: ideapad-laptop: Enable ymc_ec_trigger
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
Message-Id: <20261125-ymc-82yl-v2-7-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
In-Reply-To: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
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
events, or else the enable state of touchpad, keyboard, and keyboard
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
index 4f9dc95d8c65..f9453de6df76 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1872,6 +1872,13 @@ static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
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

