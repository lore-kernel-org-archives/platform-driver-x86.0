From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/4] Introduce the aural error reporting framework
Date: Tue, 2 Apr 2019 15:21:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1904021518170.1676@nanos.tec.linutronix.de>
References: <20190401102456.11162-1-mcroce@redhat.com> <20190401110329.GA12232@hirez.programming.kicks-ass.net> <alpine.DEB.2.21.1904021045310.1676@nanos.tec.linutronix.de> <CAGnkfhzkS-QDq0uTSF=XEutaZ3ig6NYg5rgcWwQNmH9QM0TMSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGnkfhzkS-QDq0uTSF=XEutaZ3ig6NYg5rgcWwQNmH9QM0TMSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matteo Croce <mcroce@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Matteo,

On Tue, 2 Apr 2019, Matteo Croce wrote:
> On Tue, Apr 2, 2019 at 11:33 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> > Aside of that, where is the android-app to customize and decode the
> > melodies?
> >
> > I surely want to have the music theme of 'Once Upon a Time in the West' on
> > kernel crashes.
> 
> I'm a little rusty with Android programming, so I'll share the script
> I use to convert notes to frequences.
> With some awk magic it can turn notes into a C array, I hope that you
> find it useful.

That's great. Just a few nitpicks on the patches themself. You want to
change msleep() to mdelay() in order to avoid "Scheduling while atomic"
noise and you want to have global serialization because interleaving "La
Paloma" from CPU1 and "Once Upon a Time in the West" from CPU2 sounds
really horrible.

Thanks,

	tglx
