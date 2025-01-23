Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710D1C5F26;
	Thu, 23 Jan 2025 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737670067; cv=none; b=uxh+Ec7J0+v1VAWPkkvcn/NtK87HkxJnv1mutJEC0MAo4xAbOBPbzNjqDrejm34hfuBYhkbd1Gk4W0oM2wE4xNVUplftMousPUFivHdoxs0hEFVLuT6+sUz3gFT8/4ot5Gp1Etyof0u5N5TTsr5pR1DQNfZu32vNcBdEztbtHqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737670067; c=relaxed/simple;
	bh=53/KKmcB5i82lSmGpzWEC6Vw5eDmDgl5T9CnsbRDPbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6LxqPCNaTqs5OLdYl07zNw7tO9m0v2ywH3lEZYuDJYiaYiCf0YG3JugZBegfP2zPeJ7sNPaB7GYfE+iJ4aqcC2c/h70f7qfRfrjDmpmpkUhWWlOmVTESECT7a2yw1Np/vjsrPVTSIYrlTpzGVE4mXPRkpof83gaIs7xInjY3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hD/YxVkW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hD/YxVkW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-540215984f0so1554522e87.1;
        Thu, 23 Jan 2025 14:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737670064; x=1738274864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+r8z99b3FJMALiOYIFO8WFLsHfrM3KZGhhDJDWAbMY=;
        b=hD/YxVkWInwVUAjivTi7Fs6wgMt0lRaEyqCNYPHQidUBFcW8cZnRKdVVYo/IuuEBYp
         T4pfvggqLkoEkoGDgNNbUyhlulgdlKcfCtkXN7aBGy7GlqASfo64fA3QgNSmov+usj+R
         JbiijpaAjvFMNSB52/SdQ0YXbtpl4x/b0UWFDFKR68+9H/f1llP6H0zsJ5/JaKyPbk2L
         les8sZxpHLM+FM78hqy1gSQwBBLz30LJMUChpnZBiZexkU7eOG2VA0AiBxiL6d37WcPK
         RzUIbcMdChtcZxLINuWB4g0h0ghs8poGplksAhSLgrbw8rDrOq+nYMz6enPjthqk3NCB
         hFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737670064; x=1738274864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+r8z99b3FJMALiOYIFO8WFLsHfrM3KZGhhDJDWAbMY=;
        b=mzt9l7tcQl6qbBRcMcvR5SkW6KDcaIu+qbaWamqHJopD8xzOMs5fCbkT6S09rQwr3r
         QGSQdeimVltdr1x+hubPg3NC3OFIF1DGrD9RDnyk3HgNGA3MJMHRMjjmL4gKR9ZjVJg0
         frw2l/GoZlTKk2SdHYIXstzkcbdrWjE48OAn2HiPt23yrMEsjTXxg3gwzkiNYaPBFIde
         zFNY+ev8BZqO9M251b95VW+PAFuX70mEMJsYbq5G24w2YoB1riF0ieURwDaqVZVAMUgy
         tb6LQzse2SdkJbT4TD19sg0D+304cuTJTmQlZUFriTCEPwDjk218upPiWxFKD5Hf9ok2
         aHcg==
X-Forwarded-Encrypted: i=1; AJvYcCUJHZSy6OD/QMDbGMwyVFxDO0vFarxkC+6+tW2yFWeqMf7fr87xmCLap+w0Bm07gFeXS04rhZ3lXmUlmkY=@vger.kernel.org, AJvYcCUX0eOy6NzOpWOMO5jASUw4MdqiAZYPGfHhGMbKr0pt2jJa7XldJpI5eFVG/nPCcexmcdu5CaVjHUlCtq8hPTI3ElmZtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2di5GQI88AbtSZ6fArKIMTX442Xon97QTL9XWm+a9KppFdxat
	AxeA8wmb59DkohZqGFOdiooEqM3M1sp7IREYaD9f7KaeguJaGOLW
X-Gm-Gg: ASbGnctzOquUWmSHcENr6Tua+7GyIWR0jyBqEPIdh3Epsb90uQbZCtK8Q40IB5Rvgge
	X0YlDoTnDeVL1lfVSmg13Okx6AN9WwmdXmpxdL9TZFGYw1FLvg+y6ISsIm0xOYk6AnemIhn0p/w
	0AQdTeAdMVCHf3klfyxVhR06nHHVJ7Itkh1dxP8uYO5KacNhg9gqMck+ybZ5cMBDOXjyujatSUM
	xEMF7R2tCfl2uFgUQA+ZdjNe1fwRUaBibKMzTLauSMVQVRd9Dk8X4JpGHer/p4qHxnboteB08Gi
	Xzg0Ku7AoZITu+4TKJPNs0OdHk3bY2GHLz8DL2g=
X-Google-Smtp-Source: AGHT+IFwKXmwzwDz8Y/ODbudrx8R2bzSbl8ZqzaCr5LjQ58zVeOxll8NpPH0Lfa1jHVOX31O2lcO6g==
X-Received: by 2002:ac2:5dce:0:b0:543:9a5c:1914 with SMTP id 2adb3069b0e04-5439c22d87amr8626228e87.4.1737670063442;
        Thu, 23 Jan 2025 14:07:43 -0800 (PST)
Received: from localhost.localdomain ([185.201.30.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836856asm61013e87.134.2025.01.23.14.07.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 14:07:42 -0800 (PST)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
Date: Fri, 24 Jan 2025 01:07:39 +0300
Message-ID: <20250123220739.68087-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pmc_core_ltr_show(), promote 'val' to 'u64' to avoid possible integer
overflow. Values (10 bit) are multiplied by the scale, the result of
expression is in a range from 1 to 34,326,183,936 which is bigger then
UINT32_MAX. Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
---
v1 -> v2: 'val' variable declared as 'u64' instead of type casting
at usage points

 drivers/platform/x86/intel/pmc/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 10f04b944117..1ee0fb5f8250 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -626,8 +626,8 @@ static u32 convert_ltr_scale(u32 val)
 static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	u64 decoded_snoop_ltr, decoded_non_snoop_ltr;
-	u32 ltr_raw_data, scale, val;
+	u64 decoded_snoop_ltr, decoded_non_snoop_ltr, val;
+	u32 ltr_raw_data, scale;
 	u16 snoop_ltr, nonsnoop_ltr;
 	unsigned int i, index, ltr_index = 0;
 
-- 
2.47.1

