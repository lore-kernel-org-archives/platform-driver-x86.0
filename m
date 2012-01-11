From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle
 backlight power to avoid a page fault
Date: Wed, 11 Jan 2012 12:57:54 -0600
Message-ID: <20120111185754.GD3005@burratino>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
 <20120111004256.GS22184@burratino>
 <4F0D76D5.2080704@canonical.com>
 <20120111161110.GC25593@kroah.com>
 <20120111164028.GC1891@burratino>
 <20120111170532.GA3222@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:56899 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755909Ab2AKSxB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jan 2012 13:53:01 -0500
Content-Disposition: inline
In-Reply-To: <20120111170532.GA3222@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

Greg KH wrote:

> This is all fine, I'll queue it up for the next release.
>
> Oh wait, there isn't going to be another 3.1 kernel release, so this
> might not have been needed.  I'll see if others really want another 3.1
> release, and if so, I'll add this to it.

Thanks.  Sounds good to me.
