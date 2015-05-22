From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Fri, 22 May 2015 15:53:16 -0700
Message-ID: <CAKdAkRQRdFBsgCmvL-aTKL=1xxPN-YYVEa0nTVkEV9jHMbzgYA@mail.gmail.com>
References: <5875.1432260403@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:35567 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161034AbbEVWxS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 May 2015 18:53:18 -0400
In-Reply-To: <5875.1432260403@turing-police.cc.vt.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
Cc: Pali Rohar <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Thu, May 21, 2015 at 7:06 PM, Valdis Kletnieks
<Valdis.Kletnieks@vt.edu> wrote:
> So after I made both config variables =y, the resulting kernel built, but
> died a glorious death at boot.

I guess if both are built-in then, according to link order,
dell-laptop starts first, before dell-rbtn, and dies in
dell_rbtn_notifier_register() in call to
driver_for_each_device(&rbtn_driver.drv, ...) because rbtn_driver has
not been registered yet and thus half-initlalized.

Thanks.

-- 
Dmitry
