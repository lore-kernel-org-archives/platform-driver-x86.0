Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D178C7EE25
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Jun 2023 04:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbjFGEda (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Jun 2023 00:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjFGEcv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 00:32:51 -0400
X-Greylist: delayed 608 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Jun 2023 21:30:57 PDT
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4107330D1;
        Tue,  6 Jun 2023 21:30:57 -0700 (PDT)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
        id 7B7DD42455; Wed,  7 Jun 2023 05:20:32 +0100 (BST)
Date:   Wed, 7 Jun 2023 05:20:32 +0100
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     AceLan Kao <acelan.kao@canonical.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
Message-ID: <20230607042032.GA28835@srcf.ucam.org>
References: <20230607034331.576623-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607034331.576623-1-acelan.kao@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 07, 2023 at 11:43:31AM +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> dell_laptop is somethines loaded before nvidia driver, causing it to
> create its own backlight interface before native backlight is set.
> This results in the presence of 2 backlight interfaces in sysfs and
> leads to the backlight can't be adjusted.

It seems like this approach would still be broken if the nvidia module 
isn't available at the time the dell module is loaded?
