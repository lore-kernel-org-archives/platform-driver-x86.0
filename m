From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform: x86: dell-smo8800: remove redundant
 assignments to byte_data
Date: Tue, 31 Oct 2017 14:55:48 +0100
Message-ID: <20171031135548.u5vtsxj7hbnuioz3@pali>
References: <20171031110318.20985-1-colin.king@canonical.com>
 <CAHp75Vec3Hjd_keMid-x6ub5ZJqUmq1nUFiHPsxuWt8V+vzrnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:43627 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751926AbdJaNzv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2017 09:55:51 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vec3Hjd_keMid-x6ub5ZJqUmq1nUFiHPsxuWt8V+vzrnQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday 31 October 2017 15:47:58 Andy Shevchenko wrote:
> On Tue, Oct 31, 2017 at 1:03 PM, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Variable byte_data is being initialized and re-assigned with values that
> > are never read. Remove these as these redundant assignments. Cleans up
> > clang warning:
> >
> > drivers/platform/x86/dell-smo8800.c:106:2: warning: Value stored to 'byte_data'
> > is never read
> 
> Thanks for the patch.
> 
> As I read a code it was from the beginning like this. I dunno what was
> a motivation of this pieces, thus I would like to hear Pali.

IIRC this part of code comes from the lis3lv* driver which was used for
HP EliteBook machines. As both drivers provides similar interface for
userspace.

> Per se patch looks pretty much good to me.
> 

-- 
Pali Rohár
pali.rohar@gmail.com
