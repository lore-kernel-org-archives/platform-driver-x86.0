Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F04C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 09:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51C7822CB9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 09:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbhAFJSy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 04:18:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33464 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725836AbhAFJSy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 04:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609924648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=74reAFMP9bENCEIgFbfQOXKA/PsWi2wcOMNMUHX6jRs=;
        b=NncPIcfMenZN+GlJydfVWrMld/lrhzHQHBmSoMdt9BAVrc98/miKmT9CZfD71AH9I4EDor
        OG5dlzqln/LgNIKh8S9GBG9FkqbFroffq24LyCc0MpUWK+eKDAl9LMI4eik2RDaRE+gOlZ
        N0nTZf5G460yhn3MV6GzAFch0WLdemY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-oprYqnlUMCm-G2sdTlL60Q-1; Wed, 06 Jan 2021 04:17:26 -0500
X-MC-Unique: oprYqnlUMCm-G2sdTlL60Q-1
Received: by mail-ed1-f71.google.com with SMTP id h5so1712784edq.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 01:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=74reAFMP9bENCEIgFbfQOXKA/PsWi2wcOMNMUHX6jRs=;
        b=oh8xAxDUD5J20XQO6rU4hP50x/DjwLb7ihsoI6x0//0EGRYc0bS9kcgKQi1aRbpxCf
         Q6Mqv8f8e7DCzNg7r0j/7NQzJXZkcFfHg+bx0QasvoL/e/EGAbA9HBhXgF/t1+tDMSaC
         WLJ0lmRE3uCcAU9H4laC4nxOYPLuWq9K9QJX9i3+rko97CBw3hPif2dOOeV+U2iAokdf
         IeYl9Ey+zFvVKu9F1HIwn/L1L+oSJkTzUtHvkjguJEaCt/2LqaRtxtzar/bIy7WT701u
         maPQZkDiihBBCop6GpwP6rLxEvIokVFHaTht3JpiSLpsTEXXZx1FYA+B/7sumSJPjQUZ
         j3dg==
X-Gm-Message-State: AOAM530HeSjkILEMn85QWodPrDmNV+KY05h2wRmQW/QyinizBwWzR1XH
        easo6e42vp6MKzZVp1xyBHxUxfqEva3LBj3I70nARHpu74hkXlX9Mib9oQiZP8Ux6Yp5LPScJZO
        K31/GIDpzc6fpff6C0jLNN3Fsx1DdV9tGJA==
X-Received: by 2002:a05:6402:746:: with SMTP id p6mr3354044edy.313.1609924645421;
        Wed, 06 Jan 2021 01:17:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySWOSAgxnffC8LBV3wDGbija0UW5bX4NCm1gy26Oam0C1xmlbog1r2rFQq7ZWJYvqHt58O5w==
X-Received: by 2002:a05:6402:746:: with SMTP id p6mr3354035edy.313.1609924645315;
        Wed, 06 Jan 2021 01:17:25 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id z24sm1187871edr.9.2021.01.06.01.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 01:17:24 -0800 (PST)
Subject: Re: [PATCH 0/2] IdeaPad platform profile support
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Mark Pearson <markpearson@lenovo.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210101125629.20974-1-jiaxun.yang@flygoat.com>
 <35ac853a-266c-6944-6e5e-6286456865e3@redhat.com>
 <CAJZ5v0jcCD3qWUJQcS+nFVJWSCQEbq2eN3i07mN8yFr3WZD9dg@mail.gmail.com>
 <6a29f338-d9e4-150c-81dd-2ffb54f5bc35@redhat.com>
 <CAJZ5v0je41iXQnr3m-RY9fD_C-qnqbLdqYMvUzp0qgBwEvVoJA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9e745724-d704-6250-9bfb-e347f3611ec4@redhat.com>
Date:   Wed, 6 Jan 2021 10:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0je41iXQnr3m-RY9fD_C-qnqbLdqYMvUzp0qgBwEvVoJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/5/21 6:18 PM, Rafael J. Wysocki wrote:
> On Mon, Jan 4, 2021 at 9:58 PM Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>> Patch 1/2 does use a slightly different approach then I suggest above,
>> thinking more about this it would be cleaner IMHO to just pass the
>> cur_profile pointer to the callbacks as the pseudo-code patch which I
>> wrote above does. Drivers which use globals can then just ignore
>> the extra argument (and keep the platform_profile_handler struct const)
>> where as drivers which use dynamic allocation can embed the struct in
>> their driver's data-struct.
> 
> Agreed.

Note that Jiaxun has provided a v2 of this patch-set with patch 1/2 implementing
the new approach.

Can you merge merge that patch please and then once you're happy that this
has seen enough exposure in -next, provide me with an immutable branch with
the 3 platform-profile patches in it ?

Regards,

Hans

