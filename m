Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7226DC197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 22:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjKTWt2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 17:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjKTWt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 17:49:27 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9A2CF
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 14:49:23 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5098e423ba2so6869514e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 14:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520561; x=1701125361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SqPAnw0QpKcg0zC6uM3+YKsZ1Rv+zntSbyUGLhP8hE=;
        b=b3b9FYMulndAe7UFDMMRx1bRJ8lKGoutoLhUCrx8feNQL0BB+KrI9YNB8YOtjJZ4OP
         niLUXtIjy183SjsIV9OjMqRcCe2t23kIrygPlyFDH/FhIavLxO5wAwLehZB8QGGtib8V
         LT8TyKX0XNdUsrn8ogjLvhIM1n2Z98vU7SMgLPRjbppsQHJRD4tCpVj/no/jgQxfSFF+
         k6xcOxRVCWcY1rcbTvl+rTChngajAzMOHS35SOdZsV63eQX32mcPP59VHEKnGyedqn0s
         qkZ0d2P4MWNtGqlSajecx1waC5DI+hdJdXFs1jM3+ye8riSGF/E7j1/dPOefktzu9gAx
         Lasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520561; x=1701125361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SqPAnw0QpKcg0zC6uM3+YKsZ1Rv+zntSbyUGLhP8hE=;
        b=GZ1P5Vys70tD7UGT3IxtAMY8u6TK0iXqO6RA1jdt0DeOwQ0/KIde9B12AFjxvqgVlC
         NnbRkhyAtcoSN611sbKJMI77P6Dn4UpXfebc20BD7Rntmay0/sa9Sce3JUoHCz/TAMhz
         2inkGCcVyRnGdvdragZ4vj3s+nTxbG5CmEKLTi3+CKQny9B4rLIoFOLrFEeAEXcbfZxB
         NA10ih9H8AoWem1v/i6UpPDPMRtY5uVxd5urkuOvZPDG28IJms/DFZjiUYjmwFajPOHC
         BAJNoeV8dUEiOqCi17HZesSKgoP2PoK/DiQyPH62UP9fSMIKHhUgBaO1Nh/9+9GWp97L
         +7cQ==
X-Gm-Message-State: AOJu0YwwkNIvl6LXzJDD9PN9SKsgowzrBNxXdSOD0JmqrwZ7ZRrNqu1v
        S6g/xL3xYULYdE5ur1jxLLap/Q==
X-Google-Smtp-Source: AGHT+IHTbjSayWigF0siBEmx2UcusxW01ObJc5vC7FIWm7CrcH6uqemKAgtjbHSoxxVi021tZT0VuQ==
X-Received: by 2002:a05:6512:3b2a:b0:50a:aa7d:2c18 with SMTP id f42-20020a0565123b2a00b0050aaa7d2c18mr6095443lfv.61.1700520561236;
        Mon, 20 Nov 2023 14:49:21 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b00503189d8b8csm1297756lfc.198.2023.11.20.14.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:49:20 -0800 (PST)
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
Subject: [PATCH v3 0/3] dt-bindings: connector: usb: provide bindings for altmodes
Date:   Tue, 21 Nov 2023 00:00:17 +0200
Message-ID: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In some cases we need a way to specify USB-C AltModes that can be
supportd on the particular USB-C connector. For example, x86 INT33FE
driver does this by populating fwnode properties internally. For the
Qualcomm Robotics RB5 platform (and several similar devices which use
Qualcomm PMIC TCPM) we have to put this information to the DT.

Provide the DT bindings for this kind of information and while we are at
it, change svid property to be 16-bit unsigned integer instead of a
simple u32.

NOTE: usage of u16 is not compatible with the recenty extended
qcom/qrb5165-rb5.dts DT file. I'm looking for the guidance from DT and
USB maintainers whether to retain u32 usage or it's better to switch to
u16.

Changes since v2:
- Inlined altmode definitions instead of having them under $defs (Rob)
- Explicity list permitted AltMode names (currenty only displayport is
  allowed) (Rob)

Changes since v1:
- Added type:object and fixed 'description' string in the altmodes-list
  definition.

Dmitry Baryshkov (3):
  dt-bindings: connector: usb: add altmodes description
  usb: typec: change altmode SVID to u16 entry
  arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid

 .../bindings/connector/usb-connector.yaml     | 29 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
 drivers/usb/typec/class.c                     |  5 ++--
 4 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.42.0

