From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 0/3] Add support for X51-R3 to alienware-wmi
Date: Tue, 16 Jun 2015 00:25:00 -0500
Message-ID: <557FB32C.7090807@dell.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com> <556F8B03.4060802@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from AUSXIPPC110.us.dell.com ([143.166.85.200]:2433 "EHLO
	ausxippc110.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751350AbbFPF1G (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 01:27:06 -0400
In-Reply-To: <556F8B03.4060802@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>



On 06/03/2015 06:17 PM, Mario Limonciello wrote:
>
> On 05/27/2015 02:36 PM, Limonciello, Mario wrote:
>> An upcoming Alienware platform, X51-R3 will support some new features in the
>> WMI BIOS control API as well as emit some scan codes when particular hardware
>> is used in conjunction.
>>
>> Mario Limonciello (3):
>>     Add support for X51-R3
>>     Add support for Alienware graphics amplifier.
>>     Capture cable events created by Alienware GFX Amplifier.
>>
>>    drivers/platform/x86/Kconfig         |   1 +
>>    drivers/platform/x86/alienware-wmi.c | 179 ++++++++++++++++++++++++++++++-----
>>    2 files changed, 156 insertions(+), 24 deletions(-)
>>
> Matthew,
>
> Aside from the third patch which has unfavorable feedback from Greg, any
> thoughts on the first two?  I purposefully broke them up and would like
> to get the first two included even if some variation of the third ends
> up not landing.
>
> Thanks,
>
Hi Matthew,

I wanted to check in once more on the first two patches.  If you've got 
them queued up for inclusion in a future kernel already please let me 
know.  If any changes are needed I'd like to get them taken care of.

Thanks,
