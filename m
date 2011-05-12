From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [RFC PATCH] thinkpad-acpi: Improve hardware volume controls
Date: Thu, 12 May 2011 10:24:10 -0400
Message-ID: <BANLkTimmrM4HMATSbsYzz6kh=e9hrfAZmg@mail.gmail.com>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110512134827.GA26159@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:46659 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752851Ab1ELOYa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2011 10:24:30 -0400
Received: by pwi15 with SMTP id 15so736636pwi.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 May 2011 07:24:30 -0700 (PDT)
In-Reply-To: <20110512134827.GA26159@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Thu, May 12, 2011 at 9:48 AM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Mon, May 09, 2011 at 06:18:46PM -0400, Andy Lutomirski wrote:
>
>> Henrique, do you know of anywhere to find AML dumps from different models?
>> It would be nice to see what SAUM looks like.
>
> It looks like SAUM was introduced with the *61 machines, and it's
> identical from then on.

I wonder the machines with SAUM are the same as the machines on which
pressing mute generates an i8042 keystroke instead of an HKEY.  If so,
it looks like there's some code (or at least comments) in
thinkpad_acpi that mention doing the right thing when the HKEY mute
event in generated (e.g. the driver won't send KEY_MUTE to the input
layer), so something like my patch along with removing the _OSI(Linux)
hack for the newer models might make everything work right.

Still, someone who has an older laptop should test it, because all I
can do is pretend I carefully inspected all the possible code paths.

(Even if it works, don't apply this patch for 2.6.40 as it stands
because the ALSA change notification on KEY_MUTE is crap and should at
least ignore key release events.)

--Andy

>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>
