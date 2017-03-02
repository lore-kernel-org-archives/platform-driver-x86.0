From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Thu, 2 Mar 2017 08:19:38 +0100
Message-ID: <20170302071938.GA1081@ozzy.nask.waw.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170301223912.GF28335@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35957 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbdCBI1z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2017 03:27:55 -0500
Received: by mail-lf0-f68.google.com with SMTP id g70so4110119lfh.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Mar 2017 00:27:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170301223912.GF28335@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Wed, Mar 01, 2017 at 09:10:40AM +0100, Micha?? K??pie?? wrote:
> > These patches should make fujitsu_init() a bit more palatable.  No
> > changes are made to platform device code yet, for clarity these will be
> > posted in a separate series after this one gets applied.
> 
> Thanks for these.  As for the other series you posted I will endeavour to
> review and test within the next 48 hours.  I note the particular testing
> requirements of patch 2/4.
> 
> Could you confirm which git tree you've based these off?

Sure, both series posted yesterday are based on dvhart/testing as that
is where Alan's reworked series is currently applied.  I posted them as
separate series for consistency with previous submissions and also
because they are independent, i.e. can be applied in any order.

-- 
Best regards,
Michał Kępień
