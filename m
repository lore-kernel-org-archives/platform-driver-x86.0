From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/1] apple-gmux: Add initial documentation
Date: Mon, 11 Jan 2016 08:03:18 +0100
Message-ID: <20160111070318.GC8076@phenom.ffwll.local>
References: <cover.1452431795.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33661 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758423AbcAKHDS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 02:03:18 -0500
Received: by mail-wm0-f67.google.com with SMTP id u188so24863634wmu.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jan 2016 23:03:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <cover.1452431795.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@linux.intel.com>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Bruno Premont <bonbons@linux-vserver.org>

On Mon, Jan 11, 2016 at 12:08:35AM +0100, Lukas Wunner wrote:
> On Fri, Jan 08, 2016 at 09:49:22AM -0700, Jonathan Corbet wrote:
> > Well, it's built around the asciidoc patch, which isn't in the mainline
> > at this point.  Should things go a different direction, that could force
> > some changes here;
> 
> If/when that happens, I'll be happy to fixup the documentation as needed.
> In fact I originally wrote this in markdown in November, then converted
> it to asciidoc in December and that really wasn't a big deal.
> 
> The need for asciidoc arises from the desire to not clutter up the prose
> text with URLs. To achieve this, asciidoc allows defining so-called
> "attribute entries" which may then be referenced in the text:
> http://asciidoc.org/userguide.html#X62
> 
> Markdown has a similar feature called "reference style links", the
> difference being that they can be defined anywhere in the document,
> whereas asciidoc's "attribute entries" must precede their usage in
> the text:
> https://daringfireball.net/projects/markdown/syntax#link
> 
> 
> Here's a v2, the only change is Bruno Pr?mont's addition to the commit
> message.
> 
> @Daniel Vetter: Could you pick this up for topic/drm-misc please?

I think it makes more sense to pull this in through Darren's tree, and I
acked that on the last round already.
-Daniel

> 
> An ack for drivers/platform/x86 was kindly provided by Darren Hart with:
> Message-ID: <20160104203150.GA4219@malice.jf.intel.com>
> Link: http://lists.freedesktop.org/archives/dri-devel/2016-January/097918.html
> 
> Thanks everyone!
> 
> 
> Lukas Wunner (1):
>   apple-gmux: Add initial documentation
> 
>  Documentation/DocBook/gpu.tmpl    |  22 ++++++++
>  drivers/platform/x86/apple-gmux.c | 113 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
> 
> -- 
> 1.8.5.2 (Apple Git-48)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
