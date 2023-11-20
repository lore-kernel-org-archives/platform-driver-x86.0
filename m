Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16CAC2BB3F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 23:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjKTXSG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 18:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjKTXSF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 18:18:05 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A73BC
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 15:18:00 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 2adb3069b0e04-507973f3b65so6954266e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700522279; x=1701127079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADt8pzOsXpdfsf1HgObr0YIdUIhge4egXUaCPmB+CDg=;
        b=lacxF1LqvkmCPwO3lglQAtKCn9yNCdUD/JOLG8Qsi89G6n0vvKI99Ra/MxAcY4tMgV
         EhIxacTXDIgZ953eFf7R2zkvmxyTiQIYZ3UWOIAXyY9RQLjq6lXs8qhYsqZxJuudO1GM
         s8dfj4l17iPq+md0ByXM5G7jSqeZxODcD28p4zZat/2LFpxvm3CxFQCI1vXZ+ALfMhtP
         aFO41pjKLuXVs6IZqRL4xoxzX9+TsEF2aWUl4jFP6w7JpPHCxMHVaazT5lRQsF43z23S
         sh5EYlxKCWOsgWNLXRK3t2b9+nksOZTdbMRxC0xz6clI9k/ohzbyxOtl03l0m9R5jwDs
         h4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700522279; x=1701127079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADt8pzOsXpdfsf1HgObr0YIdUIhge4egXUaCPmB+CDg=;
        b=WdHmDxjNobZ+UfOmX0qmvevj7H5dclhmuVY7zywl0kHXS2OlbI/2eym/A6lizYZqBv
         fqghP4QRMKAVr5PZTAX12C2kzLlHn4w3AjNOiiO24z3R6J/wrrApl3pWUtkAVA9Tqe1w
         o8V24CZF9ol/Y8XbYZBxHY/XYywUBIGKdZvsXiZrhWJ4n3t5dC4ejw+N+SBkqt7hDgfd
         d9M5kaSsWz56y9dElXpD8QQYa75tqkd2SmGDn31hYrGTbjEg0BljDhiOF4Xb3uQmG+n0
         hmAVHg0tDDFBSmA5UR22ubCUu6TOKRraDwVeLTy0+1/dZ0vshcqF1f/SQSo/RQF2KcIv
         Kq6Q==
X-Gm-Message-State: AOJu0YyBP3AFsb0Zx4JO62X/EQyuIRgCEX1JGfveuO3LNhDElGiSbwb4
        eZZHvNId3z+E0xoDqAPyYdiy7Q==
X-Google-Smtp-Source: AGHT+IF9nbnnlfFuWTc+kca9xlA0YRyUIqjfnoareDqrnufygavYMGGnBbf+MK5jzMXQplQJTEzWKQ==
X-Received: by 2002:a19:7109:0:b0:509:494d:c3d5 with SMTP id m9-20020a197109000000b00509494dc3d5mr5445896lfc.26.1700522279090;
        Mon, 20 Nov 2023 15:17:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id bi32-20020a0565120ea000b0050aab042c7csm677036lfb.190.2023.11.20.15.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 15:17:58 -0800 (PST)
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
Subject: [PATCH 0/2] usb: typec: tcpm: Handle Accessory Modes
Date:   Tue, 21 Nov 2023 01:11:06 +0200
Message-ID: <20231120231757.2309482-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In addition to Alternative Modes (see [1]), some of the TCPM-backed
boards (e.g. Qualcomm SM8150-HDK) can support USB-C Accessory Modes
(e.g. the Analog Audio). Add bindings and driver support for parsing
this kind of information.

Note, while it might make sense to put accessory-mode-audio and -debug
handling to typec_get_fw_cap(), I decided against it. Several existing
drivers use this function, while providing AccMode caps based on some
internal logic.

[1] https://lore.kernel.org/linux-usb/20231120224919.2293730-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (2):
  dt-bindings: connector: usb: add accessory mode description
  usb: typec: tcpm: Parse Accessory Mode information

 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                        |  7 +++++++
 2 files changed, 19 insertions(+)

-- 
2.42.0

