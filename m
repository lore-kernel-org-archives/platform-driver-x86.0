Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA68CC48BDF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 07:40:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADF6E61410
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 07:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhFOHm0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:42:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230043AbhFOHmZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 03:42:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BFB361407;
        Tue, 15 Jun 2021 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623742822;
        bh=73gizlTliA/pud7w2GB11phk8X+Xma4eI8ERl2bELx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nALmmLayCSws1PcRJJvY8AgVIKnY6846SjpsFOin4HCHe/mE8gBdQaPr33MsrFHrC
         4g2p6Ge/Tit8UHynCEiyNFP0rEZCSbDXVJ+NDZ+a4+2zYlUIyUyJ4M1632VRPRTXiy
         WzKwiiU3ZMMeLoFTVHIlgeFv1e12fLaEpgOeaX/M=
Date:   Tue, 15 Jun 2021 09:40:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: typec: altmodes/displayport: Make
 dp_altmode_notify() more generic
Message-ID: <YMhZY6aVgTRl20rD@kroah.com>
References: <20210604194840.14655-1-hdegoede@redhat.com>
 <20210604194840.14655-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604194840.14655-8-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jun 04, 2021 at 09:48:39PM +0200, Hans de Goede wrote:
> Make dp_altmode_notify() handle the dp->data.conf == 0 case too,
> rather then having separate code-paths for this in various places
> which call it.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 35 +++++++++---------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
