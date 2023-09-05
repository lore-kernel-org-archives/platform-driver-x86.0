Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8CBCA0FE2
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 16:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354079AbjIEQeA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354233AbjIEKN4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 06:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDB21AB
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 03:13:07 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-SMK2IsWUPhqMHCui7CsHyg-1; Tue, 05 Sep 2023 06:13:05 -0400
X-MC-Unique: SMK2IsWUPhqMHCui7CsHyg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5009796123dso2253869e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 03:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693908784; x=1694513584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6wyL4VpWvSOwlagHKIDQgjznH0ETmOhDgwZtUvrzvM=;
        b=hkGASUpLlvZ5QhIPziN/ozUm+Vj9CkY+kS5KcTzDBN6SD12DYrMxS8pg91s3CWS4A1
         gd92GdL4K1KHqOyhTHS7+EAvPeuvJexTUTPTTnzb+jDl1ZZPp2pl3I0gazpnJ7xdHrsP
         in3jKg493T4YgH9UI/X4veaRK/IWHEl4ZsDE4YTMW2x9hMabtZ9oKSRwO2zPl3Lkw33s
         ZNpWIV+eYvT2cD7+EfvKCfyFHC3JpeGJn011Bdr5FPD+JY5vBgFm5eRj3hcrj0cOBcDG
         WlpJUViQLHYh+V3gvhZxjkPVwLw9LPapNa2y1yPsG8v8DeEy3UJ1GF3QOu+Fnm+8FdWL
         dTzw==
X-Gm-Message-State: AOJu0Yye8I/lc6TzuQwuDSruDbT4X/weRRNy8cVwIWoGdvzMA0qgjncL
        GTCMQGWW1nHUzdwzOzKSgH5ApqajR6B9zmSvk9Px/R1nyEDfEil3Ty/6oJJ824+Vf77ooZF5Abb
        wDKHa+9M54FY6SqN0tqf9qtYX/P0IxP/nMw==
X-Received: by 2002:a05:6512:3ca8:b0:500:b5db:990b with SMTP id h40-20020a0565123ca800b00500b5db990bmr10401954lfv.47.1693908783990;
        Tue, 05 Sep 2023 03:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBkFcLSUGWrgQdqfNIE14GXda1QLUBJpdBcLUIHVClHNN/wzy3ZDA/sL5yOG9VDO9km86lbA==
X-Received: by 2002:a05:6512:3ca8:b0:500:b5db:990b with SMTP id h40-20020a0565123ca800b00500b5db990bmr10401937lfv.47.1693908783636;
        Tue, 05 Sep 2023 03:13:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gj17-20020a170906e11100b00982be08a9besm7497301ejb.172.2023.09.05.03.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 03:13:02 -0700 (PDT)
Message-ID: <6ce36e6e-726a-69f3-882c-0790d311eee1@redhat.com>
Date:   Tue, 5 Sep 2023 12:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 0/3] Avoid PCIe D3 for AMD PCIe root ports
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>, bhelgaas@google.com,
        rafael@kernel.org, Shyam-sundar.S-k@amd.com
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230829171212.156688-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230829171212.156688-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 8/29/23 19:12, Mario Limonciello wrote:
> D3 on PCIe root ports isn't used on Windows systems in Modern Standby.
> This series adjusts the amd-pmc driver to choose the same strategy
> for Rembrandt and Phoenix platforms in Linux with s2idle.
> 
> LPS0 constraints are the basis for it; which if they are added for
> Windows would also apply for Linux as well.
> 
> This version doesn't incorporate a callback, as it's pending feedback
> from Bjorn if that approach is amenable.
> 
> NOTE:
> This series relies upon changes that are both in linux-pm.git and
> platform-x86.git. So it won't be able to apply to either maintainer's
> tree until later.
> 
> Mario Limonciello (3):
>   ACPI: x86: s2idle: Export symbol for fetching constraints for module
>     use
>   platform/x86/amd: pmc: Adjust workarounds to be part of a switch/case
>   platform/x86/amd: pmc: Don't let PCIe root ports go into D3

Thank you for the new version.

I understand you wanted to get this new approach "out there" but
this does not address my remarks on v15:

https://lore.kernel.org/platform-driver-x86/53d26a63-64f3-e736-99f5-32bf4b5ba31d@redhat.com/

Bjorn, I suggest to allow platform code to register a callback
to influence pci_bridge_d3_possible() results there. Can you
take a look at this and let us know what you think of this
suggestion ?

Looking at this problem again and rereading the commit message
of "platform/x86/amd: pmc: Don't let PCIe root ports go into D3"

I see that the problem is that the PCIe root ports to which
the USB controllers connect should not be allowed to go
into D3 when an USB child of them is configured to wakeup
the system.

It seems to me that given that problem description,
we should not be directly messing with the bridge_d3
setting at all.

Instead the XHCI code should have an AMD specific quirk
where it either unconditionally calls pci_d3cold_disable()
on the XHCI PCIe device; or it could even try to be smart
and call pci_d3cold_enable() / pci_d3cold_disable()
from its (runtime)suspend handler depending on if any
USB child is configured as a system wakeup source.

Note that it is safe to repeatedly call pci_d3cold_enable()
/ _disable() there is no need to balance the calls.

Regards,

Hans


