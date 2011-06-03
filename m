From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control file
Date: Fri, 3 Jun 2011 15:12:38 -0700
Message-ID: <201106031512.38349.dmitry.torokhov@gmail.com>
References: <4DE8FC4A.9010401@absence.it> <201106031400.36141.dmitry.torokhov@gmail.com> <4DE9563F.9010503@absence.it>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:53539 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752759Ab1FCWMo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 18:12:44 -0400
Received: by pxi2 with SMTP id 2so1474504pxi.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jun 2011 15:12:44 -0700 (PDT)
In-Reply-To: <4DE9563F.9010503@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

On Friday, June 03, 2011 02:46:39 PM Marco Chiappero wrote:
> Il 03/06/2011 23:00, Dmitry Torokhov ha scritto:
> > The issue with that that we are breeding myriad of quirks
> 
> Where is the quirk?

The quirk is that for given device there is a sysfs attribute somewhere
that one can write something into to turn the touchpad off. 

> If many vendors provide the same feature let's
> create a common interface for that.
> 
> > that nobody
> > knows  about
> 
> This is false, especially for (so many) people using Windows too, where
> the feature is clearly visible by the OEM software.

Thankfully OEM software either does not exist or is not widespread on
Linux. 

> 
> > and nobody ever uses.
> 
> Again, this is false, and I don't think you can speak for everybody.

No, I indeed can not speak for everybody, but it is my belief that this
feature in the form it is implemented will not be widely used.

> 
> > X provides standardized way of
> > ignoring input devices.
> 
> Let's create a standardized solution, instead of using a standardized
> hack.
> 
> > It is also more transparent than "I once wrote
> > something to some sysfs file and I completely forgot about this but
> > now my touchpad does not work".
> 
> The problem does not lie in the sysfs file, lies in the lack of
> userspace software for it (BTW, about this case someone already created
> a Vaio specific GUI for an easy control of these features).

Gah... Vaio-specific, Dell-specific, HP-specific... I'd rather we do not
go down this road. The kernel needs to abstract away this data and present
unified interface to the userspace. For bonus points... No, scratch that.
The interface should behave consistently for all input devices, including
keyboards, keypads, etc. 

> 
> > There were quite a few bugs filed just
> > because users pressed key that cuts power to touchpad and stores the
> > state across reboots.
> 
> It's very much like saying that we should not produce cars because some
> people use them improperly and crash. People doing wrong things will
> always be present, we can improve userspace software to help them
> instead, not just delete features they payed for (and they wanted to
> use, at least once as you say).

No, it's like saying railroad tracks should be unified instead of every
country inventing their own size. We all know how helpful it was.

> 
> >> (and why should we suppose that X will be used always and
> >> forever?).
> > 
> > We should not but replacement should have at least the same
> > functionality if not better.
> 
> I agree, but this doesn't necessarily mean it will use an hack again.
> 
> It's a common and widespread feature, let's support it better instead of
> just removing it.

What is the feature again? What do users really want to do here?
Do they turn off the touchpad because in interferes when they type?
Do they hate touchpads? Do they believe they will save power if the
touchpad is off?

Thanks.

-- 
Dmitry
