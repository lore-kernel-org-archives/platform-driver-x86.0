Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBD9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 10:30:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DFCE610FF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 10:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245329AbhKIKdD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 05:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238291AbhKIKc4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 05:32:56 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D334C061764
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 02:30:10 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id i5so32145842wrb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 02:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=MfHxJl5a6auNvNFSJ7rg1Gf81R9mZfjH7HTWxoZ/5G0=;
        b=0/vArSvCwEu3G9LIyqv5w8ArrzCbHLtzXuKaog7D4my9z8GI1I9RVqTMwLeTPkeZWM
         mW4I5lBV7rFZTY8olzrkDgcE55U6BiaIBKdF/Vr3JqlgRy+jGxTGeuxtwCyVSaMFm6ry
         FOKxFRTjfd11wb6i75STiqoqpwhhNCRakWeIbiWt0LLhty13cRsMR1dJSRIbRlSlGpsR
         wHDf8LkYUo/cBCkx4FNFGobOUJik483qiT0AyF+5mD9sjlorkzvSSp/f/0hY9Jf6VPtF
         9Ibs57mwkqTfKmYK3vLqI+D4d2dpEsvrdy7NFFjSGaggmpJhDVW56xprcwmAcGKFXo9L
         mAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=MfHxJl5a6auNvNFSJ7rg1Gf81R9mZfjH7HTWxoZ/5G0=;
        b=qzIrJovvsCzT3GnPYuKXp+9I+jYC1ivqP1kt3+NmEDxhdgbBtYaw3sdGDmhmdMoeYi
         TAovKJwfFcogi7x7alUa2NVg8n2mr9UCPUJnJtMdajtEOds1qSnnMhTMRBXsl9kpXaPR
         Jo11e/zxj1V5wUoMy0wptFXKOEaQM2kQec4IoN0V5x1Qur18yaPiGUQQ3JvxwAFWfmWG
         Z3JLdvhvCsb7gg6Nq8Vrw+OVSuiieg9rpRI3c0BbrgZN++G9tuZUrztENhnrb3zAKpto
         uv7j/99/ZjWgCgGowdcE3AmB2zsn5C/wWP8Y/3EY3tokRTly/hmfXRPKbTvdCHl5KY4D
         hTng==
X-Gm-Message-State: AOAM533k4MOexKFt7INdX0bbovGJRXVdQAA1+RT/eiGow2mUkXAftvnp
        kMfODYfOttxVEWH3y7VTpPfTrg==
X-Google-Smtp-Source: ABdhPJzN8THOHqvkX+1aIcikWUkFt1UOpd4MA5jJv58ReOK0cNxpt57XaqOcBPqkiLMdgU8y+axNGA==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr8047576wrn.335.1636453808864;
        Tue, 09 Nov 2021 02:30:08 -0800 (PST)
Received: from Haruhi ([185.254.75.37])
        by smtp.gmail.com with ESMTPSA id t9sm21192654wrx.72.2021.11.09.02.30.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Nov 2021 02:30:08 -0800 (PST)
Date:   Tue, 9 Nov 2021 11:30:06 +0100
From:   Philipp Deppenwiese <philipp.deppenwiese@immu.ne>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
        "=?utf-8?Q?akpm=40linux-foundation.org?=" <akpm@linux-foundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>,
        "=?utf-8?Q?mauro.lima=40eclypsium.com?=" <mauro.lima@eclypsium.com>,
        "=?utf-8?Q?hughsient=40gmail.com?=" <hughsient@gmail.com>,
        "=?utf-8?Q?platform-driver-x86=40vger.kernel.org?=" 
        <platform-driver-x86@vger.kernel.org>
Message-ID: <C7D4E238-04FA-4C96-9D54-89CD649B6CBC@getmailspring.com>
In-Reply-To: <YYpMTVP/dWsyxMSt@kroah.com>
References: <YYpMTVP/dWsyxMSt@kroah.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region
 via sysfs
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Greg,

sorry for the previous html email, totally forgot kernel ml was plain
text only.

Just some feedback regarding the use case for the interface. As you may
know the firmware (BIOS/UE=46I/coreboot) is growing massively in the last=

few years. So we have now 32MB of firmware on a normal x86 system. The
interface shall be used as safe and secure method to get the first 16MB
read-only copy of the firmware. The interface from Intel is read-only so
we shouldn't introduce any security issues here.

Aside from us there is fwupd.org=C2=A0and another company which are
interested in the interface as well. We have added Richard from Redhat
to the CC. We use the interface mainly for firmware analysis and TPM PCR
pre-calculation features in our SaaS product.

I hope that resolves your questions :).=C2=A0Let me know if you want to
discuss more.

=40Hans-Gert can you deliver the documentation, otherwise I can help out.=


Greetings Philipp

On Nov. 9 2021, at 11:24 am, Greg KH <gregkh=40linuxfoundation.org> wrote=
:

> On Tue, Nov 09, 2021 at 11:06:07AM +0100, Philipp Deppenwiese wrote:
>> Hi Greg,
> =20
> <snip>
> =20
> Sorry, html email is rejected by the mailing lists.  Please fix your
> email client to send text-only email and I will be glad to respond.
> =20
> thanks,
> =20
> greg k-h
> 
