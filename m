Return-Path: <SRS0=y5BS=DI=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1249AC4727C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Oct 2020 07:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C414C2176B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Oct 2020 07:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9kN6bzX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731699AbgJAHzR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Oct 2020 03:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731697AbgJAHzO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Oct 2020 03:55:14 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5214FC0613D0
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2020 00:55:13 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v12so1963464wmh.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2020 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nxchK35WzNClqTZsaQg5x4PMi7z26OOqbOLc2gLFY54=;
        b=Y9kN6bzXfYnJtEnmJ0d9W1y9qoNRVuLyd0pJrpScGVCWKc2H6HTgNEGiNziQjnFGi4
         W6NJJpy/mIbqaLAnEkm/Oh5qxZg+fCStul0PeHoiMOZWh5OVvuhadZcDOoXyrDBPmb2Z
         qf2HSt3QcUUbFNsYWxwIh8xQdjmPrksQjHMnyX/dKe3mDUJTE9dHJt8OBQ/TUagUy93E
         2LES+b6jYvAbHAtkJrQ64wsr1icfil/zacXERe2n+vbhH27Qx7VB+fbER5+GN0xId2+Y
         I2Gxn0rijwePJaOkvi6Wv0saJknw6yYZJQF+fXZIOYu37qns3Pz8KBM6NQjOXS8etG1V
         yxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nxchK35WzNClqTZsaQg5x4PMi7z26OOqbOLc2gLFY54=;
        b=ijArOhg/xp4EboohsdOQBkiHBGII6xv6EvGldjWGgy3OEpbLlxrTzpZfapHe6oDy5C
         XmS7lTtkJDhfQWNh67wPD2YkVB83jXefG/M95IbNALpPwkA9XGxvPrJW33ZmEA2iFeto
         XBfw9J7KXEzsa0mEP1TG6m5UsZqWHrX+xDCOpSB11RZiZLyA+CeswpWc1PePE8WDPI6t
         sD//sf98okNsv73yErhsLZ5x5jtU9TGrUSjPUcPmDArzLbAFnRzAmyhVxAtJgBrNTwL3
         +cV19SWnM6NGIGzIAzNgmMddftWQloZMvDm0yVsV3QFzGKpN/RqXvY0PJh0M1Vc9aM5v
         Qv0A==
X-Gm-Message-State: AOAM533cfafnMDH37AyJkf2lGPWPa6sSJocK3aPVh0mYJodbcYiuH96d
        6MgxplG030Bfa+I+/gwxzjjDRw==
X-Google-Smtp-Source: ABdhPJwaKf0kHIDcNB6uw/SrtqtjTjJBwBxCYFT1dCOJ5o7Fhad9e52Ro92vjcnUxd3g4SlDKWr3GQ==
X-Received: by 2002:a1c:f208:: with SMTP id s8mr7319753wmc.85.1601538911977;
        Thu, 01 Oct 2020 00:55:11 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id t17sm7411493wrx.82.2020.10.01.00.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 00:55:11 -0700 (PDT)
Date:   Thu, 1 Oct 2020 08:55:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, andriy.shevchenko@linux.intel.com,
        dvhart@infradead.org, andy@infradead.org,
        alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: intel_pmt: Add OOBMSM device ID
Message-ID: <20201001075507.GK6148@dell>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-2-david.e.box@linux.intel.com>
 <20200929095106.GG6148@dell>
 <e23b255493c78d80558b9226920b3c7d54d7c84f.camel@linux.intel.com>
 <20200930071250.GI6148@dell>
 <47276f4aacbf4ec3729e674a573a28cd6399cfd6.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47276f4aacbf4ec3729e674a573a28cd6399cfd6.camel@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 30 Sep 2020, David E. Box wrote:

> On Wed, 2020-09-30 at 08:12 +0100, Lee Jones wrote:
> > On Tue, 29 Sep 2020, David E. Box wrote:
> > 
> > > On Tue, 2020-09-29 at 10:51 +0100, Lee Jones wrote:
> > > > On Fri, 11 Sep 2020, David E. Box wrote:
> > > > 
> > > > > Add Out of Band Management Services Module device ID to Intel
> > > > > PMT
> > > > > driver.
> > > > > 
> > > > > Signed-off-by: Alexander Duyck <
> > > > > alexander.h.duyck@linux.intel.com>
> > > > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > > > ---
> > > > >  drivers/mfd/intel_pmt.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> > > > > index 0e572b105101..8f9970ab3026 100644
> > > > > --- a/drivers/mfd/intel_pmt.c
> > > > > +++ b/drivers/mfd/intel_pmt.c
> > > > > @@ -55,6 +55,8 @@ struct pmt_platform_info {
> > > > >  	unsigned long quirks;
> > > > >  };
> > > > >  
> > > > > +static const struct pmt_platform_info pmt_info;
> > > > > +
> > > > >  static const struct pmt_platform_info tgl_info = {
> > > > >  	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG
> > > > > |
> > > > >  		  PMT_QUIRK_TABLE_SHIFT,
> > > > > @@ -200,8 +202,10 @@ static void pmt_pci_remove(struct pci_dev
> > > > > *pdev)
> > > > >  	pm_runtime_get_sync(&pdev->dev);
> > > > >  }
> > > > >  
> > > > > +#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
> > > > >  #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
> > > > >  static const struct pci_device_id pmt_pci_ids[] = {
> > > > > +	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
> > > > 
> > > > Why are you supplying an empty struct?
> > > 
> > > Because the OOBMSM device doesn't need code provided driver data,
> > > but
> > > info is dereferenced in several areas. We also use kmemdup to copy
> > > driver_data under the assumption that it was provided. We could
> > > allow
> > > for NULL if driver_data is referenced directly.
> > 
> > Just check for NULL.  No need to create and send bogus data.
> 
> Sure. If you haven't already, please note that this patch was pulled
> into the V6 series in the link below. You accepted V5 but Hans
> suggested some late changes after reviewing the new crashlog driver in
> this patchset. So rather than have separate patchsets with a
> dependency, we bundled them all into the original. We'll make these
> changes in V7 now.
> 
> https://lore.kernel.org/patchwork/patch/1313166/

Sounds reasonable. 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
