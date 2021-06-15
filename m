Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9D7C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 07:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 191EB61417
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 07:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFOHnD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:43:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230074AbhFOHnD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 03:43:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 564E3610CD;
        Tue, 15 Jun 2021 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623742859;
        bh=VwEjZA+HLYCz2yRgKmTJNqgBt/h66NCTj9MfoC5gaww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kYMdoWDLs7rJmcw26Crm656vvOkuphOrxxa5mnTunPuTHKsG8IbcQFOp6D454pdo1
         W5vWO4J1i3yTSSzNBVrZLld7ptk8LW31Bk/OE34hHcej7SXGTvrmkL21SggR+/ryV6
         9ypiyBuaas3MxZTluSc3fWmwJy9Obf3iYfXAe/dY=
Date:   Tue, 15 Jun 2021 09:40:56 +0200
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
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v4)
Message-ID: <YMhZiAFshz1xklUK@kroah.com>
References: <20210604194840.14655-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604194840.14655-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jun 04, 2021 at 09:48:32PM +0200, Hans de Goede wrote:
> Here is v3 of my patchset making DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> Changes in v4:
> - Rebase on top of latest drm-tip
> - Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
>   (fixes warning reported by kernel test robot <lkp@intel.com>)
> - Add Heikki's Reviewed-by to patch 7 & 8
> - Add Heikki's Tested-by to the series
> 
> Changes in v3:
> - Base on top of latest drm-tip, which should fix the CI being unable to
>   apply (and thus to test) the patches
> - Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
>   it stores in connector->fwnode and have drm_connector_cleanup() put
>   this reference
> - Drop data argument from drm_connector_oob_hotplug_event()
> - Make the Type-C DP altmode code only call drm_connector_oob_hotplug_event()
>   when the HPD bit in the status vdo changes
> - Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
>   reference patch, this will be merged independently through the pdx86 tree
> 
> Changes in v2:
> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>   device hold a reference to the connector" patch with:
>   "drm/connector: Give connector sysfs devices there own device_type"
>   the new patch is a dep for patch 2/9 see the patches
> 
> - Stop using a class-dev-iter, instead at a global connector list
>   to drm_connector.c and use that to find the connector by the fwnode,
>   similar to how we already do this in drm_panel.c and drm_bridge.c
> 
> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>   argument, rather then a drm_connector pointer and let it do the
>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>   drm-internal function and avoids code outside the drm subsystem
>   potentially holding on the a drm_connector reference for a longer
>   period.
> 
> This series not only touches drm subsys files but it also touches
> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
> does not see a whole lot of changes. So I believe it would be best
> to just merge the entire series through drm-misc, Assuming we can
> get an ack from Greg for merging the typec_displayport.c changes
> this way.

No objection from me, I've replied with reviewed-by for those USB
patches now.

thanks,
greg k-h
