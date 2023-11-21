Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF07C54FB9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Nov 2023 09:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjKUJUJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Nov 2023 04:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjKUJUI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2023 04:20:08 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F547100
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 01:20:03 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-da41acaea52so4971876276.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 01:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700558402; x=1701163202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e0GnsYSjmMnnlfj2CWEXFz1CqUs2uGzKvSRcvkw5bjs=;
        b=JCKgJlqfNrr/Kd0IbU4DXNllY54+Wjs3TBNKIPViw27VRn7QzfehGURVE/BCq6khIH
         SRFGCXovd0ZCX5fdajIY4jn2R6KVA2Yx193y33q8+SX8Iw7mv5yK/Y47Iu4Ybdi1yG0R
         pL9ySpMhZLFXOtY8CaqreGe9URFLWEKvUmQlsB7/OXAR8nOQtyp5H96H4lg7XfnDlbEG
         h9LoMTmNnROteLbb/WjWYHDRpOjYq+nTt4yRyB+ljOP0SCfBvO29CC+nyAhX6hGNlDu0
         VOARcusWCH3R6sdUGQ2na0xqZOItV+Y9E3deHI94trQ3mYYOsvdXFAv31d0ORwlxGzRT
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700558402; x=1701163202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0GnsYSjmMnnlfj2CWEXFz1CqUs2uGzKvSRcvkw5bjs=;
        b=JKJx6PFOdCsCn5JmBG7toQQeuF74dw/fudtfrnNoufsQPvNApJHwHLr0viACr1ejH/
         M2hWIU7ApUoC/rxanUYz7Lx5vHmqdwZCYsh9dO9yq8TVTF6IBPpeXsMNREUQ/BUfOT6+
         pnDDLNIiva86C3F+xX/2S56KQ4AKQ79lFhw5VQWuGXDMf1eX6EXteJqlRqcXBpPK952B
         E5xfpsMUHWVaIEavsWZav/155sSqSG5vgImnEfIfgeb9CWJbY9qbvQCN4+nU1S9Ly1cE
         zKyDRpd0h+G1FuFUywXIaL4ZMy+jm9dMdY39WAVZUT75+8nTeh3wRKRZWmh0+78/zqSE
         DX9A==
X-Gm-Message-State: AOJu0YwlXD7G6blPyBiaTHCj2F11plEFPSNGwRRBgbaf+IR0JvoPknAj
        MVH97N4e0uKmH/TpmjfK1WSd2z3BXTRODBgo74WzNg==
X-Google-Smtp-Source: AGHT+IGGKp46rrXxTxtTOtiXmo2Li35FgNeYDd8e5HO6aCQZjqPditR2ptVz6cb2AzXxBDV7hw/hT+XOKdph+CuSf5Y=
X-Received: by 2002:a25:ae03:0:b0:db0:2161:5950 with SMTP id
 a3-20020a25ae03000000b00db021615950mr10361703ybj.63.1700558402174; Tue, 21
 Nov 2023 01:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
 <20231120224919.2293730-2-dmitry.baryshkov@linaro.org> <ac3f3304-6dcd-470a-907c-32a63d3c39cf@linaro.org>
In-Reply-To: <ac3f3304-6dcd-470a-907c-32a63d3c39cf@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Nov 2023 11:19:50 +0200
Message-ID: <CAA8EJppOGsc1+iw-YB9FBEm2UPpyAB_4cQg94Ob4swPzXheQ7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: connector: usb: add altmodes description
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 21 Nov 2023 at 10:31, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/11/2023 23:00, Dmitry Baryshkov wrote:
> > Add description of the USB-C AltModes supported on the particular USB-C
> > connector. This is required for devices like Qualcomm Robotics RB5,
> > which have no other way to express alternative modes supported by the
> > hardware platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/connector/usb-connector.yaml     | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 7c8a3e8430d3..c1aaac861d9d 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -171,6 +171,28 @@ properties:
> >        offer the power, Capability Mismatch is set. Required for power sink and
> >        power dual role.
> >
> > +  altmodes:
> > +    type: object
> > +    description: List of Alternative Modes supported by the schematics on the
> > +      particular device. This is only necessary if there are no other means to
> > +      discover supported alternative modes (e.g. through the UCSI firmware
> > +      interface).
> > +
> > +    patternProperties:
> > +      "^(displayport)$":
>
> This is just a property, so should be under "properties:".

Having it under properties would make adding new altmodes harder.

Inherently it should become something like
"^(displayport|virtuallink|thunderbolt)$".

>
> The rest looks good to me, but I don't know USB that much to judge.
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry
