From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Thu, 02 Jun 2011 13:16:38 -0600
Message-ID: <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:37147 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751902Ab1FBTQm (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Thu, 2 Jun 2011 15:16:42 -0400
In-Reply-To: <4DE74CEF.3020608@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-06-02 =E6=96=BC 10:42 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/01/2011 04:08 AM, Joey Lee wrote:
> > So, does that mean Fn+F5 cann't on/off wireless? or Not?
> > Could you please help to check the value on 0x51 and 0x52?
>=20
> I tested again on my ideapad s205:
>=20
> hardware wifi switch changes the following registers:
> 0x0C: 0->64
> 0x78: 0->1

> key combination fn+f5:
> i can't see a register which changes stable from 0->1 or similar.
>=20

This is a problem on "Fn+F5" and "wireless hardware switch", does "Fn
+F5" also can control wireless state? If yes, then it's a problem it
have conflict with "wirelss hardware switch".

I mean, even 0x0C is "64", the Fn+F5 still can turn-off wireless, does
it right?
If the answer is yes, then we cann't use 0x0C to be killswitch state.

> i tried combination fn+cursor-up (labeled with screen brightness).=20
> Screen brightness changes and so do some registers (in the range 0...=
255=20
> according to brightness level).
>=20
> 0x51 and 0x52 do not change.
>=20

What the value in 0x51 and 0x52? is 0, 1 or?


Thank's
Joey Lee
