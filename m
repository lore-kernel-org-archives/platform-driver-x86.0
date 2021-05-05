Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F6CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1ECF613B3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbhEEK3p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 06:29:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:3871 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhEEK3p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 06:29:45 -0400
IronPort-SDR: ElRX5uEn6AjY5Fen2dmUS+e9ofi3uOirPXWWHt/vd2mTiuipEAPa+/W7WK+goe2vcw6Ci2WNHg
 M9q+Vn0uPx2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198234841"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="198234841"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 03:28:49 -0700
IronPort-SDR: oN74f6sSgF4XCZmYoweQxh2eme3Q+Lr2Q0f4Zojo1rOngA3iziW4ASRUGicslRBouwtelEX6p5
 BfMI5DHUysuA==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="618912096"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 03:28:45 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 43061203BC;
        Wed,  5 May 2021 13:28:43 +0300 (EEST)
Date:   Wed, 5 May 2021 13:28:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
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
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
Message-ID: <20210505102843.GM3@paasikivi.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
 <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy, Hans,

On Wed, May 05, 2021 at 12:17:14PM +0300, Andy Shevchenko wrote:
> On Wed, May 5, 2021 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 5/4/21 9:52 AM, Andy Shevchenko wrote:
> > > On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
> ...
> 
> > >     +               fwnode = device_get_next_child_node(kdev, fwnode);
> 
> > > Who is dropping reference counting on fwnode ?
> >
> > We are dealing with ACPI fwnode-s here and those are not ref-counted, they
> > are embedded inside a struct acpi_device and their lifetime is tied to
> > that struct. They should probably still be ref-counted (with the count
> > never dropping to 0) so that the generic fwnode functions behave the same
> > anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_subnode()
> > in drivers/acpi/property.c which is the get_next_child_node() implementation
> > for ACPI fwnode-s.
> 
> Yes, ACPI currently is exceptional, but fwnode API is not.
> If you may guarantee that this case won't ever be outside of ACPI and
> even though if ACPI won't ever gain a reference counting for fwnodes,
> we can leave it as is.
> 
> > > I’m in the middle of a pile of fixes for fwnode refcounting when
> > > for_each_child or get_next_child is used. So, please double check you
> > > drop a reference.
> >
> > The kdoc comments on device_get_next_child_node() / fwnode_get_next_child_node()
> > do not mention anything about these functions returning a reference.
> 
> It's possible. I dunno if it had to be done earlier. Sakari?

The fwnode API has worked with references for a long time, looks like from
the very beginning of it, as in patch
8a0662d9ed2968e1186208336a8e1fab3fdfea63 .

If you're expecting an fwnode family of function returning another node,
then that function has to have taken a reference to that node before
returning it. Otherwise there's no guarantee that node is still there when
it is returned.

It may be this is not documented for every function doing so. That should
probably be added.

-- 
Kind regards,

Sakari Ailus
