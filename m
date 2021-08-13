Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23F5C432BE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 11:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C702A6104F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 11:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239683AbhHMLS4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Aug 2021 07:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30151 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239428AbhHMLS4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Aug 2021 07:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628853509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B1YAoDB2tVdVkwW31D/57wP+jmLuaBJs6eYuBTaRpCA=;
        b=KYZUfABexpL5BGuPvCjBOp+/K8o9L/UD1gYZysDh2i/S+heIK2qWiBYnkk/5/dYMCd48vV
        8fSzDe5g2vPN9L8NuqZUOuhrH9D3zMZg6iZ7VtW5pyf610FJh/9og56YM1J9nmB2/9SlWp
        vW69vlyKGEJH4OK2U6OZJxjdF3xPNkk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-hyrsW-qyPz-d7MxdO_e3xA-1; Fri, 13 Aug 2021 07:18:28 -0400
X-MC-Unique: hyrsW-qyPz-d7MxdO_e3xA-1
Received: by mail-ed1-f72.google.com with SMTP id n4-20020aa7c6840000b02903be94ce771fso4182072edq.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Aug 2021 04:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B1YAoDB2tVdVkwW31D/57wP+jmLuaBJs6eYuBTaRpCA=;
        b=ra3aFpEfby6DPEVsjlUzJw3V+nFiUVZhea9ISAOf3wQEctimt1VdwAFoClTX+hh/ug
         fMZQsVSY6QBE+aHp+uhKpkJrbp6OtIny9HLK6DrE1HCiXL2juvZ2/DF4LxsaSF1RUJXC
         0LFY+1gqHE0UGPcJLH+2WljaCMShnebHwQ48JshG+Ei3ly1b3qCZCSrosNwfXDUzWjXG
         gpnfdXP3GG7IRxh73B8HxyUrZfcyFdxlEAu1agSsrcV2598HL+mibshGWFNWg8/wHYq1
         pTvZ2rlTCK6DTLwcn/Y6M34kfuD7Fs6Pu1FSEVo6jtTAeQ7Rwm2Ek3bAYUVqH2nkztDg
         LvJg==
X-Gm-Message-State: AOAM532Ul6ZGoF7p+4zxpmCalSNYD9jAugppMRefMG4t6U/4uzT7y4LN
        jopSiEULEk7GHwkrg45PxSHFdxEyQSMJOuNVWcMJcRwZZStK+x1Tpb0QupuN2bvnRQOhFLghAXo
        DqDcmFvDdLqJaI0uRosBsTaJ5B+ZeCfcLSA==
X-Received: by 2002:a05:6402:cb9:: with SMTP id cn25mr2436205edb.271.1628853507016;
        Fri, 13 Aug 2021 04:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA3N6Ogi9ZcphDRsJSWT9CUAXF5A4SNj/CljSRgFDjcGGHCFK9t0C6FF3Eze3xLODmpSCiDA==
X-Received: by 2002:a05:6402:cb9:: with SMTP id cn25mr2436182edb.271.1628853506848;
        Fri, 13 Aug 2021 04:18:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id x15sm494448ejv.95.2021.08.13.04.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 04:18:26 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: Update Mario Limonciello's email address in
 the docs
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
        Mario Limonciello <mario.limonciello@outlook.com>
