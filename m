Return-Path: <SRS0=Dww4=ID=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4E5C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 16:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 355C065092
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 16:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhCEQvE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Mar 2021 11:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhCEQuf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 11:50:35 -0500
X-Greylist: delayed 461 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 05 Mar 2021 08:50:35 PST
Received: from vulcan.kevinlocke.name (vulcan.kevinlocke.name [IPv6:2001:19f0:5:727:1e84:17da:7c52:5ab4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A079C061574
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Mar 2021 08:50:35 -0800 (PST)
Received: from kevinolos.kevinlocke.name (2600-6c67-5000-3d1b-bbf5-9078-10b8-e7c1.res6.spectrum.com [IPv6:2600:6c67:5000:3d1b:bbf5:9078:10b8:e7c1])
        (Authenticated sender: kevin@kevinlocke.name)
        by vulcan.kevinlocke.name (Postfix) with ESMTPSA id D3A7920EDB35;
        Fri,  5 Mar 2021 16:42:50 +0000 (UTC)
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
        id AA3D81300170; Fri,  5 Mar 2021 09:42:48 -0700 (MST)
Date:   Fri, 5 Mar 2021 09:42:48 -0700
From:   Kevin Locke <kevin@kevinlocke.name>
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     hdegoede@redhat.com, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs interface to
 reduce wlan tx power
Message-ID: <YEJfiP+oUzgCXG2r@kevinlocke.name>
Mail-Followup-To: Kevin Locke <kevin@kevinlocke.name>,
        Nitin Joshi <nitjoshi@gmail.com>, hdegoede@redhat.com,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212055856.232702-1-njoshi1@lenovo.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 2021-02-12 at 14:58 +0900, Nitin Joshi wrote:
> Some newer Thinkpads have the WLAN antenna placed close to the WWAN
> antenna. In these cases FCC certification requires that when WWAN is
> active we reduce WLAN transmission power. A new Dynamic Power
> Reduction Control (DPRC) method is available from the BIOS on these
> platforms to reduce or restore WLAN Tx power.
> 
> This patch provides a sysfs interface that userspace can use to adjust the
> WLAN power appropriately.

Question from a user: How does wlan_tx_strength_reduce relate to or
interact with ioctl(SIOCSIWTXPOW) (i.e. iwconfig txpower) and
NL80211_ATTR_WIPHY_TX_POWER_LEVEL (i.e. iw dev set txpower)?  If I
request 30 dBm then enable wlan_tx_strength_reduce, what happens?  Same
in the opposite order?  Will ioctl(SIOCGIWTXPOW) show the reduced
txpower?

Thanks,
Kevin
