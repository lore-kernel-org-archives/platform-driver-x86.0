Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883FBA45
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196530; cv=none; b=XfzYhzecrovowOMV7IpqI77awDK2ju1ZjP2e9IB+pO7tatMEY07q3JBMQ6aL6wFcvaXVN+OsqjblcJ9pCrTL3numddqdLlWmSiNxxNgnlMuuNZ9kfQcmUka1sb52kgLI++8Nyz1QTAJ8q6hFXz0WnPLf3CMbAGc1mNi8z089F6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196530; c=relaxed/simple;
	bh=TbqkSgZCXlTrGYhXzkeDQaBOdkWS495hC6rftFSCSLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtIFU074WfHOZ38dqCM8eaBazOV+CZ31cE4IE+SWSK2qjFYmtxajmyEF1opdDZQ8AszYhdSxYzYbjBUCPqU/M7m1QC7iBPV+Yjhu6EuRkLxB+5EaIInGor/kM6V5zaKqxFQw+0BWo3rIGj62Pj8H4QS0Lq4pH5khSxn9/lYNYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqlN6c2c; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqlN6c2c"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-557a56aa93fso422308e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762196527; x=1762801327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+wfLlHdlrvYcCklMhkk2SxyIiTOFDFm9ntS4AcDqkw=;
        b=bqlN6c2c2z8F5g1pELtv8SzMTppUd515HsQQyRgOFVBkoub7ESSv6xWwasL4c7Wt2C
         1Zyrpmkqvfp+rKIJLwRhcmfyTRLeZKLHc0ZHthY6aGLP5pCt7fwsdzTzU4VT1+CkHI6S
         546HCAkWJldIKtdLdU5tAqdpqvqPvNYr+hFn51PvNlY162t5IAjVaiojN5E984a4RVBn
         0hgiE+0rrBAPT4PVdPskYNgU2OpMFxchQH1tsaz1gOPxAqajmduItWEwm5ekyVZwc1ZG
         CNafAJVNcxbEavJ49Mih1MDs9ixpQCHfZHHCNaOYkVEBSjuDI2z+kgUeJzlddBNZ/Lnh
         o1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762196527; x=1762801327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+wfLlHdlrvYcCklMhkk2SxyIiTOFDFm9ntS4AcDqkw=;
        b=UOgYNmFeALzdS9Z6VmZ5/9Hy7KuTMZnu9B18p8s45olifqVXoqosZ0DblxunPRKrW3
         mc4jpJIhR+9eFV0dwQfBOhztm+h1Z7u/1YaCUNS+14iHgMMjAfmEx3+L4DlHY+2gRlkd
         iq+F+6CGHCbsrUUsXaOktoj/t8aEkV0Z3UuI5o8HflYhr0wfEXwmHqzqi8y9CvZWiW+s
         ni0TXHEnUbbR/nJgQTBZPC5KErj+Q9a5g/z8pgFh0kXvXLDFwmhlKlBvLE0s6xAT8EmD
         g2S4slAghB8HwpC3kpG7Mn8lJ9whQRsKle7E9kOMHBCnmhnEw7hminzHA0FLSpkULYiy
         oLJg==
X-Gm-Message-State: AOJu0YwjWBaH5JFo7Mhg8Rd3kE7+VvYXBqZ3m3uMwF+RfOJDwOgCABPT
	kSOF5mx1X0MhwQhr0nAMUxkKGQN1TyCDztvyp7gWPdQrv8pVovHQXVUr
X-Gm-Gg: ASbGncukm6QZJImw1kln4UNuZxhQYuoB+j9oEI7ehmNE1EezDyvu2eyc/0TFXd+rAGI
	eZrdH8ygWZwvSoTWtP8X2/HiG9tG6chuvlkORur/ZJ4g5OnQuygnfcmH5QBvXlVsI6L0bw7A/Lj
	hKLplNDmB2k9g2pCO5V6DtQXao5Rqr029MnETEHb7484Voqd660KaalEnxg+beVSrvTBQjvjDew
	sNLIsnBHmmiGfJRECTgXwDNRMCpQ4F7JrwPpwjprZdoQJMrFRRZ+4YK/kyHdBvhl7iSW1Qn9Ea6
	IDvTeNVoAPdfqQp3WN1h3DyvRmVPBv3cRgLesVve8Z6gE4jcLojnQKX4eSHju2RPsi1jgaFeqMt
	FPbfRO28AWvIg+NkG9ggYv/SlugCb8ZqilFEFeCUotQ37AhNRvmEcogCjo1MCX0GGkmUZGAqgxI
	zPtkFIgN1f0eZ7
X-Google-Smtp-Source: AGHT+IHQJiuKepqGQcmrBoRO1kAtF4hiBGj9Yir2z/yiL5vsrXcf+T2JYfiECUzR5VFEEv230gcPKw==
X-Received: by 2002:ac5:ccd9:0:b0:559:6e78:a43a with SMTP id 71dfb90a1353d-5596e78acf4mr721689e0c.9.1762196527510;
        Mon, 03 Nov 2025 11:02:07 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973c834e3sm358469e0c.11.2025.11.03.11.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:02:06 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 03 Nov 2025 14:01:46 -0500
Subject: [PATCH 3/5] platform/x86: alienware-wmi-wmax: Add support for the
 whole "M" family
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-family-supp-v1-3-a241075d1787@gmail.com>
References: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
In-Reply-To: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=TbqkSgZCXlTrGYhXzkeDQaBOdkWS495hC6rftFSCSLw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkcf5RmXYi5emtn9Y050fdrtpivjDUVyzimbZbIVV0ZJ
 rLwk0h7RykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEzk8B6GP5zv0i1rK9JOLLo5
 JyNj3pa1U1iPbFJurBS4nGI+/XqclDMjw8MUvvc7nEXNVzw5aKxxt6huvnphxGepqZOmXu2znr7
 gHBsA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add support for the whole "Alienware M" laptop family.

Cc: stable@vger.kernel.org
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index b911921575ad..53d09978efbd 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -98,18 +98,10 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		.driver_data = &generic_quirks,
 	},
 	{
-		.ident = "Alienware m15 R5",
+		.ident = "Alienware m15",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m15 R5"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware m15 R7",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m15 R7"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m15"),
 		},
 		.driver_data = &generic_quirks,
 	},
@@ -138,18 +130,18 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		.driver_data = &generic_quirks,
 	},
 	{
-		.ident = "Alienware m17 R5",
+		.ident = "Alienware m17",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17"),
 		},
 		.driver_data = &generic_quirks,
 	},
 	{
-		.ident = "Alienware m18 R2",
+		.ident = "Alienware m18",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18"),
 		},
 		.driver_data = &generic_quirks,
 	},

-- 
2.51.2

