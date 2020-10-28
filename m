Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5ECC55179
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2C0324171
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P071rnXW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgJ1WNZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731080AbgJ1WNY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603923202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BbQYkDcZfnhM7E4l1E54EEK6id+31chdPIDAkbnASR4=;
        b=P071rnXWOPbtpT0f6CuDoXyJs6Q4JRs26QAaPiHXSiyblzZlVvF8CiHz0XX0hMtLImRwyh
        KUTgfPyZ0OVWZ27eM0OziYK0ltGHlAy6JzxPBVlAM/jrvlnux9vrgZSH2cx5w5cR/rKro9
        uY3nZTZsoSHIzZY07hV6TaZ8zMptLMs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-51CgnqtNOtOkXlRNmq5UwA-1; Wed, 28 Oct 2020 08:11:09 -0400
X-MC-Unique: 51CgnqtNOtOkXlRNmq5UwA-1
Received: by mail-ed1-f69.google.com with SMTP id b16so2027732edn.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 05:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BbQYkDcZfnhM7E4l1E54EEK6id+31chdPIDAkbnASR4=;
        b=BeEdPW9RDJfLJYXTLtM5x/E0UWXF4NdYxK7Fwsms1RuRlSSoDrC3EZo7UL0RILQksK
         7DtkrsxLYIIM93LFNUKxWiTn0gN9hECBsQU6q0ZVjPzNU4DvZY6I3AsPJUUbNqYlb7Bc
         Nu9lKyMWx+fg5fNpMCwqNnnMOrvK7vvX5x+s9rG/6+wywadFSRJnSIw+zdsU+GA/18am
         izy56+oPvVYUGU7Z2t7ybOuA8CeGWHlEgNOFw95ZTDce5M13L5PTZASlsvLDMLLg72VO
         SZOVQpXknb4ecg2QQevlgO6k29OmRDRrT89q2KxZg+aDSpFCSYnfusaGLDcP7urhxOJH
         Pmcw==
X-Gm-Message-State: AOAM531uMifocJidHUcfLILRzgpwEgKDemNUybHFRJw/1yIR1TQOxv57
        uRzPSJksml7+efFLgI7AbBqETu2TvJxq5ZXCTTmoEcdUXZHX4ugGc3WSaHXxeos3LHbKO2qv9H+
        oZDEH1BP9vJl4MRobiMe4p5PUZqMpZYcpqA==
X-Received: by 2002:a17:907:11d0:: with SMTP id va16mr6863725ejb.22.1603887068222;
        Wed, 28 Oct 2020 05:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpPic4nKTiHVpf2NSnj1FFP8XUPcD49Ru9/gjGQ9WnLTXDdoWH0glRlRPEg5zWZLVB1vC13w==
X-Received: by 2002:a17:907:11d0:: with SMTP id va16mr6863710ejb.22.1603887068060;
        Wed, 28 Oct 2020 05:11:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id qt11sm2878171ejb.16.2020.10.28.05.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 05:11:07 -0700 (PDT)
Subject: Re: [PATCH 1/6] platform/x86: acer-wmi: Drop no-op set_quirks call
 from find_quirks
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20201019185628.264473-1-hdegoede@redhat.com>
 <CAHp75Vcrghf330j_6P5iSxcxJYa_LvDvN3OGBBJWFpUXBPMRJQ@mail.gmail.com>
 <1cb8c938-df6d-2c99-1160-27b389b1f198@redhat.com>
 <CAHp75VeH5h7fQ6amth=Wc9WpunXZOVArxr38nc9Y1ESqBuaqzg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6b390cf5-08b2-b1b2-df03-82a50128f85a@redhat.com>
Date:   Wed, 28 Oct 2020 13:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeH5h7fQ6amth=Wc9WpunXZOVArxr38nc9Y1ESqBuaqzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/20 5:55 PM, Andy Shevchenko wrote:
> On Mon, Oct 26, 2020 at 5:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/26/20 4:15 PM, Andy Shevchenko wrote:
>>> On Mon, Oct 19, 2020 at 9:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>>> In any case, LGTM, you may use my tag
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>
>> Thank you, I assume that applies to the entire series ?
> 
> Yes.

Great, I've added the series to my review-hans branch with your
Reviewed-by added.

Regards,

Hans

