From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH] ideadpad: Runtime check for hw touchpad control
Date: Tue, 31 May 2016 19:27:24 -0400
Message-ID: <CA+A7VXXFVwgrwFToQkCLhCEERdFosLPbC5WYc8LUtgu7p6_vCw@mail.gmail.com>
References: <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
 <1464736867-6084-1-git-send-email-jprvita@endlessm.com> <CA+A7VXVWq32gH2VEvo=0xrY6YYTD-Tiv_Lw7MdVMn2rD-ouhEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:35558 "EHLO
	mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbcEaX2E convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2016 19:28:04 -0400
Received: by mail-yw0-f174.google.com with SMTP id o16so2858936ywd.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 May 2016 16:28:04 -0700 (PDT)
In-Reply-To: <CA+A7VXVWq32gH2VEvo=0xrY6YYTD-Tiv_Lw7MdVMn2rD-ouhEw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 31 May 2016 at 19:25, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>=
 wrote:
> On 31 May 2016 at 19:21, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.co=
m> wrote:
>> Check if disabling the i8042 AUX port has any effect on
>> VPCCMD_R_TOUCHPAD, and use that information to decide whether or not
>> ideapad_sync_touchpad_state() should do something.
>>
>
> Just put this together quickly, as a RFC for a runtime detection of
> whether or not the laptop has touchpad hardware control. I didn't
> think it thoroughly, tho. Does it make any sense?
>

And of course, I tested it on the Yoga 900 and it works there.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
