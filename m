From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] x86: wmi: Remove private %pUL implementation
Date: Wed, 9 Sep 2015 20:34:06 -0700
Message-ID: <20150910033406.GA107779@vmdeb7>
References: <87r3qm6lvg.fsf@rasmusvillemoes.dk>
 <1441836525-26194-1-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441836525-26194-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 10, 2015 at 12:08:45AM +0200, Rasmus Villemoes wrote:
> The work performed by wmi_gtoa is equivalent to simply sprintf(out,
> "%pUL", in), so one could replace its body by this. However, most
> users feed the result directly as a %s argument to some other function
> which also understands the %p extensions (they all ultimately use
> vsnprintf), so we can eliminate some stack buffers and quite a bit of
> code by just using %pUL directly.
> 
> In wmi_dev_uevent I'm not sure whether there's room for a
> nul-terminator in env->buf, so I've just replaced wmi_gtoa with the
> equivalent sprintf call.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> Resending, hoping to get it picked up this time.

I appear to have dropped the ball on this, even after you sent me a reminder. My
sincere apologies.

I've re-reviewed, built myself, queued to testing, and it's now getting the
0-day treatment. Provided that comes back good - hopefully tonight, I'll push to
for-next, and you'll see it in next in the morning, and to Linus on Friday
before the close of the merge window for 4.3.

-- 
Darren Hart
Intel Open Source Technology Center