References: <20210810160900.106512-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f446d01-1f38-8b49-369c-891068e756dd@redhat.com>
Date:   Fri, 13 Aug 2021 13:18:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810160900.106512-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/10/21 6:09 PM, Hans de Goede wrote:
> Various pdx86 docs under Documentation/ABI/testing still use Mario's
> old, now defunct, <mario.limonciello@dell.com> address.
> 
> Update the docs to point to either the new Dell.Client.Kernel@dell.com
> email alias for Dell specific drivers, or to Mario's new @outlook.com
> address for other drivers.
> 
> Cc: Dell.Client.Kernel@dell.com
> Cc: Mario Limonciello <mario.limonciello@outlook.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  Documentation/ABI/testing/dell-smbios-wmi                 | 2 +-
>  Documentation/ABI/testing/sysfs-bus-thunderbolt           | 2 +-
>  Documentation/ABI/testing/sysfs-class-firmware-attributes | 8 ++++----
>  Documentation/ABI/testing/sysfs-platform-dell-smbios      | 2 +-
>  .../ABI/testing/sysfs-platform-intel-wmi-thunderbolt      | 2 +-
>  Documentation/ABI/testing/sysfs-power                     | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> diff --git a/Documentation/ABI/testing/dell-smbios-wmi b/Documentation/ABI/testing/dell-smbios-wmi
> index 5f3a0dc67050..f58229084469 100644
> --- a/Documentation/ABI/testing/dell-smbios-wmi
> +++ b/Documentation/ABI/testing/dell-smbios-wmi
> @@ -1,7 +1,7 @@
>  What:		/dev/wmi/dell-smbios
>  Date:		November 2017
>  KernelVersion:	4.15
> -Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Contact:	Dell.Client.Kernel@dell.com
>  Description:
>  		Perform SMBIOS calls on supported Dell machines.
>  		through the Dell ACPI-WMI interface.
> diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
> index 95c21d6c9a84..b7e87f6c7d47 100644
> --- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
> +++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
> @@ -232,7 +232,7 @@ Description:	When new NVM image is written to the non-active NVM
>  What:		/sys/bus/thunderbolt/devices/.../nvm_authenticate_on_disconnect
>  Date:		Oct 2020
>  KernelVersion:	v5.9
> -Contact:	Mario Limonciello <mario.limonciello@dell.com>
> +Contact:	Mario Limonciello <mario.limonciello@outlook.com>
>  Description:	For supported devices, automatically authenticate the new Thunderbolt
>  		image when the device is disconnected from the host system.
>  
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 3348bf80a37c..0b43997b76e3 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -2,8 +2,8 @@ What:		/sys/class/firmware-attributes/*/attributes/*/
>  Date:		February 2021
>  KernelVersion:	5.11
>  Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
> -		Mario Limonciello <mario.limonciello@dell.com>,
>  		Prasanth KSR <prasanth.ksr@dell.com>
> +		Dell.Client.Kernel@dell.com
>  Description:
>  		A sysfs interface for systems management software to enable
>  		configuration capability on supported systems.  This directory
> @@ -130,8 +130,8 @@ What:		/sys/class/firmware-attributes/*/authentication/
>  Date:		February 2021
>  KernelVersion:	5.11
>  Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
> -		Mario Limonciello <mario.limonciello@dell.com>,
>  		Prasanth KSR <prasanth.ksr@dell.com>
> +		Dell.Client.Kernel@dell.com
>  Description:
>  		Devices support various authentication mechanisms which can be exposed
>  		as a separate configuration object.
> @@ -220,8 +220,8 @@ What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>  Date:		February 2021
>  KernelVersion:	5.11
>  Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
> -		Mario Limonciello <mario.limonciello@dell.com>,
>  		Prasanth KSR <prasanth.ksr@dell.com>
> +		Dell.Client.Kernel@dell.com
>  Description:
>  		A read-only attribute reads 1 if a reboot is necessary to apply
>  		pending BIOS attribute changes. Also, an uevent_KOBJ_CHANGE is
> @@ -249,8 +249,8 @@ What:		/sys/class/firmware-attributes/*/attributes/reset_bios
>  Date:		February 2021
>  KernelVersion:	5.11
>  Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
> -		Mario Limonciello <mario.limonciello@dell.com>,
>  		Prasanth KSR <prasanth.ksr@dell.com>
> +		Dell.Client.Kernel@dell.com
>  Description:
>  		This attribute can be used to reset the BIOS Configuration.
>  		Specifically, it tells which type of reset BIOS configuration is being
> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios b/Documentation/ABI/testing/sysfs-platform-dell-smbios
> index e6e0f7f834a7..5583da581025 100644
> --- a/Documentation/ABI/testing/sysfs-platform-dell-smbios
> +++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios
> @@ -1,7 +1,7 @@
>  What:		/sys/devices/platform/<platform>/tokens/*
>  Date:		November 2017
>  KernelVersion:	4.15
> -Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Contact:	Dell.Client.Kernel@dell.com
>  Description:
>  		A read-only description of Dell platform tokens
>  		available on the machine.
> diff --git a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
> index e19144fd5d86..fd3a7ec79760 100644
> --- a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
> +++ b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
> @@ -1,7 +1,7 @@
>  What:		/sys/devices/platform/<platform>/force_power
>  Date:		September 2017
>  KernelVersion:	4.15
> -Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Contact:	"Mario Limonciello" <mario.limonciello@outlook.com>
>  Description:
>  		Modify the platform force power state, influencing
>  		Thunderbolt controllers to turn on or off when no
> diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
> index 51c0f578bfce..90ec4987074b 100644
> --- a/Documentation/ABI/testing/sysfs-power
> +++ b/Documentation/ABI/testing/sysfs-power
> @@ -295,7 +295,7 @@ Description:
>  
>  What:		/sys/power/resume_offset
>  Date:		April 2018
> -Contact:	Mario Limonciello <mario.limonciello@dell.com>
> +Contact:	Mario Limonciello <mario.limonciello@outlook.com>
>  Description:
>  		This file is used for telling the kernel an offset into a disk
>  		to use when hibernating the system such as with a swap file.
> 

