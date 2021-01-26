Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C054C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 15:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E89C62083E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 15:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391332AbhAZPqz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 10:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730427AbhAZPqe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 10:46:34 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ADAC061A29
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 07:45:54 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d16so16297384wro.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 07:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QBdMQ8Uh7g6x9tzWebFyKzC3sPjya6HWZL/iGUy6V+0=;
        b=srlPk53AHjANh76Tfzi0p6KLqPAqD0xZT7upwOreTrMKd1aCj8adj98VSNawDhH+Rl
         JFkettD6zJUjybF9HCtFuS/CJIMkhdxBt6kKfWbTlv9TR4toaqMNqYlgNvtorNUUr3Er
         aFa3Krl9WYXsPqBjVd4z6YLsf0VJXV7zbUEesCYddZXyAsq7E4TV2eqznf4xXXvZUEuS
         A0NnLH5Q89T0zyB+MYFpDT0/c23zsi3C2dh39sanyHgoz0LN7EuBMxuEpnSP9z4R9okq
         /AjJYqoHvoIl5f+ih93HfskQOw/NMc73GULUDl44+kDNsJ+kCj/jKC6PhMOf01p0mjCU
         mHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QBdMQ8Uh7g6x9tzWebFyKzC3sPjya6HWZL/iGUy6V+0=;
        b=dIhCCDA5y5VAOSa0UtqRIQ4V1oNRLTgjhrKhhQNVZC9DRPRHhbszBWFrzKrlIq+uiq
         5kXof+06t8PcS5WvKk7++mdOaYJsA78fwUCcUBZfbSlvIS3tLJlIr+kHmT6Ot4wzSQ83
         4YdNR2aAjc5CqRgogJQEzA9OyqJyoviFZKChE2K4LPodRFIRZLIErzlSBmd6Oaz+39ll
         ETaerK3KBetTQ5k0uoBKDBSKpNN/GDsKERGkXQMF8gvq5/r0yqyyoev0TnTiswZ5HSZ8
         1kjVMphfL476rQvYODNKunEPkW+XvYOPMt5IohjVET/MBnrpDGb7xA0Ex3VLDstMSxPW
         qFZw==
X-Gm-Message-State: AOAM530dc20Y4aYDYIafJEP+bl2h8Dd+lSTHA4EoKJBYYeQB791h7j1M
        E6UNA0rhyRovHTGfKV9FnEkShdnmD0+Isw==
X-Google-Smtp-Source: ABdhPJyGGXqYbNyYlnGAkmIZeJLCwjGSL3LYQ0fR+bRqm77d3XD3oYVKToCnEaOqv2YVl6g+g3lYUg==
X-Received: by 2002:adf:e8c5:: with SMTP id k5mr6993076wrn.242.1611675952528;
        Tue, 26 Jan 2021 07:45:52 -0800 (PST)
Received: from [192.168.2.202] (p5487bbca.dip0.t-ipconnect.de. [84.135.187.202])
        by smtp.gmail.com with ESMTPSA id x11sm3734436wmi.4.2021.01.26.07.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 07:45:51 -0800 (PST)
Subject: Re: [bug report] platform/surface: Add Surface Aggregator subsystem
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <YA6up/PbuEZ82kNd@mwanda>
 <9302e8c9-5909-968c-9ac4-e5725e61082e@gmail.com>
 <20210126101133.GP20820@kadam>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <aa7eeb23-8e5d-0a91-456f-e68207c185c3@gmail.com>
Date:   Tue, 26 Jan 2021 16:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126101133.GP20820@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 1/26/21 11:11 AM, Dan Carpenter wrote:
> On Mon, Jan 25, 2021 at 01:12:06PM +0100, Maximilian Luz wrote:
>> On 1/25/21 12:42 PM, Dan Carpenter wrote:
>>> Hello Maximilian Luz,
>>>
>>> The patch c167b9c7e3d6: "platform/surface: Add Surface Aggregator
>>> subsystem" from Dec 21, 2020, leads to the following static checker
>>> warning:
>>>
>>> 	drivers/platform/surface/aggregator/ssh_packet_layer.c:1697 ssh_ptl_rx_eval()
>>> 	warn: check likely/unlikely parens
>>>
>>> drivers/platform/surface/aggregator/ssh_packet_layer.c
>>>     1683  static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
>>>     1684  {
>>>     1685          struct ssh_frame *frame;
>>>     1686          struct ssam_span payload;
>>>     1687          struct ssam_span aligned;
>>>     1688          bool syn_found;
>>>     1689          int status;
>>>     1690
>>>     1691          /* Error injection: Modify data to simulate corrupt SYN bytes. */
>>>     1692          ssh_ptl_rx_inject_invalid_syn(ptl, source);
>>>     1693
>>>     1694          /* Find SYN. */
>>>     1695          syn_found = sshp_find_syn(source, &aligned);
>>>     1696
>>>     1697          if (unlikely(aligned.ptr - source->ptr) > 0) {
>>>
>>> The unlikely() macro returns 0/1.  Smatch is suggesting that this should
>>> just be "if (unlikely((aligned.ptr - source->ptr) > 0)) {" but I'm not
>>> at all sure that that's correct.  Isn't aligned being higher than source
>>> the normal case?
>>
>> Hi,
>>
>> the suggestion by Smatch, i.e.
>>
>>      if (unlikely((aligned.ptr - source->ptr) > 0)
>>
>> should be correct. The normal case is aligned.ptr equal to source->ptr.
>>
>> Let me elaborate a bit for detail: SSH messages all start with a "SYN"
>> sequence and are frame based. So once we've parsed one message, we
>> expect it to be followed up directly by the next message. So, here, we
>> are directly expecting a new message to start, meaning the SYN should be
>> found at the start of the buffer, or, closer to the code, aligned.ptr
>> (the start of the message frame) should equal source->ptr. If this is
>> not the case, this indicates that some unexpected bytes are in-between
>> the last successfully parsed message and the next message. Usually
>> that's caused by when a previous message has failed one of the CRC
>> checks (thus we can't rely on the length encoded in the frame) and we're
>> actively searching for the next message (via this call here).
>>
>> Thanks for the report!
>>
>> Do you want to submit a patch for this or should I do that?
>>
> 
> I think I understand, but can you send the patch for this.

Sure, I'll do that. Expect it later today.

> Why not just make the condition:
> 
> 	if (aligned.ptr != source->ptr) {

The '!=' would work too. The (frame-)aligned pointer is guaranteed to
always be either equal to or greater than the source pointer, so that's
equivalent to '>'. I'd kind of like to keep the unlikely though, as that
indicates it's part of the failure path and it's a failure we don't
expect frequently.

That section could probably also use a comment.

> 
> Anyway, I assume you know what you're doing.  :)
> 
> regards,
> dan carepnter
> 
