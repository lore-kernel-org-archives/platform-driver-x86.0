From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] fujitsu-laptop: call_fext_func() cleanup
Date: Mon, 3 Apr 2017 15:13:11 -0700
Message-ID: <20170403221311.GA17322@fury>
References: <20170403093859.6685-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170403093859.6685-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 03, 2017 at 11:38:56AM +0200, Michał Kępień wrote:
> This series contains a few cleanups for the call_fext_func() function.
> It does not depend on the previous series I submitted for
> fujitsu-laptop, which is why I am sending it in parallel with the
> backlight cleanup series.
> 
> While patches 1 and 2 are tangible improvements, I will understand if
> you deem patch 3 to be unnecessary churn.  I decided to submit it anyway
> as I think it might bring some benefit to a casual reader of the
> module's code, but it is basically just a suggestion and as it is the
> last patch, it can simply be omitted when the series is applied.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 39 +++++++++++------------------------
>  1 file changed, 12 insertions(+), 27 deletions(-)

These all look like worthwhile changes to me. Jonathan, are you aware of any
usage of the arguments in 3/3 that would argue against changing their names to
the more specific ones?

Pushed to the temporary fujitsu branch for testing, awaiting ack from Jonathan.

-- 
Darren Hart
VMware Open Source Technology Center
