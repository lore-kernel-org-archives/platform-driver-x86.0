From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin@canonical.com>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Fri, 25 Feb 2011 17:22:43 +0800
Message-ID: <AANLkTim6pxadoTSsNqYV_gmRGOwyFRvfErSvcwRtaavy@mail.gmail.com>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
 <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com> <20110225071827.GA14053@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40808 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932167Ab1BYJXE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Feb 2011 04:23:04 -0500
In-Reply-To: <20110225071827.GA14053@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Martin Pitt <martin.pitt@canonical.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, tyson.chen@canonical.com

On Fri, Feb 25, 2011 at 3:18 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> I believe that the kernel should use KEY_TOUCHPAD_TOGGLE and userspace
> should use udev's key re-mapping facilities while X is unable to process
> keycodes above 255 to adjust to the keycode du jour. If all kernel
> drivers were to use KEY_TOUCHPAD_TOGGLE then remapping would be much
> easier (the utility would simply check capabilities for
> KEY_TOUCHPAD_TOGGLE and do the remap).

Can udev re-map a key code to another?

Am I correct that udev can only re-map a scan code to a specified key code.
