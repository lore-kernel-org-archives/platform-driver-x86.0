From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup [resend due to vger error]
Date: Thu, 2 Mar 2017 09:56:59 +1030
Message-ID: <20170301232659.GN28335@marvin.atrad.com.au>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170301223912.GF28335@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59124 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753335AbdCBAwr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 19:52:47 -0500
Content-Disposition: inline
In-Reply-To: <20170301223912.GF28335@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 01, 2017 at 09:10:40AM +0100, Micha?? K??pie?? wrote:
> These patches should make fujitsu_init() a bit more palatable.  No
> changes are made to platform device code yet, for clarity these will be
> posted in a separate series after this one gets applied.

Thanks for these.  As for the other series you posted I will endeavour to
review and test within the next 48 hours.  I note the particular testing
requirements of patch 2/4.

Could you confirm which git tree you've based these off?

I'm resending this for the benefit of the lists, hoping they will work this
time.  On the first attempt (at 2 Mar 2017 09:09:12 +1030) I got this:

>    ----- The following addresses had permanent fatal errors -----
> <platform-driver-x86@vger.kernel.org>
> <linux-kernel@vger.kernel.org>
> 
>    ----- Transcript of session follows -----
> ... while talking to vger.kernel.org.:
> >>> MAIL From:<jwoithe@just42.net> SIZE=1474
> <<< 450 4.5.0 Interactive router timed out!
> 550 5.1.2
> <linux-kernel@vger.kernel.org>,<platform-driver-x86@vger.kernel.org>... Host
> unknown (Name server: bl-ckh-le.kernel.org.: host not found)

Regards
  jonathan
