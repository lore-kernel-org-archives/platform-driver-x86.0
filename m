From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: Dell Latitude E6530 keyboard mapping
Date: Tue, 19 Mar 2013 10:55:31 -0700
Message-ID: <1426990.1ajUrW6ygT@dtor-d630.eng.vmware.com>
References: <8157.1363531900@owl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-da0-f48.google.com ([209.85.210.48]:50057 "EHLO
	mail-da0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933316Ab3CSRze (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Mar 2013 13:55:34 -0400
Received: by mail-da0-f48.google.com with SMTP id p8so450199dan.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Mar 2013 10:55:34 -0700 (PDT)
In-Reply-To: <8157.1363531900@owl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stephen Gildea <stepheng+linux@gildea.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Stephen,

On Sunday, March 17, 2013 07:51:40 AM Stephen Gildea wrote:
> On my Dell Latitude E6530 laptop, some of the function keys and keypad
> keys are mapped incorrectly by the kernel.  I first tested this with
> Linux 3.6; testing now with the current head (3.8+), I find that some of
> the keys have been fixed (End, NumLock, KbdLightOnOff, AudioPlayPause).
> Some of the other wrong keys have changed mappings but are still wrong
> (External Screen).
> 
> What change fixed these keys, and where should I be looking to fix the
> rest of them?  I looked through drivers/platform/x86/, but I don't see
> any other drivers dealing with keyboard mappings.

The mappings for AT keyboards is done by udev (look at its keymaps).

-- 
Dmitry
