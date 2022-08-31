Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06013ECAAD4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 31 Aug 2022 15:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbiHaPQv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 31 Aug 2022 11:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiHaPQu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 Aug 2022 11:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC127E00A
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Aug 2022 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661959009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e0xifggWWVXyqkkAAWgCH5K33dRfapcSInzbE22dq0k=;
        b=HGf+cnUBR1FPtuSd+T7b1h/pX/WcDYd6L1WUBBsJQPgNmQGTgWYzWUmQj+hYdEg3VBiCRv
        Q0+yRULq7Fvi09pvJqRZURHP0Oh3sqfE/pohQi/9XkR8DpWFyBFVi6FMwLqzRKh3BPGqRX
        /ut2p1b7JzlwzBGVqTQeXnrS9WIxvqg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-NF93lCjBNbaLXl4sk0xxzw-1; Wed, 31 Aug 2022 11:16:46 -0400
X-MC-Unique: NF93lCjBNbaLXl4sk0xxzw-1
Received: by mail-ej1-f70.google.com with SMTP id gs35-20020a1709072d2300b00730e14fd76eso5492448ejc.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Aug 2022 08:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=e0xifggWWVXyqkkAAWgCH5K33dRfapcSInzbE22dq0k=;
        b=SrbJ07c4tAi5Wf0uK51SK3QI7+b8Cn2FvWjLwemGLyiOfWAU5+cRqGwj4DJN3/Z1Vk
         qDBtZ7PJVGCq64T4kES4LuMlnWi6zb3OHrOu1ZcakE0KwOKK0DEg/3+vthwb7iE0WTuJ
         MUxgTvPOwvDnt3gaDACjoEJIdW6xNRv78uYn7xxZlC71+1o3ig03wlIhQgnRe6uVbBoO
         BC5Jm0DnFotAzgz0J+ssL8g85KBD2p7bzijeP4sks/QX/YieLS2xzwXtYyvDLt1leQba
         53gP8tW2ljN+cDreNcbmTmUzeSiHLsPOT1ozwZq7trQ2qfkwxXbI1tRnxbIQVe0DVTfM
         Ha0g==
X-Gm-Message-State: ACgBeo3gmI047Sfjw1vo4YRIlBL2DFZIpzhlxndmuJYsnxMcdtWUC6OR
        KBqaKRlrxtN9nsjKsHozAEUv+T+iUYLMtqXuiLIZf81EL4rSb6SeO/P7HkE2rJjDWQKur8h48q+
        5dc4iEYejd0YLAsr7vGwZglizvwWj6RRdOQ==
X-Received: by 2002:a17:907:968d:b0:741:5d55:e501 with SMTP id hd13-20020a170907968d00b007415d55e501mr13353102ejc.449.1661959005202;
        Wed, 31 Aug 2022 08:16:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6V+akHnnsYaO06t426lFF4ZrUc7b7phUa9GsHReHWCCzfJw8cqILu7eNd1LmGLN4cBIMbY9g==
X-Received: by 2002:a17:907:968d:b0:741:5d55:e501 with SMTP id hd13-20020a170907968d00b007415d55e501mr13353095ejc.449.1661959005024;
        Wed, 31 Aug 2022 08:16:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id rl26-20020a170907217a00b0073db043a6f7sm7206294ejb.210.2022.08.31.08.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 08:16:44 -0700 (PDT)
Message-ID: <8b4547ca-6859-20b8-595b-759830bbe54a@redhat.com>
Date:   Wed, 31 Aug 2022 17:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/1] platform/x86: intel_cht_int33fe: Fix comment
 according to the code flow
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>
References: <20220824152115.88012-1-andriy.shevchenko@linux.intel.com>
 <Yw9tIAObVXvLcg+v@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yw9tIAObVXvLcg+v@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/31/22 16:16, Andy Shevchenko wrote:
> On Wed, Aug 24, 2022 at 06:21:15PM +0300, Andy Shevchenko wrote:
>> We don't use software_node_register_nodes() in the code, fix the comment.
> 
> Any comments?

No, I just have a bit of a patch backlog to process,
I'm trying to process the backlog in FIFO order and
I have not gotten around to this one yet.

Regards,

Hans

