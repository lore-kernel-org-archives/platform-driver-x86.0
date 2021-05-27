Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1BBC4707F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 611216105A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbhE0JVZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 05:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28836 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235720AbhE0JVZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 05:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622107191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l5AT7+XiFfSHkDoHdiSKE9OFvBXu/1i5qex0cVuzWvk=;
        b=IzliEya56plolgZvDA94gRHdROTBKZ/EtOzN9IneB5n76rUaDV/sxV2yGeOMu0XT5LvVbd
        UFVVxgT/ppHzr3aKhS2T59wD0aR57Gt0EPOP8Mnawv97wMiGDQpSObyoP4N8P8kmeQdkAY
        YXScnZ1xpZa3eWHXe8DmttwxfSD1ks8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-WIKHwYCjPp-BmNtUk2zAvQ-1; Thu, 27 May 2021 05:19:50 -0400
X-MC-Unique: WIKHwYCjPp-BmNtUk2zAvQ-1
Received: by mail-ej1-f72.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccso1415229ejn.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 02:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l5AT7+XiFfSHkDoHdiSKE9OFvBXu/1i5qex0cVuzWvk=;
        b=I4uDJLSkwLxpB2/2Gh0EwGsFW4gRuAwNtkoGCoFs3OjMqGw9PPAFotBIc5We7Fhiao
         bvu6JHdOfpb7TMRTYmVLiIOqarsdOsHX1exzLi8DGnFqzCL0WzbA1UeTeefgU3hdD1+v
         jai3TrJ8NvUSuXL5PRGpfpFBSRVb/VTkpIkDNoICTgKAPwJzLbDInmx36AJD76QF/3J+
         apSCkeXqMTfHFKpHrYlKrz1tSWW/wO4EZFAPptQd9DavMm8cdNEytjJe1jMbLsbCHOEP
         fAbB/nDnyhWLUJayMCx0YWYw/L3jpiOxhl8vFzhmpPXqw9oNi/X6kaHwkVN+g13xRTZ5
         onZw==
X-Gm-Message-State: AOAM530bbH0y6Qb9+ioq6f95+fN3NnV4o1rSXHbMPSH3gPOY3B1PvdrB
        rPmnjAZgTmRJtJm8PfproZACASooBZzqWfWafZ5x+UxelyxFH7LDZITVDU3RVdYfZwwqFifyAEH
        t3nP6ibeeSVgwkuGA9P/XJrFJ3hmA8ZM/XbJZYaXIjbfpko9gSDzSIXIKUFufaR1KZNKa6Q+aHl
        Ow/DaD5l3j4g==
X-Received: by 2002:a17:906:af72:: with SMTP id os18mr2728328ejb.327.1622107188906;
        Thu, 27 May 2021 02:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF3ht91NKcGmuEtwCNlJnCTYHGDcN7KCD9ifZzXQ4lL0v/9vzrdnpyUNE4TWLEfxp+1wLsuA==
X-Received: by 2002:a17:906:af72:: with SMTP id os18mr2728315ejb.327.1622107188746;
        Thu, 27 May 2021 02:19:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cn21sm766459edb.36.2021.05.27.02.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 02:19:48 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     andy.shevchenko@gmail.com, prasanth.ksr@dell.com,
        divya.bharathi@dell.com, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d7503e00-25e2-35b1-021a-dbfca88ec2c1@redhat.com>
Date:   Thu, 27 May 2021 11:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526201447.3686-3-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi again,

On 5/26/21 10:14 PM, Mark Pearson wrote:
> For Lenovo platforms that support a WMI interface to the BIOS add
> support, using the firmware-attributes class, to allow users to access
> and modify various BIOS related settings.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Mark, checkpatch.pl is complaining about this patch not adding a
MAINTAINERS entry for the think-lmi driver, can you please do a
follow-up patch adding a MAINTAINERS entry for this?

Regards,

Hans

