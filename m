Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D4158DAC
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758695254; cv=none; b=E5O2Nry1Wnhjmnh6MA0+32KEeYZcrH4PEdaBECMEPjN706agnnHUapEb+n8YbRpeH8itd+5HR8zsKm6aVcN0iSE+Fwl4Votz1N4W5ZChouLtLYFQ3owfC8RcTcCYiAHwM+RLWnnaFNxk02RWKgynbrKSisyUkM7hgDb4vNcBJig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758695254; c=relaxed/simple;
	bh=thSdD+XLVj9ksDk6itiukuHrdH82G5cb2lzJ3hDNa/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDJlDEbq9cwCL+Uo6IIS06jDqZEkOUbE8UDK71aGV5yerK1eKMOq1U2oUhR3kbbo+lY7k2UyRT+eFFwkw5Y6vbCuxsJp3vJ85EUVf7VBfaFi6kcogII+9yyJDqqdaD9uyxF4knHNXhpAN79GiqaHOUwhHxX+8sF6rmyLnEx6Gvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trix.is-a.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trix.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso5971209a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 23:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758695252; x=1759300052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZ1xWK3nab1TsqaxpzRGSrmw5Oe/9F4mQRkje8mHRf8=;
        b=ChJwR8XegLM9eT7tQ6Mr8FklVa8uzIGGWa9ZIjlIygFrwORt9SbQEqkW4NNmhvtuH4
         tmplDIG24dc8TFG0qoCgHpYEqNdxFy5VyT1EwNJMj4fhkVfo862XJVtgSxKTJ+2VWH+X
         V7lTS2CExez6PG99PrSm1oOc1VoX3Brd/q/ejkDFwvla4sg/x4GYE+/yb+g69qq9c5hz
         cNQBoBUkbfHD6WXR3dyV6uyl4yFXxaNHixR6yczFn6Ww9gMRuo6qLiVZtqRac2teu3jI
         xJtoJQjY2PYHb8husJNUBXnJntujDDfL6nCgvwrpStxW8w01m8fWFF0gArN2tmyN4ErG
         M0cg==
X-Gm-Message-State: AOJu0YxVsb5KwtVhymDnKJuzMkYoR1Vrdp3YGh40XX/dClHvIkxtmki9
	vD6+9F7j/Bio3CKqULr0z0o46f1ffI+RbyqU9hRJUGnTT4PC+7geKycU23fcpDfy7g8=
X-Gm-Gg: ASbGncuSTb6WXHYq3+SzROfBUE61FR6UXvB9BwaiDIQkRfwQMLxMgfa4fQpbmdptPTP
	xuia2vMkAYl4st3PLTjntXSp34qgJ8xKVMaeJfz8AZfYKEux5vOe6s84G/EAv1rliPBlGRa9Feb
	ruhfXmxNJ973OeV+nTX8ySb9Happv5TOKKuXw1BPVw0qKbwJN8QD1PSPd7bVGYsF24tL0Ro0WfM
	UIVAXAowhq5aJW96sU6+XSanaya9Opc1QYS4xgj8cd196y5y8M+pdRhiSz2x/mrr4u4PTZwqPjx
	Am1D3J/cSnp77WAx3E1iQ1ExS5YAhxuA7OgZJt21tvDLVkaIm4MAkJ+4D+EHZelfEjXFz7yehVN
	0migJ9hQqdXtfCfKJ4W8A3cA=
X-Google-Smtp-Source: AGHT+IHuq5yhIT3z80bU/wkBqpouwpma4+VpW7e1naUiZULHr9yq17YpLUKrLbpLsn+6n6aQkAR9nQ==
X-Received: by 2002:a17:902:e5d0:b0:268:db2:b78f with SMTP id d9443c01a7336-27cc5fcd4e4mr59792205ad.44.1758695252263;
        Tue, 23 Sep 2025 23:27:32 -0700 (PDT)
Received: from archlinux ([2405:201:6804:217e:39f7:e9ae:d6fb:a075])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c081sm182094155ad.41.2025.09.23.23.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 23:27:31 -0700 (PDT)
From: tr1x_em <admin@trix.is-a.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	kuurtb@gmail.com,
	tr1x_em <admin@trix.is-a.dev>
Subject: [PATCH v2 1/1] alienware-wmi-wmax:Add AWCC support to Dell G15 5530
Date: Wed, 24 Sep 2025 11:57:21 +0530
Message-ID: <20250924062721.209621-2-admin@trix.is-a.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924062721.209621-1-admin@trix.is-a.dev>
References: <20250924062721.209621-1-admin@trix.is-a.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Makes alienware-wmi load on G15 5530 by default Tested by me

Signed-off-by: Saumya <admin@trix.is-a.dev>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 31f9643a6..3b25a8283 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -209,6 +209,14 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &g_series_quirks,
 	},
+	{
+		.ident = "Dell Inc. G15 5530",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5530"),
+		},
+		.driver_data = &g_series_quirks,
+	},
 	{
 		.ident = "Dell Inc. G16 7630",
 		.matches = {
--
2.51.0

