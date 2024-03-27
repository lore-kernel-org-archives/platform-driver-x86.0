Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71EE374DD
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525507; cv=none; b=MJhMCxqoHvXmIxWejN4QMWvvOCgWPSCznk4QhuXvKy1VjkbmX9rikd+6pyK9DzOIqJAKbrc8ZUFb5SaU5jwRuakbOX5ADuOY7PwZ7QXs/mgsoTEL/4EPJiaZWPRaFuBlAxbP0COg55nkRxOnadW8o4fExuckap7k5CuGYm29E3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525507; c=relaxed/simple;
	bh=NlwdekirFhEN97DvAhZtYwhl4leroAl3Df+vwGpT2Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWWUom65P+Zw1E4sJzDTys6bLrle9+NQ3nEchiEc4mlYAZ0MVojURN+TM0UpfwKupaLTsBG7NE4Ao/6QRNAK69lWvX/Iu/XrTqqexql2R6DLyOsd0bwgxwc7z34VEYhD5LRwAxP3SFqcdCXmVRfVOsYXSb8dfjG3JlAcXKJkJOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQFvPrV6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQFvPrV6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a474c4faf5eso398291766b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525504; x=1712130304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfQ/6ENUFYJM5krjoCLDppxsc8PEMInedWcrUE1sKcY=;
        b=ZQFvPrV6nfgTsuK4SVIz5rf1sWk+aLnUyHcUsCSx5VOHtcv9ebb87C9rQVmqsDHje3
         YoAZfcJSC3Pbp+5gG0Db38EtX/BfsvjOv4qkh7tSz0H8e/htZ5oBjo9+SXJ9hBe4JgTZ
         T1KUPK7y4ykf6E5Tuzb7bFruPFgLrLLTvPgnC3bV+3JpRIdK4raCCKLoCgcz88mShfoh
         nFpluLaxCZbxAXEP6ZRWjPHBskPzS+QFL0A4BMBJi4a51zo5mlDQx6pdYXfS4rSA0iAT
         9XPo4548ZMz3TvUpBOb2iVDQSl7+Xxo2MPNCepdFQN1jHZPeg+tClZ50PeoPPmf/4Wq+
         D2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525504; x=1712130304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfQ/6ENUFYJM5krjoCLDppxsc8PEMInedWcrUE1sKcY=;
        b=O9T8Gf6h2M237Lxt3UIGIM8mPmiHd5PF3rgEPIXJ/sWhAupXEivJnhrMhMeylqPyc1
         Kv9/SyCSkiTXW8Xq8xLAdIhUpcF8gyq1mKD9NwEXLaHAVC5BE8YQCG8sZzexVaUjaWvP
         noh5ifu7ooEr8UrFyW0uMUjVOOn9TuNKPn58HkFiyJ20+isHJnYY9JXSlSBuFum9Hdo/
         LHFNkEQOK2bhDVb9seBuzsjPoISbGv+cV9n2dkCTMDTPXXZrSQxA+axy0Fh0VgpfdaGe
         0X63HTPUisCvMFgN+46tjv0c8/G8Ma+igTeJc8hCkIdqFiZ/hVuKtS1Ug3dKJFXN8uvq
         bHAw==
X-Forwarded-Encrypted: i=1; AJvYcCWEfIXf85P40VBXQfml+dE6Gv4+RpvG0lIReCPaq30PskLF2VXF/qsMH5LMNVp+eP0+aB28uclUB7nQ9kg8cHFxSMfLn3zW8C63UxKROyxoFRCwQQ==
X-Gm-Message-State: AOJu0YxmLQ/chHx9PrDjyFbZzl1mvKpnjTgmbJ4bC4/qW0hjGoySPSxo
	6Ggdh1l9U8UOX4rK76lyHzjudJjESxNzdHP1gLTnZMe80DLiZHWtiTyHllzkmrk=
X-Google-Smtp-Source: AGHT+IGPmO1mR5K7ICS0f1Lp3U+jfd8w12HjLzszKos7oFjScLO+5cewTzANdyegGvzlnb+jKxPWkg==
X-Received: by 2002:a17:906:2412:b0:a46:5e1b:58a3 with SMTP id z18-20020a170906241200b00a465e1b58a3mr283499eja.35.1711525504116;
        Wed, 27 Mar 2024 00:45:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:51 +0100
Subject: [PATCH 04/19] platform: chrome: drop owner assignment
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-4-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NlwdekirFhEN97DvAhZtYwhl4leroAl3Df+vwGpT2Nk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85O5xLzwqpArWXpMJDqqxc+w1oRKGtJdnp4x
 96+fPjsasmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOTgAKCRDBN2bmhouD
 1wyXEACW/4L3DI2OlklYU6g0kokcqn89JQ/lXF2mafD3UrLqDTTk01O0yt01OjGhQ7NdwPZ343V
 VawU8RuciYfU6jB/44HF2Z10opR7W2Jo/EEE1BEC6O9xe1c0sZbaayTZjtx7eLFaEDeAlIj1S2Y
 rPJwJI6q68pCPzgKXi3tuHjCae9EhridvmfQoyLkZm4OR0XRGmaXJipj7197KivNOKKc2BOIyBX
 YkraKhjQkHI7BoAVla3WE2Jp1t3JPcrp780M7MtGw9+4Ls8t1COPnDhqLdyy05Px9zp+UXanDwW
 KoOqDYQZehMPTu8SzxctG1KQKTpSToaw661b6cVDqNE/NHn/33zSeNXSFeU4B1CE6zLzOUVJJ1S
 9J/euG0r3m0g0V2ZhCeNUZ/e7BOgH8qe6oHivfIjMgdgbx7JoeAgrzexxbVdvtX++gU6a3GWT5E
 QXNpoE2YeZLApzbpvZHj2TOIl++qvHChqLYSlYjAZXyxLwhuUmg1i+ES2GYmWa/IAaw2esQiE1w
 7Oj7IQJNfEwoj7aw1LV/jTvvlivZ0RP1hfQyhdf+DxO7862/4fo40FhjAKq3Yb4FrJsuImc+xql
 r0ctlGdBKWpFQFSLxKNQg8tpMnnT85q5WQMPtV+rIe9lUU04Zv3QAIoYUyYvc/wNFJlLR8tD6ru
 fKVay/tSUDsLtPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/platform/chrome/wilco_ec/event.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
index 13291fb4214e..ae34e81c5d18 100644
--- a/drivers/platform/chrome/wilco_ec/event.c
+++ b/drivers/platform/chrome/wilco_ec/event.c
@@ -523,7 +523,6 @@ static struct acpi_driver event_driver = {
 		.notify = event_device_notify,
 		.remove = event_device_remove,
 	},
-	.owner = THIS_MODULE,
 };
 
 static int __init event_module_init(void)

-- 
2.34.1

