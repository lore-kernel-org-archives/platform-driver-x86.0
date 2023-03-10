Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF8AC6FA99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 03:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjCJDuV convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 22:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjCJDuV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 22:50:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B7DAB0AD;
        Thu,  9 Mar 2023 19:50:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A963D60C15;
        Fri, 10 Mar 2023 03:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AE3C4339B;
        Fri, 10 Mar 2023 03:50:18 +0000 (UTC)
Date:   Thu, 9 Mar 2023 22:50:16 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [BUILD BUG v6.3-rc1] platform/x86/amd: error: implicit
 declaration of function =?UTF-8?B?4oCYYW1kX3BtY193cml0ZV9zdGLigJk=?=
Message-ID: <20230309225016.2e8cd211@gandalf.local.home>
In-Reply-To: <20230309224451.13b9648b@gandalf.local.home>
References: <20230309224451.13b9648b@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 9 Mar 2023 22:44:51 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> With CONFIG_SUSPEND not defined I get:
> 
> drivers/platform/x86/amd/pmc.c: In function ‘amd_pmc_stb_debugfs_open_v2’:
> drivers/platform/x86/amd/pmc.c:256:15: error: implicit declaration of function ‘amd_pmc_write_stb’; did you mean ‘amd_pmc_read_stb’? [-Werror=implicit-function-declaration]
>   256 |         ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>       |               ^~~~~~~~~~~~~~~~~
>       |               amd_pmc_read_stb
> 

And I just checked out Linus's top of tree and see that all the
CONFIG_SUSPEND defines are removed from that file.

As the Church Lady use to say...

     Never mind!

-- Steve
