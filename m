Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D910C61D90
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Nov 2023 20:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjKUUcA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Nov 2023 15:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbjKUUbu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2023 15:31:50 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0491BEB
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 12:29:28 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 2adb3069b0e04-507bd19eac8so7903234e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700598567; x=1701203367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/YPc2+7OX5cSuooAWCFK/zXbyQQcMjUtmvaEdzyH0I=;
        b=Ps59Aw4+pnOcsZnMWAupwEZBkEGtOXOiqJs7dXAa0Xypq1i2WYq5D5dTNEV2ruU6Zb
         TjdhhYjxAih+QC5k1G74Z+aBFVXE+0ZG1HpigJN4sTGg3ME9cbX/bV8ex7QTP6d4OfSI
         OfIrvgvr39fH0A9tNv5wzLXgPlRh1OymF2XC7DVajXY2+0fPQnT6+z0b+J1hp9Pe5RWV
         qG+kFdoP2rL/oMXCL0LGGOSKMgPfwT1KTJqp/B3VMB6AnsnEuNXkjXUy/R+ZmtPEf/0I
         8lwee+yJjKHYmdWn3TbSI2qSYWU9arIN5AY9DeXbeyr+AN/QlGLfI0pL0cs0uGilEH+s
         EJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598567; x=1701203367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/YPc2+7OX5cSuooAWCFK/zXbyQQcMjUtmvaEdzyH0I=;
        b=fXBHVk/J5ebmWMZumhZPY8u0/GQb3LuVs/NzoPfbD2R5f7uluxb6oVfPqzV9zUnalW
         0qCDS1oWR5rBU+5CM1ujbmW8Id1nnziNwa9KrmpYvUdU26oouBrrlzo60u71+2dbdNzj
         +rs4Rw+VbBQ4w8T1J9PVbwtLpI54rsK67HsBeIBWyeir6iYbzQytpTXiKC0Oib+RxuzF
         5IydSiCU1Nt+BjBNQTILhWrIldaIf1ua6Q+/KDx2KcAbFf79Zt7dq00E+L1P/DkcdBEz
         xsFZsogkOajoLkl7ja2DCSuCy46izr46kYZ3zt27FMQXOnGNsYKC1DcrEPELhgB4BNST
         G8bg==
X-Gm-Message-State: AOJu0Yx91gkKWKwSYqvXtEtk2QwuuVZueYSOyMfS082sKKYKrw2gf6Z3
        YfJZKYDb2pmi0WLrd+Ip2og5DA==
X-Google-Smtp-Source: AGHT+IH+lx0/QyDiMn/bUpTX/WV0RizOFIs7Tn8KJMsGYobLA7HMgbfKSNb2zVaPAad4qhxkMJIPVQ==
X-Received: by 2002:ac2:5e73:0:b0:507:a383:fe18 with SMTP id a19-20020ac25e73000000b00507a383fe18mr190070lfr.40.1700598566624;
        Tue, 21 Nov 2023 12:29:26 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050ab6112af2sm286287lfs.65.2023.11.21.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:29:26 -0800 (PST)
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
Subject: [PATCH v2 0/2] usb: typec: tcpm: Handle Accessory Modes
Date:   Tue, 21 Nov 2023 22:26:58 +0200
Message-ID: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:

- Initialised the `mode' variable to 0 (Sergei Shtylyov)

Dmitry Baryshkov (2):
  dt-bindings: connector: usb: add accessory mode description
  usb: typec: tcpm: Parse Accessory Mode information

 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                        |  9 +++++++++
 2 files changed, 21 insertions(+)

-- 
2.42.0

