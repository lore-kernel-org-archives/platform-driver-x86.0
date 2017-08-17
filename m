From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 4/4] platform/x86: wmi: Fix check for method instance
 number
Date: Thu, 17 Aug 2017 14:36:02 -0700
Message-ID: <20170817213602.GC19276@fury>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
 <1502523858-25716-5-git-send-email-pali.rohar@gmail.com>
 <20170817152431.GA19276@fury>
 <20170817211319.GA20526@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170817211319.GA20526@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 17, 2017 at 11:13:19PM +0200, Pali Rohár wrote:
> On Thursday 17 August 2017 08:24:31 Darren Hart wrote:
> > On Sat, Aug 12, 2017 at 09:44:18AM +0200, Pali Rohár wrote:
> > > instance_count defines number of instances of data block and instance
> > > itself is indexed from zero, which means first instance has number 0.
> > > Therefore check for invalid instance should be non-strict inequality.
> > > 
> > > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> > 
> > This is correct per the WMI specification. Pali, now that Andy has
> > applied 1-3 of this series, is that all the required driver updates?
> 
> Hmmm... I have not understood your question.
> 
> I checked that all drivers which uses instance id 1 have comment
> explaining why is id 1 used.
> 
> Problematic drivers without comment have either patch to use instance id
> 0 in this series or somebody else already supplied patch which is part
> of linus tree.

Perfect, that is what I was looking for. Thanks Pali!

> 
> > Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>
-- 
Darren Hart
VMware Open Source Technology Center
