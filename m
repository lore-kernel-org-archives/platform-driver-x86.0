From: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 01/11] vga_switcheroo: Add support for switching only the DDC
Date: Thu, 12 Jun 2014 10:37:46 +1000
Message-ID: <CAPM=9tyTEoHt3Y0K5E8bQ0oNzkGHK3Dd0ZQxdXj3nC6BLUP4CA@mail.gmail.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
	<1401640723-2058-2-git-send-email-matthew.garrett@nebula.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:56779 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754441AbaFLAhs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jun 2014 20:37:48 -0400
Received: by mail-la0-f48.google.com with SMTP id gl10so280309lab.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2014 17:37:46 -0700 (PDT)
In-Reply-To: <1401640723-2058-2-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>

On 2 June 2014 02:38, Matthew Garrett <matthew.garrett@nebula.com> wrote:
> From: Seth Forshee <seth.forshee@canonical.com>
>
> During graphics driver initialization its useful to be able to mux only
> the DDC to the inactive client in order to read the EDID. Add a
> switch_ddc callback to allow capable handlers to provide this
> functionality, and add vga_switcheroo_switch_ddc() to allow DRM to mux
> only the DDC.
>

I can't figure out why I didn't like this, but I rewrote this way back
to lock/unlock the ddc lines,
bits are contained in this WIP mess.
http://cgit.freedesktop.org/~airlied/linux/commit/?h=switchy-wip&id=aead3bb72d82bd63149082a2670cc2521f2290a4

I think I'd prefer something like that otherwise the interface got really ugly.

Dave.
