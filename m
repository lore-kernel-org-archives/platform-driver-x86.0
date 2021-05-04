Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D824C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 14:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D8FE611CB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 14:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhEDO5F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 10:57:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:51552 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230246AbhEDO5E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 10:57:04 -0400
IronPort-SDR: 5n6EG0JPyVT7Xy93HJo4OvO/M1DZmpqDiRiKet1UTV2yEjo7c33ryalW+zCC9RKyXwCs0EbrrK
 tfBQfik46M4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198052299"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="198052299"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 07:56:09 -0700
IronPort-SDR: a5y6u8eLfzoTlmH3RBbBzZbslDtwNu7smkGG46CpEjFPkGRJgDXIeOdVLYasTJF4VjNXIVCdqz
 Cr04KJebwGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="531088023"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 04 May 2021 07:56:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 04 May 2021 17:56:03 +0300
Date:   Tue, 4 May 2021 17:56:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
Message-ID: <YJFgg0IQ6Csluoxu@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

> > +/* NOTE: The connector order must be final before this is called. */
> > +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
> > +{
> > +       struct drm_connector_list_iter conn_iter;
> > +       struct drm_device *drm_dev = &i915->drm;
> > +       struct device *kdev = &drm_dev->pdev->dev;
> > +       struct fwnode_handle *fwnode = NULL;
> > +       struct drm_connector *connector;
> > +       struct acpi_device *adev;
> > +
> > +       drm_connector_list_iter_begin(drm_dev, &conn_iter);
> > +       drm_for_each_connector_iter(connector, &conn_iter) {
> > +               /* Always getting the next, even when the last was not
> > used. */
> > +               fwnode = device_get_next_child_node(kdev, fwnode);
> > +               if (!fwnode)
> > +                       break;
> 
> Who is dropping reference counting on fwnode ?
> 
> I’m in the middle of a pile of fixes for fwnode refcounting when
> for_each_child or get_next_child is used. So, please double check you drop
> a reference.

Sorry Andy. This patch is from time before the software nodes
implementation of the get_next_child callback handled the ref counting
properly.

Br,

-- 
heikki
