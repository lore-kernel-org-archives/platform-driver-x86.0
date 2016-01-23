From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi list
Date: Sat, 23 Jan 2016 07:57:23 -0500
Message-ID: <CA+5PVA65=TRXf25_j95JWeeJjMivfcrp=6=7Yej35hstyAbiTw@mail.gmail.com>
References: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
	<20160123072731.GI1979@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:33102 "EHLO
	mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949AbcAWM5Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Jan 2016 07:57:24 -0500
In-Reply-To: <20160123072731.GI1979@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>

On Sat, Jan 23, 2016 at 2:27 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Jan 18, 2016 at 02:32:53PM -0500, Josh Boyer wrote:
>> Like the Yoga 900 models the Lenovo Yoga 700 does not have a
>> hw rfkill switch, and trying to read the hw rfkill switch through the
>> ideapad module causes it to always reported blocking breaking wifi.
>>
>> This commit adds the Lenovo Yoga 700 to the no_hw_rfkill dmi list, fixing
>> the wifi breakage.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1295272
>> Tested-by: <dinyar.rabady+spam@gmail.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
>> ---
>>
>> This applies to the for-next branch of the platform-x86-drivers tree
>>
>>
>>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index d28db0e793df..51178626305d 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -900,6 +900,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>>               },
>>       },
>>       {
>> +             .ident = "Lenogo Yoga 700",
>
> Josh,
>
> Is this a typo? "Lenogo"? Please tell me it's a typo.... :-)

Ugh, yes.  A typo.  One that apparently doesn't matter in
functionality because the tester used this exact patch and things
work, but embarrassing either way.

Do you need me to send a v2, or is that something you can fixup?

josh
