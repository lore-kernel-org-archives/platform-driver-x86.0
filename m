Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630276;
	b=2LJkMN3eiWUe4onmGoKrovWckAss89bL/Fpf5kiP5IwHrX9dIVCa1utbyVllnjUxnoCF
	 qiLoA0MlG1uZXJRAPQsb0BZ9ShH4hz9Gm/sN3BgW0RMwMnJEjp3TqDsnd707vFWj0Wjpd
	 5NHvM7b9Ywxq1SK9zY6FcnBlp2yJdKsQi243UUYkNK/Y3xY8iUg/FkubkYabBwKToZNFi
	 6ViRLoaT6Tu5zkO8shBFmmqIgnhOwv0PKYABSKUx5+vErR4ArkRBtNfMk18zkRrPVbqxY
	 P0duEjdFaB37RKHAp9wuAyNMxMOmgj38twg+2Kqk7uHYMIV0u6nfyBH6rKWwXSffmAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630276;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=6KOMSeMBCnjs5mhrPq+LnQxT/aixBEKr23EpHe5/yHk=;
	b=PL0SVYY1uZO+gXvyVpVs77cy0Q3K/UxnXI5w2V9XDEuRpiR6Tx/nq+WRlSeKmnVvr5Sy
	 HRKkxViDb94jFIrsVhaNIjzXT4VwsTiC+AQ3hAuFD34cSlKrYjrP4dFLTpIs7K2Yd63k0
	 bL97QkRhIYNoyxkcPn7NjINSE3EHHfjTFeL/BfFWeu+ISvHPGOWuh3QvQUUzCacl+ktKM
	 qlv8qpN0nlAYa+gsbmB3HddNkDVm/g6orb0wyGSxfwWrCtkOz/yn3Znr6gJxdvlcVw5NS
	 0zmVP80osnKkpjFuj8z0KB2EVqstZ2uz8h9VNbPjKG+BdvCtYNkrk2Xm2u2vNsp7g7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lPzQ+qrx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B52606A69E;
	Wed, 25 Nov 2026 18:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B52606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lPzQ+qrx
ARC-Seal: i=1; a=rsa-sha256; t=1795630149; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J5Vkn7hWEOf/ZnmoJZ6v25mxyxRkqr7VjKRNt8JKHz9ArifquNVm4lRIMtggF7hMJne9JOqAFseV3i3gGsDZeK4Cg6kSoFEoa3npaydQoBNigxW96Sdx1/oX1uf98cal2iqrB22vAgkAjn0MRcs1bXbMr6xbku9UvWkAV0QK+cY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795630149; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6KOMSeMBCnjs5mhrPq+LnQxT/aixBEKr23EpHe5/yHk=; 
	b=YYNTJeNn+lZiIPS46p0DByGXnaiUFb/b22J8xSE17Z+A/9wiMglltXh+3dZDCUiUyJ80z82BsPyXDVuU1MMbxJUXvawztANcqDFEAN3t00X2Q1eNCGqcXM8HKf+ELqP/Pfn2IVAK0wxYYeQnCzPZOoxJZRnbNLxJLIrkbcjWE5Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=lPzQ+qrxwcsrvlvMEpQte36vIBy2TZdTMnbgPaOYzAvxpE7MmgLdWEo2QeV9k1lhy0wGjl/tuQF1mTn2QzpikTaqhB02g7gFEd8K67EEsQR/FQ1OVjHri3Oznjvr0BmiDieyysmS328NYQuDIKlynK70VcFDv1Ll13GaDUNJcmWUOnOHaUDc2il+saXlUWE4Clhad63QmpDIbR5HDxd2sWIRKVe1xMQLUfgkOTTnHHw/kagEYuiWAWJm//MjNEdopKvduaxcjNKmke9vt8Bd61Q1+Yn+6ZNCKxZzOu2ZYv2najGVRMw5ry4z5A3Ks9UYE4ZBiVl0Jng6FqxiTJHzkQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=6KOMSeMBCnjs5mhrPq+LnQxT/aixBEKr23EpHe5/yHk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795630146459286.87903086355686;
	Wed, 25 Nov 2026 10:09:06 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 26 Nov 2026 02:08:26 +0800
Subject: [PATCH v3 8/8] platform/x86: ideapad-laptop: Enable ymc_ec_trigger
 for Lenovo Yoga 7 14ARP8
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
Message-Id: <20261126-ymc-82yl-v3-8-e30842671ec3@rong.moe>
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

The Lenovo Yoga 7 14ARP8's EC must be triggered by software on YMC
events, or else the enable states of touchpad, keyboard, and keyboard
backlight become out of sync.

Add a DMI quirk table entry for the said device.

Reported-by: Eduard Aliman <edialiman20@gmail.com>
Closes: https://msgid.link/CAA4HgYKab7_GMCNdHF9+E=9ECVBHRs_axefeCOnZbUNUoyVSoQ@mail.gmail.com
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- New patch to address Eduard Aliman's report
- Drop Eduard Aliman's Tested-by: as a prerequisite patch has changed
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index ec060bcb5c88..dfd3eda05a4b 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1880,6 +1880,13 @@ static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82YL"),
 		},
 	},
+	{
+		/* Lenovo Yoga 7 14ARP8 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+		},
+	},
 	{ }
 };
 

-- 
2.55.0

