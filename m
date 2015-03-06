From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] x86: wmi: Remove private %pUL implementation
Date: Fri, 6 Mar 2015 09:52:32 -0800
Message-ID: <20150306175232.GC19001@vmdeb7>
References: <1424787330-26770-1-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424787330-26770-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 24, 2015 at 03:15:30PM +0100, Rasmus Villemoes wrote:
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

Nice cleanup, thanks Rasmus. Queued for 4.1.

-- 
Darren Hart
Intel Open Source Technology Center
