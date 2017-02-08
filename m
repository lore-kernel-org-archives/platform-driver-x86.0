From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Wed, 8 Feb 2017 08:21:46 +0100
Message-ID: <20170208072146.GA1199@ozzy.nask.waw.pl>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain>
 <20170204012605.GA43075@f23x64.localdomain>
 <20170204160653.GA27398@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:32967 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753425AbdBHH34 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2017 02:29:56 -0500
Received: by mail-lf0-f65.google.com with SMTP id x1so8548734lff.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Feb 2017 23:28:23 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170204160653.GA27398@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

> Hi!
> 
> On Saturday 04 February 2017 02:26:05 Darren Hart wrote:
> > Apologies, this time with Pali's correct email address (aliases fail).
> > 
> ...
> > > 
> > > Pali, would you care to offer a review or some testing to verify no unexpected
> > > conflicts with the other dell drivers?
> 
> I do not have Dell machine which uses intel-hid.ko so I cannot test this
> patch. And obviously as it is not loaded it cannot break machines which
> do not use intel-hid.ko.
> 
> > > > +/* 5 button array notification value. */
> > > > +static const struct key_entry intel_array_keymap[] = {
> > > > +	{ KE_KEY,    0xC2, { KEY_LEFTMETA} },                /* Press */
> > > > +	{ KE_IGNORE, 0xC3, { KEY_LEFTMETA} },                /* Release */
> > > > +	{ KE_KEY,    0xC4, { KEY_VOLUMEUP} },                /* Press */
> > > > +	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP} },                /* Release */
> > > > +	{ KE_KEY,    0xC6, { KEY_VOLUMEDOWN} },              /* Press */
> > > > +	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN} },	             /* Release */
> > > > +	{ KE_SW,     0xC8, { .sw = {SW_ROTATE_LOCK, 1} } },   /* Press */
> > > > +	{ KE_SW,     0xC9, { .sw = {SW_ROTATE_LOCK, 0} } },   /* Release */
> > > > +	{ KE_KEY,    0xCE, { KEY_POWER} },                   /* Press */
> > > > +	{ KE_IGNORE, 0xCF, { KEY_POWER} },                   /* Release */
> > > > +	{ KE_END },
> > > > +};
> 
> This looks suspicious. Why are all release events ignored?

I also do not have a Dell machine that makes use of this driver, but my
understanding is that calling sparse_keymap_report_event() with
autorelease set to true makes release events irrelevant and simplifies
implementation.  Though each release event still needs a KE_IGNORE entry
in the keymap so that superfluous KEY_UNKNOWN events are suppressed.

-- 
Best regards,
Michał Kępień
