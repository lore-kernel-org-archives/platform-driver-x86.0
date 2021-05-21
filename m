Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CA7C433B4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 11:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E225613DF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 11:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhEULmo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 07:42:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:42215 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhEULmn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 07:42:43 -0400
IronPort-SDR: Q+tdHRNAiEbF6un6utvy8+tBFbOCznJZmPhhlWFxQCpnzNkXrJnyzp/XGbzzAuz9ZppVcvkKvt
 4j9DOh8NYdsA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="199522139"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="199522139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 04:41:08 -0700
IronPort-SDR: YIK2n34v8umkm+IAPpDeACOESV7W80LamTXMNDhNBVyAxH8Z1juHU5Snnwo+BCpD7gVo7QOa8D
 jojbaFIOwKRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="544043738"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 21 May 2021 04:41:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 21 May 2021 14:41:03 +0300
Date:   Fri, 21 May 2021 14:41:03 +0300
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
Message-ID: <YKecT6x9hOoBkyf2@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
 <YJosrajgV9zem5lr@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJosrajgV9zem5lr@kuha.fi.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 11, 2021 at 10:05:26AM +0300, Heikki Krogerus wrote:
> On Wed, May 05, 2021 at 06:24:07PM +0200, Hans de Goede wrote:
> > Hi All,
> > 
> > Here is v3 of my patchset making DP over Type-C work on devices where the
> > Type-C controller does not drive the HPD pin on the GPU, but instead
> > we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> These look good to me. I can also test these next week if needed. I'll
> give my Tested-by tag after that if these haven't been taken by
> anybody by that.

It's almost weird to see console output from the Type-C connector on
my good old GPD printed to an actual display :-)

At least in my tests, the DP alt mode driver now calls
drm_connector_oob_hotplug_event() only when it should. This is pretty cool!
FWIW:

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


thanks,

-- 
heikki
