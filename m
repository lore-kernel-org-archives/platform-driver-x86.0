From: Colin Guthrie <gmane@colin.guthr.ie>
Subject: Re: [Regression] Problem with rfkill on 2.6.38
Date: Fri, 24 Jun 2011 11:54:13 +0100
Message-ID: <4E046CD5.2070709@colin.guthr.ie>
References: <ip6j66$o5f$1@dough.gmane.org> <1304930195.3475.17.camel@jlt3.sipsolutions.net> <4DC81FC7.9040503@colin.guthr.ie> <20110509171144.GA7194@srcf.ucam.org> <4DC9072D.4030103@colin.guthr.ie> <BANLkTinVwnSei_VobfKtgzrwSP+cJSvxaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from brent.tribalogic.net ([78.86.109.144]:50905 "EHLO
	summit.brent.tribalogic.net" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751584Ab1FXLEh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2011 07:04:37 -0400
In-Reply-To: <BANLkTinVwnSei_VobfKtgzrwSP+cJSvxaQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, Thomas Backlund <tmb@mageia.org>

'Twas brillig, and Keng-Y=C3=BC Lin at 10/05/11 15:48 did gyre and gimb=
le:
> On Tue, May 10, 2011 at 11:36 AM, Colin Guthrie <mageia@colin.guthr.i=
e> wrote:
>> 'Twas brillig, and Matthew Garrett at 09/05/11 18:11 did gyre and gi=
mble:
>>> On Mon, May 09, 2011 at 06:09:27PM +0100, Colin Guthrie wrote:
>>>
>>>> Just a quick (non-compile) followup from my last email... blacklis=
ting
>>>> the dell-laptop module works around the issue, so I think the comm=
it
>>>> previously mentioned is indeed the culprit (as it's the only recen=
t
>>>> commit and does fiddle with the rfkill stuff).
>>>>
>>>> Not sure what the best track forward is, but it's certainly a
>>>> regression, so should probably be fixed or reverted until a more
>>>> complete fix is found.
>>>
>>> If you can confirm that with a build then I'll do that.
>>
>> ACK. Reverting that commit and unblacklisting the dell_laptop module
>> restores the previous, working functionality. I've flipped rfkill a =
few
>> times and it's always worked fine.

Just wondering if there was any progress on this. I ACKed a regression
but it was not reverted.... I thought the standard practice was to
revert until a fuller fix was found.

I appreciate some other users will not get their fix but I was still
under the impression that this was the policy?

I don't see any relevant changes in the 2.6.39 kernel:

http://git.kernel.org/?p=3Dlinux/kernel/git/stable/linux-2.6.39.y.git;a=
=3Dhistory;f=3Ddrivers/platform/x86/dell-laptop.c;h=3Dde301aa8e5c379962=
0ff5a06372b5e1942c2dab2;hb=3DHEAD

nor in Linus' 2.6 tree (which I presume is actually for 3.0 these days?=
):
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
history;f=3Ddrivers/platform/x86/dell-laptop.c;h=3Dd3841de6a8cf199ec08b=
24bd85f50a0af0490d37;hb=3DHEAD


> May I have the model of your Dell laptop?
snip....

I supplied all this info before here:
http://thread.gmane.org/gmane.linux.kernel.wireless.general/68758

Anything else I can do to move this forward?

Col



--=20

Colin Guthrie
gmane(at)colin.guthr.ie
http://colin.guthr.ie/

Day Job:
  Tribalogic Limited [http://www.tribalogic.net/]
Open Source:
  Mageia Contributor [http://www.mageia.org/]
  PulseAudio Hacker [http://www.pulseaudio.org/]
  Trac Hacker [http://trac.edgewall.org/]
