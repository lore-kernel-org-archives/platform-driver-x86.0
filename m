From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Mon, 16 Oct 2017 14:48:37 -0700
Message-ID: <20171016214837.GC14419@fury>
References: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33590 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753147AbdJPVsl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Oct 2017 17:48:41 -0400
Content-Disposition: inline
In-Reply-To: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 15, 2017 at 06:03:14PM +0200, Pali Rohár wrote:
> This machine reports number of keyboard backlight led levels, instead of
> value of the last led level index. Therefore max_brightness properly needs
> to be subtracted by 1 to match led max_brightness API.

Which field is behaving differently?

If I'm understanding this correctly:

Since the max level is something we test for once at runtime, it seems
to me a cleaner fix would be to check for this quirk in kbd_get_info()
and set kbd_info.levels accordingly. The rest of the driver logic would
then remain unchanged.

The idea being to translate what the platform firmware reports into what
the driver already understands, instead of giving the levels fields of
the structure multiple meanings.

-- 
Darren Hart
VMware Open Source Technology Center
