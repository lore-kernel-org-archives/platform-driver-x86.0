Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B186EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Jan 2022 11:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbiAEL2C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Jan 2022 06:28:02 -0500
Received: from mga06.intel.com ([134.134.136.31]:31859 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233838AbiAEL2C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Jan 2022 06:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641382082; x=1672918082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8VeuXiGzgGOwCJBVNY12Xld7RNyObSnZSQkX+iqDvkA=;
  b=aVLzJ9FDaNkmAnnMXb8CUP3Xbp16HBueT/xWedQpwe5v+JS0be/Ta3AP
   C/E3qA73DByFA+vzfNuaoAzlaHJRzTci1zRYhBaaZWSITHul5A5+dQVNI
   YRFPJgAUVdTSbDAlBxoGHcJ8iQaYzUugLK8I8MOkagoS3i4ovXT8VD19E
   wLc8xkcM0lVyuQLdLtAMPfDmYu9BjW6ImpSQ04VM2avsMTBtrxWyEPQeP
   qqLanwLREtz1kSFyQJfE3WNCvm6/uP6D7/YxDceQ2WMulVLqSkdt5W7oh
   7/YuVz0j0A5Vhq83na5XMZjcEElwTiggqGlF9k3KHKg2Ui7UCgt1HP+yL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303172950"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="303172950"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 03:28:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="590990530"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 03:27:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n54RG-006fiG-EG;
        Wed, 05 Jan 2022 13:26:42 +0200
Date:   Wed, 5 Jan 2022 13:26:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH] platform/x86: Add Asus TF103C dock driver
Message-ID: <YdWAcvCjKU0kcx+i@smile.fi.intel.com>
References: <20211226141849.156407-1-hdegoede@redhat.com>
 <YdRokPBoYYnF+D3D@smile.fi.intel.com>
 <3504b30f-a63d-c0cd-00ce-38ab0089c5be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3504b30f-a63d-c0cd-00ce-38ab0089c5be@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 05, 2022 at 12:06:57PM +0100, Hans de Goede wrote:
> On 1/4/22 16:32, Andy Shevchenko wrote:
> > On Sun, Dec 26, 2021 at 03:18:49PM +0100, Hans de Goede wrote:

...

> >> +/* Byte 0 is the length of the rest of the packet */
> >> +static const u8 tf103c_dock_enable_cmd[9] = { 8, 0x20, 0, 0, 0, 0, 0x20, 0, 0 };
> >> +static const u8 tf103c_dock_usb_enable_cmd[9] = { 8, 0, 0, 0, 0, 0, 0, 0x40, 0 };
> >> +static const u8 tf103c_dock_suspend_cmd[9] = { 8, 0, 0x20, 0, 0, 0x22, 0, 0, 0 };
> > 
> > This seems to me rather
> > 
> > struct {
> > 	u8 cmd;
> > 	DECLARE_BITMAP(payload, 64);
> > };
> > 
> > And those 2s and 4s are actually some bits in payload with some meaning.
> > 
> > Would it be the case?
> 
> Something like that yes, there are some hints that this is a bitfield in
> the Android driver code, but then in other places it seems to be more of
> a command structure then just individual bits having a meaning.
> 
> All in all we really don't know, so I'm going to keep this as just
> an opaque array of bytes, because that is really what it is / what we know
> about it.

Thinking more about this it rather __le64. then it's more easily to see the
bits there. I still think the byte array here carries less information than
what we can assume. In the case of __le64 you don't need to keep a length,
you may derive it from the size of the supplied variable.

-- 
With Best Regards,
Andy Shevchenko


