Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8977CC43457
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 07:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2646C22267
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 07:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ux+0DfNI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732392AbgJIH4O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 03:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20254 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732402AbgJIH4O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 03:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602230172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I8Hb0h6ScF1tl8u80BrgRArHZmBJ/VhyBC+gkHXVJxk=;
        b=Ux+0DfNINpTcy5yCaQr34w4vOE6w3Vmw+3eDcMDXzsHRn2CvVIpJCkUILT9kd3yNgCvJzI
        gC7aVqgI1tttupZ30ytQh249urtvDewM6fTtzOPHzng3ECwwNhWG6azx6ZqfY3XUFJlHUO
        5hViUOCqujpR0w+9XQBJP7JOn0hKab8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-hMVuLtKjMDuwzNYkF3MzOw-1; Fri, 09 Oct 2020 03:56:08 -0400
X-MC-Unique: hMVuLtKjMDuwzNYkF3MzOw-1
Received: by mail-ej1-f69.google.com with SMTP id j2so3262555ejm.18
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2020 00:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I8Hb0h6ScF1tl8u80BrgRArHZmBJ/VhyBC+gkHXVJxk=;
        b=ZegaeVXllpKMM0B+GJkWNOm49QFKXHpgKf4uX8n6NA1Pfe2Qh6gnvDqBv2o1Z+Sl31
         7A9x9o52kcSXui7VeUajH5JCGA6BOH7909Z+18czhslx6cLl2FXUx2fv3wbs4b7ulN5w
         YySxgIpW5dAqscXNWWeCeCEwLJqff6mKpY69iCr0L+kg5gMw0vdwcOJLv0OYGNzAD5I+
         T+kzW4tmvEdQhgpDrmDOxjAHB8vGbBcwAs5TOjXXADlAtYM+NBTir9RMTd64xqq0rCW4
         LuU4UZ7Qdfe/IS6XNqOwgBLCOt+3144DMfGxn1kuERtdWdb24f5x6EPkIwKOXNwZdo9Z
         bIzw==
X-Gm-Message-State: AOAM532AzhdosGf5P0T/8Z2XE7shuPWABbnoDn9a23Zc1sOTeVkQH+ef
        7VIjB492stM8E4Ixfv1HnhkfIYztt0ciJdqcghUl4pgcK9rQtgulUFQrv6vCfq/C8JqlPXTylOv
        gijz58rQB86dyV41bUo86hi3LELB1B8UT6w==
X-Received: by 2002:a05:6402:18d:: with SMTP id r13mr12882511edv.267.1602230166706;
        Fri, 09 Oct 2020 00:56:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/66uLnyFqg/9kCcMOc0TuhowJA3A586tRe7Ql6jKXtEmv70cTQPxbE6ykL6rqucE5mO9yRg==
X-Received: by 2002:a05:6402:18d:: with SMTP id r13mr12882495edv.267.1602230166485;
        Fri, 09 Oct 2020 00:56:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id jw9sm5967342ejb.33.2020.10.09.00.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 00:56:05 -0700 (PDT)
Subject: Re: [PATCH v5] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        mark gross <mgross@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200929025521.59573-1-divya.bharathi@dell.com>
 <7015e6d5-3c1e-e07e-572f-d5d47a9b0191@redhat.com>
 <CY4PR19MB1254A852F16CD347C38E742E850D0@CY4PR19MB1254.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <797a25c1-03f2-9a1d-62ba-86fd39c09a3a@redhat.com>
Date:   Fri, 9 Oct 2020 09:56:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CY4PR19MB1254A852F16CD347C38E742E850D0@CY4PR19MB1254.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/20 10:37 AM, Bharathi, Divya wrote:
> <snip>
> 
>>
>> Hmm, checkpatch is saying:
>>
>> WARNING: Missing Signed-off-by: line by nominal patch author 'Divya
>> Bharathi <divya27392@gmail.com>'
>>
>> I assume the dell address is the one you want to use ?
>>
>> If so try setting the following in ~/.gitconfig:
>>
>> [user]
>>           email = divya.bharathi@dell.com
>>
>> And then do:
>>
>> git commit --amend --reset-author
>>
>> To change the author which git is using for the patch.
>>
>>> ---
>>>
> 
> Thanks, I used --reset-author while creating patch-v6.
> 
> And I had added my dell address in gitconfig for previous patches
> as well. Also, local checkpatch.pl script did not throw me this warning.
> 
> Hope, next patch will not hit this warning.

I'm afraid v6 still has this issue. I guess this has something todo
with how you are sending the emails. I assume you are not directly
sending them from your Dell email because that leading to mangled
patches.

For now I can fix up the git author to match the s-o-b after I've
applied the patch to my tree, but it would be nice if you can
get this fixed eventually.

The usual way to deal with this is to use git send-email. There are
several howtos out there on how to use git send-email in combination
with a gmail account.

Note I'm not 100% sure if using git send-email will actually help,
I hope it is smart enough to see the gmail email address used is
not the one from the author field of the commit and then add an
extra "From: Divya Bharathi <divya.bharathi@dell.com>" header, which
git am will then use as the author when I apply the patch.

I know it will add the extra "From:"if I submit patches which
were originally by someone else, but then the author field of
the commit does not match the [user] email setting from my
config...

Anyways this is not an urgent thing to fix, I can fix things
up for now. Would be nice to get this sorted out eventually though.

Regards,

Hans

