Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6BFC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 16:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFB02613B3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 16:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbhEEQZY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 12:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51134 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233794AbhEEQZY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 12:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620231866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3EhU4OEfah1XGTcRkhD0WUD+XZJT95s2WFsG7w+GL7s=;
        b=aF/bGp7Jwu5ssA88qtQCldcttbUVZUb3WKzkzt0SYvwvmdqqOspZjxAd7LInEQOPBow8wh
        lha4j1z1MNeyTtjlMP10SqehkNew2vWV8jZpnOeOawV+EdkH725TNcjfhw5ReuqncFMGic
        Ii0NSiozuLgwPZu9xr660yNmXu8RKCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-FHrWcxalPPawy4qYtKbw8A-1; Wed, 05 May 2021 12:24:23 -0400
X-MC-Unique: FHrWcxalPPawy4qYtKbw8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 125D919251A4;
        Wed,  5 May 2021 16:24:21 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4621A5C5B5;
        Wed,  5 May 2021 16:24:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band hotplug notification (v3)
Date:   Wed,  5 May 2021 18:24:07 +0200
Message-Id: <20210505162415.531876-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is v3 of my patchset making DP over Type-C work on devices where the
Type-C controller does not drive the HPD pin on the GPU, but instead
we need to forward HPD events from the Type-C controller to the DRM driver.

Changes in v3:
- Base on top of latest drm-tip, which should fix the CI being unable to
  apply (and thus to test) the patches
- Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
  it stores in connector->fwnode and have drm_connector_cleanup() put
  this reference
- Drop data argument from drm_connector_oob_hotplug_event()
- Make the Type-C DP altmode code only call drm_connector_oob_hotplug_event()
  when the HPD bit in the status vdo changes
- Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
  reference patch, this will be merged independently through the pdx86 tree

Changes in v2:
- Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
  device hold a reference to the connector" patch with:
  "drm/connector: Give connector sysfs devices there own device_type"
  the new patch is a dep for patch 2/9 see the patches

- Stop using a class-dev-iter, instead at a global connector list
  to drm_connector.c and use that to find the connector by the fwnode,
  similar to how we already do this in drm_panel.c and drm_bridge.c

- Make drm_connector_oob_hotplug_event() take a fwnode pointer as
  argument, rather then a drm_connector pointer and let it do the
  lookup itself. This allows making drm_connector_find_by_fwnode() a
  drm-internal function and avoids code outside the drm subsystem
  potentially holding on the a drm_connector reference for a longer
  period.

This series not only touches drm subsys files but it also touches
drivers/usb/typec/altmodes/typec_displayport.c, that file usually
does not see a whole lot of changes. So I believe it would be best
to just merge the entire series through drm-misc, Assuming we can
get an ack from Greg for merging the typec_displayport.c changes
this way.

Regards,

Hans


Hans de Goede (7):
  drm/connector: Give connector sysfs devices there own device_type
  drm/connector: Add a fwnode pointer to drm_connector and register with
    ACPI (v2)
  drm/connector: Add drm_connector_find_by_fwnode() function (v2)
  drm/connector: Add support for out-of-band hotplug notification (v3)
  drm/i915/dp: Add support for out-of-bound hotplug events
  usb: typec: altmodes/displayport: Make dp_altmode_notify() more
    generic
  usb: typec: altmodes/displayport: Notify drm subsys of hotplug events

Heikki Krogerus (1):
  drm/i915: Associate ACPI connector nodes with connector entries (v2)

 drivers/gpu/drm/drm_connector.c              | 79 ++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h          |  1 +
 drivers/gpu/drm/drm_sysfs.c                  | 87 +++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 46 +++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 12 +++
 drivers/usb/typec/altmodes/Kconfig           |  1 +
 drivers/usb/typec/altmodes/displayport.c     | 58 ++++++++-----
 include/drm/drm_connector.h                  | 25 ++++++
 10 files changed, 278 insertions(+), 35 deletions(-)

-- 
2.31.1

