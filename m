From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v2] Fujitsu tablet extras driver
Date: Wed, 18 Jan 2012 20:58:40 +0000
Message-ID: <20120118205840.0fc3afec@pyramind.ukuu.org.uk>
References: <20120118053258.GB32285@core.coreip.homeip.net>
	<1326893182-19478-1-git-send-email-khnz@gmx.de>
	<20120118204515.GA9125@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:47286 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757574Ab2ARU5Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Jan 2012 15:57:25 -0500
In-Reply-To: <20120118204515.GA9125@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Robert Gerlach <khnz@gmx.de>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Ryan Lewis <me@ryanlewis.net>

On Wed, 18 Jan 2012 12:45:15 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Wed, Jan 18, 2012 at 02:26:22PM +0100, Robert Gerlach wrote:
> > This patch adds support for some of the devices within a wide variety
> > of Fujitsu Tablet Computers, both convertibles and slates. Primarily
> > it allows for the automatic detection of the tablet/notebook mode for
> > convertible tablet pc's, and orientation for docked slates. It also
> > adds support for the application panel buttons usually found next to
> > the tablet screen, and docking station detection for slates.
> > 
> > Signed-off-by: Robert Gerlach <khnz@gmx.de>
> 
> Acked-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Alan Cox <alan@linux.intel.com>

[And tested with an extra table for my Fujitsu Oaktrail based tablet I'll
send along once this is merged]
