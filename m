From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/1] apple-gmux: Add initial documentation
Date: Mon, 11 Jan 2016 15:57:14 +0100
Message-ID: <20160111145714.GX8076@phenom.ffwll.local>
References: <cover.1452431795.git.lukas@wunner.de>
 <20160111070318.GC8076@phenom.ffwll.local>
 <20160111130715.GA6172@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35463 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760054AbcAKO5O (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 09:57:14 -0500
Received: by mail-wm0-f65.google.com with SMTP id f206so26650976wmf.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jan 2016 06:57:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160111130715.GA6172@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@linux.intel.com>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Bruno Premont <bonbons@linux-vserver.org>

On Mon, Jan 11, 2016 at 02:07:15PM +0100, Lukas Wunner wrote:
> Hi Daniel,
> 
> On Mon, Jan 11, 2016 at 08:03:18AM +0100, Daniel Vetter wrote:
> > On Mon, Jan 11, 2016 at 12:08:35AM +0100, Lukas Wunner wrote:
> > > Here's a v2, the only change is Bruno Pr?mont's addition to the commit
> > > message.
> > > 
> > > @Daniel Vetter: Could you pick this up for topic/drm-misc please?
> > 
> > I think it makes more sense to pull this in through Darren's tree, and I
> > acked that on the last round already.
> 
> As I've written in the cover letter of v1, this will provoke merge
> conflicts going forward since I'll post a new version of my GPU switching
> patches for the MacBook Pro this week which also touch apple-gmux and
> are based on this docs patch.
> 
> I guess alternatively the patches touching vga_switcheroo and the DRM
> drivers could go in via pdx86, I'll cross-post to both lists to keep
> this option open, though I expect this might also lead to merge conflicts
> if relevant portions of the DRM drivers are changed in drm-next for 4.6.
> 
> I still believe merging this via drm-next or drm-intel/topic/drm-misc
> would be the option least prone to merge conflicts.

Ah sorry, forgot about that again. Indeed that makes sense if other stuff
is pending, so applied to drm-misc for 4.6.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
