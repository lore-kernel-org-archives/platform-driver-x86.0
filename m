From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/3] fujitsu-laptop: call_fext_func() cleanup
Date: Wed, 5 Apr 2017 08:29:02 -0700
Message-ID: <20170405152902.GB27833@fury>
References: <20170405065023.3267-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170405065023.3267-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 05, 2017 at 08:50:20AM +0200, Michał Kępień wrote:
> This series contains a few cleanups for the call_fext_func() function.
> Just as a reminder, please note that v1 of this series is currently
> applied in testing.
> 
> Changes from v1:
> 
>   - Update debug message logged by call_fext_func() to reflect code flow
>     changes introduced by patch 2/3.

My apologies Michał, I misunderstood - I was thinking you had a second change to
the 11 patch series, so I asked for a v2.

This series is already in for-next, and we only rebase that for bugs that would
be bad to leave in the history - like things that break bisecting.

For this change, would you please send just 1 new patch on top of for-next?

Again, I'm sorry that, my fault.

-- 
Darren Hart
VMware Open Source Technology Center
