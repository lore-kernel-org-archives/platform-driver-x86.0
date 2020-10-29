Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176C9C4363A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 07:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7A0E218AC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 07:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G4hu6+LP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgJ2HV0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Oct 2020 03:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60953 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726083AbgJ2HVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Oct 2020 03:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603956067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k+MySIa0GO5sAsedbOJklvkP1JxXrpHRlnL4dRpsf/4=;
        b=G4hu6+LPzLZiY1zNpGWejRN1iRAMp2Q2GNLdqbmT257sRo+Bf1ysqV76lin2NVdC+gC5Sh
        No6beNH6NsXdi/Tmmh9Ux0nYYZnj2F4Rw8fbM6NpyN+MWhCDkE15FY8CvZIP3Z7h8kTUP9
        /Nafq0HQkbH7z+N7kfT/JkJvMux6zjQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-TTzmUK4dPX6MufV5HB8mBA-1; Thu, 29 Oct 2020 03:04:35 -0400
X-MC-Unique: TTzmUK4dPX6MufV5HB8mBA-1
Received: by mail-wr1-f70.google.com with SMTP id m20so865815wrb.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2020 00:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+MySIa0GO5sAsedbOJklvkP1JxXrpHRlnL4dRpsf/4=;
        b=bsTVi4mrX9JOxdend8M+bhqxqewPSmBUZoQPv3xR1KYKxEOkcrcnywc/PX9uZWbcmx
         hQsG2IANwrY3dN21qtohe1bqp7zLJnAgRK6fAG/txd2AWX0Dn+bGUR8rVxK0vDWtgYcX
         GFh7GLu3z4mvQzff+nZRuOpHw7AYpQ6oDXm8O1qFWTKyyHevCKNVHQNy8gWpe6tkOfQF
         ThU4Hr4veSHK4dAYyWv1OlrpbPbwzFOvGiASQXkCG2qxM9bgDbBpUv2wtl0aJWNV86vI
         N9BMZQAiOgHPoyPTGHfmBLglBPfidMs+Z0yTa50/OvkewBUawGbz+oATILQ4H8m/XsWy
         7PfQ==
X-Gm-Message-State: AOAM530LU1YBe+sONAj+ubb5Jw+TxDeOWHZqcUd0oM/R3QDCuG6JTpZ6
        HJmHodpwPmQBsR4h2yyhIOmUMwQUKbCxUC6Bow3jaoh/iHwTlVC698hH2RLKJdC1jsGY7wJK8pZ
        fJbmuidWP5K3UTPtUu5yVsTgVjyKHSH9NgA==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr3780272wrm.53.1603955073922;
        Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjtd7rX2GzPMeGPldc12GMpi5saPCqNeQJ2ZCa70evuRQIB96hYYOHQ+JlKqMs5entrVHldQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr3780234wrm.53.1603955073729;
        Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id 3sm2825527wmd.19.2020.10.29.00.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To:     Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, linux-hyperv@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
References: <20201028212417.3715575-1-arnd@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
Date:   Thu, 29 Oct 2020 08:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028212417.3715575-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 28/10/20 22:20, Arnd Bergmann wrote:
> Avoid this by renaming the global 'apic' variable to the more descriptive
> 'x86_system_apic'. It was originally called 'genapic', but both that
> and the current 'apic' seem to be a little overly generic for a global
> variable.

The 'apic' affects only the current CPU, so one of 'x86_local_apic',
'x86_lapic' or 'x86_apic' is probably preferrable.

I don't have huge objections to renaming 'apic' variables and arguments
in KVM to 'lapic'.  I do agree with Sean however that it's going to
break again very soon.

Paolo

