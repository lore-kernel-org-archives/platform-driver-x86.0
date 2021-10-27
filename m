Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78F9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 13:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A386360E74
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 13:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242291AbhJ0NyQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 09:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54832 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242287AbhJ0NyP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 09:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635342710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rbSK7kH4DvvqtjJGgABQf4nj5P3f/YQZbmJ32z/na10=;
        b=Y39No6ai6KZ8iTlboREB40OxjO3l/WdcZ1+3ScQ5lxgivyVAW8hWLugCJltj0FOStl6+Tc
        2CbQ3+OP65rUjJg9FWOfgl6arQqVj36yxck0dz1qUf9G1qkbAL6N+6OJlZ3FuXNOBqCjWh
        P7ACkGRshHbg3qoG9KpT2lAsyHOkwmc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-G_8-a-fONlWGKi_a8YoNPg-1; Wed, 27 Oct 2021 09:51:48 -0400
X-MC-Unique: G_8-a-fONlWGKi_a8YoNPg-1
Received: by mail-ed1-f71.google.com with SMTP id s12-20020a50dacc000000b003dbf7a78e88so2396003edj.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 06:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rbSK7kH4DvvqtjJGgABQf4nj5P3f/YQZbmJ32z/na10=;
        b=5Iibb/CRFSllKjC35z0mppnTOZwDUzBk/kjs/0+WxXb9l/pcJHDHvWiQoha9uUh+zO
         Un/efLTg84YEGbzcI84LrOCfyOTMJv9Rj5uMY0dG+7XfP4gSm1snUizZ/T4v8HV+4G6V
         d3FtPnzDj0LAkWlaMTpEDR2TKMTq5oJNouqwC5vYaWJvcagQYEIUYYYF4eD3ET3SuC6m
         YHB7+s8S8FOnhNBlIJVzHlFmvx39fZXsCqEhd4+b1HUoZPnRiL39cejqDGIYby19X056
         Ag16HM95cC5hIh/W0DJ8cLVR0rbaslz7jyZfMgqAzqAHrIL7MIy5Mu1uKQvigNtZkdg8
         s00g==
X-Gm-Message-State: AOAM531GuAeclZCugHiEzvsRTp3f8/iilodZvQO8N3Ci68LEnjLphRFm
        eZjRX5Q348f6X9hXGkypY9sZ8UzRXeH76QS5q4Eyuimch3XbJ5BMbKjZvVSfaq+JhNr8awslnL6
        3XRaktoq3OsrkVS1pQ3PwAoE+jz1rnG2d5A==
X-Received: by 2002:a17:906:7f89:: with SMTP id f9mr24773579ejr.261.1635342706749;
        Wed, 27 Oct 2021 06:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXuc5G8JrlqqoodV+1iyuKRfDXwzi2sdNu63XfMsduAvTwcpYautkGZ7GzxJ7wytVnH1P12w==
X-Received: by 2002:a17:906:7f89:: with SMTP id f9mr24773551ejr.261.1635342706543;
        Wed, 27 Oct 2021 06:51:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z4sm51947edd.46.2021.10.27.06.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 06:51:46 -0700 (PDT)
Message-ID: <2ef89421-a783-e1b2-0a31-1f2be5343e22@redhat.com>
Date:   Wed, 27 Oct 2021 15:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/3] Let other drivers react to platform profile
 changes
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Cc:     "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>, markpearson@lenovo.com,
        linux-acpi@vger.kernel.org
References: <20211026190835.10697-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211026190835.10697-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 10/26/21 21:08, Mario Limonciello wrote:
> Currently only one driver can register as a handler for a platform profile.
> 
> This limitation means that if multiple drivers want to react to platform
> profile changes that they will need to directly interact with individual
> drivers.
> 
> Instead introduce a notification flow that drivers can register for event
> changes.  The idea is that any driver that wants to can:
> 1. read the current profile
> 2. set up initial values
> 3. register for changes
> 4. react to changes
> 
> Changes from v3->v4:
>  * Simplify platform_profile_notify
>    - No need to check cur_profile as platform_profile_get does it
>    - No need to track ret as it's unused
> Changes from v2->v3:
>  * Add patches to avoid collisions in hp-wmi and asus-wmi symbols

We typically do not merge new in-kernel API without at least one
consumer of that in-kernel API.

I can take patches 1 + 2 now as prep work for the future,
but I would expect Rafael to only want to take patch 3/3 if
you post a new series which also includes at least one consumer
for the functionality added by 3/3.

That will also make it a lot easier to review 3/3 / to consider
other means to reach the same goal.
Rafael, do you concur?

Regards,

Hans

