From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 2/5] asus-wmi: Create quirk for airplane_mode LED
Date: Mon, 13 Jun 2016 17:02:20 -0400
Message-ID: <CA+A7VXXsf_zNt6Rx3hr=g1iBXhGkLEfRkuc=qScHbJyeNQemvQ@mail.gmail.com>
References: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
 <1454951123-27470-3-git-send-email-jprvita@endlessm.com> <CAHR064itbc5bWLxX3DyCMmQ3n1gq5SWFhSrBpDqTu=6VjUcsWw@mail.gmail.com>
 <20160525212415.GF109010@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160525212415.GF109010@f23x64.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On 25 May 2016 at 17:24, Darren Hart <dvhart@infradead.org> wrote:
>

(...)

> I believe this is all still blocked on the underlying RFKILL support.=
 Jo=C3=A3o,
> correct me if I'm mistaken.
>

That was true at the time of this message, but the RFKill
infrastructure that I was planning to use here is not going to be
merged. So the new plan is now to simply expose the LED to userspace
under a meaningful name ("asus-wireless::airplane") and have the
userspace people look for LEDs with this suffix and drive then
accordingly.

I have just sent an updated patchset.
