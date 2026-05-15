Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796AE36403D
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823751; cv=none; b=qY6GWaApMnk/iFHK5++X+tTVKm4TiOpgOHpGxPYzWgiwKwo4hk4i57UzBmexyzEJvRMN8L2fd9ir+kLz43qlsy2XPQPWuJAtVfXq9bGKJ7oq0JA3CmaX50ccdNHfquixHwurXUpE6v6EHdVKiIGo3a87F/mUkHTH28VEgv88wfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823751; c=relaxed/simple;
	bh=aVdFf5OymMVSZ4KFTnooyC2hd0qHH4hvBzmghV4dLpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvTnqrUNI7DuqXq1kbs7kxPXo2EPJoDt5VlzjmI3nEjRbJtOshfDhK/dyVb2xHzGiM/IzzxNdBbU0y10kBqL3H5fnp3oC1lUM4bnyrdZoA1JA3iCcw8FVsm93B+IvC760iUPtTf+l4Ys5NaDYXU4GH4AkBqBBwk1wA44rCvR82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4zjnFXG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4zjnFXG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so4034854b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823750; x=1779428550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=P4zjnFXGHsF/eBNiA1ijEPqz/NFATd7mTH554p4nTpVHGlaiIPzSNPOmme5yz7k36/
         DpR+N6STAkUWLTeCPyD/lw6+zaxnuRujKlOW9C/Mkk8GC2CGSCTTQEQ97eSY2tQcYWUJ
         ZQnYF1HtCwdD2QRW8eNCHv0gDugHAcmUGi7FOAPubXii4tDsSTxtzhEPxtSKK8YwhQhg
         ZgvtVdaNIo61i+GjMueX74rfcfVleUAT6JuR7FrXQd4MMDwJDhQ4Ghn3AN4a+drWzJdB
         mPQ9mL55ufgPy3oqpt688fTl8gcE0PnrU8Fm/9F3nkoe7CQ5j4byS8klEGelMiWokk3w
         Gvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823750; x=1779428550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=FJGgxIh/jFZOW1uTO1d4sGzXAVHSAILh2+zcObIr4+qYeLp09rq1VVVZjGp1hFcg/S
         TxiZvadq6DF58IAoSw13usqBZuffdmH0pPwgyys++Q7ZNfW3g2z+9CX6v0UdCigrDxDc
         JbVpW7y26oboogjU2eK3a39rHow8xak3nZDlD3Zvv2/auXjEs3H0BNbnlGb2zIwoRgmx
         i8sH7v2x7vCqW2aYySpSQvR+jJtRwRBXZ5ORAcNXPtzkw9okH9rHpcpOsNILNKjso18w
         VWXb889NqQpoVMRXE6bYaHalLuawy4z0s7D33EuT3q4KTo1xv3kBRI/ah1Ka/j3muAly
         9GMw==
X-Forwarded-Encrypted: i=1; AFNElJ/fpe8a8l/4Vo3TxuNSxksWd8kTXKi4p0VJXt9TVd//eXXU/jz2ZhAHc7QiHA3Q6OjNAhGKZNO0/ee41o7TcoIHqzdv@vger.kernel.org
X-Gm-Message-State: AOJu0YxCZNwpZzfjCBlba0XsaJBokRUw8idb237/XI3inW4ITaXAWlmH
	W0rDdAu6OWNFX35JtX7ucASvKLf7rN1yiv7Lg2uK2PFfoILU0VZi9TiD
X-Gm-Gg: Acq92OGzlSo4knqQPWNsKUHf2N6YAE71y5EzRA/lvt1ukwUMUJ5yL6736hXXOrnSR9Q
	jhzbc9566k7lxO03b+eSQrvk5ddWrRKAT/zbeqXlyMukLEOK6qQCirQxTBLWaXPLeBddaMkS1J+
	V4UrfaawwnNIl1204sreEX9hfjt2EjxAXwOqoaNmgjN9nOSp98MRPmwBhx9k/VSjyOc5F/E9J+q
	UZxQrvtIcCcF9GjpWsgUf0WfrWKIef0lpNDszxxVYLn+fZKtqEgT7n1+169Vkq7Na9FOW2gRTUm
	NktjSCfQv+6la1TEJY8Z1AeH3PvnGYo1h33Mxn/PL/pWSToUMyqWhuyeZ+NRBntM9AssCRCvTMO
	bLw+wJkutWfO2JzZTcmpKSI0P6Dz48fXkzFFc8tRM83q6/c6W0W7Vmct4OnIdjBz2OXHRDnb5Xc
	xO31IQ637nPUB+7Pu2AIYvgCLZ22JlGulEkdfnRxVRigvrQJC2MkJ6pUQmjSJZJpkQ/v+i0agwW
	q84k+O/3ENN2maZFpHz5FCxIng=
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr2723997b3a.29.1778823749726;
        Thu, 14 May 2026 22:42:29 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:29 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
Date: Fri, 15 May 2026 15:41:46 +1000
Message-ID: <e54aa6c1e190b0e26d58504c5ea1b05fd09d64d3.1778822464.git.harrison.vanderbyl@gmail.com>
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

Document the compatible string for the Microsoft Surface Pro
12-inch, 1st Edition with Snapdragon, based on the Qualcomm X1P42100
SoC.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..aaa9a129908a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,10 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - const: microsoft,surface-pro-12in
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - qcom,purwa-iot-evk
-- 
2.53.0

