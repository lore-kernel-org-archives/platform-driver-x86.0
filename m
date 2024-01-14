Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842512900
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXkyyldS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-559414622c9so223605a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 08:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705251197; x=1705855997; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3qWAAOZBPVxBCEmxCyNo6guY2tQ4OipTOJ0NEYFWNs=;
        b=SXkyyldSHtz1wew9Fj7GafrHxKKtjV+sOR45tMPgkylKKa3CNM3vcopJcTQrt8Grxm
         HokTNtKNicknq60dEOZ4ueWo2A2nknOchhxi5tERq3qnYOkBGpIX0zheGB2TmCDJAXBM
         52FijAGp8MSU9DhW8XL1MSDkyyzPm5R5SmH7RmC6KN03rVo7NdmsD/pedudyaUIszz1k
         ttRQKOMthDaUTig34fjKQ6BLRKdF7kjaWCMAs01FqDH/lZ07OSAPc6YTuwD4qx12f1h3
         E+oV2JiE4ACGZ7jZgt9jV+LRA7oUaILTfvhpLIw0AtGIhCmRKAsERMLOxEhJb0d2dSKY
         4nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705251197; x=1705855997;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3qWAAOZBPVxBCEmxCyNo6guY2tQ4OipTOJ0NEYFWNs=;
        b=ulrfzh1QWAzQixuJ+ESE9Ytfe/yjVKHfkP9Tk4sRj7M2JyRK1ZF/Fjn7dgZBo2zEyo
         QYU13EVDiQJDp8XRMuvZzkNR6uGg4Jf/UhoymlxGLlqaPe/ve24ZcyWQUZLuB5gwQ1xq
         bT4f9RNFwenhrasqta5n+u0ihDIGPthrzPlYsMkr3Ww+5m+7Z3aCCxPFa6JtARUHPkDh
         5K5TCZIyyPAnZlYr9URfQ5ReVONL8dI8s0AV1wu48iIZfci7Gw1U/B177gC1bGXtB8ib
         PBL6Jse6QyijRcsES4mtmd0BSI/bxPRmzpQfkSTRiwrrt0ezQ4dt6zN9jAw9kzzMt6t2
         coZA==
X-Gm-Message-State: AOJu0YzXpa1oS5tkSmOwMD51EvCQzbSXSGrDq+igakDktL2FtKrXtXv7
	lupU0aOJnTyjw4tR330pjN2mYbqFjwc=
X-Google-Smtp-Source: AGHT+IGeDeDwDaYTowHickJ0PbZmooMyhuR2GbR/xw5S2Sl8/AfYhqng6ZBHKW1AS/fuAFaBlZ47dw==
X-Received: by 2002:a17:906:a0d2:b0:a2d:60c5:f18f with SMTP id bh18-20020a170906a0d200b00a2d60c5f18fmr766169ejb.149.1705251196487;
        Sun, 14 Jan 2024 08:53:16 -0800 (PST)
Received: from ?IPV6:2a01:c22:73ca:7c00:6976:809d:3eab:4a9? (dynamic-2a01-0c22-73ca-7c00-6976-809d-3eab-04a9.c22.pool.telefonica.de. [2a01:c22:73ca:7c00:6976:809d:3eab:4a9])
        by smtp.googlemail.com with ESMTPSA id wb3-20020a170907d50300b00a2cc6398083sm3173441ejc.10.2024.01.14.08.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 08:53:16 -0800 (PST)
Message-ID: <c9757d0a-2046-464b-93e1-a2d9ab0ce36b@gmail.com>
Date: Sun, 14 Jan 2024 17:53:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] MAINTAINERS: Remove Perry Yuan as DELL WMI HARDWARE PRIVACY
 SUPPORT maintainer
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Recent mails to his Dell address bounced with "user unknown".
So remove him as maintainer.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcacd665f..8f6b09a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5954,7 +5954,6 @@ S:	Maintained
 F:	drivers/platform/x86/dell/dell-wmi-descriptor.c
 
 DELL WMI HARDWARE PRIVACY SUPPORT
-M:	Perry Yuan <Perry.Yuan@dell.com>
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-- 
2.43.0

