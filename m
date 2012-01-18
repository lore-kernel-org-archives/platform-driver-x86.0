From: Ryan Lewis <me@ryanlewis.net>
Subject: Re: [PATCH v2] Fujitsu tablet extras driver
Date: Wed, 18 Jan 2012 17:57:45 -0500
Message-ID: <CA+L2dvFPy27r7kJJEdVnaZV9Y3S6KOEGrkediS7xjuYpC9FedQ@mail.gmail.com>
References: <20120118053258.GB32285@core.coreip.homeip.net>
 <1326893182-19478-1-git-send-email-khnz@gmx.de> <20120118204515.GA9125@core.coreip.homeip.net>
 <20120118205840.0fc3afec@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:39313 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754094Ab2ARW6I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Jan 2012 17:58:08 -0500
Received: by wibhm6 with SMTP id hm6so2622065wib.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jan 2012 14:58:06 -0800 (PST)
In-Reply-To: <20120118205840.0fc3afec@pyramind.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Robert Gerlach <khnz@gmx.de>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Wed, Jan 18, 2012 at 3:58 PM, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> On Wed, 18 Jan 2012 12:45:15 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
>> On Wed, Jan 18, 2012 at 02:26:22PM +0100, Robert Gerlach wrote:
>> > This patch adds support for some of the devices within a wide variety
>> > of Fujitsu Tablet Computers, both convertibles and slates. Primarily
>> > it allows for the automatic detection of the tablet/notebook mode for
>> > convertible tablet pc's, and orientation for docked slates. It also
>> > adds support for the application panel buttons usually found next to
>> > the tablet screen, and docking station detection for slates.
>> >
>> > Signed-off-by: Robert Gerlach <khnz@gmx.de>
>>
>> Acked-by: Dmitry Torokhov <dtor@mail.ru>
>
> Acked-by: Alan Cox <alan@linux.intel.com>
>
> [And tested with an extra table for my Fujitsu Oaktrail based tablet I'll
> send along once this is merged]

Tested-by: Ryan H. Lewis <me@ryanlewis.net>

Works on both my Fujitsu T901 and T4215
