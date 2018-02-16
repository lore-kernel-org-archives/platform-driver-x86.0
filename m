From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/7] fujitsu-laptop: Miscellaneous cleanups
Date: Fri, 16 Feb 2018 21:27:47 +1030
Message-ID: <20180216105747.GC25974@marvin.atrad.com.au>
References: <20180211210727.12130-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:36848 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934609AbeBPK6M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 05:58:12 -0500
Content-Disposition: inline
In-Reply-To: <20180211210727.12130-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 11, 2018 at 10:07:20PM +0100, Micha?? K??pie?? wrote:
> The patch series contains miscellaneous cleanups which I think are worth
> getting done before splitting fujitsu-laptop into two separate modules.
> I am not 100% sure that all the changes in the last patch in this series
> actually help, so please speak your mind.

With the relatively minor comments about patch 6 I've posted about
separately, I'm happy with this patch set.  Collectively these changes
improve the readability of the code and make its intent clearer.

> This patch series was tested on a Lifebook S7020.  AFAICT it does not
> conflict with the recent draft patch from Jan-Marek Glogowski and may
> thus be applied independently.

I agree.

I'm interested to hear your thoughts in connection with my queries about
patch 6 before merging.  That aside, I have no issues with this series.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
