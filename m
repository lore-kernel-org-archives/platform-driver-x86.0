Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B75C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D0CD2073C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8cMZECt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731742AbgKXLNN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24678 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731429AbgKXLNM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 06:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606216391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zsrR/ptX/mPv0s92HsrORfN4/zVK1GNdFilYGWRxaEs=;
        b=i8cMZECtBWfQZom+mrhXU7k30+5ndlsNJMhpIaB3wYZ3x7pCnN/ZXkOaRuL2BPeWT4/BGw
        LSXibxRNRA2jB+urMEq6mByXFZb8qgDFncVyzMfqCwOLvKk94ZVFgdpL15kr8lh1F1Jlrm
        GaAXySsChSrKpGSfnt6qtt5eHxt0HLo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-FkYLM_djN0ibVcL5LwTeQA-1; Tue, 24 Nov 2020 06:13:10 -0500
X-MC-Unique: FkYLM_djN0ibVcL5LwTeQA-1
Received: by mail-ed1-f72.google.com with SMTP id i1so1748476edt.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 03:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zsrR/ptX/mPv0s92HsrORfN4/zVK1GNdFilYGWRxaEs=;
        b=SGf4qD3A13KGTcHoG/8wiw11KylvFkGfFM+FGN14FIUsOJ6tg8SsogDqYVasm9vKP0
         kBbSYvo9VW57GpCmM1bslvPZhjURBXdrVMo2zBxcMEX4Nw+Wvu6zbVL9pCHzenNMbrdx
         Fp94cvke/gITiUeUL9kNmpVcvxPZQ3vKYKnDQEpann4s56B0sKnMJAYtfUPz8NtB9XFH
         dgRbzIyDsJxR23em88Wj3Ko+How6otAP0uy4vhucBn8Yw9odSgzXM/5NRbSGTM6i2thB
         oZT/nMZHrIaAxaHuaoHSCRHS8aoq2TNryxSDZ3tTIIqOW0UEw2Dg7yWKOtDfSI9tSfwI
         r2Qg==
X-Gm-Message-State: AOAM532sUsEQV46Rkbyf0ar+pLqUf0hFuAawPhOshK3pnLcDC3uJEqzK
        ebaI1s8sDtkHDm/X56Ascv5u2n3bBN/RjxNBMeiqXIn5Uo5XoWXa22TWs0SfHs84btL4ZhdMufG
        zfyx7E34Kxsq+v/mCIQGQ/V52mVoqGkt+0tioyvlW/2DUW/sptge8g8L0Elx1YluB0hzXvFdRBz
        Ld14UfGg8Bvw==
X-Received: by 2002:a17:906:138c:: with SMTP id f12mr3892836ejc.108.1606216388514;
        Tue, 24 Nov 2020 03:13:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8vyF4C+lY6nXdQ0/bOqosVps0ldMflvE1JVRgPTSUjX/dQgvGGI0cbDdvGQtOdcCniaoJSQ==
X-Received: by 2002:a17:906:138c:: with SMTP id f12mr3892819ejc.108.1606216388352;
        Tue, 24 Nov 2020 03:13:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id p25sm4219150eju.63.2020.11.24.03.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 03:13:07 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Rhys Perry <rhysperry111@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
 <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
Message-ID: <f7786f2f-b770-4875-26be-9e48b4cb914c@redhat.com>
Date:   Tue, 24 Nov 2020 12:13:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Rhys,

I just heard from another HP user that updating his BIOS fixed this for him,
are you at the latest BIOS for your machine?

Regards,

Hans

