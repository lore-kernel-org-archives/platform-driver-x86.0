From: Arun Raghavan <arun.raghavan@collabora.co.uk>
Subject: Re: [PATCH] apple-gmux: Correctly depend on apple_bl for building
Date: Thu, 28 Jun 2012 18:53:35 +0530
Message-ID: <1340889815.4994.4.camel@localhost>
References: <1340879796-30262-1-git-send-email-arun.raghavan@collabora.co.uk>
	 <20120628132058.GA15308@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:40763 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322Ab2F1NXs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jun 2012 09:23:48 -0400
In-Reply-To: <20120628132058.GA15308@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2012-06-28 at 08:20 -0500, Seth Forshee wrote:
> On Thu, Jun 28, 2012 at 04:06:36PM +0530, Arun Raghavan wrote:
> > apple_bl_register/unregister() are unconditionally used now, so we need
> > to make sure that apple_bl is selected appropriately (built-in/module)
> > if apple-gmux is being built.
> 
> apple_bl.h provides stubs for these functions when apple_bl is not
> built, so this shouldn't be necessary. Are you encoutering a situation
> that causes build problems?

Yes, I am. With CONFIG_BACKLIGHT_APPLE=m and CONFIG_APPLE_GMUX=y, I see
the following error:

  LD      init/built-in.o
drivers/built-in.o: In function `gmux_probe':
apple-gmux.c:(.devinit.text+0xa769): undefined reference to `apple_bl_unregister'
drivers/built-in.o: In function `gmux_remove':
apple-gmux.c:(.devexit.text+0x46d): undefined reference to `apple_bl_register'

-- Arun
