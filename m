From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 0/3] Add support for X51-R3 to alienware-wmi
Date: Wed, 03 Jun 2015 18:17:23 -0500
Message-ID: <556F8B03.4060802@dell.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from AUSXIPPC110.us.dell.com ([143.166.85.200]:60216 "EHLO
	ausxippc110.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558AbbFCX1A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Jun 2015 19:27:00 -0400
In-Reply-To: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>



On 05/27/2015 02:36 PM, Limonciello, Mario wrote:
> An upcoming Alienware platform, X51-R3 will support some new features in the
> WMI BIOS control API as well as emit some scan codes when particular hardware
> is used in conjunction.
>
> Mario Limonciello (3):
>    Add support for X51-R3
>    Add support for Alienware graphics amplifier.
>    Capture cable events created by Alienware GFX Amplifier.
>
>   drivers/platform/x86/Kconfig         |   1 +
>   drivers/platform/x86/alienware-wmi.c | 179 ++++++++++++++++++++++++++++++-----
>   2 files changed, 156 insertions(+), 24 deletions(-)
>

Matthew,

Aside from the third patch which has unfavorable feedback from Greg, any 
thoughts on the first two?  I purposefully broke them up and would like 
to get the first two included even if some variation of the third ends 
up not landing.

Thanks,
