Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1835C432BE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Aug 2021 08:31:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9563760232
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Aug 2021 08:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbhHIIcF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Aug 2021 04:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56591 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233963AbhHIIcF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 04:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628497904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XKLlxgOYHIXDGZqKNU3L4WkyKtyN1anFPB3c2MZ6gG8=;
        b=edjJi8y7EYw6GHA8GaiwfPjHjyZLjuGxVC01cgXfvxIhNC35H8lnyaiDOirbP6BZ1snsMm
        NiSVuzEBi4r4lH1/gozlgfYjkZim8lX/EeY50aFrDRVzE6nnMKmGfCWkGU6JmJAwbfGirm
        txsBOn5jMn1oBxLJm7Xl3HqGO+gEUFA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-9aoJwKlWPfW8lfyJ_AQcqg-1; Mon, 09 Aug 2021 04:31:41 -0400
X-MC-Unique: 9aoJwKlWPfW8lfyJ_AQcqg-1
Received: by mail-ej1-f70.google.com with SMTP id a19-20020a1709063e93b0290551ea218ea2so855856ejj.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Aug 2021 01:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XKLlxgOYHIXDGZqKNU3L4WkyKtyN1anFPB3c2MZ6gG8=;
        b=ShSth725cm/T21kGAqvicVcQ1VDzRg95Bsrcet/JIS7n+mktz1jFZojspffndA1tOM
         nbgdn8ctjKbRC7y4JMQiORhUDc6Ln+XEoRLiqDleHZJbyoF7CdwiaaRrKAeF2piueze/
         Ml5vBSEYIdEQkh5BVnh/GH1Mgc7UCVkUu9Ix97mbTCAkJPBIPqPC/ZJsfdeItIfVZ64e
         U/m5hFu+boz4eTZlJzIufnQNYfRFgxw6RKrwt7AfJCZDkUqRNDx6ceUBAb+hPAXuQPDD
         kOtF4eWJdJt0ailMGhBjNk9LfATo1fDzD/KeUEaxNYrgjX57CSloJB7/rZNRhMZNuwhm
         MFDg==
X-Gm-Message-State: AOAM533VI6p4Lg6STW0wQzWR1Dd0+RVOV8d/FktTMBHkZq7bj/P1nQl8
        oKep3TjPqaSD8WwpSqXJN9a2lMSBkIdc2WbBCgsoLSO48XKG5x1lFXmu/3kKKI0TmyPT/zU6emX
        D+y2FKxfbt47ZiPygeRFu5YnXgQ4BDMLEoQ==
X-Received: by 2002:a17:906:4109:: with SMTP id j9mr2512021ejk.320.1628497900207;
        Mon, 09 Aug 2021 01:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPISJe76Dug4VBATf9KCILWQXuNroes4fC6inRmva+zqKsZn86mWWhhguGlZ8h0Bp4qzrb1w==
X-Received: by 2002:a17:906:4109:: with SMTP id j9mr2512011ejk.320.1628497900031;
        Mon, 09 Aug 2021 01:31:40 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id p5sm5679991ejl.73.2021.08.09.01.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 01:31:39 -0700 (PDT)
Subject: Re: [PATCH V4 0/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210806145630.8858-1-s.shravan@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e35c176a-2cbd-0c7a-bd83-09765dbd3838@redhat.com>
Date:   Mon, 9 Aug 2021 10:31:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806145630.8858-1-s.shravan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/6/21 4:56 PM, Shravan S wrote:
> SAR (Specific Absorption Rate) driver is a host driver implemented for Linux or chrome platform to limit the exposure of human body to RF frequency by informing the Intel M.2 modem to regulate the RF power based on SAR data obtained from the sensors captured in the BIOS. ACPI interface exposes this data from the BIOS to SAR driver. The front end application in userspace ( eg: Modem Manager) will interact with SAR driver to obtain information like the device mode (Example: tablets, laptops, etx), Antenna index, baseband index, SAR table index and use available communication like MBIM interface to enable data communication to modem for RF power regulation.
> 
> The BIOS gets notified about device mode changes through Sensor Driver. This information is given to a (newly created) WWAN ACPI function driver when there is a device mode change. 
> The driver then uses a _DSM method to retrieve the required information from BIOS. 
> This information is then forwarded to the User-space using the sysfs_notify interface.
> A lookup table is maintained inside the BIOS which suggests the SAR Table index and Antenna Tuner Table Index values for individual device modes.
> 
> The SAR parameters to be used on the Modem differs for each Regulatory Mode like FCC, CE and ISED.
> Hence, the SAR parameters are stored separately in the SMBIOS table in the OEM BIOS, for each of the Regulatory mode. Regulatory modes will be different based on the region and network available in that region.
> 
> Hence the entire SAR functionality handling is divided into 2 parts:
> 
> •	A ACPI function driver implemented that uses a dedicated ACPI node for WWAN device.
>     Sends notifications whenever there is change in Device Mode. (each OEM has different mechanism
>     of updating this DEVICE Mode info). This is notified to User-space applications using 
>     the sysfs_notify interface.
> •	WWAN Device Service listens for sysfs_notify messages and reads the sysfs data and routes them 
> 	to Modem using MBIM.

Thank you for the new version.

I expect that you will send a new version addressing Andy's remarks,
so I'm going to drop this version from my queue.

Regards,

Hans

