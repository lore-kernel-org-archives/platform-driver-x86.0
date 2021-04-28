Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCA3C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1147C6109E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhD1Vx4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21340 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229890AbhD1Vxz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646789;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4FeRx+7tZAzW3f2aXiTu45Velasn4q92EatUtQzE+0w=;
        b=bkiU0TQnQxNlFZ7EQ7QMjZXz//DMf2qQdCCHRBQpaxWBssksyhfp9Vpo8o1xsG4cH8Gtho
        BnaiF0djF29BoK83lj6xN68mJTZJcnOM1Weykpvg15OfIxLTHPzyLI6ZDGt8tkATBH3wyf
        Bodjdr/4/z4EeBKrH2zXKdVdBy4DwQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-HFr7J55yMx-rNcHhbKruSQ-1; Wed, 28 Apr 2021 17:53:05 -0400
X-MC-Unique: HFr7J55yMx-rNcHhbKruSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40586801F98;
        Wed, 28 Apr 2021 21:53:03 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 910095C1BB;
        Wed, 28 Apr 2021 21:52:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band hotplug notification
Date:   Wed, 28 Apr 2021 23:52:48 +0200
Message-Id: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is a new attempt to make DP over Type-C work on devices where the
Type-C controller does not drive the HPD pin on the GPU, but instead
we need to forward HPD events from the Type-C controller to the DRM driver.

For anyone interested here are the old (2019!) patches for this:

https://patchwork.freedesktop.org/patch/288491/
https://patchwork.freedesktop.org/patch/288493/
https://patchwork.freedesktop.org/patch/288495/

Last time I posted this the biggest change requested was for more info to
be included in the event send to the DRM-subsystem, specifically sending
the following info was requested:

1. Which DP connector on the GPU the event is for
2. How many lanes are available
3. Connector orientation

This series is basically an entirely new approach, which no longer
uses the notifier framework at all. Instead the Type-C code looksup
a connector based on a fwnode (this was suggested by Heikki Krogerus)
and then calls a new oob_hotplug_event drm_connector_func directly
on the connector, passing the requested info as argument.

This series not only touches drm subsys files but it also touches
drivers/usb/typec/altmodes/typec_displayport.c, that file usually
does not see a whole lot of changes. So I believe it would be best
to just merge the entire series through drm-misc, Assuming we can
get an ack from Greg for merging the typec_displayport.c changes
this way.

Regards,

Hans


Hans de Goede (8):
  drm/connector: Make the drm_sysfs connector->kdev device hold a
    reference to the connector
  drm/connector: Add a fwnode pointer to drm_connector and register with
    ACPI
  drm/connector: Add drm_connector_find_by_fwnode() function
  drm/connector: Add support for out-of-band hotplug notification
  drm/i915/dp: Add support for out-of-bound hotplug events
  usb: typec: altmodes/displayport: Make dp_altmode_notify() more
    generic
  usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
  platform/x86/intel_cht_int33fe: Correct "displayport" fwnode reference

Heikki Krogerus (1):
  drm/i915: Associate ACPI connector nodes with connector entries

 drivers/gpu/drm/drm_connector.c               |  20 +++
 drivers/gpu/drm/drm_sysfs.c                   | 129 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_acpi.c     |  40 ++++++
 drivers/gpu/drm/i915/display/intel_acpi.h     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  13 ++
 .../platform/x86/intel_cht_int33fe_typec.c    |   4 +-
 drivers/usb/typec/altmodes/displayport.c      |  78 ++++++++---
 include/drm/drm_connector.h                   |  36 +++++
 9 files changed, 292 insertions(+), 32 deletions(-)

-- 
2.31.1

