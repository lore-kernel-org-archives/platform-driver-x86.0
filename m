Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1490EC43464
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 21:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD93E208E4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 21:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgIQVkf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 17:40:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:48083 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbgIQVkf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 17:40:35 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 17:40:35 EDT
IronPort-SDR: KQkD8RzcC7Xf4IpV9XYUMMcgsuQucvILr8UWOxiqkKp2PF0mz0rutOfz8aC3nFskZFQhIsQrPj
 jjdy2c0uhBvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="244629379"
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; 
   d="scan'208";a="244629379"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 14:33:25 -0700
IronPort-SDR: CQoFn8VfQMiEND8uAu6laA3WpJ29+CyLgq4qStsNdQ8mAmNLPwTrKxP5wW3boUqlNKywdh+3/V
 IzF22DgbjqMw==
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; 
   d="scan'208";a="289121070"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 14:33:24 -0700
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id CE12B6369;
        Thu, 17 Sep 2020 14:33:24 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:33:24 -0700
From:   mark gross <mgross@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix SW_TABLET_MODE always
 reporting 1 on the HP Pavilion 11 x360
Message-ID: <20200917213324.GB29136@mtg-dev.jf.intel.com>
Reply-To: mgross@linux.intel.com
References: <20200912093532.18522-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912093532.18522-1-hdegoede@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Acked-by: Mark Gross <mgross@linux.intel.com>

--mark

On Sat, Sep 12, 2020 at 11:35:32AM +0200, Hans de Goede wrote:
> Commit cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist
> SW_TABLET_MODE on the 9 / "Laptop" chasis-type") restored SW_TABLET_MODE
> reporting on the HP stream x360 11 series on which it was previously broken
> by commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet
> mode switch on 2-in-1's").
> 
> It turns out that enabling SW_TABLET_MODE reporting on devices with a
> chassis-type of 10 ("Notebook") causes SW_TABLET_MODE to always report 1
> at boot on the HP Pavilion 11 x360, which causes libinput to disable the
> kbd and touchpad.
> 
> The HP Pavilion 11 x360's ACPI VGBS method sets bit 4 instead of bit 6 when
> NOT in tablet mode at boot. Inspecting all the DSDTs in my DSDT collection
> shows only one other model, the Medion E1239T ever setting bit 4 and it
> always sets this together with bit 6.
> 
> So lets treat bit 4 as a second bit which when set indicates the device not
> being in tablet-mode, as we already do for bit 6.
> 
> While at it also prefix all VGBS constant defines with "VGBS_".
> 
> Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index e85d8e58320c..f443619e1e7e 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -15,9 +15,13 @@
>  #include <linux/platform_device.h>
>  #include <linux/suspend.h>
>  
> +/* Returned when NOT in tablet mode on some HP Stream x360 11 models */
> +#define VGBS_TABLET_MODE_FLAG_ALT	0x10
>  /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
> -#define TABLET_MODE_FLAG 0x40
> -#define DOCK_MODE_FLAG   0x80
> +#define VGBS_TABLET_MODE_FLAG		0x40
> +#define VGBS_DOCK_MODE_FLAG		0x80
> +
> +#define VGBS_TABLET_MODE_FLAGS (VGBS_TABLET_MODE_FLAG | VGBS_TABLET_MODE_FLAG_ALT)
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("AceLan Kao");
> @@ -72,9 +76,9 @@ static void detect_tablet_mode(struct platform_device *device)
>  	if (ACPI_FAILURE(status))
>  		return;
>  
> -	m = !(vgbs & TABLET_MODE_FLAG);
> +	m = !(vgbs & VGBS_TABLET_MODE_FLAGS);
>  	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
> -	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
> +	m = (vgbs & VGBS_DOCK_MODE_FLAG) ? 1 : 0;
>  	input_report_switch(priv->input_dev, SW_DOCK, m);
>  }
>  
> -- 
> 2.28.0
> 
