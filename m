From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: BUG? Duplicate key code 0xe045 in dell-wmi.c
Date: Tue, 07 Jul 2015 13:38:41 -0500
Message-ID: <559C1CB1.4040509@dell.com>
References: <201507041834.03944@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201507041834.03944@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Len Brown <len.brown@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?B?TWljaGHFgiBLxJlw?= =?UTF-8?B?aWXFhA==?= <kernel@kempniu.pl>
List-Id: platform-driver-x86.vger.kernel.org



On 07/04/2015 11:34 AM, Pali Roh=C3=A1r wrote:
> Hello,
>
> I'm looking at dell-wmi.c driver and its history in git and I found=20
> problem with handling WMI key code 0xe045. In current dell-wmi.c code=
 is
>
> {KE_KEY, 0xe045, KEY_PROG1},
> {KE_IGNORE, 0xe045, KEY_NUMLOCK},
>
> I bet this is some copy-paste error as one code can be translated onl=
y=20
> to one input key event.
>
> In git history I found that above change was added by commit:
>
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5cab0098171712a9fd51399b06181c8dfdebe9c9
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> commit 5cab0098171712a9fd51399b06181c8dfdebe9c9
> Author: Mario Limonciello <mario_limonciello@dell.com>
> Date:   Wed Jun 10 19:40:47 2009 +0000
>
>     dell-wmi: add additional keyboard events
>    =20
>     Upcoming Dell hardware will send more keyboard events via WMI.  A=
dd
>     support for them.
>    =20
>     Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
>     Signed-off-by: Matthew Garrett <mjg@redhat.com>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Len Brown <len.brown@intel.com>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Sending email to all signers of this commit. Problematic code is stil=
l=20
> in upstream kernel, so it needs to be fixed.
>
> Mario Limonciello: Do you know if code 0xe045 is some PROG1 or NUMLOC=
K?
>
Hi Pali,

Yes this looks like a mistake and that the KEY_PROG1 item should have
been removed in that patch.  It should be a notification (KEY_IGNORE)
for numlock.

Thanks,
