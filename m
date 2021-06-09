Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D105C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 458F16139A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbhFIOgv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237208AbhFIOgu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 10:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623249295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hyhhNttI6O1fLxHTOPrG7JORk/Ntqh0YxF/LsYbSkM0=;
        b=Qd8VWEgogrBrrhjVXVgHQsLsVLzn/XLmYM0NqvLXXvUXmi1JDNURHnz115QC/pwK94ZcbQ
        AbkGI2Nwfcfr7M4BDiHwxG71o0gjm53XfmaWdXkes9RLROg8yQhAa9KxXu9Ay7CJG666OG
        vzVcAjnJcLNPbkV9bZflrymf/241tbw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-2APW_T6vMaOjk_QtMcs_lw-1; Wed, 09 Jun 2021 10:34:54 -0400
X-MC-Unique: 2APW_T6vMaOjk_QtMcs_lw-1
Received: by mail-ej1-f72.google.com with SMTP id b10-20020a170906194ab02903ea7d084cd3so8130319eje.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 07:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hyhhNttI6O1fLxHTOPrG7JORk/Ntqh0YxF/LsYbSkM0=;
        b=nntnoqkMdCQvqJxKiIpgSy/pWEGE6f3g5z3eCMvGoKEhrf5qDpYRglVeJToWr2DIHY
         wb5CbhmdmdqKNTA4S/a1wlw+CnuM5HCFDGDvtZfKuZKyqc7KncpQGv/6FTTYk7RfknDw
         95iic8ZSRX5aLp+8B4Fep7E0vJ09B0kJe9pMfISureZXoWJYkzHzq1TE2iYYc7fH0C28
         RRdjDb7KtPyQiiAovSLHwonOS+asx3Z9NGFEGmlTpKyqhXV4lFX1BrTdj83XbnlfSfIv
         Bdza8SZAk9OUoJABtvOWZbEZ8645+TKpTnCUACTd7JwmE8Xu7YIztYcsQZuuvA/j4d7J
         grQg==
X-Gm-Message-State: AOAM533LK0YiL4+tcU+l46UHvdNlOvjhqbtLhAsd4JeN/5jvFKTbwsk2
        2S4wyaI4Af5/60ET1GspXEQR2/LoWtj24Ju8rLLspfeAN4xAlk0DJxY28zK3HFlkYK9FHl/CfE+
        +t/CwRKDoonMF7Mzebb5IwPxXz1oF1A2QIQ==
X-Received: by 2002:a05:6402:510e:: with SMTP id m14mr22676348edd.225.1623249292466;
        Wed, 09 Jun 2021 07:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNcFshXRLlE3PjGlHZEXyQ+jEUn9HQR6Wam1uj3zCbLT5RmDmSAr4RnqIUuUnvZPU23GZglQ==
X-Received: by 2002:a05:6402:510e:: with SMTP id m14mr22676332edd.225.1623249292347;
        Wed, 09 Jun 2021 07:34:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z63sm1237928ede.36.2021.06.09.07.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:34:52 -0700 (PDT)
Subject: Re: [PATCH v5] platform/x86: firmware_attributes_class: Create helper
 file for handling firmware-attributes class registration events
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Mark Pearson <markpearson@lenovo.com>, andy.shevchenko@gmail.com,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <markpearson@lenovo.com>
 <20210530223111.25929-1-markpearson@lenovo.com>
 <98d213aa-9500-64f7-9fce-b880a6322d01@redhat.com>
 <YL+tch7KHVCAqJI+@Ryzen-9-3900X>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a3442c2d-9410-4d74-ef7c-297c686e70dd@redhat.com>
Date:   Wed, 9 Jun 2021 16:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL+tch7KHVCAqJI+@Ryzen-9-3900X>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/8/21 7:48 PM, Nathan Chancellor wrote:
> On Mon, May 31, 2021 at 03:56:41PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/31/21 12:31 AM, Mark Pearson wrote:
>>> This will be used by the Dell and Lenovo WMI management drivers to
>>> prevent both drivers being active.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> ---
>>> Changes in v2:
>>>  - This is a new file requested as part of the review of the proposed
>>> think_lmi.c driver. Labeling as V2 to keep series consistent
>>>
>>> Changes in v3:
>>>  - Set default in Kconfig, and removed help text
>>>  - Allow multiple modules to register with module. Change API names to
>>>     better reflect this.
>>>
>>> Changes in v4:
>>>  - version bump for consistency in series
>>>
>>> Changes in v5:
>>>  - Fix issue reported by kernel test robot. Add header file to includes
>>
>> Thanks Mark,
>>
>> Unfortunately you squashed the Kconfig and Makefile changes which I made
>> to v4 when fixing it up during merging into 3/3 instead of having them in
>> v5 of this patch.
>>
>> No worries, since this was the only problem which I could see I've fixed
>> this up in my review-hans branch while merging v5 of this series there
>> (replacing v4).
>>
>> I did notice a bit of dead code while reviewing the changes which you
>> made to 3/3 in response to Andy's review. I'll send a follow-up patch
>> fixing that.
>>
>> I'll leave this sit in my review-hans branch for a bit to give Andy
>> a chance to give his Reviewed-by and then I'll push this to for-next.
>>
>> Regards,
>>
>> Hans
> 
> It looks like this series causes allyesconfig to break on linux-next:
> 
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/2773158286?check_suite_focus=true
> 
> $ make -skj"$(nproc)" allyesconfig all
> ld: drivers/platform/x86/think-lmi.o:(.bss+0x0): multiple definition of `fw_attr_class'; drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:(.bss+0x0): first defined here

Thank you for reporting this. This is caused by both these files:

drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
drivers/platform/x86/think-lmi.c

having a global struct class *fw_attr_class variable, which should
be static in both files. I'll send a patch fixing this (and merge
the patch into the pdx86/for-next branch).

Regards,

Hans

