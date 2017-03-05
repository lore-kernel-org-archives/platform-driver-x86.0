From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 0/2] fujitsu-laptop: acpi_fujitsu_bl_notify() cleanup
Date: Mon, 6 Mar 2017 09:27:21 +1030
Message-ID: <20170305225721.GF28473@marvin.atrad.com.au>
References: <20170301064254.1311-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:34874 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752414AbdCEXZf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2017 18:25:35 -0500
Content-Disposition: inline
In-Reply-To: <20170301064254.1311-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 01, 2017 at 07:42:52AM +0100, Micha?? K??pie?? wrote:
> Here are two minor cleanups for acpi_fujitsu_bl_notify() that I came up
> with while preparing the sparse keymap migration.
> 
> Changes from v1:
> 
>   - Rebase on top of reworked Alan Jenkins' cleanup patch series.
> 
>   - Join integer variable declarations into a single line in patch 2/2.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 64 +++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 36 deletions(-)

These two clean ups, as their descriptions indicate, improve the clarity of
the driver code and permit some minor optimisations.  No regressions are
evident when tested on S7020 hardware.  Please apply.

Tested-by: Jonathan Woithe <jwoithe@just42.net>
Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
