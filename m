From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 0/8] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Mon, 22 May 2017 08:53:23 +0930
Message-ID: <20170521232323.GD28475@marvin.atrad.com.au>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:51882 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750799AbdEUXX5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 May 2017 19:23:57 -0400
Content-Disposition: inline
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

On Fri, May 19, 2017 at 09:44:40AM +0200, Micha?? K??pie?? wrote:
> fujitsu-laptop registers two ACPI drivers that access each other's
> module-wide structures.  To improve data encapsulation and lay the
> groundwork for separating the two aforementioned ACPI drivers into
> separate modules, move away from module-wide global data structures by
> using device-specific data instead.
> :

I have had a quick look through this series.  To my eye it addresses the
outcome of our discussion over the last couple of weeks, and looks good.  I
had one query regarding patch 5/8, but that might just be a case of me not
knowing about a subtlety of WARN_ONCE().  In any case this isn't a major
issue and would be easily resolved if needed.

Once I get feedback on patch 5/8 (and after seeing any additional comments
from Darren et al) I can send through a reviewed-by.

Regards
  jonathan
