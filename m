Return-Path: <SRS0=i/bP=C7=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC42C4363D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 05:26:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C6D23A9B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600752404;
	bh=qMEf5SRqxg16qn8I/G5rP7MkXwbqJykNgZ/oV4sbIDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Jbd7QyCkCAV41D6fLeCa2XokbuxUZEV0LnPGtNpliFqm6RMo12L/UutqZu3yfh7B9
	 meOEFdIvhV1dcd7ckb+FJ5rCthvYIFW51yPz+NQ9nPD5d6aTthDnYmF4NhDEaLu+td
	 ZYmf2mTEWV+DMzH6f6/6wnZlTRa+BYK9FkbBjnVc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgIVF0o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Sep 2020 01:26:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:43292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgIVF0o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Sep 2020 01:26:44 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E60AA23A84;
        Tue, 22 Sep 2020 05:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600752403;
        bh=qMEf5SRqxg16qn8I/G5rP7MkXwbqJykNgZ/oV4sbIDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfFSEy0HIIAbO6N7D4nVFGhVmf9vk7uAHk3GU9UvvqqmPu9F4LFSGrqFukCLVw65S
         EGrbtS9xs0m272iUnRy0RqSF5DhsY7kqoGiCfpBGBs7AFwSpNLNna3xOZXz5FeHlYx
         +CmOIvXOPsOOepWrSeMImolnjMffNdSorhjFGZjI=
Date:   Tue, 22 Sep 2020 07:26:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Russ Anderson <rja@hpe.com>
Cc:     Mike Travis <mike.travis@hpe.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Jian Cai <caij2003@gmail.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 13/13] x86/platform/uv: Update Copyrights to conform
 to HPE standards
Message-ID: <20200922052640.GA586403@kroah.com>
References: <20200916192039.162934-1-mike.travis@hpe.com>
 <20200916192039.162934-14-mike.travis@hpe.com>
 <20200917075429.GB3333802@kroah.com>
 <20200922022504.unsi33w4njahh6pv@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922022504.unsi33w4njahh6pv@hpe.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 21, 2020 at 09:25:04PM -0500, Russ Anderson wrote:
> On Thu, Sep 17, 2020 at 09:54:29AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Sep 16, 2020 at 02:20:39PM -0500, Mike Travis wrote:
> > > Add Copyrights to those files that have been updated for UV5 changes.
> > > 
> > > Signed-off-by: Mike Travis <mike.travis@hpe.com>
> > > ---
> > >  arch/x86/include/asm/uv/bios.h      | 1 +
> > >  arch/x86/include/asm/uv/uv_hub.h    | 1 +
> > >  arch/x86/include/asm/uv/uv_mmrs.h   | 1 +
> > >  arch/x86/kernel/apic/x2apic_uv_x.c  | 1 +
> > >  arch/x86/platform/uv/bios_uv.c      | 1 +
> > >  arch/x86/platform/uv/uv_nmi.c       | 1 +
> > >  arch/x86/platform/uv/uv_time.c      | 1 +
> > >  drivers/misc/sgi-gru/grufile.c      | 1 +
> > >  drivers/misc/sgi-xp/xp.h            | 1 +
> > >  drivers/misc/sgi-xp/xp_main.c       | 1 +
> > >  drivers/misc/sgi-xp/xp_uv.c         | 1 +
> > >  drivers/misc/sgi-xp/xpc_main.c      | 1 +
> > >  drivers/misc/sgi-xp/xpc_partition.c | 1 +
> > >  drivers/misc/sgi-xp/xpnet.c         | 1 +
> > >  14 files changed, 14 insertions(+)
> > > 
> > > diff --git a/arch/x86/include/asm/uv/bios.h b/arch/x86/include/asm/uv/bios.h
> > > index 97ac595ebc6a..08b3d810dfba 100644
> > > --- a/arch/x86/include/asm/uv/bios.h
> > > +++ b/arch/x86/include/asm/uv/bios.h
> > > @@ -5,6 +5,7 @@
> > >  /*
> > >   * UV BIOS layer definitions.
> > >   *
> > > + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
> > >   * Copyright (C) 2007-2017 Silicon Graphics, Inc. All rights reserved.
> > >   * Copyright (c) Russ Anderson <rja@sgi.com>
> > 
> > Gotta love the different ways of text here :(
> > 
> > Anyway, much better than before, thanks.
> 
> The HPE copyright text is different than the old SGI copyright text.
> We could update the SGI copyright line to be consistent, change
> "Copyright (C)" to "(C) Copyright", if that is desired.
> 
> The HPE lawyers said the old SGI copyrights do not need to be
> updated as far as they are concerned, because HPE owns the SGI
> copyrights, but they can.  So the two lines could be combined to 
> 
>   * (C) Copyright 2007-2017, 2020 Hewlett Packard Enterprise Development LP
> 
> I will do whatever the lawyers and community want as far as format.

What you did here is fine, it's just "fun" to see lawyers change their
minds over time as to what the "correct" way to write these lines are.

For extra fun, it turns out none of these lines are actually needed,
it's just a real-world case of lawyer cargo-cult behavior :)

thanks,

greg k-h
