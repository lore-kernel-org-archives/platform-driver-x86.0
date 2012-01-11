From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle
 backlight power to avoid a page fault
Date: Wed, 11 Jan 2012 10:40:28 -0600
Message-ID: <20120111164028.GC1891@burratino>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
 <20120111004256.GS22184@burratino>
 <4F0D76D5.2080704@canonical.com>
 <20120111161110.GC25593@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:36269 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751576Ab2AKQfe convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jan 2012 11:35:34 -0500
Content-Disposition: inline
In-Reply-To: <20120111161110.GC25593@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

Greg KH wrote:
>> On 01/11/2012 08:42 AM, Jonathan Nieder wrote:

>>> From: Ren=C3=A9 Bollford <xsecute@googlemail.com>
>>> Date: Sun, 23 Oct 2011 09:56:42 +0200
>>>=20
>>> commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.
>>>=20
>>> This patch avoid a page fault in the ideapad-laptop extras when
>>> turning the backlight power on or off.
>>>=20
>>> Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
>>> Signed-off-by: Matthew Garrett <mjg@redhat.com>
>>> Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
>>> Tested-by: Artem X <artem.brz@gmail.com>
[...]
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read Documentation/stable_kernel_rules.tx=
t
> for how to do this properly.
>
> </formletter>

Well, what did I do wrong this time?

 - The patch is obviously correct and tested.
 - It is a two-liner, plus context.
 - It fixes exactly one thing.
 - The bug bothers people, and I gave links to reports.
 - It is an oops (a null pointer dereference).
 - No unrelated "trivial" fixes in there.
 - Follows SubmittingPatches rules, as far as I know.
 - Patch was produced by cherry-picking the commit named above from
   Linus's tree.
