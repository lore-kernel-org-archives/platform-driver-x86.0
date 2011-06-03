From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Fri, 03 Jun 2011 23:46:39 +0200
Message-ID: <4DE9563F.9010503@absence.it>
References: <4DE8FC4A.9010401@absence.it> <201106031323.55763.dmitry.torokhov@gmail.com> <4DE94501.1080905@absence.it> <201106031400.36141.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:40264 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084Ab1FCVqp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 17:46:45 -0400
In-Reply-To: <201106031400.36141.dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Il 03/06/2011 23:00, Dmitry Torokhov ha scritto:
> The issue with that that we are breeding myriad of quirks

Where is the quirk? If many vendors provide the same feature let's 
create a common interface for that.

> that nobody
> knows  about

This is false, especially for (so many) people using Windows too, where 
the feature is clearly visible by the OEM software.

> and nobody ever uses.

Again, this is false, and I don't think you can speak for everybody.

> X provides standardized way of
> ignoring input devices.

Let's create a standardized solution, instead of using a standardized hack.

> It is also more transparent than "I once wrote
> something to some sysfs file and I completely forgot about this but
> now my touchpad does not work".

The problem does not lie in the sysfs file, lies in the lack of 
userspace software for it (BTW, about this case someone already created 
a Vaio specific GUI for an easy control of these features).

> There were quite a few bugs filed just
> because users pressed key that cuts power to touchpad and stores the
> state across reboots.

It's very much like saying that we should not produce cars because some 
people use them improperly and crash. People doing wrong things will 
always be present, we can improve userspace software to help them 
instead, not just delete features they payed for (and they wanted to 
use, at least once as you say).

>> (and why should we suppose that X will be used always and
>> forever?).
>
> We should not but replacement should have at least the same functionality
> if not better.

I agree, but this doesn't necessarily mean it will use an hack again.

It's a common and widespread feature, let's support it better instead of 
just removing it.
