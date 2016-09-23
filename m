From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] toshiba_haps: Small updates to driver code
Date: Fri, 23 Sep 2016 16:19:28 -0700
Message-ID: <20160923231928.GB27846@f23x64.localdomain>
References: <20160907152815.5950-1-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39628 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752839AbcIWXTa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Sep 2016 19:19:30 -0400
Content-Disposition: inline
In-Reply-To: <20160907152815.5950-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 07, 2016 at 09:28:12AM -0600, Azael Avalos wrote:
> These two patches make some small changes to the driver code, the first
> splits the error check fro the ACPI status and the HDD protection, and
> the second simply changes the printing level of two strings from info
> to debug.

Queued, thanks Azael.

After reviewing the history of this tree and following the approach of the ACPI
tree, I've started prefixing commit subjects with "platform/x86: DRIVERNAME:
MESSAGE". Please use this format in the future (not a big deal, but it's nice
when your subject is the same as the one I submit).

Thanks (and sorry for the delay).

> 
> Azael Avalos (2):
>   toshiba_haps: Split ACPI status error check from HDD protection
>     support
>   toshiba_haps: Change the error logging level from info to debug
> 
>  drivers/platform/x86/toshiba_haps.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> -- 
> 2.9.3
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
