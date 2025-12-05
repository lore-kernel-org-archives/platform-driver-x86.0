Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E44364772
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Dec 2025 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960650; cv=none; b=TiN0dzsDY/uVPx7Q/9+o2VpyEo/Soi4AphbfKnA9oRDIL53h6lzyVbO+161eLZcuqAjabpmEmwBKr2459tiArplE4N4ySlxzm+wcf2AJKdTR/KLPyx92JMCctDVmOFAqYkihmNHnzK6xPpRMaz+q++318QlhL45+FJKSlSZ/iGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960650; c=relaxed/simple;
	bh=imTl+fYR7wmHW3q5go+m1SIRr7DeAZJpMv0X/PMlExY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAtlkBnZYxACc2j0SPQ6CZMh3wx0rSZgGdcym8ODXVL04mUY12A3FpX1DVZNYRfFTqFHvg8g2W0FzEzL3KW2qH2+vh34tSLpUiqXTNWz2VVPdDOKmIevLyv/l9xQ5vC99Qgx4zgNKDydTU+vYsnwOGi1HK+GpgXzzq3jyZEy9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUyhvI59; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUyhvI59"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6420c08f886so2855285d50.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Dec 2025 10:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764960647; x=1765565447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQfjZT7hVjg/85ZYWWQWD1RSKOBJZiM/njkF1tgTNp4=;
        b=BUyhvI59yh+yIUi9TOFZPy2Rf4NpuMGncapqCxLGOkPRGem4w5iU9H1O+eBRVCE+jR
         KRFQ7AVDpj3bpSiThszFSwTHUlAOMIQCCj1O37mygo4MG/4W3EQ9DYg1N7TTFqL+ujda
         s7euPCJLZdVNwORc1iADK75Sc99lPAB8xC+HvANTccOBdyNpaJaQpBVEEGR9LrErshAs
         9nz8d1vCKa5+Z9au+zJufHgFq9RneiWA+6vO869+MKnuZSEdfnAW1GJXpaJY+eUPS6t/
         f/P9yUpxqcQPdVexai9mWxCIgv9/iUV+Bs9Dt60AE8zC5ebQEepweEnwyvYQJx+kZL8X
         4o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960647; x=1765565447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NQfjZT7hVjg/85ZYWWQWD1RSKOBJZiM/njkF1tgTNp4=;
        b=izhTyD3xpzn9rvPB5C2JtkKPmkWKGCnxho7ccPyOELxqPIKL7+HIA27qSf3P5qrG2m
         /Ed1lzw8lezD2eD8InQOlpGccZC8tCmgmrhx3k/RbBZsn2uf3uv4U4wcn1LirToJzYu3
         0BeRVgFVa5xTKYKSB/w1xm94lY26FbKVFoRGaktLBnAiuNfEQkexABksMq4CTLfjzAus
         nTM/zJz97U4PpAFDR6WVznOPniuuc3aycGxXoEsp9Q14BZQ9jYugy9lKI88wAhrBvtzW
         WbRPTN/nmLkhF7NsLsv/E0TtQnV70FdT2YNKLEaUDcmQWUktYGzAy8Oeptzw0QhWK2nU
         NSpw==
X-Gm-Message-State: AOJu0YyoLo1o+GideQB+xRu54osZ/k/CnfaGY/Zb9gkRBBM/gE69NPW9
	EAG4LfifRMof6BCXR2FDMSZ+kTJLyxDIgHpjoN2aBcYGaOk8k4ie55In
X-Gm-Gg: ASbGncvoP/LfcCxWAg4d/UJg0tuN24JJzd6JFzu6dOt1jw0vtQLARazRWSPVPt4BV+8
	Xa/A9Mjepg6roTIk6/725mkeTmvCKmkuy/Zyrx8Jngymm4pyoEzikacHDCXdTxVb7pCxSPISNqa
	OJGRy5oSGf9KNVwoA9+EJ1RE4bsBI8XxyPRiPV85wqfXRt1Qkv0zGkpupgrTf5evV2MO554vprq
	rpE8nXE143CIZ+CElgJQV/rSQqqH+pNA9ksaDLCDk3B5bpd6FO3rXd5Yz/LbFi/kK+LUTRWDTyI
	2Ponq+NyxY3JDla2Mj3DxckSs9n7/elBEtix1OBbPDO6aL/G2FzZB2T7JTtdrrEUXWtW0Qy/r02
	aUnL/M4VETq6i7oOmvvJt7ruN2PWA+wZ9WzUdRGIMySza0SVi1JetejWYHf0MLCcDtBJZ6+mfnm
	Loq8BQoGfKwy2d
X-Google-Smtp-Source: AGHT+IEPliYwiX/DRTmJXV2njV5vxO4ybaXR9NFasvDgVyAUKKQQy4c7fR+5+GIz4Oj0Zb+ZHq3iUA==
X-Received: by 2002:a05:690e:1904:b0:640:dd53:71aa with SMTP id 956f58d0204a3-644370403ddmr8803178d50.46.1764960646879;
        Fri, 05 Dec 2025 10:50:46 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c2f0aaf83sm4586407b3.32.2025.12.05.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:50:46 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 05 Dec 2025 13:50:12 -0500
Subject: [PATCH 3/3] platform/x86: alienware-wmi-wmax: Add support for
 Alienware 16X Aurora
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-area-51-v1-3-d2cb13530851@gmail.com>
References: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
In-Reply-To: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=imTl+fYR7wmHW3q5go+m1SIRr7DeAZJpMv0X/PMlExY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnGmo2qJu3sgnv3z6jzDjnyVP2jWoVnXmLenfkztwguW
 979ycWyo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACby9BrDHx7eC5tPz02PXLnx
 4Y0Dtgq5rNpSryo58w8GSfJu79g17S/D/4qW5mrzrXVLC05dCb3Bu6BW5L7VlLiANXssWoP+Mv3
 IZgYA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add AWCC support for Alienware 16X Aurora laptops.

Cc: <stable@vger.kernel.org>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index baea397e0530..01af6dde9057 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -97,6 +97,14 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &g_series_quirks,
 	},
+	{
+		.ident = "Alienware 16X Aurora",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16X Aurora"),
+		},
+		.driver_data = &g_series_quirks,
+	},
 	{
 		.ident = "Alienware 18 Area-51",
 		.matches = {

-- 
2.52.0

