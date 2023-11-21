Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD465C61D85
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Nov 2023 20:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbjKUUac (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Nov 2023 15:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbjKUUaP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2023 15:30:15 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93341FE5
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 12:29:32 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50aa8c0af41so159767e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 12:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700598569; x=1701203369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6pUSylQ57QDAnOYu4uoAZWK5eAYHbB7ZTMJQDUS70M=;
        b=fCCR6+pbo1xyY31e4mJ4cQXLs2L4HGXuHsCeD8RpJ4hj4cwx1nXW4hRhytYk81PBda
         wfmGjdEilXAxS699atHxZIdWrI5R9sVkCOwQR1OrBdPFeFG+h6i7R1bJipwEl7VfJ94D
         YTFykVcMwgeGntOEeCSW0Ktil4bI0i0o4PCYJz2hOpv36I+JVbro64MVO2Gf2E1+chth
         rNf+Ri48jKkc+dfkZQL/JRg1wvo8meRfxNmEsig0u5h6OPs0DLUC164A7au+KP/3sZ1X
         D9H8i07ZhFb5uGbRkM06vTp0MyEeBrW4pzBmr8DmFwSWUooIynKUnfZTzPNsRzGcEEUd
         5ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598569; x=1701203369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6pUSylQ57QDAnOYu4uoAZWK5eAYHbB7ZTMJQDUS70M=;
        b=MXtACVPu+2/eZFIvVBP7euIQM6Ega+7wp+kApxevuXM9RwxAXyX5jyLM0ToMab6mlD
         5UliUeVZ8GF0PwC6QhEmtCZc5xtV1BkPkr1ncz389sC+3DKa9YGks7bONnqV5051OD94
         CCouSmI+l7SmOIjgRii6G58kNT/+H5rF9TRlRaWh/64WNc1zg5F0/3mPhv8diNu5hirK
         ZE4nFRZmu1/Y6QpnfaDoCOB53sNAIh422eaWz37fHerl1outRNzDmpVBGdHaple9J/MH
         V8nDggRaeVOGZvbshEoD8J8vntlHRdl4QXbx4wVaHeqVN8yLqrWuT8n0UhUT+TLp8479
         1lgw==
X-Gm-Message-State: AOJu0Yy2K+HVogqX/2YKipGzKVnfBLi22Hj2T+XR0PyRhHhWxJtVYeIK
        jN/CE2L0lb0w+bl95nX5KKn4mw==
X-Google-Smtp-Source: AGHT+IH0jTRQM5w+kYWIMAHKUNTpVDgqlCy01ePT/kCx57Ft4PfLmDfBxK5KunZbk5hReZpNqqabLA==
X-Received: by 2002:a05:6512:3708:b0:50a:6fb8:a0c0 with SMTP id z8-20020a056512370800b0050a6fb8a0c0mr114755lfr.19.1700598568810;
        Tue, 21 Nov 2023 12:29:28 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050ab6112af2sm286287lfs.65.2023.11.21.12.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:29:28 -0800 (PST)
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
Subject: [PATCH v2 2/2] usb: typec: tcpm: Parse Accessory Mode information
Date:   Tue, 21 Nov 2023 22:27:00 +0200
Message-ID: <20231121202925.2481471-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
References: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
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
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..ba2926846269 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6114,6 +6114,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 {
 	const char *opmode_str;
 	int ret;
+	int mode;
 	u32 mw, frs_current;
 
 	if (!fwnode)
@@ -6132,6 +6133,14 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	if (ret < 0)
 		return ret;
 
+	mode = 0;
+
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

