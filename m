Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8EAC43460
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 11:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57FE761405
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 11:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhD2Lzh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Apr 2021 07:55:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhD2Lzg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Apr 2021 07:55:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD9976100C;
        Thu, 29 Apr 2021 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619697288;
        bh=EFuIJ2kGdn+wTnQa+8XZmr6F/jtLE+EI8uAIIF5uiT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rNp7vun3lmDpJmVvZcBq7yxtklzexyKbWAMkm7XDgGoE4/mGw4OHLJNJgU0J/CfX7
         hlQ2V9WudP37kQLy9r6FsuocGapSgVp/pdm8zFrFxq74741n1L2o00gmNvmvKfyDXy
         nRw0lsXft2z+GtQ994efP6bEK7GjFA8mWjmQD2fQ=
Date:   Thu, 29 Apr 2021 13:54:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
Message-ID: <YIqehmw+kG53LF3t@kroah.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
> > Userspace could hold open a reference to the connector->kdev device,
> > through e.g. holding a sysfs-atrtribute open after
> > drm_sysfs_connector_remove() has been called. In this case the connector
> > could be free-ed while the connector->kdev device's drvdata is still
> > pointing to it.
> > 
> > Give drm_connector devices there own device type, which allows
> > us to specify our own release function and make drm_sysfs_connector_add()
> > take a reference on the connector object, and have the new release
> > function put the reference when the device is released.
> > 
> > Giving drm_connector devices there own device type, will also allow
> > checking if a device is a drm_connector device with a
> > "if (device->type == &drm_sysfs_device_connector)" check.
> > 
> > Note that the setting of the name member of the device_type struct will
> > cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
> > as extra info. So this extends the uevent part of the userspace API.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Are you sure? I thought sysfs is supposed to flush out any pending
> operations (they complete fast) and handle open fd internally?

Yes, it "should" :)

