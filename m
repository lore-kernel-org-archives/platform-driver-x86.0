Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221388;
	b=3vDehI4451X0EuaFHOdB8jHvxVmeO5rAcBRMkz/g+pLiJ5I+eCamazPlGjNeoH59+39G
	 8AHMja69r0EFyFC1H2E0D5CKbTXYgtWbs8AvxWFckDrDRLiXZxNm3AiB5nRRnEykt5eoN
	 //ZDfHtUnNeECNL1GBJDDceGDshYWVV2nk/rjy6qndqK5jh7DWqxaQC0QXBTRH1aRcHuZ
	 RCnMgK9JRN/rBd4apTtjYnFfulubCD6FYb608idewdCNmv4FzAgXoW3JgAUcGW/6kUmYu
	 lHH4vZc+Dad/UrxWwYkGUoSPv0gCubqpdA4H75Kxrh88N4/67CS26sQuB++aq9KI95A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
	b=rGXP0fzeW34F2LzanOBXzw5eA2Dwjumk+suXEWSztPmnADayhZjff8JCWK7bM94mzlyy
	 eqEjbXKMa9u6PZ8KEsEx832vLQQFYnUDZiTTapts2XvXI6v1g4j9nnIgoQM07zYedarby
	 bWvheLiMOhG+u3QtulwIJbXETKhrqMyqKAfMRVB/ZrL4Ev6sFQVqYAXcor9+GwonFDh7/
	 7wHP8aLGy/LcXVs5MRH1H7K8F3RQR80czEp0QxpUwlbX9rSifuQGEfCyA8/+AScXQ7SIg
	 SP6Aj5bK8N39sPoSIW/6wFkQ5oZht5M8x6nz9a4TNv3WEtxlSTMt2KIrS6KWxBtLcfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F3F606A333
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F3F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so3714885ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221387; x=1794826187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=d3TITIqYEQy2nVPw2nwc3LQqZM4/kzPbuGM44hHPAGvIZFeNP1PUYtBhrYtiGZk2aD
         KAvRce1tF3JXHWqC9dHn7JRr6A4nfBgVAcIEZmrrEtB8JwfNzjNWCETv+AGtA2kJnlS+
         BV+1CPLQwcBl8vg7XDgD3/3aFJlaX892W9xWCtK8oDnivRGcOhOW8yvROkjqjdMITkgH
         BKqq5rDsiEuMwhq8/1EzAjSco3LUB2Nbf+dPtpxSTojqXN2BDmSQRyD8KXML4eOo62lM
         rHGW5+ZO5c3XG37HoOIIHZVD4kpUO8Bfjl9x8UEHpP+lXnTyKnggpXRmmshuqoa/54Cp
         rGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221387; x=1794826187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=EdYTRROIIw4nQf8l4fwNo2gMQW5V9l600hvuRYBJq6leJ3miuqXH5AV0mRSyKcgCP1
         xyzXnBEQaPGQF4lR6eLOU8RB2Hb79KcPngbUsbNeZV2LOqFcU0cRtty7CjTvai/O/nMl
         xgRb6kqU5ibOSoeBTJAwa4bHn0qFp0/p8ydEiW9dt7p6gykyqPbnD9TRdAYhHUKFQRIw
         MhsdK6cGFhoyTFDt4P24c33SWDod1ww7OWZIGa+xXABZAr/vYAnX8Gzi9HxjUfGW62YW
         EhBgTU/iyjEEZqD6YbFYsiL3pdhqMulKc0OhCS/V1SYWEePt1nisJ+6GTR+IU1JgvOP5
         JKIA==
X-Forwarded-Encrypted: i=1; AL+hErHgNCjFiMGuIkX2gyJw5eLaTg7dXzRtN1B6GWxt4QAlZ0m+X7pA92rRGBJWqYPO5XkFrGEBB1FcOojWbfPCSLYflPBC@vger.kernel.org
X-Gm-Message-State: APuU4Z+JLXu7KnfgyXHphVb549MXO9lNDO+BjEWmh8v4XJnI55UBX1VE
	l3tgwQ6JyCfln5aEbMs+XZyMeVd/xEpvUQTnemPx/iLeb7YblPklk1eJ
X-Gm-Gg: AYBFou09dTkBMmhDx7awV1tww0StlXaaFnvKqL7dp+QsCiFqcNQbmFUUMLcUlpmwVeM
	s1MKxSWCkh42bBFH9HsVcX/D+B9izmBfqknf21eqUelz+3ISmR8AlgV3yvQiWLK9PWMYHk7e90t
	eve4BFQ23kOqCI+eNWWKQSym3WxxMk1WU9uBA7wUMO834+IlqQM5iaa8GFdx4AN9QlEekJKYIcu
	pmQlquPlR8Hnln5dE9dpR5Tb8A2aLEd9klb1V68jlc3ArrjJqpEFyGke8/VNIhlDtYBsfqz5Af9
	u/1VVohpFhWpHYRpqTRxWZzeiJFxMFERlfwITgyN0xShCi81/FXIiez0g46p1DxLHxtw9dE/9s0
	C/eWoYvbgM4jgASSXvR9edtxDF4qqbA+V4+kEoh22RuWZVl7tLv69syECJuUJ0lg7dZz3EIkP70
	GSsIMAdF3ypHn+2TSZYcEwf3rm+fAiJKrjES9l+Q+ldN2vu5gOC6ZyfHtuKhqeCBjM6EQcvHiYS
	8kKM2mCAV8weVMIx2plPsnmA2hU6tPE821U8cTjCy2uN5RqLeHRNBB5hOJ+QNEP88ccSv4lsUws
	qjO5eNpJO635EmRf5TKSSigFZ3SFhmjG1n9VQyayeoHSA519DiYfoHfF0ASYaZnKU8g3Ivr9W4D
	6GFEqx56PMa0Tr/nLXb1mnpA76hELUgJJSBDHLbArYYMWRQTGHsaD2tYu7A0BUqVK3e0=
X-Received: by 2002:a17:903:2304:b0:2e4:cc75:2728 with SMTP id d9443c01a7336-2ed837a7559mr29304325ad.36.1794221386941;
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
Date: Mon,  9 Nov 2026 16:19:13 +0530
Message-ID: <20261109104914.1534-2-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261109104914.1534-1-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OmniBook 5 16 (Snapdragon X2) has an embedded controller on I2C
at address 0x76. It runs the fan and the keyboard backlight and reports
the fan speed and its thermistor temperatures.

Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
new file mode 100644
index 0000000000..be4c845067
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HP OmniBook 5 16 Embedded Controller
+
+maintainers:
+  - Rahul Pon <theflyingrahul@gmail.com>
+
+description:
+  The embedded controller of the HP OmniBook 5 16 (Snapdragon X2), on an
+  I2C bus. It runs the fan and the keyboard backlight and reports the fan
+  speed and its thermistor temperatures. Its four thermistors can serve
+  as thermal sensors, indexed 0 to 3.
+
+properties:
+  compatible:
+    const: hp,omnibook-5-16-bf1xxx-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "hp,omnibook-5-16-bf1xxx-ec";
+            reg = <0x76>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

