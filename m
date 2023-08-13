Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130FAEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 12:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjHMMrL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 08:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHMMrK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 08:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5901710
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691930784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NBWpp4WcH1Of4gtytpz7Sy6Dwn85bunNSeompfy5hes=;
        b=dFDJqXhUP9mjEwebVTSpcz0Z/mfM+6U21l2ljMNo1wBcZXi8qI6l5X2N4NkZHZaZZQ3TsU
        B+uR/9woaS6cOlyFLj8f5uYMTwzB8OT4US0qf8bii9NDcmLXR96ezk1lGAkgn5HRX3Qr91
        4Bci++xyIRBPYajE1lJCMxhDQ2eum3g=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-Sbvg-2DEPgaKBTv4CJAEtg-1; Sun, 13 Aug 2023 08:46:23 -0400
X-MC-Unique: Sbvg-2DEPgaKBTv4CJAEtg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fe27502459so3248234e87.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691930781; x=1692535581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NBWpp4WcH1Of4gtytpz7Sy6Dwn85bunNSeompfy5hes=;
        b=AWxsgHEDdRKMowxD3fp5WhXNfyKNavBU2M6qyhQnel21I0CQj5QcQ5Vd2RChdy8yr7
         T+CAe5B+Dpb9VVOrr4Jl5ORi7SJ9zVaD6P2phDNT/TgaWOcx6uuSg8p3dLSV9xat6JFJ
         FiQWJqjURoI1nfSBDCZy9QQoG5CVo0eTpP5eWu6UetDoMGms/yNSZXEvqiJctkAZvAW7
         zi90Ok4goq9YM8tPFfd1C547DrzSjczR56ovTc6ZTYTBJrnY+njGytv036lqaBO1xCse
         oChrP5f0CJyswmowVzCGSxCUlfAGdMgk8/SSthuoiDyx3o1PdIITad8hrP5o0XrBjlGH
         cGwg==
X-Gm-Message-State: AOJu0YxXY0xKqIz5xgwUy+zvEbE5ZBY8s6GUKlwKEkVOjoOVV2yN9WPO
        +1JfD+mnn7CL0dfDIdC2d67wTYLLXN6PnSy5/i8WasVEmSfNfjWy2VzkUERvblvYQ3AnxYLmvEh
        GL+msekS0RxN812r4dqHEFuhAUxunEwt0wR1xk26uvA==
X-Received: by 2002:a05:6512:3f1:b0:4fd:f876:d86 with SMTP id n17-20020a05651203f100b004fdf8760d86mr3921751lfq.50.1691930781194;
        Sun, 13 Aug 2023 05:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/aL13iYl7Ki9U+aGv7HE/HV0NfqbZ5GExa67Y7/ib88f5ZVpWWJpIJOaWQTp6VPQRZzBG5g==
X-Received: by 2002:a05:6512:3f1:b0:4fd:f876:d86 with SMTP id n17-20020a05651203f100b004fdf8760d86mr3921745lfq.50.1691930780905;
        Sun, 13 Aug 2023 05:46:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090622cc00b009929d998abcsm4529115eja.209.2023.08.13.05.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 05:46:20 -0700 (PDT)
Message-ID: <74589699-de7f-5d11-6988-b41583b341d4@redhat.com>
Date:   Sun, 13 Aug 2023 14:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] platform: sps: Fix an unsigned comparison that can
 never be negative
Content-Language: en-US, nl
To:     coolrrsh@gmail.com, Shyam-sundar.S-k@amd.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linux-kernel-mentees@lists.linuxfoundation.org
References: <20230813110841.130206-1-coolrrsh@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230813110841.130206-1-coolrrsh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/13/23 13:08, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> The variable 'mode' is declared as unsigned int in local function.
> The return value of function amd_pmf_get_pprof_modes(dev) is int and
> it is stored in the 'mode' variable. Also the value of 'mode' variable
> is compared with 0 which is signed int by default. Thus redeclaring the
> variable to signed int.
> 
> This fixes warning such as:
> drivers/platform/x86/amd/pmf/sps.c:128:5-9:
> WARNING: Unsigned expression compared with zero: mode < 0
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

Thank you your patch.

This has already been fixed by a patch which is pending in the pdx86/fixes branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=785c00993dc4c4bb2f7b0f3a3f29c03a6f7aab2e
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Regards,

Hans



