From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: mlx-platform: make a couple of structures
 static
Date: Mon, 9 Oct 2017 11:29:00 -0700
Message-ID: <20171009182900.GH12321@fury>
References: <20171005104211.30440-1-colin.king@canonical.com>
 <CAHp75Vf8k-hmk4n86foSfSPZxVUQJmGNFkf8ExUKbF2nXaSy8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59221 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbdJIS3E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2017 14:29:04 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vf8k-hmk4n86foSfSPZxVUQJmGNFkf8ExUKbF2nXaSy8A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Vadim Pasternak <vadimp@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

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

I'll be working with Vadim's series shortly and would like to take this
after that is settled.

-- 
Darren Hart
VMware Open Source Technology Center
