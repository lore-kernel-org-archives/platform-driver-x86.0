Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A63C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 Oct 2022 13:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbiJSNpW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiJSNoU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2022 09:44:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF621D2F73
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666186215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T5clWctR2/IjrrSMHt7MK4xFirjxxR+TN/MDtNqMzWU=;
        b=dp+xuwqI0xuFO/Nsk9flANoU3d0yQEBhKo5NOeWwDaqlwX09vI6vp0/rvPoA55HvuYBNaY
        OPn7VduDOAYIl7CAfQb4itBzGlLnMV0wlbglKrozKQCbI0lVJe0PY08xbee9B6m3M5HnI2
        cMd2S+2v/BHTv+altaIo+tk6nlpnz1M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-GYKNi8pIPv-9nlVrQXG3qQ-1; Wed, 19 Oct 2022 05:01:51 -0400
X-MC-Unique: GYKNi8pIPv-9nlVrQXG3qQ-1
Received: by mail-ej1-f70.google.com with SMTP id gn34-20020a1709070d2200b0079330e196c8so364745ejc.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 02:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5clWctR2/IjrrSMHt7MK4xFirjxxR+TN/MDtNqMzWU=;
        b=JMav90lLFaEKL0nHCXox2G25DkAQIeoH/O1V9hVIOq/W8PWDLfPPoB8aq05qJkDoov
         C8G4jw+NTicku6LqzsvqmULZso31Aa7f1Pb27YjLmAho0L9xCmjBZSXrRel4WSLvJ9wh
         mGC2pzvcRH1r4Fc6SE5VgAIFfIxiFzO8oSsNKAkmW9IZvbtbdZ+xJrz6yOCMae5p5lJX
         K/UqlXpwS8qgZhbCSIWBI3qq/rKB/QPRlm3RDhDBya9fg1DJu1Bpi85qQnupGYqLlSGd
         XfnBJqMOcuODTT7iZkj1CZq8q/IZgyCy4JU8QklVMU728uqvTJnLn7pyfGs/IXY5Qj5A
         V6CQ==
X-Gm-Message-State: ACrzQf329vg08MhpEB9pWa+0UercZx7wFQ+KWa0Gu6WaJBypsrZhtBNP
        B+vbh1DEq3OxbA4xpBYR02e1EMZy1YcemaS+/bNEj/OmJfAmSRAglVPsDd5omJQ77yfqXZAhEHm
        zWqPEKEq7fpUrmUX8T+aO5S8Ip2JCuwBDOw==
X-Received: by 2002:a05:6402:401e:b0:45c:a1ce:94bf with SMTP id d30-20020a056402401e00b0045ca1ce94bfmr6333732eda.177.1666170110422;
        Wed, 19 Oct 2022 02:01:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66EyH45jONdSbPCHCpgFPLwEhPYydWQgqbC6/b6fJ3yFrJRC4Ai2QcR4cAPSYi1wHxtoZytw==
X-Received: by 2002:a05:6402:401e:b0:45c:a1ce:94bf with SMTP id d30-20020a056402401e00b0045ca1ce94bfmr6333714eda.177.1666170110165;
        Wed, 19 Oct 2022 02:01:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906304e00b0078250005a79sm8667926ejd.163.2022.10.19.02.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 02:01:49 -0700 (PDT)
