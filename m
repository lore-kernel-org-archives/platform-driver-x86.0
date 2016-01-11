From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 0/1] apple-gmux: Add initial documentation
Date: Mon, 11 Jan 2016 20:19:54 +0100
Message-ID: <20160111191954.GA6562@wunner.de>
References: <cover.1452431795.git.lukas@wunner.de>
 <20160111070318.GC8076@phenom.ffwll.local>
 <20160111174525.GA1813@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:46299 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934419AbcAKTT6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:19:58 -0500
Content-Disposition: inline
In-Reply-To: <20160111174525.GA1813@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Bruno Premont <bonbons@linux-vserver.org>

Hi Darren,

On Mon, Jan 11, 2016 at 09:45:25AM -0800, Darren Hart wrote:
> On Mon, Jan 11, 2016 at 08:03:18AM +0100, Daniel Vetter wrote:
> > On Mon, Jan 11, 2016 at 12:08:35AM +0100, Lukas Wunner wrote:
> > > On Fri, Jan 08, 2016 at 09:49:22AM -0700, Jonathan Corbet wrote:
> > > > Well, it's built around the asciidoc patch, which isn't in the mainline
> > > > at this point.  Should things go a different direction, that could force
> > > > some changes here;
> > > 
> > > If/when that happens, I'll be happy to fixup the documentation as needed.
> > > In fact I originally wrote this in markdown in November, then converted
> > > it to asciidoc in December and that really wasn't a big deal.
> > > 
> > > The need for asciidoc arises from the desire to not clutter up the prose
> > > text with URLs. To achieve this, asciidoc allows defining so-called
> > > "attribute entries" which may then be referenced in the text:
> > > http://asciidoc.org/userguide.html#X62
> > > 
> > > Markdown has a similar feature called "reference style links", the
> > > difference being that they can be defined anywhere in the document,
> > > whereas asciidoc's "attribute entries" must precede their usage in
> > > the text:
> > > https://daringfireball.net/projects/markdown/syntax#link
> > > 
> > > 
> > > Here's a v2, the only change is Bruno Pr?mont's addition to the commit
> > > message.
> > > 
> > > @Daniel Vetter: Could you pick this up for topic/drm-misc please?
> > 
> > I think it makes more sense to pull this in through Darren's tree, and I
> > acked that on the last round already.
> 
> OK, I'm happy to take it. Lukas, this doesn't apply cleanly to my 4.4-rc* based
> for-next branch or Linus's 4.4 from yesterday. I can manually apply it:
> 
> $ patch -p1 < ~/incoming/PATCH_v2_1-1_apple-gmux_Add_initial_documentation.mbox 
> patching file Documentation/DocBook/gpu.tmpl
> Hunk #1 succeeded at 4279 with fuzz 1 (offset 809 lines).
> patching file drivers/platform/x86/apple-gmux.c
> 
> But that is one hell of an offset. What are you developing against and can you
> send me something that applies cleanly?

I'm developing against drm-next and/or drm-intel-nightly.
Looks like gpu.tmpl is touched very frequently. :-)

As for the apple-gmux documentation, Daniel picked it up this afternoon:
http://cgit.freedesktop.org/drm-intel/commit/?h=topic/drm-misc&id=3d7b75fdae9c81dd71c7573dbc285af90e0924fa

So, everything's fine. Thanks a lot though for being such a responsive
and speedy maintainer, much appreciated!

Best regards,

Lukas
