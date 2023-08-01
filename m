Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A3FEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Aug 2023 05:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjHAFym (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Aug 2023 01:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjHAFyl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2023 01:54:41 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1747810C1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 22:54:40 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so17300775e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 22:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690869278; x=1691474078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N80uoosdDa7yvdA2hpRb8uu5HD+aBTdak3hppZUjvME=;
        b=W81z5LIvTNakNfnLI9h3rRYOTVhxMuXypfc2ZPp23NYR4TBHZZIZ6FC2WY5K8qM0v7
         c9KtpjQEzbz03YmYXSu9sfaMCIXLovw2AYzmSNAagTnDxlKdSCOjUZdQi5mOIom5iTnt
         SYbmdG3PHq5eH2hSykAFJ/EHcpvNEOppuR5pEYZ9CgxjPmyAlrUczgYGxu1oyEEyIpYd
         KH0urdQDlL+Y4r4OFB58hK9UNpFplEmNntMwJimg6KV3FGWu3tFYyMmC5VV51rjYxWHn
         ApEfWU7lB2Q5bcxJ97ooXjZcsz6kHxi/QhZybjhi91GsdM/L09iyus+govgCNBVVdhdD
         DroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690869278; x=1691474078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N80uoosdDa7yvdA2hpRb8uu5HD+aBTdak3hppZUjvME=;
        b=AwEj8Vq6RHqGdE2E3HcsRcxtWUvrN9P6zb5k5DPB9ODJx3QhctXgD9IBpNAED5gitT
         1KuxK2az1wr5KET24+DnZU0rE79cum/HvZH2SDsH2YgPJ5OGvkAGSH2S+lbOYj+2mp1V
         BtI+hIURGxGGVgbuZc+9v7L+NttJoFD/1Vb2zoUqUmRkOJfWQ0aQtZaqkIVEOL8X44yx
         KqH4StuN9yDg7eerP/uP/vM8Eckxt1mZuykSY1IkZw2CVCb1RSYRYaedtLLY9cLA5Cs2
         dMzBNgkF866ApWTWKnKiyaduOViqkMmP6UeApuuasBdP2rgiS1rVnrtZ2j7mStO166dW
         GI7w==
X-Gm-Message-State: ABy/qLbTtOOSAJ+7NJgulfQjzOc8XLsmMzosXCsWREeHHCzbIZKwto12
        Owt/aE9gt61bIE20O+olW/jBpw==
X-Google-Smtp-Source: APBJJlF7w8g4PdS0vx0UCedzEPqIB3jut1ot+T356u96ck8Ze0W/oghlj8TAPWJYmtsTeMO2yGB1Qg==
X-Received: by 2002:a7b:cc88:0:b0:3fe:1d13:4663 with SMTP id p8-20020a7bcc88000000b003fe1d134663mr1535750wma.1.1690869278559;
        Mon, 31 Jul 2023 22:54:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m8-20020a7bce08000000b003fe18d03188sm7679010wmc.17.2023.07.31.22.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 22:54:38 -0700 (PDT)
Date:   Tue, 1 Aug 2023 08:54:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de,
        ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH 2/5] hp-bioscfg: Fix memory leaks in
 ordered_list_elements_from_package
Message-ID: <0f8c1b87-e211-4ca7-bf92-8fde5bb77cd2@kadam.mountain>
References: <20230725220056.25560-1-jorge.lopez2@hp.com>
 <20230725220056.25560-3-jorge.lopez2@hp.com>
 <77867e93-7785-457c-9e37-4b41503bb509@moroto.mountain>
 <CAOOmCE_uRxqjTYueZkStbXeU5GKRUnvFOSGNhiBbtWDfkvxveg@mail.gmail.com>
 <2978ca9d-fbab-45b1-8d90-321fb9453965@kadam.mountain>
 <CAOOmCE_p_QgV0QJZKtYZD+t7Y9MzNOQ9sEkfSM88VoHDUCwdCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOOmCE_p_QgV0QJZKtYZD+t7Y9MzNOQ9sEkfSM88VoHDUCwdCw@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 31, 2023 at 11:35:35AM -0500, Jorge Lopez wrote:
> On Mon, Jul 31, 2023 at 11:16 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Mon, Jul 31, 2023 at 11:03:42AM -0500, Jorge Lopez wrote:
> > > On Thu, Jul 27, 2023 at 1:21 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >    134          int value_len = 0;
> > > >    135          int ret;
> > > >    136          u32 size;
> > > >    137          u32 int_value = 0;
> > > >
> > > > It confused me that it's called int_value when it's not an int.  Just
> > > > call it "u32 value = 0;".
> > >
> > > The variable is named int_value when it is not an int because it
> > > stores the value reported by ACPI_TYPE_INTEGER package.
> > > The variable will be renamed to  type_int_value;
> >
> > Eep!  That's even worse!  Just leave it as-is then.
> 
> Oops!  just send a new patch using type_int_value.  Should I change it back?

In order of preference for me, it's "value", "int_value", and
"type_int_value".  But it doesn't really matter.  I feel there were a
couple bugs like the size vs value_len and re-using the iterator.  You
have addressed the real problems so lets not worry about variable names.
Whatever you pick is fine.

regards,
dan carpenter

