Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44CB3630A3
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823760; cv=none; b=LHIL5irQUW2MIj7zZ47wW3BM5WXxQKIF1tF3Y/3XwFRYALVaf48g19eyaIe+XENpcMMxIYPA6QJxPiFohXhZLYC8C4jmbQ8IXtC7cF7SN6/+fF0S092PHjmFPcHqlLO/o3UXxcCrFUH7hVhKEuEc5PPoKDyqWJEFHRd8b2Lj7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823760; c=relaxed/simple;
	bh=Uj71YxMd7CP0/+rQajvUXPXNAzpKdvAdtZ6sztvIkfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxFPGwEP1x3PJupjBFBIDzQssgbBMPB9trE18Ata6B1o30jm4xFfjC46XIbkT52OiNQyv7uiA/3OxGrHa/vdvSw3lyo1HI/oPv29kgRm0BaigxzTAHQRL2UxCWT6v9H3ThO+S/37sc2xdfp1cQDxn7rMUBO3wRAQXt4LOGvB4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyccnjCo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyccnjCo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8173b2af32so6463327a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823758; x=1779428558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=TyccnjCo4ObKyoBHeWWN0uDjXxbjeo7qEUhVMUXhuS7N342JBrsNaAwA6mG4BKLzrh
         UA0AhBDlvKPTZjGeXFIDUICBZAZDDruCD2uwsXsu1DORDIc+JFtsbJQjBHa8dexqap5T
         VRR/a+jCOwc+UdR3L3UoZG0S6XUllwzUzZMf4JNQMI9sdXgC3czHojU2H88VS1q8xDTu
         2Cc4XuQ//QpXgsitNSPiIWbiejqkjMtwywab7QK5HFHGQyZRfAT5MOLAD+pXaMfGL1jM
         LF1COegvVw6wAZ79+jkDrg1T89TgLx5V8aaHuk9WTJHLUNAlDQM4NzGJzoWapa6MN13M
         T/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823758; x=1779428558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=EDNXnd/0xWm1EUdD5Tl1RQf1t1EDusB0ygcCaH7w6wRQDhTo7RuT7BdY3KgnxmlSvR
         7ki+FFIDZr5frfNjNUVuWtIzh1wTDksnBUcsII6YPtLXQOxexQbkQknVuQCTztMDR5EQ
         Sav2tArWk8RDfDt7XW04214D8vzCQMF1481gLqBnFEM+RSSNVUia9vL7C8Fra9ngBRte
         a0xhdn5YgrVDYfsOJz3DaAR+Rs/ekKFT7USxdQY/9sI3Em+hF5sSQFzLYljAHBWWK5ZL
         +oAver9hsrc4dxDliUfhTtjPCECVo5x4eqTqXUEj0AvE1gguK0xd0tw1Y31gZ29UEhyb
         vPZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GaEFc8ScU1H6gDe96bZ6/dvJYk9tDH/U1EXKknSt+eLWAaI5d5vr9KGmTNVbQdP6HVJb5Bbkepe+j0TXl32TvoJMm@vger.kernel.org
X-Gm-Message-State: AOJu0YysXJPqwjkP6C/dNCg98/nhl3Xdkuk6o+w22rzQORdcBOm+ePxl
	DkRbBFba5lGwttQQwRzx1Q6CPBGpZo7luThVDkoLfSVARxz5kzdwDigs
X-Gm-Gg: Acq92OHAkbM8W/a8h8bt8I/SBWbdAV61Dm3raitIQKHRq8AO9zJDsjMUKG6Uo3jWTVG
	GzIM3KU0dHMfDBqOclJnfkwnqQaFIzdQIOL9D39hRWcZnp9EB2dh8tJnprcTqJLGrJizL2YMmLX
	DSxvvqJ3mSLcHVRsYbTNIT/EeIyH1hRfWFI6vsFlvK1Hew+GbclED8t7NIz84G940MSAwK4lh7x
	P0GFF+aXoh6HXafb6vX3dkR2JYg2Ht4VupaMY/P9GUSNoJdd2+Ib6JML1xiLUknqmwN954XovTf
	gHM2a6vo0jya2908ivBECXuF6PcJrAsms2H+8uS0hGF54iQIKCqyBlx9QHm73lgKc0Q35c0x161
	FdmwBFtpJJ5w/xesklNNEEWmvX0N1aFZhPPaWUYlJzdj+9TT9fdh34jCC3TdaXs8GkCcyIWHLOJ
	9x81/k2QxZ0495xPKZgRJU7KzqxtQ8tPbLMyvNcmhiMwBbUQusVOp/1qpx0Xhh6oJnIO3tJclIc
	pq6o8ga5T7UFJMmYS8fL6vK3Dw=
X-Received: by 2002:a05:6a00:400a:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83f33d96b70mr2736897b3a.30.1778823758064;
        Thu, 14 May 2026 22:42:38 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:37 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: crypto: Add x1e80100 inline crypto
Date: Fri, 15 May 2026 15:41:47 +1000
Message-ID: <14cd42e3d3af4b2591c9dd8dffde11ef18666751.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibility string for the x1e80100/x1p42100
inline crypto engine.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..a338c4a33e98 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:
-- 
2.53.0

