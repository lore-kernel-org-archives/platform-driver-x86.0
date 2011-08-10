From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [RESEND][PATCH 0/5] Support for the TS-5500 board
Date: Wed, 10 Aug 2011 08:18:28 +0200
Message-ID: <CAHR064hamS0gHqQR5a5UAanN89CzzW94sjW6SB3=8MAcf6pkMg@mail.gmail.com>
References: <1311887450-22235-1-git-send-email-vivien.didelot@savoirfairelinux.com>
	<20110809233208.1a71122e@lenov0n>
	<4E421CD8.3090606@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:62742 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121Ab1HJGS3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Aug 2011 02:18:29 -0400
In-Reply-To: <4E421CD8.3090606@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Ike Panhc <ike.pan@canonical.com>, linux-kernel@vger.kernel.org, mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Wed, Aug 10, 2011 at 7:53 AM, Ike Panhc <ike.pan@canonical.com> wrote:
> I think platform-driver-x86 may not be the best mailing list for your patches.
>
> Please try to use scripts/get_maintainer.pl and it can tell you who you shall ask for reviewing.

Like Ike said, this is the mainling list for drivers/platform/x86, not
arch/x86, and running get_maintainer.pl on your patchs will give you
the rights people to CC.

And btw, I'm not sure we really want to put all these drivers in
arch/x86/platform/ts5500/ a re-create the arm driver mess.
drivers/leds/, drivers/gpio/  and drivers/mtd/ are probably a best choice.



-- 
Corentin Chary
http://xf.iksaif.net
