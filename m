From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH v3 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Fri, 14 Dec 2012 12:13:20 +0100
Message-ID: <201212141213.21214.trenn@suse.de>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com> <CAKErNvrw3-vfzSvPjTQLL7GfoveLWgD0WCNnafw8Dp_VS4BBmw@mail.gmail.com> <1355481420.2710.59.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37382 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753501Ab2LNLN0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Dec 2012 06:13:26 -0500
In-Reply-To: <1355481420.2710.59.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anisse Astier <anisse@astier.eu>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Friday, December 14, 2012 11:37:00 AM joeyli wrote:
...
> Hi Thomas, do you have good suggestion if we filter out all events
> within 50ms?
Puhh, I do not know the details anymore.
I never had this machine, but worked on it remotely
while someone else hit the key.
Iirc this was a BIOS bug and instead of one event, several
showed up. I cannot recall the exact behaviour, I can hardly
remember that the number of events was random (1-3?) and they
came "immediatly".

I also do not know the input layer well, Dimitry should be
better in judging what the most elegant and safe way is
to handle this.


  Thomas
