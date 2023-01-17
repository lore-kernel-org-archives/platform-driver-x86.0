Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34660C3DA78
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Jan 2023 05:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbjAQFlu convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Jan 2023 00:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbjAQFlt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2023 00:41:49 -0500
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B301EFD0;
        Mon, 16 Jan 2023 21:41:48 -0800 (PST)
Received: from smtpclient.apple (macbook3-2.redfish-solutions.com [192.168.8.12])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 30H5fN4R744660
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Jan 2023 22:41:23 -0700
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
From:   Philip Prindeville <philipp@redfish-solutions.com>
In-Reply-To: <20230113231139.436943-1-philipp@redfish-solutions.com>
Date:   Mon, 16 Jan 2023 22:40:56 -0700
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
Content-Transfer-Encoding: 8BIT
Message-Id: <B4F0D1BF-9B3D-4B32-BBBE-443F196270BF@redfish-solutions.com>
References: <20230113231139.436943-1-philipp@redfish-solutions.com>
To:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For the record, we're using the APUv2 driver as patched by this series in Openwrt and there are no reported issues with it.



> On Jan 13, 2023, at 4:11 PM, Philip Prindeville <philipp@redfish-solutions.com> wrote:
> 
> From: Philip Prindeville <philipp@redfish-solutions.com>
> 
> Extend PCEngines APU2 driver to derivative models APU3, 4, 5
> and 6.
> 
> Of the five, the APU5 is the most dissimilar.  The APU2 is not
> derivative of the APU1, and we call that out in the leds-apu
> driver.  We also clarify the expanded compatibility of the
> pcengines-apuv2 driver in the Kconfig menu.
> 
> We correct some line labeling for GPIO lines 4-6, and we add
> appropriate definitions to the GPIO lines for the APU5 which
> is mapped out differently.
> 
> The majority of the work was done by Ed Wildgoose.  Philip
> Prindeville took over the effort to upstream the fixes and
> made some minor cleanup.
> 
> Philip Prindeville (2):
>  x86: Support APU5 & APU6 in PCEngines platform driver
>  x86: Further PCEngines APU4/5/6 cleanup
> 
> drivers/leds/leds-apu.c                |   2 +-
> drivers/platform/x86/Kconfig           |   4 +-
> drivers/platform/x86/pcengines-apuv2.c | 118 ++++++++++++++++++++++---
> 3 files changed, 107 insertions(+), 17 deletions(-)
> 
> -- 
> 2.34.1
> 

