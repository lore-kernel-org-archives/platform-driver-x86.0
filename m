From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/5] fujitsu-laptop: platform device code cleanup
Date: Wed, 15 Mar 2017 16:39:22 -0700
Message-ID: <20170315233922.GB2828@fury>
References: <20170314102631.8203-1-kernel@kempniu.pl>
 <20170315001908.GE18460@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170315001908.GE18460@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 15, 2017 at 10:49:08AM +1030, Jonathan Woithe wrote:
> Hi Michael
> 
> On Tue, Mar 14, 2017 at 11:26:26AM +0100, Micha?? K??pie?? wrote:
> > This series removes backlight-related sysfs attributes from the platform
> > device registered by fujitsu-laptop and does some other cleanups to
> > platform device code which hopefully make it easier to understand.
> 
> Thanks for your continued clean up efforts.  I will review and test this in
> the next few days.  I will be particularly busy between now and the weekend,
> so in the worst case it could be Sunday before I get a chance to do this
> thoroughly.  However, given the relative simplicity of the patches I will
> try to get it done before then.

I'll await Jonathan's Reviewed-by, but I've reviewed these as well and they are
consistent with the discussion on the platform device sysfs attributes we had
previously and all look good to me.

-- 
Darren Hart
VMware Open Source Technology Center
