Return-Path: <SRS0=hdUH=EF=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495A4C4741F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Oct 2020 18:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D702D2151B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Oct 2020 18:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RqKX+DP0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgJ3SQ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Oct 2020 14:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29940 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbgJ3SQ6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Oct 2020 14:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604081816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hQ9JbkxvNa0VjLQd06HFpKY/mjumkrtDAKSURNuwMaY=;
        b=RqKX+DP0RS54Yr1lQ/F8Bed33mIAGibN1Yno7dIuYutZz0mrrpoUGmG9qdNfJauA/cPyYt
        uULqyRlrpEPkFas8N65+mTu4LqFsVq8Z7Vp5LWZmJdMiEilYpMF9zUI/UyQubuPeHe2SIy
        49Syu43b6rmf5+egDoxmfA1AERFWD6U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-fObwbbl5O36UkkPAxPGaGA-1; Fri, 30 Oct 2020 14:16:54 -0400
X-MC-Unique: fObwbbl5O36UkkPAxPGaGA-1
Received: by mail-ej1-f70.google.com with SMTP id t1so2737239ejb.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2020 11:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQ9JbkxvNa0VjLQd06HFpKY/mjumkrtDAKSURNuwMaY=;
        b=DLCZO6mItNcm8lxZxKtMaKvTu/yf0OL89wLFPwI0OQWFCZLamj5zgL3j/5swwF7C15
         VE1/GT0HUEtxDRR+e29zVYBLV1LtAltOtJ2nS2t8ILd99YdZuv4CprcQuLd8wQMQvbB6
         KwlQT/aNISTiydjeif0ZZxHoBIk4Fpkbxzr5jhxnGPXbz/1cqyClcEWUfAyyaTkN298b
         qObd7d+aaeshmrjddRmRgF9JlTcNcjv1XXKJpYXIsvuOHVzZhWRt2tpq1R91VUWBRWrv
         T0XMuHjM/5ISz+QQEBYSmv9sqcP+/ujBXbRZNLWfs4nRZ23t23ZQI3hO4IePHwujEuoA
         u3GA==
X-Gm-Message-State: AOAM532UJ+vXvyJq3prjMPTzjT31Giyz6jeYgT3JKbwOQJMwQYDMdCHl
        QJJiK9kihyIXXV+qMSvMOjBzSj3xw3rPVl1Ry+/GEHbGfkdNjYeUhU1doOSPd4J7wmU5zclhyGR
        QcqsPDYQM7gNgmdQxhPOMhpSC9sPBQQfvwg==
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr3678293ejz.341.1604081812909;
        Fri, 30 Oct 2020 11:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxORp9yhzCHXkXQ+SV0R3eIJai4qo4teWFQf7D18bUb6YmyTx02WLXvoVEuul2E5KtdAUsMg==
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr3678275ejz.341.1604081812714;
        Fri, 30 Oct 2020 11:16:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id r24sm3338060eds.67.2020.10.30.11.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 11:16:51 -0700 (PDT)
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To:     David Laight <David.Laight@ACULAB.COM>,
        'Arvind Sankar' <nivedita@alum.mit.edu>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     'Arnd Bergmann' <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
 <20201029165611.GA2557691@rani.riverdale.lan>
 <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
 <87v9esojdi.fsf@nanos.tec.linutronix.de>
 <20201029213512.GA34524@rani.riverdale.lan>
 <ad73f56e79d249b1b3614bccc85e2ca5@AcuMS.aculab.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <070f590f-b702-35f0-0b6c-c6455f08e9d5@redhat.com>
Date:   Fri, 30 Oct 2020 19:16:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ad73f56e79d249b1b3614bccc85e2ca5@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 29/10/20 23:12, David Laight wrote:
>> https://godbolt.org/z/4dzPbM
>>
>> With -fno-strict-aliasing, the compiler reloads the pointer if you write
>> to the start of what it points to, but not if you write to later
>> elements.
> I guess it assumes that global data doesn't overlap.

Yeah, setting

	p = (struct s *) ((char *)&p) - 8;

invokes undefined behavior _for a different reason than strict aliasing_
(it's a pointer that is based on "p" but points before its start or
after one byte past its end).  So the compiler assumes that only the
first few bytes of a global can overlap it.

If you change the size of the fields from long to char in the compiler
explorer link above, every field forces a reload of the global.

Paolo

