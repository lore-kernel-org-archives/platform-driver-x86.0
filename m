Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE54C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 18:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEFA26522E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 18:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhCISNP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Mar 2021 13:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbhCISNN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 13:13:13 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD733C06175F
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Mar 2021 10:13:12 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id u14so17565642wri.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Mar 2021 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FCeZyWcx9r714dGfzrG/eDg2CjZxdafC8NUDOqSGmK0=;
        b=ZlEUmstZoffnFnTMbp7Mx7IYuB0Y9erWcp9Dd9ub19kDHfGEXjWh6s2mKnhZAGTD2N
         rCtEQ67xmfAdHV4q4WBG0WosdG2f9ChH5yAevX+zkdaEBtkaxBjDIOX/9Wdyw1qLNdXC
         3PLdMsOvze9CoyPiLf8/rMNWGH5qvZoS4Acj9XzqfbVUafRVUW4cCj+bxkXVEw4PflBz
         JrBCzYuCzuLQ7Oug9WCyBxLHi3VtKNlKLwiIj7klqXDSk+R5vW9ETXWaI/FkSeuH4efm
         N2P7j0gjBPZP60ZuH83J8/3k7lmaBsqMareL1bnzWpMpR89UmQAOB499Z9wl/t+8Tzd2
         D2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FCeZyWcx9r714dGfzrG/eDg2CjZxdafC8NUDOqSGmK0=;
        b=IPQJ9Y6ZO/JXRF14jkFJdax6FdHAOY87cXfZ0M3mi1zUdU1PN98lVWWOh8iFcvNjT+
         n/xGv3Shm/SsmO0QZVv2aLhBL28saLUqxUqOFfI8rH5NZglDDPfgfL1Amu6SH1rZL+TR
         GtUAAVeD9TXejMBenqncRsyZjaNybdR8c8qRVLnBIv1QLYhOvio5QU9cPJ5Rg82cGy0V
         9eLXutx884UPNkYcwxzAJwR/NNFWsi3sGJ3GJ+iGP5ySw+sjBSUCJ1bIGGzUQB7pCaMj
         HodfYz8L4IJKcYQ3mrW+A1mmhnpfhst6k3ASxd7PqTKljev//MQNZUfEMgHb6OvGu9WS
         VycA==
X-Gm-Message-State: AOAM533EzmXPzglpCO5yamLpafqmncAvs3XvVck6le4ryOjVCzM4dyY3
        D28aoTB6NsF7/Al219qn2CJf7w==
X-Google-Smtp-Source: ABdhPJzpCyTvZXmsjkhmc4OXvVuou8AfZalrUtZSBIE+FL6zOixU/nyCPT0oKHN8HBlj1g1W6nlZCw==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr29350224wrn.59.1615313591515;
        Tue, 09 Mar 2021 10:13:11 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id 9sm5237993wmf.13.2021.03.09.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 10:13:11 -0800 (PST)
Date:   Tue, 9 Mar 2021 18:13:09 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2 V2] MFD: intel_pmt: Add support for DG1
Message-ID: <20210309181309.GU4931@dell>
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-2-david.e.box@linux.intel.com>
 <20210309164505.GS4931@dell>
 <d4e0883f6f71bbfc68804c97222b28acad77f969.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4e0883f6f71bbfc68804c97222b28acad77f969.camel@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 09 Mar 2021, David E. Box wrote:

> On Tue, 2021-03-09 at 16:45 +0000, Lee Jones wrote:
> > On Wed, 24 Feb 2021, David E. Box wrote:
> > 
> > > Adds PMT Telemetry aggregator support for the DG1 graphics PCIe
> > > card. The
> > > device does not have the DVSEC region in its PCI config space so
> > > hard
> > > code the discovery table data in the driver. Also requires a fix
> > > for DG1
> > > in the Telemetry driver for how the ACCESS_TYPE field is used.
> > > 
> > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > ---
> > > Based on 5.11-rc1 review-hans branch:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> > > 
> > > Changes from V1:
> > > 
> > >         - New patch
> > > 
> > >  drivers/mfd/intel_pmt.c                    | 101 +++++++++++++++--
> > > ----
> > >  drivers/platform/x86/intel_pmt_class.c     |  46 ++++++++++
> > >  drivers/platform/x86/intel_pmt_class.h     |   1 +
> > >  drivers/platform/x86/intel_pmt_telemetry.c |  20 ----
> > >  4 files changed, 119 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> > > index 65da2b17a204..dd7eb614c28e 100644
> > > --- a/drivers/mfd/intel_pmt.c
> > > +++ b/drivers/mfd/intel_pmt.c
> > > @@ -49,10 +49,14 @@ enum pmt_quirks {
> > >  
> > >         /* Use shift instead of mask to read discovery table offset
> > > */
> > >         PMT_QUIRK_TABLE_SHIFT   = BIT(2),
> > > +
> > > +       /* DVSEC not present (provided in driver data) */
> > > +       PMT_QUIRK_NO_DVSEC      = BIT(3),
> > >  };
> > >  
> > >  struct pmt_platform_info {
> > >         unsigned long quirks;
> > > +       struct intel_dvsec_header **capabilities;
> > >  };
> > >  
> > >  static const struct pmt_platform_info tgl_info = {
> > > @@ -60,6 +64,26 @@ static const struct pmt_platform_info tgl_info =
> > > {
> > >                   PMT_QUIRK_TABLE_SHIFT,
> > >  };
> > >  
> > > +/* DG1 Platform with DVSEC quirk*/
> > > +static struct intel_dvsec_header dg1_telemetry = {
> > > +       .length = 0x10,
> > > +       .id = 2,
> > > +       .num_entries = 1,
> > > +       .entry_size = 3,
> > > +       .tbir = 0,
> > > +       .offset = 0x466000,
> > > +};
> > > +
> > > +static struct intel_dvsec_header *dg1_capabilities[] = {
> > > +       &dg1_telemetry,
> > > +       NULL
> > > +};
> > > +
> > > +static const struct pmt_platform_info dg1_info = {
> > > +       .quirks = PMT_QUIRK_NO_DVSEC,
> > > +       .capabilities = dg1_capabilities,
> > > +};
> > > +
> > >  static int pmt_add_dev(struct pci_dev *pdev, struct
> > > intel_dvsec_header *header,
> > >                        unsigned long quirks)
> > >  {
> > > @@ -147,37 +171,54 @@ static int pmt_pci_probe(struct pci_dev
> > > *pdev, const struct pci_device_id *id)
> > >         if (info)
> > >                 quirks = info->quirks;
> > >  
> > > -       do {
> > > -               struct intel_dvsec_header header;
> > > -               u32 table;
> > > -               u16 vid;
> > > +       if (info && (info->quirks & PMT_QUIRK_NO_DVSEC)) {
> > 
> > Nit: Why not use 'quirks' from a few lines above?
> 
> Ack

I've applied this.  Can you fix this as a follow-up please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
