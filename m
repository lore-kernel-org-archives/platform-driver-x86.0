Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A51C43461
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 07:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F466616EB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 07:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhEKHGd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 May 2021 03:06:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:35527 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230023AbhEKHGd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 03:06:33 -0400
IronPort-SDR: y1TF5a4ha7Ll1qJV2tGm9LYUzNe36TMevKhoRwuh5579qxj1EzLfX8uvtL9nSOmJUVOGpUbmNT
 6xSg1y0hPeUw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284860404"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="284860404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:05:27 -0700
IronPort-SDR: hh35SLA9NsSXcIAkKsRmTz4fGM3LJ701A5s98ePVIVbSepPXsKrbp7Z9UljauOgIpTo2BRVpCY
 pg+RqwNt2j6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="536847702"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 May 2021 00:05:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 May 2021 10:05:17 +0300
Date:   Tue, 11 May 2021 10:05:17 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v3)
Message-ID: <YJosrajgV9zem5lr@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505162415.531876-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 05, 2021 at 06:24:07PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v3 of my patchset making DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.

These look good to me. I can also test these next week if needed. I'll
give my Tested-by tag after that if these haven't been taken by
anybody by that.


thanks,

-- 
heikki
