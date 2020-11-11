Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADE8C388F9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Nov 2020 07:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75F77221F1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Nov 2020 07:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=codon.org.uk header.i=@codon.org.uk header.b="wnSghZhR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgKKHZh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Nov 2020 02:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgKKHZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Nov 2020 02:25:19 -0500
Received: from cavan.codon.org.uk (cavan.codon.org.uk [IPv6:2a00:1098:0:80:1000:c:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219E1C0613D1;
        Tue, 10 Nov 2020 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codon.org.uk; s=63138784; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=j8pvPTokBgjaur48JBsBeg2w6qnfgaTdqOBx0yGuZ3I=; b=wnSghZhR34+/fGIQAj7q+F3oV
        gOzgT9hBZkjvHhSFnPCvpBONn/4sgjJUU3aspY8TPaBgN4TmfL1jdH0lzrWVC0PezyRhBjnQ8S4P8
        /lD89f3YzUB2eo/VRB9hGFNL/l8p09LZrD/g96ZmZf/H0aCwjGbzgFmizVKSG1Si4K0zg=;
Received: from mjg59 by cavan.codon.org.uk with local (Exim 4.89)
        (envelope-from <mjg59@cavan.codon.org.uk>)
        id 1kckUy-0004s8-40; Wed, 11 Nov 2020 07:24:56 +0000
Date:   Wed, 11 Nov 2020 07:24:56 +0000
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     "Yuan, Perry" <Perry.Yuan@dell.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "pali@kernel.org" <pali@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>
Subject: Re: [PATCH]  platform/x86: dell-privacy: Add support for new privacy
 driver
Message-ID: <20201111072456.tkwdzuq2wa7zvbod@srcf.ucam.org>
References: <20201103125542.8572-1-Perry_Yuan@Dell.com>
 <20201104014915.45tbmnrqvccbrd2k@srcf.ucam.org>
 <SJ0PR19MB4528E93631DA5FD8BE1D6E8D84E80@SJ0PR19MB4528.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR19MB4528E93631DA5FD8BE1D6E8D84E80@SJ0PR19MB4528.namprd19.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: mjg59@cavan.codon.org.uk
X-SA-Exim-Scanned: No (on cavan.codon.org.uk); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 11, 2020 at 07:21:07AM +0000, Yuan, Perry wrote:
> > > +    status = acpi_evaluate_object(NULL, ACPI_PRIVACY_EC_ACK, NULL,
> > NULL);
> > > +    if (ACPI_FAILURE(status)) {
> > > +        dev_err(led_cdev->dev, "Error setting privacy audio EC ack
> > value: %d\n",status);
> > > +        return -EIO;
> > > +    }
> > > +    return 0;
> > > +}
> > 
> > What's actually being set here? You don't seem to be passing any arguments.
> 
> Yes,  it is a EC ack notification without any arguments needed. 

I'm confused why it's being exposed as an LED device in that case - 
there's an expectation that this is something that actually controls a 
real LED, which means responding to state. Are you able to share the 
acpidump of a machine with this device?
  
-- 
Matthew Garrett | mjg59@srcf.ucam.org
