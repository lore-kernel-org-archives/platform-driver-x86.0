Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D775DC4167B
	for <platform-driver-x86@archiver.kernel.org>; Sun,  1 Jan 2023 22:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjAAWjo convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 1 Jan 2023 17:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjAAWjn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Jan 2023 17:39:43 -0500
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E75260E
        for <platform-driver-x86@vger.kernel.org>; Sun,  1 Jan 2023 14:39:42 -0800 (PST)
Received: from smtpclient.apple (macbook3-2.redfish-solutions.com [192.168.8.12])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 301MdQjx588118
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 1 Jan 2023 15:39:26 -0700
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 1/1] apu6: add apu6 variation to apu2 driver family
From:   Philip Prindeville <philipp@redfish-solutions.com>
In-Reply-To: <40bada03-8798-7139-4c43-9e24995f974b@wildgooses.com>
Date:   Sun, 1 Jan 2023 15:39:04 -0700
Cc:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        Ed Wildgoose <kernel@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>
Content-Transfer-Encoding: 8BIT
Message-Id: <2A8060D6-5534-4741-87A5-8F2BA9E2F8A9@redfish-solutions.com>
References: <20221230180715.2785959-1-philipp@redfish-solutions.com>
 <40bada03-8798-7139-4c43-9e24995f974b@wildgooses.com>
To:     Ed Wildgoose <ed@wildgooses.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



> On Dec 31, 2022, at 4:06 AM, Ed Wildgoose <ed@wildgooses.com> wrote:
> 
> 
> On 30/12/2022 18:07, Philip Prindeville wrote:
>> From: Philip Prindeville <philipp@redfish-solutions.com>
>> 
>> Add detection of PC Engines "apu6" platform via DMI.
>> 
>> Also, revise leds-apu.c to call out additional platforms
>> which aren't supported.
> 
> 
> Any chance of also adding the APU5? Details in my previous patches
> 
> Ed W
> 


Sure, but I have questions about this:

+       /* APU5 w/ mainline BIOS */
+       {
+               .ident          = "apu5",
+               .matches        = {
+                       DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+                       DMI_MATCH(DMI_BOARD_NAME, "apu5")
+               },
+               .driver_data    = (void *)&apu5_driver_data,
+       },

All the other entries have their .driver_data pointing to a struct amd_fch_gpio_pdata... but not this one.  It points to a struct apu_driver_data and I don't even see the definition of that type.  Should it point to "board_apu5" instead and we can drop:

+static const struct amd_fch_gpio_pdata board_apu5 = {
+       .gpio_num       = ARRAY_SIZE(apu5_gpio_regs),
+       .gpio_reg       = apu5_gpio_regs,
+       .gpio_names     = apu5_gpio_names,
+};
+



