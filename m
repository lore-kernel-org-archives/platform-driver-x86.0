From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/4] Introduce the aural error reporting framework
Date: Mon, 1 Apr 2019 13:03:29 +0200
Message-ID: <20190401110329.GA12232@hirez.programming.kicks-ass.net>
References: <20190401102456.11162-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401102456.11162-1-mcroce@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matteo Croce <mcroce@redhat.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 01, 2019 at 12:24:51PM +0200, Matteo Croce wrote:
> The buzzer driver is simple, requires just a few register writes to work,
> the hardware is extremely cheap and is already present on most machines.

What, no morse-code register dumps?
