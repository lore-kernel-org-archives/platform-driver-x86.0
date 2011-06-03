From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control file
Date: Fri, 3 Jun 2011 14:00:35 -0700
Message-ID: <201106031400.36141.dmitry.torokhov@gmail.com>
References: <4DE8FC4A.9010401@absence.it> <201106031323.55763.dmitry.torokhov@gmail.com> <4DE94501.1080905@absence.it>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:56020 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753630Ab1FCVAm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 17:00:42 -0400
Received: by pvg12 with SMTP id 12so1044375pvg.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jun 2011 14:00:41 -0700 (PDT)
In-Reply-To: <4DE94501.1080905@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

On Friday, June 03, 2011 01:33:05 PM Marco Chiappero wrote:
> Il 03/06/2011 22:23, Dmitry Torokhov ha scritto:
> > Why do we want to do this? X allows to ignore certain pointing devices
> > IIRC.
> 
> Because I believe it turns off the device, the power state is also
> stored and preserved across reboots and shutdowns. Telling X to ignore
> the input is, IMHO, a workaround if we have the hardware capability for
> that

The issue with that that we are breeding myriad of quirks that nobody
knows about and nobody ever uses. X provides standardized way of
ignoring input devices. It is also more transparent than "I once wrote
something to some sysfs file and I completely forgot about this but
now my touchpad does not work". There were quite a few bugs filed just
because users pressed key that cuts power to touchpad and stores the
state across reboots.

> (and why should we suppose that X will be used always and
> forever?).

We should not but replacement should have at least the same functionality
if not better.

-- 
Dmitry
