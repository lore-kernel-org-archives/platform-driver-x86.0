From: Matteo Croce <mcroce@redhat.com>
Subject: Re: [PATCH 0/4] Introduce the aural error reporting framework
Date: Tue, 2 Apr 2019 13:50:03 +0200
Message-ID: <CAGnkfhzkS-QDq0uTSF=XEutaZ3ig6NYg5rgcWwQNmH9QM0TMSg@mail.gmail.com>
References: <20190401102456.11162-1-mcroce@redhat.com> <20190401110329.GA12232@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.21.1904021045310.1676@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="000000000000fcd65c05858abee0"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1904021045310.1676@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--000000000000fcd65c05858abee0
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 2, 2019 at 11:33 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, 1 Apr 2019, Peter Zijlstra wrote:
> > On Mon, Apr 01, 2019 at 12:24:51PM +0200, Matteo Croce wrote:
> > > The buzzer driver is simple, requires just a few register writes to work,
> > > the hardware is extremely cheap and is already present on most machines.
> >
> > What, no morse-code register dumps?
>
> Aside of that, where is the android-app to customize and decode the
> melodies?
>
> I surely want to have the music theme of 'Once Upon a Time in the West' on
> kernel crashes.
>
> Thanks,
>
>         tglx
>

Hi Thomas,

I'm a little rusty with Android programming, so I'll share the script
I use to convert notes to frequences.
With some awk magic it can turn notes into a C array, I hope that you
find it useful.

Bye,
-- 
Matteo Croce
per aspera ad upstream

--000000000000fcd65c05858abee0
Content-Type: application/x-shellscript; name="notes2freq.sh"
Content-Disposition: attachment; filename="notes2freq.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_jtzpskb60>
X-Attachment-Id: f_jtzpskb60

IyEvYmluL2Jhc2gKCndoaWxlIHJlYWQgbm90ZSB0aW1lOyBkbwoKb2N0YXZlPTMKCmNhc2UgJG5v
dGUgaW4KKjB8KjF8KjJ8KjN8KjR8KjV8KjZ8Kjd8Kjh8KjkpCW9jdGF2ZT0ke25vdGU6KC0xKX0K
CQkJCW5vdGU9JHtub3RlOjA6JCgoJHsjbm90ZX0tMSkpfQoJCQkJOzsKZXNhYwoKbm90ZT0ke25v
dGUvXCMvc30KCm9jdGF2ZT0kKChvY3RhdmUtMykpCgpjYXNlICRub3RlIGluCkxhCXxBCQkpIGZy
ZXE9NDQwOzsKTGFzCXxBcwl8QmIJKSBmcmVxPTQ2Njs7ClNpCXxCCQkpIGZyZXE9NDk0OzsKRG8J
fEMJCSkgZnJlcT01MjM7OwpEb3MJfENzCXxEYgkpIGZyZXE9NTU0OzsKUmUJfEQJCSkgZnJlcT01
ODc7OwpSZXMJfERzCXxFYgkpIGZyZXE9NjIyOzsKTWkJfEUJCSkgZnJlcT02NTk7OwpGYQl8RgkJ
KSBmcmVxPTY5ODs7CkZhcwl8RnMJfEdiCSkgZnJlcT03NDA7OwpTb2wJfEcJCSkgZnJlcT03ODQ7
OwpTb2xzCXxHcwl8QWIJKSBmcmVxPTgzMTs7ClAJCQkpIGZyZXE9MDs7CmVzYWMKCmk9JG9jdGF2
ZQppZiBbICRvY3RhdmUgLWd0IDAgXTsgdGhlbgoJd2hpbGUgWyAkaSAtZ3QgMCAgXTsgZG8KCQlm
cmVxPSQoKGZyZXEgKiAyKSkKCQlpPSQoKGktMSkpCglkb25lCmVsc2UKCXdoaWxlIFsgJGkgLWx0
IDAgIF07IGRvCgkJZnJlcT0kKChmcmVxIC8gMikpCgkJaT0kKChpKzEpKQoJZG9uZQpmaQoKZWNo
byAiJCgodGltZSAqIDEwMCkpICRmcmVxIgoKZG9uZQo=
--000000000000fcd65c05858abee0--
