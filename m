Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349802CCA7
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527282; cv=none; b=dnB8S/xHNSpQY2mXDcgtjJ23vOVJmfmpdOYX/qoO6cfNjSCkGPzqRPZToyCmH55tID8xFotE/N1x9lWrQFSMiyI/cKic3nOFtzWStSp/9FgidEDLwctRWycsuCJI5GG+vBgr9vxUAHfAjC0/dIIVov53A0/MrqLUQzf8fgbd3+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527282; c=relaxed/simple;
	bh=J+RN3hJRTTGLVUedvZwunXC+U3v2nB/A62NUBTLgzc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jnijJ9Pal1b4ty3oxRFxYXdmmxJiJMO5ZzlHca5B1CF1MoweuiqltZQHBe28FwNlLy6px8NlKDVO0YOXQUZTX2WExv3xPqHU3xAQxYOCRi7C3HUoTmo06rfvmmrvVFCu6t+zggGZ/6qzlSeoQ7Su9/HrxuaWtT8qSkx/lgH+Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aKa6fjnv; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKa6fjnv"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56b8e4f38a2so8194649a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711527278; x=1712132078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGgUTwKlHME2QDnguByWBsbbg6zeHGMGTyqt6xg/ofo=;
        b=aKa6fjnvhABIv4eBDExxQ3VKmne7fLBmf53KFQcyd7lsjqvYXYrgQDVfePiVOJUP4O
         F0fTdORMqLkYzT8EHq+efyR2KVpXre/TpS04wc3fZA291/1b9+Ai/VgZhtZuvsnZ/sKt
         gcqN1zE61qywFBSIzs9q75l6pRBbbl4At87CxLB9wCX78mkMp1NyC0kxl7j8Y7v6WN7O
         hXAzzOUsrTP/mvYjI1utAxhSHz1FDjX7wieicq0+Kv3lfUSPOjR7gz/RzHwea8P6Tb8J
         S2NHIyKqictXYDXJHme8S950R74xdp38G3CrKcjEVvmC0mtofkzLoDI1q4ixL02HKktC
         zDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527278; x=1712132078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGgUTwKlHME2QDnguByWBsbbg6zeHGMGTyqt6xg/ofo=;
        b=Z0of+ZyQ5CVoTWjZHDQ2AgV9nPfJQ+aLEoW2qV/k2e59DsJv0TjGJft4aq4idXjqWB
         8V6yTYivCY9N4PcMcoWT1Mx8WzljJsplIuOBqUB+nXtxqnI3ARUa1XuN4AoPOeaKblTz
         7TcCfcsoNw8dK4iWU+mzYbbT3T72NYTMMUPKOD5yFCNCMw4nEzF2503xBgWVI84UApd+
         McY7ugWIQuwYRBviUP203PJZ459I+IAUcZlqCrMn/asTJ9zh68KG+1re0Rbe2Wwva7xc
         474PTZ+0yJ6Y+GlS8avCM+GiKegGaKeWeAXA6FlWdTiWHavStu35uRZHaGFAdejEUQfn
         ZZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVmzX0awuzytoDFT9zzqxI15INjrA4Oycdh4MtbQi7v8skfcnA2DsQuf6RE2XuuukkZJm1DSrqXVBfTGXlpdeE3GUvfitogQS128szbMjtT/TO58w==
X-Gm-Message-State: AOJu0Yxw87WeuVljO/Tsh2bEeb4XXfHyxbEz+ctKxZdh+s5/o5ua0BI1
	qcddlks7TvApJ7zmS5xQnqkWckNH99suuCD4HhqcGBO+Btyn2acHMjw5uZC8Mmg=
X-Google-Smtp-Source: AGHT+IF2WYb63mDp3YYRsu55oQqYhgUaP/nqOCYF9KAD2K6IRNfSBG5mnyYgPX2fUXSl5J4iimH1Rg==
X-Received: by 2002:a50:ccd6:0:b0:567:3ed0:47ec with SMTP id b22-20020a50ccd6000000b005673ed047ecmr2379022edj.23.1711527278609;
        Wed, 27 Mar 2024 01:14:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id ck5-20020a0564021c0500b0056c1bf78a3asm2386723edb.28.2024.03.27.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:14:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] platform/x86: MAINTAINERS: drop Daniel Oliveira Nascimento
Date: Wed, 27 Mar 2024 09:14:34 +0100
Message-Id: <20240327081434.306106-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emails to Daniel Oliveira Nascimento bounce:

  "550 5.1.1 The email account that you tried to reach does not exist."

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51d5a64a5a36..de17c0950d83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5207,7 +5207,6 @@ F:	lib/closure.c
 
 CMPC ACPI DRIVER
 M:	Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
-M:	Daniel Oliveira Nascimento <don@syst.com.br>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	drivers/platform/x86/classmate-laptop.c
-- 
2.34.1

