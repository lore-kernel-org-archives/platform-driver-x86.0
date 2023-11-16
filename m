Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C4EC197A0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 20:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjKPUs1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 15:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjKPUs0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 15:48:26 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37F1D4A
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2023 12:48:21 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso1178620276.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2023 12:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700167701; x=1700772501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3jsteqKoN0WWpHYaZ+5dGYmwGw/oo6WmbF7h43IrO4I=;
        b=Pfry8HUALyS/Pnsu4MvjCQhVjIAicRPRXtoDx/puCI6Sy1Km49JCXBgNfpXhhN3fsl
         5MIT70WcPo+UfDz7w10N5S9HyiTndnhSoUSVsf6M7bIIfL7FWkqB6/aH2QpPId9YqMSJ
         9wgu8vlGxF8ca3mn/UAAAOloE5WnYgcxsj4nEK7fmj+/uztRoWHCGE0BA8Ye55oGag+J
         IaXAtA4hMELM5cSSPEUUbM/fq0g3UnQScbiFDtUzUk0H4OFnCR7Jdmdgrfa4sQwA4MO9
         4MQJedDEftCB40TPfdVMI0lOXOBhXgqNtypjJUSYcjUW8WV85yzrBCG+1drwSgjrViAm
         5sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700167701; x=1700772501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jsteqKoN0WWpHYaZ+5dGYmwGw/oo6WmbF7h43IrO4I=;
        b=sshiUe6QVLKkDG0Nu5iDWNtAqDjhg4DHFvQAj0MG3N1E69UAkOGh4RYeyWoLQXqrb4
         lBR9vnWjHSzrr9t7FeoKjnnXCXJIlHP41K67OuvXFnDTPbRvtvNvZfQHCET4PMDVZIhP
         f7kmHeS3Pc5D8TKgEaQxHOcCytnIhHeRX7uxxVjWqwgHNl6S8KxhXmDuVFZf1oxW5z1Y
         MQ6QpJdqiRshxXnH/EX7uyDgqMIevpSv4VbTETz23VxIVuBkLdfqqVRTTDeS5Qg3U0BP
         G+vrlz68fOgVfYPg8NLGpLmKXB96DCWHP3jnmLUyn/j627KYpfrkoWf95ZQhZ8+ggU/K
         ToeA==
X-Gm-Message-State: AOJu0YzqrFyvmQapVSL/75DHfIiJcSoYbAKFvwaqQ5a8/1tw55rIbODF
        I791mAxy7y51ENgZtxtKLDJscpgFxQnMh6OohJb2xQ==
X-Google-Smtp-Source: AGHT+IHVTlFJzHDjToNpFdQnCvZKDQ+PQ1znp3kQQkzNq4tHUtFVV9wom8RYAW3XYC8nyPrjocgkBKXNLOvWzbyPg+k=
X-Received: by 2002:a25:bd8f:0:b0:d80:4533:9556 with SMTP id
 f15-20020a25bd8f000000b00d8045339556mr15904655ybh.63.1700167700968; Thu, 16
 Nov 2023 12:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
 <20231113221528.749481-2-dmitry.baryshkov@linaro.org> <20231116183802.GB2742530-robh@kernel.org>
In-Reply-To: <20231116183802.GB2742530-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 16 Nov 2023 22:48:09 +0200
Message-ID: <CAA8EJpoJzGWM_1DDY1AfB35qFz+58LVhO+L7t5fKC9HoUsR0sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: connector: usb: add altmodes description
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

On Thu, 16 Nov 2023 at 20:38, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 14, 2023 at 12:13:27AM +0200, Dmitry Baryshkov wrote:
> > Add description of the USB-C AltModes supported on the particular USB-C
> > connector. This is required for devices like Qualcomm Robotics RB5,
> > which have no other way to express alternative modes supported by the
> > hardware platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/connector/usb-connector.yaml     | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 7c8a3e8430d3..1bd51b86906f 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -14,6 +14,31 @@ description:
> >    of a USB interface controller or a separate node when it is attached to both
> >    MUX and USB interface controller.
> >
> > +$defs:
>
> I fail to see why we need to use $defs here.

I had an idea of defining a schema piece that can later be referenced
from any other place. If you think this is an overkill, I can drop
them.

>
> > +  altmode-desc:
> > +    type: object
> > +    description:
> > +      A single USB-C Alternative Mode as supported by the USB-C connector logic.
> > +    properties:
> > +      svid:
> > +        $ref: /schemas/types.yaml#/definitions/uint16
> > +        description: Unique value assigned by USB-IF to the Vendor / AltMode.
> > +      vdo:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: VDO returned by Discover Modes USB PD command.
>
> What's VDO?

Ack, I'll expand it in v3

>
> These names are a bit short. Types for property names are global
> (mostly). Though this patch doesn't make it clear these were already in
> use.
>
> > +
> > +  altmodes-list:
> > +    type: object
> > +    description: List of Alternative Modes supported by the schematics on the
> > +      particular device. This is only necessary if there are no other means to
> > +      discover supported alternative modes (e.g. through the UCSI firmware
> > +      interface).
> > +
> > +    patternProperties:
> > +      "^[a-z][a-z0-9]*$":
>
> Are there standard id's and names? Should we define some so we don't get
> 'dp', 'displayport', etc.

Indeed it might be better to enumerate them via string enumeration.

>
>
> > +        $ref: "#/$defs/altmode-desc"
> > +        unevaluatedProperties: false
> > +
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -171,6 +196,10 @@ properties:
> >        offer the power, Capability Mismatch is set. Required for power sink and
> >        power dual role.
> >
> > +  altmodes:
> > +    $ref: "#/$defs/altmodes-list"
> > +    unevaluatedProperties: false
> > +
> >    port:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description: OF graph bindings modeling a data bus to the connector, e.g.
> > @@ -289,6 +318,13 @@ examples:
> >              compatible = "usb-c-connector";
> >              label = "USB-C";
> >
> > +            altmodes {
> > +                displayport {
> > +                    svid = /bits/ 16 <0xff01>;
> > +                    vdo = <0x00001c46>;
> > +                };
> > +            };
> > +
> >              ports {
> >                  #address-cells = <1>;
> >                  #size-cells = <0>;
> > --
> > 2.42.0
> >



-- 
With best wishes
Dmitry
