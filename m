Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A79C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 May 2021 23:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93D35600D3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 May 2021 23:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236301AbhERXJZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 May 2021 19:09:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:2231 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230115AbhERXJY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 May 2021 19:09:24 -0400
IronPort-SDR: EH+byCMYJsVBwcAIVimYdED9EaqwsxXETKLtlHiGczMYEe5+UmVOnl8kuXspa05jdeOSS+x4KR
 +0wvCAvcooAA==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="264759302"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="264759302"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 16:08:05 -0700
IronPort-SDR: ONyOoJ0avZYdPpyaSICvi18jW1KCnHQi1c9Hy/FWu2Xa7Qp49LYv1sH1UfMbRbH5n+9nq+I8Do
 BulTiX9zgyTg==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="473194767"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 16:08:05 -0700
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id 24CDA636F;
        Tue, 18 May 2021 16:08:05 -0700 (PDT)
Date:   Tue, 18 May 2021 16:08:05 -0700
From:   mark gross <mgross@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@outlook.com>
Subject: Re: [PATCH] platform/x86: dell-smbios-wmi: Fix oops on rmmod
 dell_smbios
Message-ID: <20210518230805.GE47806@linux.intel.com>
Reply-To: mgross@linux.intel.com
References: <20210518125027.21824-1-hdegoede@redhat.com>
 <20210518224026.GD47806@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518224026.GD47806@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 18, 2021 at 03:40:26PM -0700, mark gross wrote:
> On Tue, May 18, 2021 at 02:50:27PM +0200, Hans de Goede wrote:
> > init_dell_smbios_wmi() only registers the dell_smbios_wmi_driver on systems
> > where the Dell WMI interface is support. While exit_dell_smbios_wmi()
> > unregisters it unconditionally, this leads to the following oops:
> > 
> > [  175.722921] ------------[ cut here ]------------
> > [  175.722925] Unexpected driver unregister!
> > [  175.722939] WARNING: CPU: 1 PID: 3630 at drivers/base/driver.c:194 driver_unregister+0x38/0x40
> > ...
> > [  175.723089] Call Trace:
> > [  175.723094]  cleanup_module+0x5/0xedd [dell_smbios]
> > ...
> > [  175.723148] ---[ end trace 064c34e1ad49509d ]---
> > 
> > Make the unregister happen on the same condition the register happens
> > to fix this.
> > 
> > Cc: Mario Limonciello <mario.limonciello@outlook.com>
> > Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/platform/x86/dell/dell-smbios-wmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> > index a1753485159c..33f823772733 100644
> > --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> > +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> > @@ -270,7 +270,8 @@ int init_dell_smbios_wmi(void)
> >  
> >  void exit_dell_smbios_wmi(void)
> >  {
> > -	wmi_driver_unregister(&dell_smbios_wmi_driver);
> > +	if (wmi_supported)
> Something is fishy with this.  wmi_supported is used in the
> init_dell_smbios_wmi function so we shouldn't even be able to call this
> function if wmi_supported == 0
> 
> is there a bug in the wmi framework where drivers that fail to init are not
> removed from a list resulting in a failure to unregister?  Is your fix hiding a
> higher level issue?
> 
> Looking more shouldn't the prob function NOT get called if the init function
> fails?

Never mind.  After thinking it over this fix makes sence the init and exit
functions get called regardless of registering.

the fix looks good.

Reviewed-by: mark gross <mgross@linux.intel.com>

--mrak

> 
> > +		wmi_driver_unregister(&dell_smbios_wmi_driver);
> >  }
> >  
> >  MODULE_DEVICE_TABLE(wmi, dell_smbios_wmi_id_table);
> > -- 
> > 2.31.1
> > 
