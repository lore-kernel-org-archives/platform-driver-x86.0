From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/5] fujitsu-laptop: platform device code cleanup
Date: Wed, 15 Mar 2017 10:49:08 +1030
Message-ID: <20170315001908.GE18460@marvin.atrad.com.au>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:43682 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751294AbdCOAUJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2017 20:20:09 -0400
Content-Disposition: inline
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

On Tue, Mar 14, 2017 at 11:26:26AM +0100, Micha?? K??pie?? wrote:
> This series removes backlight-related sysfs attributes from the platform
> device registered by fujitsu-laptop and does some other cleanups to
> platform device code which hopefully make it easier to understand.

Thanks for your continued clean up efforts.  I will review and test this in
the next few days.  I will be particularly busy between now and the weekend,
so in the worst case it could be Sunday before I get a chance to do this
thoroughly.  However, given the relative simplicity of the patches I will
try to get it done before then.

Regards
  jonathan
