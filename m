From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v9 4/4] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Sat, 18 Mar 2017 14:42:50 +0100
Message-ID: <95de3aa0-6dd8-a41f-39f3-540092a0a391@redhat.com>
References: <20170316105535.8885-1-hdegoede@redhat.com>
 <20170316105535.8885-4-hdegoede@redhat.com> <20170317223305.GA18063@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40422 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750907AbdCROgs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2017 10:36:48 -0400
In-Reply-To: <20170317223305.GA18063@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org

Hi,

On 17-03-17 23:33, Darren Hart wrote:
> On Thu, Mar 16, 2017 at 11:55:35AM +0100, Hans de Goede wrote:
>> Make dell-wmi notify on hotkey kbd brightness changes, listen for this
>> in dell-laptop and call led_classdev_notify_brightness_hw_changed.
>>
>> This will allow userspace to monitor (poll) for brightness changes on
>> these LEDs caused by the hotkey.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> Thanks Hans, this appears to be consistent with the conclusion on v8 between you
> and Pali. While I don't care for the cross-driver-dependency, that's
> pre-existing and not something I have a solution for. So this looks good to me,
> pending Pali's final review.
>
> Pali, I know you have had some reservations reading through the v8 discussion. I
> believe Hans has addressed each of those sufficiently for the purposes of this
> patch set. As a follow-on effort, I'd like to discuss the future of libsmbios
> with the Dell folks and see if we can't phase it out.
>
> Hans, a couple of nits on this patch. To keep the subject under 80, I used:
>
> platform/x86: dell-*: Call new led hw_changed API on kbd brightness change
>
> since you used the full led function name in the commit message anyway.

Ok.

> I presume the changelog was intended to go after the --- and you didn't want it
> going into the commit itself, so I've removed it.

Ah yes, my bad.

> I'll await Pali's final Reviewed-by before pushing to testing, but you can see
> my minor tweaks listed above in the dell branch:
>
> git://git.infradead.org/linux-platform-drivers-x86.git dell
>
> http://git.infradead.org/linux-platform-drivers-x86.git/log/refs/heads/dell

Looks good to me, thank you.

Regards,

Hans
