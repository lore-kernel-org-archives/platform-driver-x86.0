Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39712C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Mar 2022 19:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352696AbiCUTec (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Mar 2022 15:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352683AbiCUTe3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Mar 2022 15:34:29 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8112317E38
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Mar 2022 12:33:02 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id e6so11012581pgn.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Mar 2022 12:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tirotech-co-nz.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mTcv/jcGvlCAzFAcpV2LN2VRjOMjiLq8TD7kn8LXK64=;
        b=cUHCZSKDLzgOvN8a9hJMwdQoWOvXCM7ye0Tmipjyk7EOzzSFIb6WL/DnTxEHoBIPD8
         WOL7d+ENtPoxcPuhNQ7aJ6irVJxTEVpwZfSOfZqD4JAQJBp7LzKDnddCTo9T3o5yMW8W
         wCysltdt32BHaijo5A76Hxt3m1hisXLoR+DJKDJ/2j1mUUWbY5GaNs8QfcqADSIgvdKh
         ENw9GDCcsX3r7XthVX5ceVEKlBfyz3cMtIoq0QW5viuDp4QJsi0i5FFtjYlftdi/Y1Xt
         Y+TbBDh/I+Lu0yhvq0/F2XTpzwBHIK6KTyy7xE1enFFZLuGVkOpVrv+ZvHmOLToGNJHe
         TXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mTcv/jcGvlCAzFAcpV2LN2VRjOMjiLq8TD7kn8LXK64=;
        b=k7FPoujFrPIHiFhvmZba6Wk5Jfs8cloOx/WfwBiJVE7s1J/lt+/2OzD9+2nEtQDWOc
         1L3eJbV4zlFk8ND7jq63K12Jz1p/ods7Esg5omPMsOBm7h+61XWiYfBSPRbZKMNAyCHj
         dOFbOduWeuRni2p1VE9tr30QPAKoJNZEz4o2VM/A5yaQS6ehDPXLQsnGFqVIpEgbYX+s
         NA8XDzOygFFCa07+2y8KjvQQpqNDv0AJu2dLa37J/bzOI5jN8sY5b3Au/uaDqfGA/zay
         BlBt8jTJReMgL1YRS+YeaS7E+G9nKzgO/S6G3QIjDkIs7NUw0/Lzm9+EJ1VissnDtBza
         QrXw==
X-Gm-Message-State: AOAM531cCJ51YFrsvZhBZqZA39NQ/nwmBrH1KgtMuCLQyHWlvbIO3o2v
        z6RQNVZZqnvt3TzrKoNSVAJp5gWMn48Gxg==
X-Google-Smtp-Source: ABdhPJxK/70IoXPFutwY/2eM1ULfeu/nA8weeeXYaYqv58PPnbYwvUTCR5I+Y7vGuAWAGhDa4S1Vug==
X-Received: by 2002:a65:6091:0:b0:35e:d274:5f54 with SMTP id t17-20020a656091000000b0035ed2745f54mr19060386pgu.200.1647891182016;
        Mon, 21 Mar 2022 12:33:02 -0700 (PDT)
Received: from localhost ([121.99.145.49])
        by smtp.gmail.com with ESMTPSA id 18-20020a17090a001200b001c6320f8581sm233604pja.31.2022.03.21.12.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:33:01 -0700 (PDT)
Date:   Tue, 22 Mar 2022 08:32:58 +1300
From:   Daniel Beer <daniel.beer@tirotech.co.nz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] winmate-fm07-keys: Winmate FM07/FM07P buttons
Message-ID: <20220321193258.GA31646@nyquist.nev>
References: <6237f057.1c69fb81.1689.fec7@mx.google.com>
 <2cf4e8b2-dfaa-dd7d-9c00-c7d58eeb367b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf4e8b2-dfaa-dd7d-9c00-c7d58eeb367b@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 21, 2022 at 11:22:40AM +0100, Hans de Goede wrote:
> Do you have control of the firmware on this device?
> 
> If yes then IMHO it would be better to implement this in ACPI
> using the intel-hid fw API for this, see:

Hi Hans,

Unfortunately not. I don't work for Winmate and they haven't provided
any documentation on this.

Cheers,
Daniel

-- 
Daniel Beer
Software Development Manager
Tirotech Ltd
