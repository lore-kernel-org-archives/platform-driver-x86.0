Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2910C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 09:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64EFE2255F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 09:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAFJPx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 04:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32182 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725879AbhAFJPw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 04:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609924465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+uJpEF7Uk5EUUiqpyeX/cKe3mpeFZj5IKRx2fug0EYI=;
        b=ikD7rwC9/E5sgKaDy+t9MfgS+yye4RBBnknOn0KVz+PyvU407X8pmzZmzq9xZQAhHz571z
        DzFYuU9JB2hFHOf/WiSwv+S9jyKrtZol4JyuSkYFEN9jZyGl3xSRogOBDhT0fgsV1/7az1
        Lo9Ko4Y7cybLRIsaZLY6agvLidTpXlc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-5yBOiOM_OuW6VteDmQIGMA-1; Wed, 06 Jan 2021 04:14:23 -0500
X-MC-Unique: 5yBOiOM_OuW6VteDmQIGMA-1
Received: by mail-ej1-f70.google.com with SMTP id q11so1056133ejd.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 01:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+uJpEF7Uk5EUUiqpyeX/cKe3mpeFZj5IKRx2fug0EYI=;
        b=Wx3G1Aq7/gBDU7TKkuvousKJZPRFIFwegrtFiUd9TanYnir70BjGKoQ97UGzK28uxR
         VbiSl4/6rC7fJgBLgfayRgl+XO7HRPBTEyiKLg2x7sIFT97U4F5Ikf/gbIEQ5xc9fV8d
         xmCnm0cKKhegBMKYgWGs6RlVxPr0XEhivNGaw25BO6QE/V34XYV/TA+L4ncZeIXDUJiX
         GhXVQF5HkJ1SIhQVMiTB0zLinEAl3f4F58N5nEPojRXDfYpjhLblvPpsBOWvL8Sael0n
         QpS1qRZIHbZATNWL/35OY3o5f+OLnrKY4rYyBZuy8xC5gc63n5RL7gHMgfrj0QSOkX3w
         lWhw==
X-Gm-Message-State: AOAM533H6P+RcCdbwpe5eXpzxfuSHkUKj6UuvDQAk6ibyYp0KTAVipw/
        eGzjHRy7Ph2IV7VVzAUcy4RQVBzgogR8cgyn9lWz719oQo7nntWpJ8l3n00Ot4u4g+7d+OClTlc
        Y5bjdzxv3ccQiwkyANMWCeQ9gBZJSGDe2PA==
X-Received: by 2002:a05:6402:7d7:: with SMTP id u23mr3222597edy.325.1609924462254;
        Wed, 06 Jan 2021 01:14:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT1YbzSvRpNyLPQLciE05RouG9Vvoa41X30q1WIvY2yiZpHAhizOuNPhATcI8jzJEjDiZO6w==
X-Received: by 2002:a05:6402:7d7:: with SMTP id u23mr3222586edy.325.1609924462082;
        Wed, 06 Jan 2021 01:14:22 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id b21sm1185407edr.53.2021.01.06.01.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 01:14:21 -0800 (PST)
Subject: Re: [PATCH] thinkpad_acpi: fix: use scnprintf instead of snprintf.
To:     Joe Perches <joe@perches.com>,
        YANG LI <abaci-bugfix@linux.alibaba.com>
Cc:     mgross@linux.intel.com, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1609914976-28113-1-git-send-email-abaci-bugfix@linux.alibaba.com>
 <2d5f6ffcf47ec4675cde21ff52fc70a9dd13b023.camel@perches.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a08d4a47-df4a-5486-9b31-0548aebaf358@redhat.com>
Date:   Wed, 6 Jan 2021 10:14:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2d5f6ffcf47ec4675cde21ff52fc70a9dd13b023.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/6/21 10:01 AM, Joe Perches wrote:
> On Wed, 2021-01-06 at 14:36 +0800, YANG LI wrote:
>> The snprintf() function returns the number of characters which would
>> have been printed if there were enough space, but the scnprintf()
>> returns the number of characters which were actually printed. If the
>> buffer is not large enough, then using snprintf() would result in a
>> read overflow and an information leak. This error was found with the
>> help of coccicheck.
> 
> In all cases, the buffer _is_ large enough.
> 
> tmpi is length 5 and ok.
> include/sound/core.h:   char shortname[32];             /* short name of this soundcard */
> include/sound/core.h:   char longname[80];              /* name of this soundcard */
> include/sound/core.h:   char mixername[80];             /* mixer name */
> 
> _show function lengths are OK for all the uses with PAGE_SIZE.
> And it's probably better to use sysfs_emit for all the _show functions

Yes, please send a v2 with the following changes:

1. Use sysfs_emit in all the sysfs read functions
2. Do not replace snprintf with scnprintf when the return value is not used, that is just needless churn
3. Update the commit message to reflect 1.

Regards,

Hans

