Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD36C2BB3F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 23:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjKTXSJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 18:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjKTXSH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 18:18:07 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE461E7
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 15:18:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so2393871e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 15:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700522281; x=1701127081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yRltIxaSGonkHk709wNhnMOnmu28WhSy5thJNygUYU=;
        b=IQQt0Zv2bwdEOXrSJevG+hwyn4s7Fis2UUAVNvK2bDT3wTVzJ9U/t13uVpkIGJQ8xI
         H4DZzy5poah2x2UW9PUBTqSedJqYNIfXf431BgcTtIRRtfAYjdgw07YlP+5KFgXFHNRT
         gtqBefFnrCoOeF+leB2m0LlnDX4mRhrsP6SOrUt0UUYA+5pXXC6IPTxs3rPweEQiJpAb
         cqLC02iH/sTTQYOD5ulE9nTKImqo36A4RXknvCzKnzku1noVJ2ZRJVuEZMyCQxTAq6Sl
         qlU/MSq4VTEoylegzVG/4rcZ49DWxvl1Xc8tus0zSjxENlbfuVhqWr5XbhS14e5JVAqy
         ijug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700522281; x=1701127081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yRltIxaSGonkHk709wNhnMOnmu28WhSy5thJNygUYU=;
        b=hOjMoJIo40mY3d52VZnL7qXFMv2oZpsMMNCYwDEr5fESU7Wfe12VA5tEZJE/jnFD6O
         KywsgYSyjGebrPja2WiTgM/Vj5heNrtfez8LUM1QRtiKmgVtWgt6VpzkXfDRoHnRx+6d
         2cvf/ZuHen0OOPfpSZ3nOS71aQ8XDeEsW/fVssPbKNMyzfhOUQ6wRIYVP22JbWO1+NwC
         NY9mbwQf3UGb2KkC0V+if8mIu3Rf087D3QihcElGz4Z7gmLInhdWuuQg68MkewW69MB8
         b5hkWWnX0PRra+YY6Igw2N+T0DEWN0YcNQRJGJBXhMDyHUWX3RE+6leOGMCCnttClH73
         MmJA==
X-Gm-Message-State: AOJu0YzUbiPQAJIVHWdFHCdR4ncSzJSZGMDIA2T9Hluwiix0UiBpeeyb
        8gfhHs1SZp4Ka/CwbnCavy9ZRg==
X-Google-Smtp-Source: AGHT+IE9L3VORyelf3Xks/jkQXQB478z0uVWNtaRVh9TqFZzCytSJ0a6JWGb/Zwah6hyHzQMJ/8ztQ==
X-Received: by 2002:ac2:4db3:0:b0:507:b1f8:7895 with SMTP id h19-20020ac24db3000000b00507b1f87895mr5887579lfe.38.1700522280876;
        Mon, 20 Nov 2023 15:18:00 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id bi32-20020a0565120ea000b0050aab042c7csm677036lfb.190.2023.11.20.15.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 15:18:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: tcpm: Parse Accessory Mode information
Date:   Tue, 21 Nov 2023 01:11:08 +0200
Message-ID: <20231120231757.2309482-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120231757.2309482-1-dmitry.baryshkov@linaro.org>
References: <20231120231757.2309482-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the boards supported by the TCPM drivers can support USB-C
Accessory Modes (Analog Audio, Debug). Parse information about supported
modes from the device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..6297f803de53 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6114,6 +6114,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 {
 	const char *opmode_str;
 	int ret;
+	int mode;
 	u32 mw, frs_current;
 
 	if (!fwnode)
@@ -6132,6 +6133,12 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	if (ret < 0)
 		return ret;
 
+	if (fwnode_property_read_bool(fwnode, "accessory-mode-audio"))
+		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_AUDIO;
+
+	if (fwnode_property_read_bool(fwnode, "accessory-mode-debug"))
+		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_DEBUG;
+
 	port->port_type = port->typec_caps.type;
 	port->pd_supported = !fwnode_property_read_bool(fwnode, "pd-disable");
 
-- 
2.42.0

