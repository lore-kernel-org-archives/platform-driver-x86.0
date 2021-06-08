Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A365C4743D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Jun 2021 17:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21ABF6135D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Jun 2021 17:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbhFHRul (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Jun 2021 13:50:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233156AbhFHRul (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Jun 2021 13:50:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76FD061375;
        Tue,  8 Jun 2021 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623174527;
        bh=qYxbD6+7M2rej+P/v38B/oCyf0kCWDlzg3R9EUKT8cE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HQp51Ir8sYtic+P0rL0ekA5FIBamVFpElNPMdbQhRZ33+g110rNUyn2WzSwRij9Ga
         b3dSj1Qn1Ind5gjEW6jmq26W21gyC+RGbeZlt8/2pXbYM0UgZcOx54bhL54bM6kK8P
         +8T8X2xObMEuhakrA2MjDfhHwupMvB/O8qlFgQAlt07QC51HSCOnXHcRE7kbkYlgVw
         sax8dZjLUfwkvVcRoa3CWvQn8yDTDhVr4+v+eWd/l0UEJYDVssCy86VGuPI5xlTYxk
         RYjbjPjlqsZOuoeU65/ZasQRMMVUlSKZokaz1CZvwGkhn4hCcG8tvOgTH8Q08YHcEV
         zXSyv+9pLk4WQ==
Date:   Tue, 8 Jun 2021 10:48:34 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Pearson <markpearson@lenovo.com>, andy.shevchenko@gmail.com,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] platform/x86: firmware_attributes_class: Create
 helper file for handling firmware-attributes class registration events
Message-ID: <YL+tch7KHVCAqJI+@Ryzen-9-3900X>
References: <markpearson@lenovo.com>
 <20210530223111.25929-1-markpearson@lenovo.com>
 <98d213aa-9500-64f7-9fce-b880a6322d01@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d213aa-9500-64f7-9fce-b880a6322d01@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 31, 2021 at 03:56:41PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/31/21 12:31 AM, Mark Pearson wrote:
> > This will be used by the Dell and Lenovo WMI management drivers to
> > prevent both drivers being active.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> > ---
> > Changes in v2:
> >  - This is a new file requested as part of the review of the proposed
> > think_lmi.c driver. Labeling as V2 to keep series consistent
> > 
> > Changes in v3:
> >  - Set default in Kconfig, and removed help text
> >  - Allow multiple modules to register with module. Change API names to
> >     better reflect this.
> > 
> > Changes in v4:
> >  - version bump for consistency in series
> > 
> > Changes in v5:
> >  - Fix issue reported by kernel test robot. Add header file to includes
> 
> Thanks Mark,
> 
> Unfortunately you squashed the Kconfig and Makefile changes which I made
> to v4 when fixing it up during merging into 3/3 instead of having them in
> v5 of this patch.
> 
> No worries, since this was the only problem which I could see I've fixed
> this up in my review-hans branch while merging v5 of this series there
> (replacing v4).
> 
> I did notice a bit of dead code while reviewing the changes which you
> made to 3/3 in response to Andy's review. I'll send a follow-up patch
> fixing that.
> 
> I'll leave this sit in my review-hans branch for a bit to give Andy
> a chance to give his Reviewed-by and then I'll push this to for-next.
> 
> Regards,
> 
> Hans

It looks like this series causes allyesconfig to break on linux-next:

https://github.com/ClangBuiltLinux/continuous-integration2/runs/2773158286?check_suite_focus=true

$ make -skj"$(nproc)" allyesconfig all
ld: drivers/platform/x86/think-lmi.o:(.bss+0x0): multiple definition of `fw_attr_class'; drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:(.bss+0x0): first defined here

Cheers,
Nathan
