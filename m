From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: mlx-platform: make a couple of structures
 static
Date: Mon, 16 Oct 2017 14:26:25 -0700
Message-ID: <20171016212625.GB14419@fury>
References: <20171005104211.30440-1-colin.king@canonical.com>
 <CAHp75Vf8k-hmk4n86foSfSPZxVUQJmGNFkf8ExUKbF2nXaSy8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vf8k-hmk4n86foSfSPZxVUQJmGNFkf8ExUKbF2nXaSy8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Vadim Pasternak <vadimp@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Oct 07, 2017 at 05:03:41PM +0300, Andy Shevchenko wrote:
> On Thu, Oct 5, 2017 at 1:42 PM, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The structures mlxplat_dev and mlxplat_hotplug are local to the source
> > and do not need to be in global scope, so make them static.
> >
> > Cleans up sparse warnings:
> > symbol 'mlxplat_dev' was not declared. Should it be static?
> > symbol 'mlxplat_hotplug' was not declared. Should it be static?
> 
> Thanks for the patch.
> Since Vadim did some rather big driver changes I would like to hear
> from him how to proceed with this one: either I apply it now, or after
> we get Vadim's series in.
> 

I've asked Vadim to rework some of the mlx platform and hotplug patches, so I'll
be taking this now as it is a minimal patch - this way it doesn't get lost.

Thanks Colin.

-- 
Darren Hart
VMware Open Source Technology Center
