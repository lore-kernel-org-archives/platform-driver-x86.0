From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 19 Sep 2017 06:06:48 +0200
Message-ID: <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:53733 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750713AbdISEGx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 00:06:53 -0400
Received: by mail-lf0-f48.google.com with SMTP id k9so2417341lfe.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2017 21:06:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

> My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> but it does have FUJ02B1. That means we do register the backlight
> device (and it even seems to work), but the code will oops as soon
> as we try to set the backlight brightness because it's trying to
> call call_fext_func() with a NULL device. Let's just skip those
> function calls when the FUJ02E3 device is not present.

Oh, the irony...  I have literally just sat down to dust off the patch
series I have had queued for the past couple of months which makes the
driver for FUJ02B1 a separate module depending on the FUJ02E3 driver.
Then I saw your email and it is now clear that such a dependency is
bogus.  AFAIR, until now everyone involved was expecting the FUJ02E3
ACPI device to be present on all Fujitsu laptops.

I need to refresh my memory a bit and think about next steps.  I still
have one more cleanup series queued that is worth posting and I also
need to fix radio LED detection.  My spare time is still very limited,
but I will do my best to post something soon.

-- 
Best regards,
Michał Kępień
