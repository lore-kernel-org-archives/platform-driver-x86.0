From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/4] Introduce the aural error reporting framework
Date: Tue, 2 Apr 2019 10:49:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1904021045310.1676@nanos.tec.linutronix.de>
References: <20190401102456.11162-1-mcroce@redhat.com> <20190401110329.GA12232@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401110329.GA12232@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Matteo Croce <mcroce@redhat.com>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 1 Apr 2019, Peter Zijlstra wrote:
> On Mon, Apr 01, 2019 at 12:24:51PM +0200, Matteo Croce wrote:
> > The buzzer driver is simple, requires just a few register writes to work,
> > the hardware is extremely cheap and is already present on most machines.
> 
> What, no morse-code register dumps?

Aside of that, where is the android-app to customize and decode the
melodies?

I surely want to have the music theme of 'Once Upon a Time in the West' on
kernel crashes.

Thanks,

	tglx
