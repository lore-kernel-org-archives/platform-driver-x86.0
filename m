Return-Path: <SRS0=wg3L=EC=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6620CC5DF9E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 14:52:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1848A20732
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 14:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bd0+siwa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773085AbgJ0Owg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Oct 2020 10:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28293 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1762828AbgJ0Ooc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Oct 2020 10:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603809870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1hPHK44hVY/XA7nzTS4W+w6X6ee8nTzZEg58p2fgtMc=;
        b=bd0+siwaQvFTtodmDSgU+x76lg8fLYI/4N9uG3Jro8eoceXhV4u+bY2EPuzZ+OES5PphL3
        3xoACH66t4Aj23hM4qPGZDU+/qzFE4Jy18oyzqWLZoxdd677CsHwLPhfcyYcyCBf8dUGFZ
        mRAkUc/jPnt7UoxtG75RyJE4g5RhadI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-sjZ981SBPkKO0IufbHzMgw-1; Tue, 27 Oct 2020 10:44:29 -0400
X-MC-Unique: sjZ981SBPkKO0IufbHzMgw-1
Received: by mail-ed1-f72.google.com with SMTP id dc23so771277edb.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2020 07:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1hPHK44hVY/XA7nzTS4W+w6X6ee8nTzZEg58p2fgtMc=;
        b=SGnSH6AGcebQJFkzImrlRd9xMswFd39HG8t6d0inCKZm+JQbcozDph94sXMsRk8SZG
         x+k7mcVYzYbgWbVA2FAU3RO/dCtVq5beM5JMu4bdJ6NhfBAJGq6n74RduGxqKCZ+dOtp
         bHmPkFD+WS2VATH+flkOQJwK5ubKo92fWyUZeYnhoGr1Q5Fbc7CirNFmDNkT3SeL6dM4
         d94xvQcvN7th/VwacbsKkbgzF28lHPZrt6Ux2TNB0kSbzWiU3aMSCftl+zy4sWGVmOLo
         tIDWl6oTtyoqUpAYfNtgFSXTmDVyvpv7iDmjl9EP0+zIQegeBmozZ9sivzkNpCFJ+I58
         wVFg==
X-Gm-Message-State: AOAM532meuPmCMjoHO9HsP4lZ4tpFkkCqXc4PUzQdcflXrFQqGElXzlM
        l75XJeiGIMpCIGIuR0lgBx+7fyeDA2MAZ/Z+y80fYR/agIsPMXQmzCWYpsZKNSHEyNCJrqIFPRy
        mXlGny8CZVZYoxKuIA8wsJ7VLz6JEMAXvJA==
X-Received: by 2002:a05:6402:1653:: with SMTP id s19mr2755170edx.124.1603809867617;
        Tue, 27 Oct 2020 07:44:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4H1K+7JMfclTLd6nYQ+qpvsWZSeM351qSFwjzInubFfTNi2HgRB7fsMZx4iNCHwKR/66L3A==
X-Received: by 2002:a05:6402:1653:: with SMTP id s19mr2755155edx.124.1603809867398;
        Tue, 27 Oct 2020 07:44:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d1sm1244538ejo.17.2020.10.27.07.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 07:44:26 -0700 (PDT)
Subject: Re: [Bug 196819] ASUS X SERIES X553MA-BING-SX451B does not boot
 anymore
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <bug-196819-6418@https.bugzilla.kernel.org/>
 <bug-196819-6418-Ze8OWcGS0v@https.bugzilla.kernel.org/>
 <CAHp75VcEkCGm=Vi==t1T6b0MYHyyk8yvVyJe3NZhFXX7h8NVvQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d03f9fca-8012-e78e-9eb0-f7ef798e01ba@redhat.com>
Date:   Tue, 27 Oct 2020 15:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcEkCGm=Vi==t1T6b0MYHyyk8yvVyJe3NZhFXX7h8NVvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/12/20 4:35 PM, Andy Shevchenko wrote:
> On Mon, Oct 12, 2020 at 5:32 PM <bugzilla-daemon@bugzilla.kernel.org> wrote:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=196819
>>
>> Andy Shevchenko (andy.shevchenko@gmail.com) changed:
>>
>>            What    |Removed                     |Added
>> ----------------------------------------------------------------------------
>>              Status|NEEDINFO                    |RESOLVED
>>          Resolution|---                         |CODE_FIX
>>
>> --- Comment #5 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
>> Closing now, thanks!
> 
> This bug is simply an example of one registered to Platform_x86 component.
> Should PDx86 ask bugzilla admin to default the assignee to this
> mailing list, for example?

Changing the default assignee to the mailinglist seems like a good idea.

Can you take care of getting this changed (or do you want me to
request the change) ?

Regards,

Hans

