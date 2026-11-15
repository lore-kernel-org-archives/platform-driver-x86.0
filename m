Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770966;
	b=ZzC2nixHvxC5pk9yBJj5Pr+Uu6UZVoFkSMDyjs45n1oMgslgC0KYffklPHkdlxQd6ONH
	 IxWrhVxEujBcZgS2u4zIHDap4M4qxoEu2+kZ+KoprBYtTv7NtSsvsH6RgkZtBM/7m3TCX
	 V1EemcfJbSxHkHcRtIKCTVf4L3D2akmsPHeD9+phk1daiyBvA/LFtltWiAeV5Y7HTEea8
	 CFJderkYc78X1gSfoLkg7ceDlsCAGmpXD+F0Pf+DhQieZe78EfL90fKzMXiotylFkvoZL
	 O35yJDOXPl04szD2or5f7Da3a1sVrUD6TNEThwMdng/XkXLlv3a6XVsqr7igIdYGavQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770966;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=aJG9aj/1TNxRxMtd3MVG3wRoVr7tWOPu4qXnQ1r3U9Q=;
	b=26L023IgJRYLIZBCtieH0THE/3vt0FMONIZ6FrqHe0qeac2s4+n/odqJ7MunfIspCzye
	 ePHu4mhhbHPjd0RKtwsoChiRbbqBM+ppwGnyUUczNNlaDRfiyF4xAIizneLi6/YXHYKud
	 vfyI0H2kWY/TE4OULIRPOeI/qyNUWHVS0TYbbmP8c7/4dCfh9iZHr76ZFq19wK3rurk9Q
	 obrV2TAILLVJe9DpFnzADczZC1kcd/bP+L7fLsbUlwmNDJMDcEjPCR2l5kH/stwxVKY1L
	 IwLdF5/B3I58TU5hnqZNUTsUmD9WPCaaVdDmVL49138qdBWOz8d7xra5XWWQE0H4fgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=B5jHQ2BU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FA606A883;
	Sun, 15 Nov 2026 19:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294FA606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=B5jHQ2BU
ARC-Seal: i=1; a=rsa-sha256; t=1794770901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yu9bYdaTYGLoCt+3inZTQAGJ/AuDdMOU6R4Dn0+CVMlf1RMTdozHkZOjUXYEjebNLLub8W7SDZoruW6dLzgN9Bh0CaB1hfJoY0lhg0TgJIDmJOoj6ELbDCGIz+MbAVj1qtzK9UfRXHmnlYln3kCsRgci7qG0qZwBXn4owKEuZBo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794770901; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aJG9aj/1TNxRxMtd3MVG3wRoVr7tWOPu4qXnQ1r3U9Q=; 
	b=ZyZq2lgfBwJn4SjaeQ2hDShwVDDbYu1KALYRdGLVSh9pZXfEKteRc8mWEgRGB/r6MqWuVVU8tSzvlwviIA6UYNODQcP+kMKL8H960KWMkFZmBuK0Wq3KlzUFGbzqswEM+K/MG9x2d9y6sAGnxTKHxB1w1W+AjpbK2CAclG1i9sI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=B5jHQ2BU6sAqbpKBmMPZGjR30jTobn/QWqj6jztBNYP+9R4Pr7wTXhWEmzwPjv86rz5hsFV9Lb6LXkhR+knUYm76ITBHCSWUXu9nRVgHtiZkSCkrkZLPdbyVvviaOI/yYr2NMFFw6/7iCsx1Ev8841UhTUf7h7nEkAugM5KcnpB0Y5tN19+R4GOzspcszkvc5UJapOoJ61hIBtHdnetP5P1vuYWgvUW3TKQpFjGTzH1WRdxrLLrrW6j3UN5sI8OwUJC2qtFJxW9cV30/bV+h346taYf8eWOFDm3c92R+m0kYKhK1XszNqadV9qMGxvbZzg15PpkcGfwx3sbEUCFH7A==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=aJG9aj/1TNxRxMtd3MVG3wRoVr7tWOPu4qXnQ1r3U9Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794770898495628.9551538154195;
	Sun, 15 Nov 2026 11:28:18 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Mon, 16 Nov 2026 03:27:08 +0800
Subject: [PATCH 7/7] platform/x86: ideapad-laptop: Enable ymc_ec_trigger
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
Message-Id: <20261116-ymc-82yl-v1-7-fac1a2b01a84@rong.moe>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
In-Reply-To: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

The Lenovo Yoga 7 14IRL8's EC must be triggered by software on YMC
events, or else the enable state of touchpad, keyboard, and keyboard
backlight become out of sync.

Add a DMI quirk table entry for the said device.

Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com
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

