From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 2/4][RFC v2] fujitsu-laptop: fujitsu-laptop: restructure
 initialisation
Date: Fri, 3 Feb 2017 15:46:19 +0100
Message-ID: <20170203144619.GD11947@ozzy.nask.waw.pl>
References: <20170131130904.GC6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35405 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751958AbdBCOqX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 09:46:23 -0500
Received: by mail-lf0-f67.google.com with SMTP id v186so1699004lfa.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Feb 2017 06:46:23 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170131130904.GC6218@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

> Don't register backlight and platform devices on non-fujitsu hardware
>  - bail out instead.
> 
> Register the backlight driver _after_ the main acpi driver.

Something went wrong (during the rebase?) as after this patch is
applied, acpi_bus_register_driver() is never called for
acpi_fujitsu_bl_driver, rendering the latter useless.

-- 
Best regards,
Michał Kępień
