Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD287C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Jun 2023 07:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbjFGHuC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Jun 2023 03:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239315AbjFGHtV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 03:49:21 -0400
X-Greylist: delayed 12360 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Jun 2023 00:47:34 PDT
Received: from cavan.codon.org.uk (cavan.codon.org.uk [176.126.240.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8911712;
        Wed,  7 Jun 2023 00:47:33 -0700 (PDT)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
        id 897D242532; Wed,  7 Jun 2023 08:47:32 +0100 (BST)
Date:   Wed, 7 Jun 2023 08:47:32 +0100
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     AceLan Kao <acelan.kao@canonical.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
Message-ID: <20230607074732.GA31666@srcf.ucam.org>
References: <20230607034331.576623-1-acelan.kao@canonical.com>
 <20230607042032.GA28835@srcf.ucam.org>
 <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
 <20230607052724.GA29834@srcf.ucam.org>
 <CAFv23QkEdGnEz1q7vbyFCa9S9Dqh-zec72nRGyZ3wAz-8wpbvA@mail.gmail.com>
 <20230607062341.GA30618@srcf.ucam.org>
 <20230607065604.yaivqbbd3dkawxo4@pali>
 <CAFv23Q==r4newMXE3OWavRSRt-bEi5-qR0Vo-5HGLw4r9J36MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFv23Q==r4newMXE3OWavRSRt-bEi5-qR0Vo-5HGLw4r9J36MA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 07, 2023 at 03:39:33PM +0800, AceLan Kao wrote:

> What do you think if we unregister backlight devices if the backlight type
> is larger than the current registered one.
> Do this check in backlight_device_register() and unregister backlight
> devices by the order raw(1) > platform(2) > firmware(3)
> And maybe introduce a sticky bit into the backlight device if the backlight
> driver doesn't want to be removed.

Hans looked at doing this, but there were some awkward corner cases. 
When we first introduced this functionality, firmware was preferred to 
platform was preferred to raw - but on Intel, at least, this behaviour 
changed with later versions of Windows. I don't think there's a single 
static policy that works, I think you need to pay attention to the hints 
the platform gives you. How does Windows know which interface to use on 
this platform? The simplest solution may actually just be for 
dell-laptop to refuse to register a backlight if the platform claims to 
be Windows 8 or later.
