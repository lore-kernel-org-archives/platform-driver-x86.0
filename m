Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96367C47076
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 16:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ABCE61073
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 16:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237762AbhEUQ4p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 12:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26181 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235072AbhEUQ4p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 12:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621616121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZfRMC6x2QsqmOUuJwpxE9Erqm6Etn3QcAzZ9jzTiwTE=;
        b=Waew8Rsx7rsCvt51DVXP5fQ6Qku8EIL/qUILfPQW4EWfQ8X16rofe7d5siseBHV7IjJxko
        Ygy0t3HSGNv/5X45yQUhNiDgpJ9rFSuNBZ6ukMXjeI+1vfBI+at1FGGBNCPEcOgrm35VJP
        mLnZP3z8Jr+u8exZCGe0YstvBmtSh0Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-ZTAL__vFNpeMtzwTA_qgaA-1; Fri, 21 May 2021 12:55:20 -0400
X-MC-Unique: ZTAL__vFNpeMtzwTA_qgaA-1
Received: by mail-ed1-f70.google.com with SMTP id cn20-20020a0564020cb4b029038d0b0e183fso11650361edb.22
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 May 2021 09:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZfRMC6x2QsqmOUuJwpxE9Erqm6Etn3QcAzZ9jzTiwTE=;
        b=Q2WsNJLy4Lt0/5Z+RhoJG0cl2vRw2Yd9dU7gaArLFC6mZqOmfrli3T9uJzDnVGUCh7
         rS+kC8ZF9pQ+SWZTQbfepUd8Ep1R8nYObMTr0n8jrC6gVOOI+/MTII15OEHwDYe5NliY
         pYyQfNYalIpqkd9DGj5GRCp3gDs1FhRfiedjS07oNpQUIuC70dvMTInAsNQqKI/ffTdI
         fCbjVbQNq12bMExBy9ckC+odNhB2RCL/owI+z8w5qbEZQKCiOZili0rcdP+NjUXQK8UA
         MzUnGmC92G/sHU0FoFAsnX5Np9mURu7Js/0lRQeaitTINii7e0GDGFv7g5OBKAKWvJud
         lMFA==
X-Gm-Message-State: AOAM531GuX6uEWZuXZN2qOE8zw6Gm8KDQJcr4BStQ+a9tYGQHCEfO/9b
        1/BjzEefruHG1a5FxRzHhql4VRhaGZmPC4AvZKa857CfYNDVtURdpTM+nkH9t42FmId+xto+9Qw
        x0dUQgczs2fmmGpdj6ENdJ8yrU0IVHd+tQw==
X-Received: by 2002:a17:906:b14f:: with SMTP id bt15mr11771054ejb.126.1621616118815;
        Fri, 21 May 2021 09:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7YX6mHGzALuE6odkYWM0DxvfIagEZ+y2tISZ/fcOh9Qd7jKKgRUPFfh3r5IBxmKlfisXW3w==
X-Received: by 2002:a17:906:b14f:: with SMTP id bt15mr11771039ejb.126.1621616118550;
        Fri, 21 May 2021 09:55:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y25sm4382862edr.63.2021.05.21.09.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 09:55:18 -0700 (PDT)
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com,
        Dell.Client.Kernel@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
 <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
Date:   Fri, 21 May 2021 18:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/21/21 5:55 PM, Mark Pearson wrote:

<snip>

>>> I know it would make Dell and Lenovo operate differently (I can add
>>> that detail to the documentation) but it just feels like a nicer
>>> design.
>>
>> That works for me. Perhaps you can also do a (compile tested only)
>> RFC patch for the Dell code to do the same thing (replace the memset
>> 0 with the strscpy) to see if the Dell folks are ok with also doing
>> things this way ?
>>
> I'm not hugely comfortable with that. If for some reason it broke things
> for Dell customers I wouldn't want to be responsible :)

Right, that is why I suggested making it a RFC patch and I would
certainly not apply that patch without it being tested by Dell first.

The idea behind the patch is for it to be a way to get a discussion
about this started. In my experience patches tend to get more of
a reaction then hypothetical discussions about changes :)

> I'd rather they
> made the changes and were able to test it - I know that's what I'd
> prefer if it was the other way around. Apologies if I'm being over cautious!

If you don't feel comfortable doing this, that is fine, lets wait what
the Dell folks have to say; and if they don't respond I might do a RFC
myself.

> I've added the new Dell kernel group email to the thread so they're aware :)

Thanks.

Regards,

Hans

