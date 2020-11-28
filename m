Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CCCC3E8C5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 02:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 093E22222A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 02:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAhIanVi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgK1C4X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Nov 2020 21:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgK1Cz6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 21:55:58 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122B1C0613D1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 18:55:58 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id f93so4506342qtb.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 18:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ojW+gpdC6j8zEXMfnHbaSEMLdrF/Nw/fREzZcvwn4Ew=;
        b=SAhIanViIOiQNMALOE9bjkTemrnuP8rd9LElrm0bQQKT0YbbPEsBvq6Ir9aAJJJFif
         z6AIwFsIqbA2nOMfO6M80toJ1Wbh7JTANSlcMC1xP6CyrdVFUlyg5GLGRihX1XzW+EOx
         TsCgW/FVbb6IkneiIm+8NTYmfwq1wrzZEwEYvI4hXmCWU82oHE8hMiUp7Povt66Zdwa/
         iGs4JOiof4f6hwRvoSxU6xGQpLneG4QHtROiT2Q+iUbhu7CiL1WR+p3P1CIhOWMOtrs2
         XcVi4EDpWrjq5CCwZyLiZUwrOBd/9AvlZChGOpyQwbsv5EcRn3aiid87dRzfwapxzAwn
         HS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ojW+gpdC6j8zEXMfnHbaSEMLdrF/Nw/fREzZcvwn4Ew=;
        b=ZfrlizcZmia+F18Y282kpEkHXc9hc4xH1Ai8LbFALMU9CV8iIscwnKYMwP0ssOssPv
         mr26F0x+UiOi5Ko1HXY5Bde9zMjjK5gpqsig4A3kxP/qPj9HDaKFuYJxZlW691h3Rgys
         oHBtIpoSa2jbkBD/uHcsDQpZRAUsw6bIVqXmHDPzSV3D9//RIbM5t60p67tM7+VTYeQc
         iAi2E9fVAHQDY8aWHXUOBeBQepxzbyobTBqoJh2RE9QZMuAhHaI+MirHC754VXvjiPZR
         LA1YRg4ztSTVV1s1g0MxPDkNrZcSzqJ/h59jyJM5o10L0ULWCxy8bflylbE5HOpScJcT
         dw1w==
X-Gm-Message-State: AOAM530yPmJ84ew/fBV8/FDWf8IhdK59yVjkTJMg4ISdS/ZPzAK+BToO
        mJ3i5Iz5nEOWjsW21Uz7E34PXNgfx3aqnw==
X-Google-Smtp-Source: ABdhPJzFlihm4oF/H9G/AkM91qo6vEcQQo7XHka99E5M/rvoG6WMnvrcgRcYTPE4YMPaBt5GBSu/rg==
X-Received: by 2002:a05:622a:301:: with SMTP id q1mr11358093qtw.237.1606532156771;
        Fri, 27 Nov 2020 18:55:56 -0800 (PST)
Received: from ?IPv6:2600:6c52:7b00:d590:a3ac:9fea:75d0:42e5? ([2600:6c52:7b00:d590:a3ac:9fea:75d0:42e5])
        by smtp.gmail.com with ESMTPSA id y189sm8689857qka.30.2020.11.27.18.55.55
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 18:55:56 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for home in HP OMEN
 laptops
From:   Dana Goyette <danagoyette@gmail.com>
To:     platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
 <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
 <b8c32747-2704-8a2d-dc32-b6154128d295@gmail.com>
Message-ID: <9ca5bc3c-807c-3dbc-41a9-741a3407c66c@gmail.com>
Date:   Fri, 27 Nov 2020 18:55:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b8c32747-2704-8a2d-dc32-b6154128d295@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



 > On 11/27/20 6:19 PM, Dana Goyette wrote:
> 
> FYI, the HP Omen 15 2020 has a different keyboard, where Home is a 
> proper separate key.  The India model has yet another layout, with a 
> full numeric keypad that also includes Home.  So unless we want to get 
> into DMI matching, it's safest to map the key to something distinct.
> 
> Layout on the US model:
> 
> [Omen]   [Calc] [PrtScr]
> [Insert] [Home] [PgUp]
> [Pause]  [End]  [PgDn]
> 
> Layout on the India model:
> [Omen]    [Calc] [Insert] [PrtScr]
> [NumLock] [/]    [*]      [-]
> [7/Home]  [8]    [9/PgUp] [+]
> 
> (Where's Delete?  Above Backspace.)

Upon looking at the driver's source, the 2020 model won't be 
encountering that path, so "home" may be okay after all.  When I press 
that key, the event is different (it's not HPWMI_BEZEL_BUTTON).

hp_wmi: Unknown event_id - 29 - 0x21a5