Message-ID: <9b086aca-916c-c0b7-f60c-327f16f01c8b@redhat.com>
Date:   Wed, 19 Oct 2022 11:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 0/6] Introduction of HP-BIOSCFG driver
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221018203531.17130-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221018203531.17130-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 10/18/22 22:35, Jorge Lopez wrote:
> Version 2 -> Version 3
> ------------------------------------------------------
> 
> Introduction of HP-BIOSCFG driver (1/6)
> 	- No new changes
> 	
> Update pending_reboot state value (2/6)
> 	- No new changes
> 
> Set current_value permissions appropriate to read-only attributes (3/6)
> 	- No new changes
> 
> Improve friendly display name values (4/6)
> 	- No new changes
> 
> Moving existing HP drivers to a central location (5/6)
>     
>     The purpose of this patch is to provide a central location where all
>     HP related drivers are found. HP drivers will recide under hp
>     directory with exception of hp-bioscfg.  hp-bioscfg is found under
>     hp/hp-bioscfg/ directory.
>     
>     Introduced changes to Kconfig file to list all HP driver under "HP X86
>     Platform Specific Device Drivers" menu option.
> 
>     Changes needed to relocate hp-bioscfg driver 
>     
>     Relocation of the driver requires minor changes such updating the path 
>     for a local include file.  Additional changes include update MAINTAINERS 
>     file to indicated support status, reviewer, and maintainer of hp-bioscfg 
>     driver.  Lastly, removal of 'stddef' include file from the source.
> 
> Clarify how elements order list impacts priority (6/6)
>     
>     This patch provides additional clarification and describes how
>     priority is determined according to the order.  Elements listed first
>     are given higher priority to those listed last.
> 
> Version 1 -> Version 2
> ------------------------------------------------------
> 
> Introduction of HP-BIOSCFG driver (1/4)
> 	- No new changes
> 
> Update pending_reboot state value (2/4)
> 
>     There is not a reliable mechanism to programmatically determine which
>     BIOS settings require a reboot to be updated.  The latest changes
>     leverages “RequiredPhysicalPresence” reported value to set
>     pending_reboot.
> 
> Set current_value permissions appropriate to read-only attributes (3/4)
> 
>     This patch updates ‘current_value’ permissions to match the value
>     reported by ‘is_readonly’ value associated with the attribute.
>     ‘current_value’ permissions are set to read-only if ‘is_readonly’
>     value is 1.  ‘current_value’ permissions are set to read-write if
>     ‘is_readonly’ value is zero.   Other read-only and write-only
>     permissions will remain unchanged.
>     
> Improve friendly display name values (4/4)
> 
>     The purpose of this patch is to improve the friendly display name for
>     few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
>     assign names such ‘Tuesday’ to an attribute. The name is correct, but
>     it is not descriptive enough for the user.  It is under those
>     conditions a portion of the path data value is append to the attribute
>     name to create a user-friendly name.
>     
>     For instance, the attribute name is ‘Tuesday,’ and the display name
>     value is ‘Schedule Power-ON – Tuesday’
> 
>     
> ------------------------------------------------------
> Version: 1
> 
>   Introduction of HP-BIOSCFG driver (1/4)
>   
>     The purpose for this patch is submit HP BIOSCFG driver to be list of
>     HP Linux kernel drivers.  HP BIOS Configuration driver purpose is to
>     provide a driver supporting the latest sysfs class firmware attributes
>     framework allowing the user to change BIOS settings and security
>     solutions on HP Inc.’s commercial notebooks.
>     
>     Many features of HP Commercial PC’s can be managed using Windows
>     Management Instrumentation (WMI). WMI is an implementation of Web-Based
>     Enterprise Management (WBEM) that provides a standards-based interface
>     for changing and monitoring system settings.  HP BISOCFG driver provides
>     a native Linux solution and the exposed features facilitates the
>     migration to Linux environments.
>     
>     The Linux security features to be provided in hp-bioscfg driver enables
>     managing the BIOS settings and security solutions via sysfs, a virtual
>     filesystem that can be used by user-mode applications.   The new
>     documentation cover features such Secure Platform Management, Sure
>     Admin, and Sure Start.  Each section provides security feature
>     description and identifies sysfs directories and files exposed by
>     the driver.
>     
>     Many HP Commercial PC’s include a feature called Secure Platform
>     Management (SPM), which replaces older password-based BIOS settings
>     management with public key cryptography. PC secure product management
>     begins when a target system is provisioned with cryptographic keys
>     that are used to ensure the integrity of communications between system
>     management utilities and the BIOS.
>     
>     HP Commercial PC’s have several BIOS settings that control its behaviour
>     and capabilities, many of which are related to security. To prevent
>     unauthorized changes to these settings, the system can be configured
>     to use a Sure Admin cryptographic signature-based authorization string
>     that the BIOS will use to verify authorization to modify the setting.
> 
> 
> Jorge Lopez (6):
>   Introduction of HP-BIOSCFG driver
>   Update pending_reboot state value
>   Set current_value permissions appropriate to read-only attributes
>   Improve friendly display name values
>   Moving existing HP drivers to a central location
>   Clarify how elements order list impacts priority

Jorge, thank you for your continued work on this.

I will try to get a detailed review of this done next week (no time this
week, sorry).

But before then can you please restructure the patch series to make
it easier to review ?  ATM the series seems to be the original v1
patch + patches on top addressing review comments. That is a somewhat
unusual way to address review comments. Usually new versions include
improvements from review directly in the patch introducing the change
which got commented on.

What I would like to see for v4 of the series is a patch series like
this (with all the hp-bioscfg patches squashed together before doing
this new split):

[PATCH 1/x] Move the existing HP drivers to the new hp subdir (instead of doing this in 5/6)
[PATCH 2/x] Introduce the main bioscfg.h file + *-attributes.c files, yes this won't
            compile, but without a Makefile pointing to it that is fine
[PATCH 3/x] Add the main bioscfg.c + Makefile + Kconfig changes

Note feel free to split patch 2/x in maybe 2 or 3 patches adding a few
*-attributes.c files at a time.

The idea here is to make the individual .patch files smaller because
I personally find that reviewing big patch files does not work well
(I tend to loose track of everything which is going on if the patch
is too big / I loose my way because of too much scrolling).

Regards,

Hans


