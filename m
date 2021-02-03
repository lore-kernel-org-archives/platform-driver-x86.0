Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D15C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 13:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E1464F6A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 13:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhBCNpv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 08:45:51 -0500
Received: from mga02.intel.com ([134.134.136.20]:41981 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231191AbhBCNpt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 08:45:49 -0500
IronPort-SDR: nMOcvDfH2Fsr4bGxIvpiEsjMOELGsiymidGlVNPVgVsYe199VVIl4U0sSKFtm/8frcjwYy8IJy
 Bwoo1rO4CE+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="168149474"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="168149474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 05:45:09 -0800
IronPort-SDR: rFPzQ+JV0mP3ySjP7gdoozN8RB+D8XSYyg4o0nDYDtRAvHlYGFKPg81H6enRQ38fDOqd4yDl8O
 VGRiEN0wYMFg==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="433420129"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 05:45:07 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1l7ISv-001dyM-3P; Wed, 03 Feb 2021 15:45:05 +0200
Date:   Wed, 3 Feb 2021 15:45:05 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if
 ACPI_WMI'
Message-ID: <YBqo4REyCXjd2qE+@smile.fi.intel.com>
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
 <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
 <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
 <YBqJ7VmchoG6Kt8t@smile.fi.intel.com>
 <c3fc4dfd-13b5-73c0-7d97-cdab0b61f170@redhat.com>
 <CAHp75Vc1EMUKLoBAaUSqD-TeBuSQbe1gHPGjisp_-W7uWyc1ug@mail.gmail.com>
 <1508278f-eac4-2df3-ca94-d99f4fd2a3a2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508278f-eac4-2df3-ca94-d99f4fd2a3a2@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 03, 2021 at 01:57:10PM +0100, Hans de Goede wrote:
> On 2/3/21 1:16 PM, Andy Shevchenko wrote:
> > On Wed, Feb 3, 2021 at 2:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 2/3/21 12:33 PM, Andy Shevchenko wrote:
> >>> On Wed, Feb 03, 2021 at 11:55:40AM +0100, Hans de Goede wrote:
> >>>> On 2/3/21 11:48 AM, Hans de Goede wrote:
> > 
> > ...
> > 
> >>>> So I still think just sorting the entire bups alphabetically
> >>>> is better. We can then also add a comment at the top to please
> >>>> keep things sorted alphabetically.
> >>>
> >>> In long term I prefer split the entire folder to subfolders where you create
> >>> a new Kconfig with a rules like alphabetical order or so.
> >>>
> >>> Shuffling now Kconfig and Makefile w/o above doesn't bring a value in my
> >>> opinion.
> >>
> >> Ok, lets keep things as is for now then and hopefully in the future
> >> someone will have some time to clean this up a bit.
> > 
> > Or ask contributors from corresponding companies (Dell, Lenovo, etc)
> > to sort this out at least for their devices. Good we have no surface
> > issue with this, since it's in a separate (sibling) folder.
> 
> The biggest group of drivers seem to be Intel drivers, so perhaps
> Intel can set a good example here by moving their drivers to one
> or more sub-folders ?

Why not?

-- 
With Best Regards,
Andy Shevchenko


