Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43849C47084
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 12:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 280016142D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 12:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbhEYMqK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 08:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51651 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232784AbhEYMqF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 08:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621946673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SB3TFcBYe+oh//M+r+JgvvKsJxvRHIyMt9IEethbGxM=;
        b=dnBZXTUuNNqm1c39PVlkMKmZ23fq9GED99l45bsM1Ugk0+HKXpD5wkFCTkBFp5Y/kGhO/V
        +4qoQhWXMdt+nXJ4lwrbAszQsW/jTDWo1X4GeXYqOABu4vFlp+Z/UhEN4wSOVz0I5zo7dX
        SmncW1hEJfHY5Rwcpvut52Aed24/hgs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-8dGeaxiMPQSRiZ7iua97_A-1; Tue, 25 May 2021 08:44:32 -0400
X-MC-Unique: 8dGeaxiMPQSRiZ7iua97_A-1
Received: by mail-ej1-f69.google.com with SMTP id z1-20020a1709068141b02903cd421d7803so8747080ejw.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 May 2021 05:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SB3TFcBYe+oh//M+r+JgvvKsJxvRHIyMt9IEethbGxM=;
        b=fDeIMOEkrV2E0c5t97AkhUm5c0DgJjQJ36inui+Mi6QkiYdxh6eCRK1Jv/7PZ65HW3
         qdd8wVg3mv5FeQF0Nf7wDinGud/5JKvAFCvObNWN/vfXDqZ4tlPnXN73jjEcSclfRriJ
         J15z/ehg4DVbmv0QpNP/0Nr5SypoRt2xrD2j1o74HfAm6zTUw8HRnPpdfN+epN3vl3Dw
         YReR10zGlfzVQRre6lGpwnbcTUTbtDGYDSx5GsTOZY1hMyIXzN2/MxDlBQwSO0Zqsjwi
         nPzHl0hKghizXQc6D7SKp1iip+Gv+Pts7JNPazS+KadZoTnmKngH7JLOHJ58iJ0OYhBd
         EpfQ==
X-Gm-Message-State: AOAM531z2kYXhi2h4Jaurn7agQ8TzGmBxmI7oTTVJEu0QxDZih8mFW/1
        9Tzu1AojXxk5LK0wGxd7Ew8L3rXMGU+UH49/Sg0uOxEg7a4tBz59hQkyqTOl0D9DkKROxBUAHAx
        0dSpuZxoX7ZneoIPCdxLyuczJC0/l3aLvvQ==
X-Received: by 2002:a05:6402:2788:: with SMTP id b8mr27872707ede.335.1621946671221;
        Tue, 25 May 2021 05:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDroG1SU+C7kU4bJ4egpv1PDlQFVhmcJcYrV2lM7cK6onj4JtCKssQlefxcJjGWDv85TbZZA==
X-Received: by 2002:a05:6402:2788:: with SMTP id b8mr27872699ede.335.1621946671113;
        Tue, 25 May 2021 05:44:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id x13sm9165601ejs.93.2021.05.25.05.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 05:44:30 -0700 (PDT)
Subject: Re: [PATCH 0/3] platform/surface: aggregator_registry: Support for
 Surface Laptop 4 and cleanup
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210523134528.798887-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <899ed5ac-30bb-000c-cdd4-78a4b9625467@redhat.com>
Date:   Tue, 25 May 2021 14:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523134528.798887-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/23/21 3:45 PM, Maximilian Luz wrote:
> Hi,
> 
> this series adds support for the 13" Intel and 15" AMD versions of the
> Surface Laptop 4 and does some small cleanup regarding duplicate node
> groups in the registry.
> 
> Unfortunately I haven't heard anything of the 15" Intel version and 13"
> AMD version yet.
> 
> Hans, can you apply patches 1 and 2 as fixes for v5.13? That way we'd
> have decent support for the SL4 (at least the aforementioned versions)
> in v5.13.

Thank you for the patches, I've added these to my review-hans branch
now. I'll also cherry-pick 1 and 2 into the fixes branch as requested,

I plan to send out a second pdx86/fixes pull-req to Linus the week that
5.13-rc5 is released.

Regards,

Hans

