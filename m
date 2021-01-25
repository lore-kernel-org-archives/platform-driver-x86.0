Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8751EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 12:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A08D21D81
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 12:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbhAYMNG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 07:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbhAYMM6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 07:12:58 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1131DC06121F
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 04:12:13 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f16so1613244wmq.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7cGpp4Q/I11lKQsM0NrfStdcMQHZmJsYCLBWm8CMShU=;
        b=OHFIjCCRispoXYZUs0ZIHE2wR60srWzDnOi/xhMdGnXpxbHumqVjDeJN+/p5iOSw09
         5FSBGCIA6nVrPCBaQE48edDczk7p5DWtvvsLElU9tXJqRFo0KWW52ve1tdjf7TB/5T/z
         0TdID9evn2TCuC4ljXfBd66yxMkQcOq8NHEbSYMiQj+LfphOFOgsRWFQWNVaaft6QuDk
         JoU4hGy1ST4PTfd+KjVJ6yPoIQY+lTrfyLd1U9pYVzROER4S1y0bViA+9xU+i+aNOmWf
         zkJ1xNHFWohj65c3SHRfZjihl2DHm9eL8R10uRt5nfOZJWMrRTug1SuKJfUg9xK+p8v0
         D9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7cGpp4Q/I11lKQsM0NrfStdcMQHZmJsYCLBWm8CMShU=;
        b=k/RuUR89a6ZB/x7RHaBlM3R3CZ7nXOhZTyP1buffjw9zED3LmzEenaLhW0jgEwMFIB
         1f9kYEkucbU/e6iABGONdQekPP6w21mGF/ZLeMLltpWgbsCwd7j2kJUrnclPx+mEKpFY
         YcuGYbCSq2JAifIQ7TZfON2H6G8zT+nbO67GBnl29ghMW2uJoEj2wciFcvpsF/49AKlm
         0aUKHD94TIzH+J/jv80VMxSjLhFD2OV2ZvvkueC+iyH3rFHG9N8RcA6kssDD+7UEZWnU
         Y6o1peShYP7/XCEoc0BnFemh3UAl6eT/LtQj8xbcQ3HCWzNX8751AoGR8UqMigdvzy1p
         uWaw==
X-Gm-Message-State: AOAM532ibn324yWRGE50Yu/epdHMSmVP/bg46bXzUbuEjT9ZhUZLpYip
        sz6jZprMAuAXEeON2fvCdmT18x/RQws=
X-Google-Smtp-Source: ABdhPJylNxoImrXkMQIo6mwjbxED+4RU6Rg8yHbpeqAFHygg5iteAmo4bM4nEaoTmxQEn350txtxAA==
X-Received: by 2002:a1c:9dcb:: with SMTP id g194mr48655wme.59.1611576731395;
        Mon, 25 Jan 2021 04:12:11 -0800 (PST)
Received: from [192.168.2.202] (p5487b82c.dip0.t-ipconnect.de. [84.135.184.44])
        by smtp.gmail.com with ESMTPSA id o17sm16136004wrp.34.2021.01.25.04.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 04:12:10 -0800 (PST)
Subject: Re: [bug report] platform/surface: Add Surface Aggregator subsystem
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <YA6up/PbuEZ82kNd@mwanda>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <9302e8c9-5909-968c-9ac4-e5725e61082e@gmail.com>
Date:   Mon, 25 Jan 2021 13:12:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YA6up/PbuEZ82kNd@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/25/21 12:42 PM, Dan Carpenter wrote:
> Hello Maximilian Luz,
> 
> The patch c167b9c7e3d6: "platform/surface: Add Surface Aggregator
> subsystem" from Dec 21, 2020, leads to the following static checker
> warning:
> 
> 	drivers/platform/surface/aggregator/ssh_packet_layer.c:1697 ssh_ptl_rx_eval()
> 	warn: check likely/unlikely parens
> 
> drivers/platform/surface/aggregator/ssh_packet_layer.c
>    1683  static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
>    1684  {
>    1685          struct ssh_frame *frame;
>    1686          struct ssam_span payload;
>    1687          struct ssam_span aligned;
>    1688          bool syn_found;
>    1689          int status;
>    1690
>    1691          /* Error injection: Modify data to simulate corrupt SYN bytes. */
>    1692          ssh_ptl_rx_inject_invalid_syn(ptl, source);
>    1693
>    1694          /* Find SYN. */
>    1695          syn_found = sshp_find_syn(source, &aligned);
>    1696
>    1697          if (unlikely(aligned.ptr - source->ptr) > 0) {
> 
> The unlikely() macro returns 0/1.  Smatch is suggesting that this should
> just be "if (unlikely((aligned.ptr - source->ptr) > 0)) {" but I'm not
> at all sure that that's correct.  Isn't aligned being higher than source
> the normal case?

Hi,

the suggestion by Smatch, i.e.

     if (unlikely((aligned.ptr - source->ptr) > 0)

should be correct. The normal case is aligned.ptr equal to source->ptr.

Let me elaborate a bit for detail: SSH messages all start with a "SYN"
sequence and are frame based. So once we've parsed one message, we
expect it to be followed up directly by the next message. So, here, we
are directly expecting a new message to start, meaning the SYN should be
found at the start of the buffer, or, closer to the code, aligned.ptr
(the start of the message frame) should equal source->ptr. If this is
not the case, this indicates that some unexpected bytes are in-between
the last successfully parsed message and the next message. Usually
that's caused by when a previous message has failed one of the CRC
checks (thus we can't rely on the length encoded in the frame) and we're
actively searching for the next message (via this call here).

Thanks for the report!

Do you want to submit a patch for this or should I do that?

Regards,
Max

> 
>    1698                  ptl_warn(ptl, "rx: parser: invalid start of frame, skipping\n");
>    1699
>    1700                  /*
>    1701                   * Notes:
>    1702                   * - This might send multiple NAKs in case the communication
> 
> regards,
> dan carpenter
> 
