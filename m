From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin@canonical.com>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Tue, 1 Mar 2011 11:29:15 +0800
Message-ID: <AANLkTi=GFz4i1Y7ok=2Zt9ApbeAc4zN4tbaKppqB_LGA@mail.gmail.com>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
 <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
 <20110225071827.GA14053@core.coreip.homeip.net> <AANLkTinV+bnSBe+5CSuYYCU4gCq9Z2c9ELdy-LFAvdf0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43190 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752735Ab1CAD3f convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Feb 2011 22:29:35 -0500
In-Reply-To: <AANLkTinV+bnSBe+5CSuYYCU4gCq9Z2c9ELdy-LFAvdf0@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, tyson.chen@canonical.com

On Fri, Feb 25, 2011 at 11:14 PM, Chris Bagwell <chris@cnpbagwell.com> =
wrote:
>
> I submitted last month a patch to udev to do the scancode-to-F21
> mapping. =C2=A0So that part should be covered for near term.
>
> I also agree if we are going to change kernel side, we should change
> to KEY_TOUCHPAD_TOGGLE in both eeepc-laptop and eeepc-wmi.
>
> http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommit;h=3D0d8b=
6be5f5238360d2d8e220d6da280f842c5358
>
> Chris
>

Thanks Chris for the information. I also tested; it works.

I will re-send a eeepc-wmi patch with KEY_TOUCHPAD_TOGGLE.
