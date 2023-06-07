Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCDBC7EE29
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Jun 2023 05:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbjFGF1b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Jun 2023 01:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234481AbjFGF12 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 01:27:28 -0400
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99281994;
        Tue,  6 Jun 2023 22:27:26 -0700 (PDT)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
        id E79C242455; Wed,  7 Jun 2023 06:27:24 +0100 (BST)
Date:   Wed, 7 Jun 2023 06:27:24 +0100
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     AceLan Kao <acelan.kao@canonical.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
Message-ID: <20230607052724.GA29834@srcf.ucam.org>
References: <20230607034331.576623-1-acelan.kao@canonical.com>
 <20230607042032.GA28835@srcf.ucam.org>
 <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 07, 2023 at 01:19:40PM +0800, AceLan Kao wrote:
> Gfx drivers(i915/amdgpu/nvidia) depend on the drm driver, so delaying
> the loading of dell_laptop after drm can ease the issue the most.
> Right, it's still possible to encounter the issue, unfortunately, we
> do not have a better solution for it at the moment.

We could unregister inappropriate backlight drivers when a more 
appropriate one is loaded, or the policy decision around which driver to 
use could be made in userland?
