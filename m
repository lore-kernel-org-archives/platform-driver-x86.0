From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Sat, 4 Feb 2017 17:06:53 +0100
Message-ID: <20170204160653.GA27398@pali>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain>
 <20170204012605.GA43075@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36447 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdBDQHA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 11:07:00 -0500
Received: by mail-wm0-f66.google.com with SMTP id r18so11796698wmd.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Feb 2017 08:06:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170204012605.GA43075@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

Hi!

On Saturday 04 February 2017 02:26:05 Darren Hart wrote:
> Apologies, this time with Pali's correct email address (aliases fail).
> 
...
> > 
> > Pali, would you care to offer a review or some testing to verify no unexpected
> > conflicts with the other dell drivers?

I do not have Dell machine which uses intel-hid.ko so I cannot test this
patch. And obviously as it is not loaded it cannot break machines which
do not use intel-hid.ko.

> > > +/* 5 button array notification value. */
> > > +static const struct key_entry intel_array_keymap[] = {
> > > +	{ KE_KEY,    0xC2, { KEY_LEFTMETA} },                /* Press */
> > > +	{ KE_IGNORE, 0xC3, { KEY_LEFTMETA} },                /* Release */
> > > +	{ KE_KEY,    0xC4, { KEY_VOLUMEUP} },                /* Press */
> > > +	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP} },                /* Release */
> > > +	{ KE_KEY,    0xC6, { KEY_VOLUMEDOWN} },              /* Press */
> > > +	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN} },	             /* Release */
> > > +	{ KE_SW,     0xC8, { .sw = {SW_ROTATE_LOCK, 1} } },   /* Press */
> > > +	{ KE_SW,     0xC9, { .sw = {SW_ROTATE_LOCK, 0} } },   /* Release */
> > > +	{ KE_KEY,    0xCE, { KEY_POWER} },                   /* Press */
> > > +	{ KE_IGNORE, 0xCF, { KEY_POWER} },                   /* Release */
> > > +	{ KE_END },
> > > +};

This looks suspicious. Why are all release events ignored?

-- 
Pali Rohár
pali.rohar@gmail.com
