Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138B013AA2D
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804239; cv=none; b=M+J1xczlPIZDyKrmmFG1QEmJ42/oL4fes5gL/CXlrEa/jmsNx9g1ZVoZSF3Uy2nw5TT9u1K43nO2j+YgsVU3Z1A1LUQwtQe/FznxTcGjAbSd3BT26ESzhcNECVrfOWgALn4HTznBA/A75oUiFY5PMnwain4iNt+6j1yQNXUJEYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804239; c=relaxed/simple;
	bh=QYDBAT8W2DyzVhVIByuwRqL76E8SqW91TF9Y1jLyJZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaQlPwjNpnhttWxWxLeaO9AzCCXQDCvNnofUQc30+vn6AnZtybCFLPiSuDiV97Cy1kbMcNjoetAQpi4h+l6We2Tkb/QKbJFdwbmgAypmAxaOS8aQOa4Y/TAU7ENB/CaOCYbiRs6dQgjfqfu8w1hnvwQXloEEz/OVP1hilpxxDpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXIH7mSL; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXIH7mSL"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e73359b979so80518041fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716804235; x=1717409035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnDVrdRG/chiFifTcD1+nCXwPqU6LkEDp4HNdQa6uM0=;
        b=wXIH7mSL/XmH+YPzNWBxE99T+C+RoGGGxEG5h7YAPJ1STFD/Z2cJzVxOpROJupxYO6
         okO0W1YuZv/SRzfnS5g8m84GG4fbm0i85OmF5fJ0/ocG+aE1a9Dc6Q//b0M71YxBQoPv
         nCgguVBcXmnxGS56nBZsnWdYo54pLC/yIG0Oe6vCbnMniHK7eCh6n4CeXe0IuyMXteiT
         owiAWXfU5+kp32FLeiA+36A0eYm5pr/Q3Z6+7aQ4xvaYDGmKB1HH90W0/sOf6oJ88eyG
         5LMvBOOpmZms19no/9UteHjxZB9U8Ze6b3l1qVAWIUhwYmCX2SPv3ZyREdoZ26eQX2fg
         Wamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716804235; x=1717409035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnDVrdRG/chiFifTcD1+nCXwPqU6LkEDp4HNdQa6uM0=;
        b=loNAMqYfMUOlX04tl2/AgcupUvSGX1+0g5mC/0y1U7Hsvjx2VZWcCFyB3oU2BHGstt
         OC0Df3QdnJmSkKc9/GnESZUy84JRWLhtec7yHO+mlHHrZK/hQx2YOs2ifEq9bemXnZaq
         qCfxoZcLNeZwkUyp8ahofLcsioa7FJwMH/27XIj4aSnW6NgnGogzI6W62ypheFnJwQGv
         +E0pEhBsHNRtK9Per8VPjdLeI1AvGxzfo05fp0u4FU59aIFX7zwHPEZrdWx9WxZMRwVk
         Z8vMmL8ip0wgzVB0k7vZnpilExPlNXyLzL0ybsFZcRpsAvAITm97e0G00OylnZIJYvJ3
         Eqsg==
X-Forwarded-Encrypted: i=1; AJvYcCWfTNZFsVlqKgU+iElDca4U6QkqokOHcDoEDluzogBLEEkj/N1xxmvkK39DGAlgk1Y+lQjyEdYGLTHHnvXVZdmckqPAggg8QH9Qnt+u+QGfp78Waw==
X-Gm-Message-State: AOJu0Yyr/lFsButt+jwEkhQSxJd721hvBo6C6EMVX7vORo8A1ZerefMp
	KZHWDghKzjIRKJ0BXKkYTmGBTQC/L/7P9yB/HDFjp+kaf10dbXVWfLzhJwb7Ghk=
X-Google-Smtp-Source: AGHT+IHpI/o9+bhRtX0LMQMLR2K0frg/PS4MHmtIo/gdmz/GGyxgF/nHx/vxc8A09bGVfULtmHDkQg==
X-Received: by 2002:a2e:7c16:0:b0:2e0:1a40:6ff1 with SMTP id 38308e7fff4ca-2e95b03f295mr55774171fa.6.1716804235347;
        Mon, 27 May 2024 03:03:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4bdfsm18616651fa.63.2024.05.27.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:03:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 13:03:50 +0300
Subject: [PATCH v3 5/6] arm64: dts: qcom: sdm845: describe connections of
 USB/DP port
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-yoga-ec-driver-v3-5-327a9851dad5@linaro.org>
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
In-Reply-To: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QYDBAT8W2DyzVhVIByuwRqL76E8SqW91TF9Y1jLyJZg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVFqG5F1GyD2Dudm3jDFmSHyOQA82/0BTxIfh7
 J39EEjBQjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlRahgAKCRCLPIo+Aiko
 1cCqCACKJO4l58DjOGCzKkok4fOcU42RSJC+jknT/QqzzkgQeHzhN98x+pzmyct2T/4M0hTtlY4
 qknNvb1WJ5l6GxTnQdTnoe1d7ZZOi/cdJf5WwGMd77/bWZJUaJ88MEB34HIOHmPgVQG83xID46f
 3uUEGr5xrp74VNcOeH288WrLVKOTUiaPL4QAloj39wosAmr16xyGqo3NR4iKW/VRqBMpzspBm7t
 q9IvcUDHA4EPQ0l3LXo7y3HdN1CZc3uc7yeI3zTW+Pj3R+TQYg6LuHqbU8Z0n4jvurhXNdRvF4E
 HkSvf6CHzJEFQEwvi65ZUSWEI+pScN8BXLMSlTBPv5x7DAMp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe links between the first USB3 host and the DisplayPort that is
routed to the same pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 10de2bd46ffc..745518e3ded3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4028,6 +4028,35 @@ usb_1_qmpphy: phy@88e8000 {
 
 			#clock-cells = <1>;
 			#phy-cells = <1>;
+			orientation-switch;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&dp_out>;
+					};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -4108,6 +4137,26 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
@@ -4598,7 +4647,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						dp_out: endpoint { };
+						dp_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.39.2

