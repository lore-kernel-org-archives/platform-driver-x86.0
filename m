Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D92C001B0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 09:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjGKJsP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 05:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjGKJsF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 05:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5726CA1
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689068839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rUm+pZx3Dcl0b3Pl2ghj/mOdNmFNLUrrNmowYZCq6lY=;
        b=AyB2M1/egqwGnSbonUvQmSB549HpIvlvNJlSwOOP9T045dNDHBbXX9tdvekSQro/yupUg1
        UmbsOUe3SygpXzuLCRPDdoDgZjCikBngG1ErqI5/ubmEc0fDsqjnaJSkfMkEFg3WncsZBX
        L6wJmiVDy0bGNsxxxD4CKJ/a7KizuLg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-B_nmz17ZPHaaFd9xANs2Og-1; Tue, 11 Jul 2023 05:47:18 -0400
X-MC-Unique: B_nmz17ZPHaaFd9xANs2Og-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a355cf318so368760266b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689068837; x=1691660837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUm+pZx3Dcl0b3Pl2ghj/mOdNmFNLUrrNmowYZCq6lY=;
        b=KIgScdn2hJpwe1Q11siAGUJL9quycZkDl7tdqXmd8mmfHIHkVWq9MATjolfji7HLFR
         pR8wUoUMP9+B0FGZaQXUOIsAHTb8tnoDiZIKC+mh/8IO3emMw8jMfyHun8Ranl3duZCe
         NlsHxhPPbB7eV9uJ7hkDwTbScCxBfpga/LhzkGURPCjoHOHTErroHuyOpreJs+zX3Tmp
         8A1e07CEH/n9XdkbwARgXKrRi4RDXUA8JH66/uu3qQvgBmxWMaxQz1WJcJp3aQgZHto8
         +FhDUzN0ERkOFgS9yPO7477sH7/kXzFK4AYbMSrxywcBPLGPFe5Zx+rkBL31KXcxKKvH
         CvwQ==
X-Gm-Message-State: ABy/qLYgL9+2Rr/EvRh40xOZhu8g3rhJ0PLoTznlxYwgAWrT2NdAli47
        2dmG+E0y3/Cd3IsOcH+n3tqyZqnfEHUDILa0zgllVNtnv+R3F8+eLyI8FQdkrJEbCrHSkrt7uH9
        5SDO2A1VTtESCtlshovJwgUtFFF+YhFd3ltzNgAWmcQ==
X-Received: by 2002:a17:907:2943:b0:979:dad9:4e9 with SMTP id et3-20020a170907294300b00979dad904e9mr14001327ejc.50.1689068837255;
        Tue, 11 Jul 2023 02:47:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFQVQlSVaL8/fDqCRTKgXel2KCGpYTdEc3Vazq/wPpYriWSa9jsARdABikkIHUPmZBMtg6LJA==
X-Received: by 2002:a17:907:2943:b0:979:dad9:4e9 with SMTP id et3-20020a170907294300b00979dad904e9mr14001311ejc.50.1689068836965;
        Tue, 11 Jul 2023 02:47:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y24-20020a170906471800b00992b71d8f19sm922827ejq.133.2023.07.11.02.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:47:16 -0700 (PDT)
Message-ID: <95ad7037-76c4-d3fd-b2ea-430488a7e6e9@redhat.com>
Date:   Tue, 11 Jul 2023 11:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] Fix s2idle resume on HP 15s-eq2xxx
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20230710183934.17315-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230710183934.17315-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 7/10/23 20:39, Mario Limonciello wrote:
> HP 15s-eq2xxx has problems resuming from s2idle when IOMMU is enabled.
> This is the same root cause as some Lenovo laptops had where IOMMU enabled
> caused issues with NVME during s2idle resume from a problematic SMI.
> 
> To series fixes the issue by re-using the same quirk developed from the
> older Lenovo laptops.
> 
> Mario Limonciello (2):
>   platform/x86: Move s2idle quirk from thinkpad-acpi to amd-pmc
>   platform/x86/amd: pmc: Apply nvme quirk to HP 15s-eq2xxx
> 
>  drivers/platform/x86/amd/Makefile     |   2 +-
>  drivers/platform/x86/amd/pmc-quirks.c | 172 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc.c        |  30 +----
>  drivers/platform/x86/amd/pmc.h        |  43 +++++++
>  drivers/platform/x86/thinkpad_acpi.c  | 143 ---------------------
>  5 files changed, 222 insertions(+), 168 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmc-quirks.c
>  create mode 100644 drivers/platform/x86/amd/pmc.h

Thank you for your series, I've applied this series to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

For patch 1/2 the inclusion of linux/pci.h in
drivers/platform/x86/amd/pmc.h is not necessary, where as
some actually needed headers (types and mutex) were missing.

So I've moved the pci.h include back to pmc.c and added
a few missing includes. I have squashed the following diff
into 1/2 while merging for this:

diff --git a/drivers/platform/x86/amd/pmc-quirks.c b/drivers/platform/x86/amd/pmc-quirks.c
index cdf4c7d0a36b..362e7c0097d7 100644
--- a/drivers/platform/x86/amd/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc-quirks.c
@@ -9,6 +9,9 @@
  */
 
 #include <linux/dmi.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/slab.h>
 
 #include "pmc.h"
 
diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 5a9bc062fa8a..a8ca95a5d44c 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -20,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/limits.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 #include <linux/serio.h>
diff --git a/drivers/platform/x86/amd/pmc.h b/drivers/platform/x86/amd/pmc.h
index 8f78985ba340..c27bd6a5642f 100644
--- a/drivers/platform/x86/amd/pmc.h
+++ b/drivers/platform/x86/amd/pmc.h
@@ -11,7 +11,8 @@
 #ifndef PMC_H
 #define PMC_H
 
-#include <linux/pci.h>
+#include <linux/types.h>
+#include <linux/mutex.h>
 
 struct amd_pmc_dev {
 	void __iomem *regbase;

Since this is just changing #include-s this should not cause
any functional changes.

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



