From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-laptop: is_visible should not return a bool
Date: Sun, 18 Jan 2015 11:12:36 -0800
Message-ID: <20150118191236.GI56582@vmdeb7>
References: <1421418559-2058-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43858 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbbARTMi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Jan 2015 14:12:38 -0500
Content-Disposition: inline
In-Reply-To: <1421418559-2058-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Fri, Jan 16, 2015 at 09:29:19AM -0500, Vivien Didelot wrote:
> With a Lucid platform, asus_sysfs_is_visible() returns a boolean for
> ls_switch and ls_level attributes. Fix that and also s/supported/ok/ and
> s/asus->handle/handle/ to avoid lines wider than 80 chars.

This is two patches, a cleanup and functional change. Since the cleanup has
nothing to do with the cleanup, please split these out.

"ok" is an atypical variable name. It looks as though "ret" would server just as
well and is far more consistent with typical usage.

-- 
Darren Hart
Intel Open Source Technology Center
