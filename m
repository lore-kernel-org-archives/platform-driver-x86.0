From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Sat, 10 Feb 2018 22:22:24 +0100
Message-ID: <20180210212224.GB2070@larwa.localdomain>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:33160 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbeBJVW2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 16:22:28 -0500
Received: by mail-lf0-f54.google.com with SMTP id t139so15749530lff.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2018 13:22:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180119234547.GB24590@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

> > From: Jan-Marek Glogowski <glogow@fbihome.de>
> > Date: Fri, 19 Jan 2018 21:48:22 +0100
> > Subject: [PATCH] Emit some more button events
> > 
> > Seems Fujitsu continues to move HW functionality into software.
> > These are my observations from the U727.
> > 
> > Fn+F1 is now a button to mute the microphone.
> > Fn+F5 is now the rfkill button.
> > Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
> > 0x0) returned 0x40000413
> 
> For reference, on the S7020 F1 and F5 have no "Fn" function while F9 is
> "volume up.  There is no ambiguity regarding F1 and F5 at least with this
> hardware so this patch shouldn't create conflict there.  If the newly moved
> ECO function were to be hooked it would probably need to be done dependent
> on model.

Why?  The ECO key/hotkey is handled by fujitsu-laptop (ACPI).  Fn+F9 on
older models is handled by i8042 (like it should be).  I do not see any
conflict here.

-- 
Best regards,
Michał Kępień
