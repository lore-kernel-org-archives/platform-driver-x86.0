From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] apple-gmux: Sphinxify docs
Date: Fri, 22 Jul 2016 13:19:12 -0700
Message-ID: <20160722201912.GC3703@f23x64.localdomain>
References: <4c1b29986fa77772156b1af0c965d3799e43a47b.1467628307.git.lukas@wunner.de>
 <20160706204025.GD66341@f23x64.localdomain>
 <20160708054932.GA3842@wunner.de>
 <20160712131145.GA23520@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56893 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751AbcGVUTN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jul 2016 16:19:13 -0400
Content-Disposition: inline
In-Reply-To: <20160712131145.GA23520@phenom.ffwll.local>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Lukas Wunner <lukas@wunner.de>, platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>

On Tue, Jul 12, 2016 at 03:11:45PM +0200, Daniel Vetter wrote:
> On Fri, Jul 08, 2016 at 07:49:32AM +0200, Lukas Wunner wrote:
> > On Wed, Jul 06, 2016 at 01:40:25PM -0700, Darren Hart wrote:
> > > On Mon, Jul 04, 2016 at 12:40:35PM +0200, Lukas Wunner wrote:
> > > > Convert asciidoc-formatted docs to rst in accordance with Jonathan's and
> > > > Jani's effort to use sphinx for kernel-doc rendering in 4.8.
> > > 
> > > Somebody help me out here. How do I verify this works and using sphinx?
> > > to build the docs?
> > 
> > (1) git remote add l1k https://github.com/l1k/linux.git
> >     git fetch l1k
> >     git checkout l1k/sphinx-docs
> >     (Alternatively: git cherry-pick v4.7-rc6..l1k/sphinx-docs )
> > 
> > (2) sudo apt-get install python-sphinx python-sphinx-rtd-theme
> > 
> > (3) make xmldocs
> >     make htmldocs
> > 
> > (4) open Documentation/output/html/index.html
> >     click on "VGA Switcheroo", then click on "Handlers" in the
> >     navigation pane on the left
> > 
> > The apple-gmux docs are currently asciidoc-formatted. Support for
> > markdown/asciidoc in kerneldoc was an Intel-sponsored effort last year
> > led by Daniel, but never got upstreamed.
> > 
> > After some deliberation the decision was made to use rst instead.
> > Support for it is in docs-next, i.e. will be in 4.8.
> > 
> > Jani has converted the gpu docs to rst and deleted the gpu.tmpl,
> > this is on the drm-intel/for-linux-next branch but not yet in drm-next.
> > Jani and Daniel are both on vacation. Daniel has indicated that he
> > considers sending another drm-intel-next pull when he returns next week,
> > then the rst-formatted gpu docs would land in drm-next:
> > https://lists.freedesktop.org/archives/intel-gfx/2016-June/099114.html
> > 
> > 
> > > Should I be merging this directly, or is it dependent on something Jon
> > > is working on and therefore to be merged by him?
> > 
> > It is not dependent on someone else. You can either merge it directly
> > through your tree or alternatively ack it and have it merged through
> > drm-intel trees by Daniel (+ cc:) next week.
> > 
> > 
> > Unfortunately there is currently no branch which contains all the rst
> > patches in docs-next *and* the rst-formatted gpu docs in drm-intel.
> > (Some patches in docs-next are missing from drm-intel/for-linux-next.)
> > That's why I pushed the above-mentioned branch to my GitHub repo,
> > it contains everything needed:
> > https://github.com/l1k/linux/commits/sphinx-docs
> 
> Probably best to pull this in through drm-misc, which contains docs-next
> plus the skeleton conversion of the drm docs over to sphinx/rst. Darren,
> ack on that?

Acked-by: Darren Hart <dvhart@linux.intel.com>

I've dropped this from my testing branch (I never pushed it to my next branch)
and will leave it to you to pull in.

> 
> Oh and if you want to take a peek at the pretty docs this gives us:
> 
> https://01.org/linuxgraphics/gfx-docs/drm/

Very nice.

> 
> This is just the drm part, but if you pull in docs-next there should be
> even more. Media/tv might also be ready for 4.8.
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> 

-- 
Darren Hart
Intel Open Source Technology Center
