From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/5] fujitsu-laptop: platform device code cleanup
Date: Sat, 18 Mar 2017 22:10:35 +1030
Message-ID: <20170318114035.GA2422@marvin.atrad.com.au>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:46598 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751448AbdCRLld (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2017 07:41:33 -0400
Content-Disposition: inline
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Apologies for the delay in reviewing this series: I've had a busy few days.

On Tue, Mar 14, 2017 at 11:26:26AM +0100, Micha?? K??pie?? wrote:
> This series removes backlight-related sysfs attributes from the platform
> device registered by fujitsu-laptop and does some other cleanups to
> platform device code which hopefully make it easier to understand.

This patch series codifies the outcome of discussions held over the last few
weeks and improves the consistency of the fujitsu-laptop driver with respect
to its treatment of sysfs attributes.  The additional minor cleanups
facilitated by these changes are also worthwhile.  The patch series has been
tested on the S7020 hardware and no regressions have been observed with the
hardware devices of that platform.  Please apply.

Tested-by: Jonathan Woithe <jwoithe@just42.net>
Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
